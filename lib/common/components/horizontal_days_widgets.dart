import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'base/base_stateful_widget.dart';

class HorizontalDaysWidget extends StatefulWidget {
  final Function(DateTime? dateTime) onSelect;
  final int? initIndex;
  final ScrollController? controller;

  HorizontalDaysWidget(
      {required this.onSelect, this.initIndex, this.controller});

  @override
  _HorizontalDaysWidget createState() {
    return _HorizontalDaysWidget();
  }
}

class _HorizontalDaysWidget extends BaseState<HorizontalDaysWidget> {
  int selectedIndex = -1;
  Color textColor = kGreyishBrown;
  Color textNumColor = kDark;
  Color selectedColor = kPrimaryDark;
  Color unselectedColor = Colors.white;
  Color currentFillColor = kPrimaryDark;
  late List<int> listOfDates;
  @override
  void initState() {
    var now = DateTime.now();

    // Getting the total number of days of the month
    var totalDays = daysInMonth(now) + 1;

    listOfDates = generateDaysCount(totalDays);

    /// set selectedIndex equal zero to make all days selected by default
    selectedIndex = 0;

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('addPostFrameCallback select new ${widget.initIndex}');
      if (widget.initIndex != null && widget.initIndex != -1) {
        final today = listOfDates[widget.initIndex!];
        final day = now.add(Duration(days: today));
        widget.onSelect(day);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  var now = DateTime.now();

  Widget buildItem(int index, bool isSelected) {
    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kCoolGrey;
    textNumColor = isSelected ? Colors.white : kDarkGrey;
//40
    //41

    final today = listOfDates[index];

    final dateTime = now.add(Duration(days: today - 2));
    print('buildItem in index $index ==> ${now}');

    return Container(
      height: 62,
      width: 52,
      margin: EdgeInsets.all(4),
      child: Card(
        color: currentFillColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: InkWell(
          onTap: () {
            if (selectedIndex == index) {
              selectedIndex = index;
            } else {
              selectedIndex = index;
            }
            setState(() {});
            widget.onSelect(dateTime);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                formatDateToDay(dateTime),
                style: kTextRegular.copyWith(fontSize: 12, color: textColor),
              ),
              Text(
                formatDateToDayNumMonth(dateTime),
                style: kTextMedium.copyWith(fontSize: 14, color: textNumColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this returns the last date of the month using DateTime
  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == -1 && widget.initIndex != null) {
      selectedIndex = widget.initIndex!;
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: widget.controller,
        addAutomaticKeepAlives: true,
        itemCount: listOfDates.length,
        itemBuilder: (c, index) {
          final bool isSelected = selectedIndex == index;
          currentFillColor = isSelected ? selectedColor : unselectedColor;
          textColor = isSelected ? Colors.white : kCoolGrey;
          textNumColor = isSelected ? Colors.white : kDarkGrey;
          return index == 0
              ? Container(
                  height: 62,
                  width: 52,
                  margin: EdgeInsets.all(4),
                  child: Card(
                    color: currentFillColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        if (selectedIndex == index) {
                          selectedIndex = index;
                        } else {
                          selectedIndex = index;
                        }
                        setState(() {});
                        widget.onSelect(null);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            strings.all,
                            style: kTextRegular.copyWith(
                                fontSize: 12, color: textColor),
                          ),
                          Text(
                            strings.days,
                            style: kTextMedium.copyWith(
                                fontSize: 14, color: textNumColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : buildItem(index, index == selectedIndex);
        });
  }

  String formatDateToDay(DateTime dateTime) {
    return DateFormatter.formatDate(dateTime, 'EE');
  }

  String formatDateToDayNumMonth(DateTime dateTime) {
    return DateFormatter.formatDate(dateTime, 'MM/dd');
  }

  List<int> generateDaysCount(int totalDays) =>
      List<int>.generate(totalDays, (i) => i + 1);
}
