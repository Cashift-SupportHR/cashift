import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../shared/components/base_stateless_widget.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../pages/advanced_filter_sheet_page.dart';

class TextFieldSearchJob extends BaseStatelessWidget {
  final String? title;
  final bool? readOnly;
  final bool? isSuffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  TextFieldSearchJob({Key? key, this.title, this.isSuffixIcon=true, this.readOnly, this.onTap, this.onChanged, this.controller, this.margin}) : super(key: key);

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
        readOnly: readOnly ?? true,
        controller: controller,
        onTap: onTap ??
            () {
          showAppModalBottomSheet(
            context: context,
            title: strings.search_filtering,
            padding: EdgeInsets.zero,
            radius: 12,
            isDivider: false,
            child: AdvancedFilterSheetPage(),
          );
        },
        inputDecoration: kTextFieldDecorationSearch.copyWith(
          hintText: title ?? strings.search_for_job,
          hintStyle: kTextRegular.copyWith(
              color: kBlack.withOpacity(0.2), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: kLoadSvgInCirclePath(AppIcons.search, width: 20, height: 20),
          ),
          suffixIcon:isSuffixIcon==false?SizedBox(): Padding(
            padding: const EdgeInsets.all(14.0),
            child: kLoadSvgInCirclePath(AppIcons.filter, width: 20, height: 20),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
