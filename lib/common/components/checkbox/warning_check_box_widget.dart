import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';

class WarningCheckBoxWidget extends StatelessWidget {
  final bool? value;
  final String text;
  final Color? activeColor;
  final Color? backgroundColor;
  final Function(bool?)? onChanged;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final String? textClick;
  final Function()? onTap;
  const WarningCheckBoxWidget({Key? key, required this.text, required this.onChanged, this.activeColor, this.backgroundColor, this.padding, this.margin, this.textStyle, this.textClick, this.onTap, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? value = this.value ?? false;
    return WarningWidget(
        warningText: text,
        color: activeColor ?? kGreen_2,
        backgroundColor: backgroundColor,
        iconSize: 20,
        textStyle: textStyle,
        onTap: onTap,
        textClick: textClick,
        padding: padding ?? const EdgeInsetsDirectional.only(start: 5, top: 10, bottom: 10),
        margin: margin ?? const EdgeInsets.only(top: 30, bottom: 10),
        paddingTitles: const EdgeInsetsDirectional.only(top: 6),
        leading: StatefulBuilder(
            builder: (context, setState) {
              return Checkbox(
                value: value,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                activeColor: activeColor ?? kGreen_2,
                side: BorderSide(color: activeColor ?? kGreen_2, width: 1.5),
                onChanged: (bool? newValue) {
                  setState(() {
                    value = newValue;
                  });
                  onChanged!(newValue);
                },
              );
            }
        ),
      );
  }
}
