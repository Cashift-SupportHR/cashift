import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../common/data/repositories/local/local_repository.dart';
import '../../../../adminFeatures/di/injector.dart';
import '../../../../../common/components/restart_app_widget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class DropdownLanguage extends StatelessWidget {
  final Color? color;
  final double? horizontalPadding;
  const DropdownLanguage({super.key, this.color, this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    final localRepo = getIt.get<LocalRepository>();
    return
      DropdownButton2(
        underline: Container(),
        customButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20),
          child: Row(
            children: [
              Icon(Icons.language_outlined, color: color ?? kPrimary),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down_sharp, color: color ?? kPrimary, size: 20),
            ],
          ),
        ),
        isDense: true,
        dropdownStyleData: DropdownStyleData(
          width: 120,
          padding: EdgeInsets.symmetric(vertical: 5),
          offset: Offset(60, -10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
        ),
        items: [
          DropdownMenuItem(
            child: Text('اللغة العربية', style: kTextMediumPrimary),
            value: 'ar',
          ),
          DropdownMenuItem(
            child: Text('English', style: kTextMediumPrimary),
            value: 'en',
          ),
        ],
        onChanged: (value) {
          Navigator.of(context).pop();
          localRepo.toggleLanguage();
          RestartWidget.restartApp(context);
        },
      );
  }
}
