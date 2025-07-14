import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

class ProfileItemWidget extends BaseStatelessWidget{
  final String label ;
  final  Function ?onTap ;
  final  Widget icon ;
  final Color? iconColor ;
  ProfileItemWidget( {required this.label ,   this.onTap , required this.icon , this.iconColor});
  @override
  Widget build(BuildContext context) {
    return buildProfileItem();
  }

  buildProfileItem() {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialText(label.toString(),
              mathWidth: true,
              padding: const EdgeInsetsDirectional.only(start: 12, top: 12),
              margin: const EdgeInsetsDirectional.only(end: 16, top: 8),
              style: kTextLabel,
              startIconPadding: const EdgeInsetsDirectional.only(end: 8),
              startIcon: kBuildCircleShape(
                  child: icon,
                  color: iconColor ?? kPrimary.withAlpha(50),
                  size: 30),
              endIcon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: kDark,
              )),
          const Divider()
        ],
      ),
    );
  }

}