// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'hijri_calendar.dart';


// Values derived from https://developer.apple.com/design/resources/ and on iOS
// simulators with "Debug View Hierarchy".
const double _kItemExtent = 32.0;
// From the picker's intrinsic content size constraint.
const double _kPickerWidth = 320.0;
const double _kPickerHeight = 216.0;
const bool _kUseMagnifier = true;
const double _kMagnification = 2.35/2.1;
const double _kDatePickerPadSize = 12.0;
// The density of a date picker is different from a generic picker.
// Eyeballed from iOS.
const double _kSqueeze = 1.25;

const TextStyle _kDefaultPickerTextStyle = TextStyle(
  letterSpacing: -0.83,
);

// The item height is 32 and the magnifier height is 34, from
// iOS simulators with "Debug View Hierarchy".
// And the magnified fontSize by [_kTimerPickerMagnification] conforms to the
// iOS 14 native style by eyeball test.
const double _kTimerPickerMagnification = 34 / 32;
// Minimum horizontal padding between [CupertinoTimerPicker]
//
// It shouldn't actually be hard-coded for direct use, and the perfect solution
// should be to calculate the values that match the magnified values by
// offAxisFraction and _kSqueeze.
// Such calculations are complex, so we'll hard-code them for now.
const double _kTimerPickerMinHorizontalPadding = 30;
// Half of the horizontal padding value between the timer picker's columns.
const double _kTimerPickerHalfColumnPadding = 4;
// The horizontal padding between the timer picker's number label and its
// corresponding unit label.
const double _kTimerPickerLabelPadSize = 6;
const double _kTimerPickerLabelFontSize = 17.0;

// The width of each column of the countdown time picker.
const double _kTimerPickerColumnIntrinsicWidth = 106;

TextStyle _themeTextStyle(BuildContext context, { bool isValid = true }) {
  final TextStyle style = CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle;
  return isValid
      ? style.copyWith(color: CupertinoDynamicColor.maybeResolve(style.color, context))
      : style.copyWith(color: CupertinoDynamicColor.resolve(CupertinoColors.inactiveGray, context));
}

void _animateColumnControllerToItem(FixedExtentScrollController controller, int targetItem) {
  controller.animateToItem(
    targetItem,
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 200),
  );
}

const Widget _startSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capEndEdge: false);
const Widget _centerSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capStartEdge: false, capEndEdge: false);
const Widget _endSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(capStartEdge: false);

// Lays out the date picker based on how much space each single column needs.
//
// Each column is a child of this delegate, indexed from 0 to number of columns - 1.
// Each column will be padded horizontally by 12.0 both left and right.
//
// The picker will be placed in the center, and the leftmost and rightmost
// column will be extended equally to the remaining width.
class _DatePickerLayoutDelegate extends MultiChildLayoutDelegate {
  _DatePickerLayoutDelegate({
    required this.columnWidths,
    required this.textDirectionFactor,
  });

  // The list containing widths of all columns.
  final List<double> columnWidths;

  // textDirectionFactor is 1 if text is written left to right, and -1 if right to left.
  final int textDirectionFactor;

  @override
  void performLayout(Size size) {
    double remainingWidth = size.width;

    for (int i = 0; i < columnWidths.length; i++) {
      remainingWidth -= columnWidths[i] + _kDatePickerPadSize * 2;
    }

    double currentHorizontalOffset = 0.0;

    for (int i = 0; i < columnWidths.length; i++) {
      final int index = textDirectionFactor == 1 ? i : columnWidths.length - i - 1;

      double childWidth = columnWidths[index] + _kDatePickerPadSize * 2;
      if (index == 0 || index == columnWidths.length - 1) {
        childWidth += remainingWidth / 2;
      }

      // We can't actually assert here because it would break things badly for
      // semantics, which will expect that we laid things out here.
      assert(() {
        if (childWidth < 0) {
          FlutterError.reportError(
            FlutterErrorDetails(
              exception: FlutterError(
                'Insufficient horizontal space to render the '
                    'CupertinoDatePicker because the parent is too narrow at '
                    '${size.width}px.\n'
                    'An additional ${-remainingWidth}px is needed to avoid '
                    'overlapping columns.',
              ),
            ),
          );
        }
        return true;
      }());
      layoutChild(index, BoxConstraints.tight(Size(math.max(0.0, childWidth), size.height)));
      positionChild(index, Offset(currentHorizontalOffset, 0.0));

      currentHorizontalOffset += childWidth;
    }
  }

  @override
  bool shouldRelayout(_DatePickerLayoutDelegate oldDelegate) {
    return columnWidths != oldDelegate.columnWidths
        || textDirectionFactor != oldDelegate.textDirectionFactor;
  }
}

/// Different display modes of [CupertinoDatePicker].
///
/// See also:
///
///  * [CupertinoDatePicker], the class that implements different display modes
///    of the iOS-style date picker.
///  * [CupertinoPicker], the class that implements a content agnostic spinner UI.

// Different types of column in CupertinoDatePicker.
enum _PickerColumnType {
  // Day of month column in date mode.
  dayOfMonth,
  // Month column in date mode.
  month,
  // Year column in date mode.
  year,
  // Medium date column in dateAndTime mode.
  date,
  // Hour column in time and dateAndTime mode.
  hour,
  // minute column in time and dateAndTime mode.
  minute,
  // AM/PM column in time and dateAndTime mode.
  dayPeriod,
}

/// A date picker widget in iOS style.
///
/// There are several modes of the date picker listed in [CupertinoDatePickerMode].
///
/// The class will display its children as consecutive columns. Its children
/// order is based on internationalization, or the [dateOrder] property if specified.
///
/// Example of the picker in date mode:
///
///  * US-English: `| July | 13 | 2012 |`
///  * Vietnamese: `| 13 | Tháng 7 | 2012 |`
///
/// Can be used with [showCupertinoModalPopup] to display the picker modally at
/// the bottom of the screen.
///
/// Sizes itself to its parent and may not render correctly if not given the
/// full screen width. Content texts are shown with
/// [CupertinoTextThemeData.dateTimePickerTextStyle].
///
/// {@tool dartpad}
/// This sample shows how to implement CupertinoDatePicker with different picker modes.
/// We can provide intiial dateTime value for the picker to display. When user changes
/// the drag the date or time wheels, the picker will call onDateTimeChanged callback.
///
/// CupertinoDatePicker can be displayed directly on a screen or in a popup.
///
/// ** See code in examples/api/lib/cupertino/date_picker/cupertino_date_picker.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [CupertinoTimerPicker], the class that implements the iOS-style timer picker.
///  * [CupertinoPicker], the class that implements a content agnostic spinner UI.
///  * <https://developer.apple.com/design/human-interface-guidelines/ios/controls/pickers/>
class HijriCupertinoDatePicker extends StatefulWidget {
  /// Constructs an iOS style date picker.
  ///
  /// [mode] is one of the mode listed in [CupertinoDatePickerMode] and defaults
  /// to [CupertinoDatePickerMode.dateAndTime].
  ///
  /// [onDateTimeChanged] is the callback called when the selected date or time
  /// changes and must not be null. When in [CupertinoDatePickerMode.time] mode,
  /// the year, month and day will be the same as [initialDateTime]. When in
  /// [CupertinoDatePickerMode.date] mode, this callback will always report the
  /// start time of the currently selected day.
  ///
  /// [initialDateTime] is the initial date time of the picker. Defaults to the
  /// present date and time and must not be null. The present must conform to
  /// the intervals set in [minimumDate], [maximumDate], [minimumYear], and
  /// [maximumYear].
  ///
  /// [minimumDate] is the minimum selectable [DateTime] of the picker. When set
  /// to null, the picker does not limit the minimum [DateTime] the user can pick.
  /// In [CupertinoDatePickerMode.time] mode, [minimumDate] should typically be
  /// on the same date as [initialDateTime], as the picker will not limit the
  /// minimum time the user can pick if it's set to a date earlier than that.
  ///
  /// [maximumDate] is the maximum selectable [DateTime] of the picker. When set
  /// to null, the picker does not limit the maximum [DateTime] the user can pick.
  /// In [CupertinoDatePickerMode.time] mode, [maximumDate] should typically be
  /// on the same date as [initialDateTime], as the picker will not limit the
  /// maximum time the user can pick if it's set to a date later than that.
  ///
  /// [minimumYear] is the minimum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Defaults to 1 and must not be null.
  ///
  /// [maximumYear] is the maximum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Null if there's no limit.
  ///
  /// [minuteInterval] is the granularity of the minute spinner. Must be a
  /// positive integer factor of 60.
  ///
  /// [use24hFormat] decides whether 24 hour format is used. Defaults to false.
  ///
  /// [dateOrder] determines the order of the columns inside [CupertinoDatePicker] in date mode.
  /// Defaults to the locale's default date format/order.
  HijriCupertinoDatePicker({
  this.mode = CupertinoDatePickerMode.dateAndTime,
  required this.onDateTimeChanged,
    HijriCalendar? initialDateTime,
  this.minimumDate,
  this.maximumDate,
  this.minimumYear = 1,
  this.maximumYear,

  this.use24hFormat = false,
  this.dateOrder,
  this.backgroundColor,
  }) : initialDateTime = initialDateTime ?? HijriCalendar.now() {
  assert(
  mode != CupertinoDatePickerMode.dateAndTime || minimumDate == null || !this.initialDateTime.isBefore(minimumDate!.hYear,minimumDate!.hMonth,minimumDate!.hDay),
  'initial date is before minimum date',
  );
  assert(
  mode != CupertinoDatePickerMode.dateAndTime || maximumDate == null || !this.initialDateTime.isAfter(maximumDate!.hYear,maximumDate!.hMonth,maximumDate!.hDay),
  'initial date is after maximum date',
  );
  assert(
  mode != CupertinoDatePickerMode.date || (minimumYear >= 1 && this.initialDateTime.hYear >= minimumYear),
  'initial year is not greater than minimum year, or minimum year is not positive',
  );
  assert(
  mode != CupertinoDatePickerMode.date || maximumYear == null || this.initialDateTime.hYear <= maximumYear!,
  'initial year is not smaller than maximum year',
  );
  assert(
  mode != CupertinoDatePickerMode.date || minimumDate == null || !minimumDate!.isAfter(initialDateTime!.hYear,initialDateTime.hMonth,initialDateTime.hDay),
  'initial date ${this.initialDateTime} is not greater than or equal to minimumDate $minimumDate',
  );
  assert(
  mode != CupertinoDatePickerMode.date || maximumDate == null || !maximumDate!.isBefore(initialDateTime!.hYear,initialDateTime.hMonth,initialDateTime.hDay),
  'initial date ${this.initialDateTime} is not less than or equal to maximumDate $maximumDate',
  );
  }

  /// The mode of the date picker as one of [CupertinoDatePickerMode].
  /// Defaults to [CupertinoDatePickerMode.dateAndTime]. Cannot be null and
  /// value cannot change after initial build.
  final CupertinoDatePickerMode mode;

  /// The initial date and/or time of the picker. Defaults to the present date
  /// and time and must not be null. The present must conform to the intervals
  /// set in [minimumDate], [maximumDate], [minimumYear], and [maximumYear].
  ///
  /// Changing this value after the initial build will not affect the currently
  /// selected date time.
  final HijriCalendar initialDateTime;

  /// The minimum selectable date that the picker can settle on.
  ///
  /// When non-null, the user can still scroll the picker to [DateTime]s earlier
  /// than [minimumDate], but the [onDateTimeChanged] will not be called on
  /// these [DateTime]s. Once let go, the picker will scroll back to [minimumDate].
  ///
  /// In [CupertinoDatePickerMode.time] mode, a time becomes unselectable if the
  /// [DateTime] produced by combining that particular time and the date part of
  /// [initialDateTime] is earlier than [minimumDate]. So typically [minimumDate]
  /// needs to be set to a [DateTime] that is on the same date as [initialDateTime].
  ///
  /// Defaults to null. When set to null, the picker does not impose a limit on
  /// the earliest [DateTime] the user can select.
  final HijriCalendar? minimumDate;

  /// The maximum selectable date that the picker can settle on.
  ///
  /// When non-null, the user can still scroll the picker to [DateTime]s later
  /// than [maximumDate], but the [onDateTimeChanged] will not be called on
  /// these [DateTime]s. Once let go, the picker will scroll back to [maximumDate].
  ///
  /// In [CupertinoDatePickerMode.time] mode, a time becomes unselectable if the
  /// [DateTime] produced by combining that particular time and the date part of
  /// [initialDateTime] is later than [maximumDate]. So typically [maximumDate]
  /// needs to be set to a [DateTime] that is on the same date as [initialDateTime].
  ///
  /// Defaults to null. When set to null, the picker does not impose a limit on
  /// the latest [DateTime] the user can select.
  final HijriCalendar? maximumDate;

  /// Minimum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Defaults to 1 and must not be null.
  final int minimumYear;

  /// Maximum year that the picker can be scrolled to in
  /// [CupertinoDatePickerMode.date] mode. Null if there's no limit.
  final int? maximumYear;


  /// Whether to use 24 hour format. Defaults to false.
  final bool use24hFormat;

  /// Determines the order of the columns inside [CupertinoDatePicker] in date mode.
  /// Defaults to the locale's default date format/order.
  final DatePickerDateOrder? dateOrder;

  /// Callback called when the selected date and/or time changes. If the new
  /// selected [DateTime] is not valid, or is not in the [minimumDate] through
  /// [maximumDate] range, this callback will not be called.
  ///
  /// Must not be null.
  final ValueChanged<HijriCalendar> onDateTimeChanged;

  /// Background color of date picker.
  ///
  /// Defaults to null, which disables background painting entirely.
  final Color? backgroundColor;

  @override
  State<StatefulWidget> createState() { // ignore: no_logic_in_create_state, https://github.com/flutter/flutter/issues/70499
    // The `time` mode and `dateAndTime` mode of the picker share the time
    // columns, so they are placed together to one state.
    // The `date` mode has different children and is implemented in a different
    // state.
    return _CupertinoDatePickerDateState(dateOrder: dateOrder);

  }

  // Estimate the minimum width that each column needs to layout its content.
  static double _getColumnWidth(
      _PickerColumnType columnType,
      CupertinoLocalizations localizations,
      BuildContext context,
      ) {
    String longestText = '';

    switch (columnType) {
      case _PickerColumnType.date:
      // Measuring the length of all possible date is impossible, so here
      // just some dates are measured.
        for (int i = 1; i <= 12; i++) {
          // An arbitrary date.
          final String date =
          localizations.datePickerMediumDate(DateTime(2018, i, 25));
          if (longestText.length < date.length) {
            longestText = date;
          }
        }
        break;
      case _PickerColumnType.hour:
        for (int i = 0; i < 24; i++) {
          final String hour = localizations.datePickerHour(i);
          if (longestText.length < hour.length) {
            longestText = hour;
          }
        }
        break;
      case _PickerColumnType.minute:
        for (int i = 0; i < 60; i++) {
          final String minute = localizations.datePickerMinute(i);
          if (longestText.length < minute.length) {
            longestText = minute;
          }
        }
        break;
      case _PickerColumnType.dayPeriod:
        longestText =
        localizations.anteMeridiemAbbreviation.length > localizations.postMeridiemAbbreviation.length
            ? localizations.anteMeridiemAbbreviation
            : localizations.postMeridiemAbbreviation;
        break;
      case _PickerColumnType.dayOfMonth:
        for (int i = 1; i <=31; i++) {
          final String dayOfMonth = localizations.datePickerDayOfMonth(i);
          if (longestText.length < dayOfMonth.length) {
            longestText = dayOfMonth;
          }
        }
        break;
      case _PickerColumnType.month:
        for (int i = 1; i <=12; i++) {
          final String month = localizations.datePickerMonth(i);
          if (longestText.length < month.length) {
            longestText = month;
          }
        }
        break;
      case _PickerColumnType.year:
        longestText = localizations.datePickerYear(2018);
        break;
    }

    assert(longestText != '', 'column type is not appropriate');

    final TextPainter painter = TextPainter(
      text: TextSpan(
        style: _themeTextStyle(context),
        text: longestText,
      ),
      textDirection: Directionality.of(context),
    );

    // This operation is expensive and should be avoided. It is called here only
    // because there's no other way to get the information we want without
    // laying out the text.
    painter.layout();

    return painter.maxIntrinsicWidth;
  }
}

typedef _ColumnBuilder = Widget Function(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget selectionOverlay);


class _CupertinoDatePickerDateState extends State<HijriCupertinoDatePicker> {

  _CupertinoDatePickerDateState({
    required this.dateOrder,
  });

  final DatePickerDateOrder? dateOrder;

  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  // Alignment based on text direction. The variable name is self descriptive,
  // however, when text direction is rtl, alignment is reversed.
  late Alignment alignCenterLeft;
  late Alignment alignCenterRight;

  // The currently selected values of the picker.
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;

  // The controller of the day picker. There are cases where the selected value
  // of the picker is invalid (e.g. February 30th 2018), and this dayController
  // is responsible for jumping to a valid value.
  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  bool isDayPickerScrolling = false;
  bool isMonthPickerScrolling = false;
  bool isYearPickerScrolling = false;

  bool get isScrolling => isDayPickerScrolling || isMonthPickerScrolling || isYearPickerScrolling;

  // Estimated width of columns.
  Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDateTime.hDay;
    selectedMonth = widget.initialDateTime.hMonth;
    selectedYear = widget.initialDateTime.hYear;

    dayController = FixedExtentScrollController(initialItem: selectedDay - 1);
    monthController = FixedExtentScrollController(initialItem: selectedMonth - 1);
    yearController = FixedExtentScrollController(initialItem: selectedYear);

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      // System fonts change might cause the text layout width to change.
      _refreshEstimatedColumnWidths();
    });
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();

    PaintingBinding.instance.systemFonts.removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor = Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft = textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight = textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    _refreshEstimatedColumnWidths();
  }

  void _refreshEstimatedColumnWidths() {
    estimatedColumnWidths[_PickerColumnType.dayOfMonth.index] = HijriCupertinoDatePicker._getColumnWidth(_PickerColumnType.dayOfMonth, localizations, context);
    estimatedColumnWidths[_PickerColumnType.month.index] = HijriCupertinoDatePicker._getColumnWidth(_PickerColumnType.month, localizations, context);
    estimatedColumnWidths[_PickerColumnType.year.index] = HijriCupertinoDatePicker._getColumnWidth(_PickerColumnType.year, localizations, context);
  }

  // The DateTime of the last day of a given month in a given year.
  // Let `DateTime` handle the year/month overflow.

  HijriCalendar _lastDayInMonthHijri(int year, int month) {

    final hday = HijriCalendar()..hYear=selectedYear..hMonth =selectedMonth;

    print('_pickerDidStopScrolling minSelectDate month ${hday.getDaysInMonth(selectedYear, selectedMonth) }');
    final HijriCalendar lastDay = hday..hDay =  hday.getDaysInMonth(selectedYear, selectedMonth) ;
    return lastDay ;

  }
    Widget _buildDayPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget selectionOverlay) {

      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            isDayPickerScrolling = true;
          } else if (notification is ScrollEndNotification) {
            isDayPickerScrolling = false;
            _pickerDidStopScrolling();
          }

          return false;
        },
        child: CupertinoPicker(
          scrollController: dayController,
          offAxisFraction: offAxisFraction,
          itemExtent: _kItemExtent,
          useMagnifier: _kUseMagnifier,
          magnification: _kMagnification,
          backgroundColor: widget.backgroundColor,
          squeeze: _kSqueeze,
          onSelectedItemChanged: (int index) {
            selectedDay = index + 1;
            if (_isCurrentDateValid) {
              widget.onDateTimeChanged(HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  selectedDay);
            }
          },
          looping: true,
          selectionOverlay: selectionOverlay,
          children: List<Widget>.generate(30, (int index) {
            final int day = index + 1;
            print('itemPositioningBuilder ${day} => ${selectedDay}');
          final isValid =    (HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  day).isValid() ;
            return itemPositioningBuilder(
              context,
              Text(
                localizations.datePickerDayOfMonth(day),
                style: _themeTextStyle(context, isValid:isValid
            )));
          }),
        ),
      );
    }

    Widget _buildMonthPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget selectionOverlay) {
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            isMonthPickerScrolling = true;
          } else if (notification is ScrollEndNotification) {
            isMonthPickerScrolling = false;
            _pickerDidStopScrolling();
          }

          return false;
        },
        child: CupertinoPicker(
          scrollController: monthController,
          offAxisFraction: offAxisFraction,
          itemExtent: _kItemExtent,
          useMagnifier: _kUseMagnifier,
          magnification: _kMagnification,
          backgroundColor: widget.backgroundColor,
          squeeze: _kSqueeze,
          onSelectedItemChanged: (int index) {
            selectedMonth = index + 1;
            if (_isCurrentDateValid) {
              widget.onDateTimeChanged(HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  selectedDay);
            }
          },
          looping: true,
          selectionOverlay: selectionOverlay,
          children: List<Widget>.generate(12, (int index) {
            final int month = index + 1;
            final bool isInvalidMonth = (widget.minimumDate?.hYear == selectedYear && widget.minimumDate!.hMonth > month)
                || (widget.maximumDate?.hYear== selectedYear && widget.maximumDate!.hMonth < month);

            return itemPositioningBuilder(
              context,
              Text(
                  (HijriCalendar()..hYear = selectedYear.. hMonth = month..hDay =  selectedDay).getLongMonthName(),
                style: _themeTextStyle(context, isValid: !isInvalidMonth),
              ),
            );
          }),
        ),
      );
    }

    Widget _buildYearPicker(double offAxisFraction, TransitionBuilder itemPositioningBuilder, Widget selectionOverlay) {
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            isYearPickerScrolling = true;
          } else if (notification is ScrollEndNotification) {
            isYearPickerScrolling = false;
            _pickerDidStopScrolling();
          }

          return false;
        },
        child: CupertinoPicker.builder(
          scrollController: yearController,
          itemExtent: _kItemExtent,
          offAxisFraction: offAxisFraction,
          useMagnifier: _kUseMagnifier,
          magnification: _kMagnification,
          backgroundColor: widget.backgroundColor,
          onSelectedItemChanged: (int index) {
            selectedYear = index;
            if (_isCurrentDateValid) {
              widget.onDateTimeChanged(HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  selectedDay);
            }
          },
          itemBuilder: (BuildContext context, int year) {
            if (year < widget.minimumYear) {
              return null;
            }

            if (widget.maximumYear != null && year > widget.maximumYear!) {
              return null;
            }

            final bool isValidYear = (widget.minimumDate == null || widget.minimumDate!.hYear <= year)
                && (widget.maximumDate == null || widget.maximumDate!.hYear >= year);

            return itemPositioningBuilder(
              context,
              Text(
                localizations.datePickerYear(year),
                style: _themeTextStyle(context, isValid: isValidYear),
              ),
            );
          },
          selectionOverlay: selectionOverlay,
        ),
      );
    }

    bool get _isCurrentDateValid {
      // The current date selection represents a range [minSelectedData, maxSelectDate].
      final HijriCalendar minSelectedDate =HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  selectedDay;
      final HijriCalendar maxSelectedDate = HijriCalendar()..hYear = selectedYear.. hMonth = selectedMonth..hDay =  selectedDay + 1;

      final bool minCheck = widget.minimumDate?.isBefore(maxSelectedDate.hYear,maxSelectedDate.hMonth , maxSelectedDate.hDay) ?? true;
      final bool maxCheck = widget.maximumDate?.isBefore(minSelectedDate.hYear,minSelectedDate.hMonth , minSelectedDate.hDay) ?? false;

      return minCheck && !maxCheck && minSelectedDate.hDay == selectedDay;
    }

    // One or more pickers have just stopped scrolling.
    void _pickerDidStopScrolling() {
      // Call setState to update the greyed out days/months/years, as the currently
      // selected year/month may have changed.
      setState(() { });

      if (isScrolling) {
        return;
      }

      // Whenever scrolling lands on an invalid entry, the picker
      // automatically scrolls to a valid one.
      final HijriCalendar minSelectDate = HijriCalendar()..hYear = selectedYear..hMonth = selectedMonth..hDay= selectedDay;
      final HijriCalendar maxSelectDate = HijriCalendar()..hYear= selectedYear..hMonth=selectedMonth..hDay= selectedDay + 1;

      final bool minCheck = widget.minimumDate?.isBefore(maxSelectDate.hYear,maxSelectDate.hMonth, maxSelectDate.hDay) ?? true;
      final bool maxCheck = widget.maximumDate?.isBefore(minSelectDate.hYear , minSelectDate.hMonth , minSelectDate.hDay) ?? false;

    if (!minCheck || maxCheck) {
        // We have minCheck === !maxCheck.
        final HijriCalendar targetDate = minCheck ? widget.maximumDate! : widget.minimumDate!;
        _scrollToDate(targetDate);
        return;
      }

      print('_pickerDidStopScrolling minSelectDate ${minSelectDate.isValid()} || ${minSelectDate.toString()}');

      // Some months have less days (e.g. February). Go to the last day of that month
      // if the selectedDay exceeds the maximum.
      if (!maxSelectDate.isValid()) {
        //selectedYear, selectedMonth
        final hday = HijriCalendar()..hYear=selectedYear..hMonth =selectedMonth;

        print('_pickerDidStopScrolling minSelectDate month ${hday.getDaysInMonth(selectedYear, selectedMonth) }');
      final HijriCalendar lastDay = hday..hDay =  hday.getDaysInMonth(selectedYear, selectedMonth) ;
        _scrollToDate(lastDay);
      }
    }

    void _scrollToDate(HijriCalendar newDate) {
      SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
        if (selectedYear != newDate.hYear) {
          _animateColumnControllerToItem(yearController, newDate.hYear);
        }

        if (selectedMonth != newDate.hMonth) {
          _animateColumnControllerToItem(monthController, newDate.hMonth - 1);
        }

        if (selectedDay != newDate.hDay) {
          _animateColumnControllerToItem(dayController, newDate.hDay - 1);
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      List<_ColumnBuilder> pickerBuilders = <_ColumnBuilder>[];
      List<double> columnWidths = <double>[];

      final DatePickerDateOrder datePickerDateOrder =
          dateOrder ?? localizations.datePickerDateOrder;

      switch (datePickerDateOrder) {
        case DatePickerDateOrder.mdy:
          pickerBuilders = <_ColumnBuilder>[_buildMonthPicker, _buildDayPicker, _buildYearPicker];
          columnWidths = <double>[
            estimatedColumnWidths[_PickerColumnType.month.index]!,
            estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
            estimatedColumnWidths[_PickerColumnType.year.index]!,
          ];
          break;
        case DatePickerDateOrder.dmy:
          pickerBuilders = <_ColumnBuilder>[_buildDayPicker, _buildMonthPicker, _buildYearPicker];
          columnWidths = <double>[
            estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
            estimatedColumnWidths[_PickerColumnType.month.index]!,
            estimatedColumnWidths[_PickerColumnType.year.index]!,
          ];
          break;
        case DatePickerDateOrder.ymd:
          pickerBuilders = <_ColumnBuilder>[_buildYearPicker, _buildMonthPicker, _buildDayPicker];
          columnWidths = <double>[
            estimatedColumnWidths[_PickerColumnType.year.index]!,
            estimatedColumnWidths[_PickerColumnType.month.index]!,
            estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
          ];
          break;
        case DatePickerDateOrder.ydm:
          pickerBuilders = <_ColumnBuilder>[_buildYearPicker, _buildDayPicker, _buildMonthPicker];
          columnWidths = <double>[
            estimatedColumnWidths[_PickerColumnType.year.index]!,
            estimatedColumnWidths[_PickerColumnType.dayOfMonth.index]!,
            estimatedColumnWidths[_PickerColumnType.month.index]!,
          ];
          break;
      }

      final List<Widget> pickers = <Widget>[];

      for (int i = 0; i < columnWidths.length; i++) {
        final double offAxisFraction = (i - 1) * 0.3 * textDirectionFactor;

        EdgeInsets padding = const EdgeInsets.only(right: _kDatePickerPadSize);
        if (textDirectionFactor == -1) {
          padding = const EdgeInsets.only(left: _kDatePickerPadSize);
        }

        Widget selectionOverlay = _centerSelectionOverlay;
        if (i == 0) {
          selectionOverlay = _startSelectionOverlay;
        } else if (i == columnWidths.length - 1) {
          selectionOverlay = _endSelectionOverlay;
        }

        pickers.add(LayoutId(
          id: i,
          child: pickerBuilders[i](
            offAxisFraction,
                (BuildContext context, Widget? child) {
              return Container(
                alignment: i == columnWidths.length - 1
                    ? alignCenterLeft
                    : alignCenterRight,
                padding: i == 0 ? null : padding,
                child: Container(
                  alignment: i == 0 ? alignCenterLeft : alignCenterRight,
                  width: columnWidths[i] + _kDatePickerPadSize,
                  child: child,
                ),
              );
            },
            selectionOverlay,
          ),
        ));
      }

      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: DefaultTextStyle.merge(
          style: _kDefaultPickerTextStyle,
          child: CustomMultiChildLayout(
            delegate: _DatePickerLayoutDelegate(
              columnWidths: columnWidths,
              textDirectionFactor: textDirectionFactor,
            ),
            children: pickers,
          ),
        ),
      );
    }
 }



// The iOS date picker and timer picker has their width fixed to 320.0 in all
// modes. The only exception is the hms mode (which doesn't have a native counterpart),
// with a fixed width of 330.0 px.
//
// For date pickers, if the maximum width given to the picker is greater than
// 320.0, the leftmost and rightmost column will be extended equally so that the
// widths match, and the picker is in the center.
//
// For timer pickers, if the maximum width given to the picker is greater than
// its intrinsic width, it will keep its intrinsic size and position itself in the
// parent using its alignment parameter.
//
// If the maximum width given to the picker is smaller than 320.0, the picker's
// layout will be broken.


/// Different modes of [CupertinoTimerPicker].
///
/// See also:
///
///  * [CupertinoTimerPicker], the class that implements the iOS-style timer picker.
///  * [CupertinoPicker], the class that implements a content agnostic spinner UI.
enum CupertinoTimerPickerMode {
  /// Mode that shows the timer duration in hour and minute.
  ///
  /// Examples: 16 hours | 14 min.
  hm,
  /// Mode that shows the timer duration in minute and second.
  ///
  /// Examples: 14 min | 43 sec.
  ms,
  /// Mode that shows the timer duration in hour, minute, and second.
  ///
  /// Examples: 16 hours | 14 min | 43 sec.
  hms,
}

