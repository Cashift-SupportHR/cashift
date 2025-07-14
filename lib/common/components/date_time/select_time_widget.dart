import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';


class SelectTimeWidget extends StatelessWidget {
  final String? title;
  final void Function(TimeOfDay?)? onTap;

  const SelectTimeWidget({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay? timeOfDay;
    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () async {
          timeOfDay = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());
          if (timeOfDay != null) {
            onTap!(timeOfDay!);
          }
          setState(() {});
        },
        child: Material(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeOfDay?.format(context) ?? title ?? '',
                  style: kTextRegular.copyWith(
                      fontSize: 12, color: kBattleShipGrey),
                ),
                const Icon(Icons.keyboard_arrow_down, color: kBattleShipGrey)
              ],
            ),
          ),
        ),
      );
    });
  }
}
