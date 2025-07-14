import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../base/base_stateless_widget.dart';

class TextFieldSearch extends BaseStatelessWidget {
  final String? title;
  final bool? readOnly;
  Widget? suffix;
  final bool? isSuffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFieldSearch({Key? key, this.title,this.suffix, this.isSuffixIcon=true, this.readOnly, this.onTap, this.onChanged, this.controller, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: kGrey_94.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: MaterialTextField(
        readOnly: onTap != null,
        controller: controller,
        onTap: onTap,
        inputDecoration: kTextFieldDecorationSearch.copyWith(
          hintText: title ?? strings.search_here,
          hintStyle: kTextRegular.copyWith(
              color: kBlack.withOpacity(0.2), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: kLoadSvgInCirclePath(AppIcons.search, width: 20, height: 20),
          ),
          contentPadding: const EdgeInsets.all(5.0),

          suffixIcon:isSuffixIcon==false?SizedBox.shrink():suffix?? Padding(
            padding: const EdgeInsets.all(14.0),
            child: kLoadSvgInCirclePath(AppIcons.filter, width: 20, height: 20),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
