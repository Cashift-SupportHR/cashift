import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

class ListPickerItemWidget extends BaseStatelessWidget {
  //final Bank bank;
  final String name  ;
  final String ? logo;
  ListPickerItemWidget( {required this.name,  this.logo,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialText(
            name,
          style: kTextRegular.copyWith(color: kGreyishBrown,fontSize: 14),
          startIcon: kBuildCircleImage(logo.toString(), placeHolder: 'images/bank.png'),
          startIconPadding: EdgeInsets.only(left: 8,right: 8),
        ),
        Divider()
      ],
    );
  }
}