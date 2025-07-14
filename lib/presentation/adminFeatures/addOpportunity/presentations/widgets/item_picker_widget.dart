import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';


class ItemPickerWidget extends BaseStatelessWidget {
  final List items;
  final Function(String) onSelectCity;
  ItemPickerWidget({Key? key, required this.items, required this.onSelectCity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, position) {
            final item = items[position];

            return Container(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      onSelectCity(item);
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      alignment: AlignmentDirectional
                          .centerStart, // <-- had to set alignment
                      padding:
                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero, // <-- had to set padding to zero
                      ),
                    ),
                    child: Text(
                      item,
                      textAlign: TextAlign.start,
                      style: kTextRegular.copyWith(
                          fontSize: 12, decoration: TextDecoration.none),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: kSilverThree,
                  )
                ],
              ),
            );
          }),
    );
  }
}
