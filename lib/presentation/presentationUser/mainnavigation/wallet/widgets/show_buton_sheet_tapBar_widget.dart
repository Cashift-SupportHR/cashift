import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiftapp/extensions/extensions.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../common/components/options_menu_button.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../apply_details/pages/apply_details_list_page.dart';

Widget showButtonTabBar(
    {context,
    required int companyId,
    required int statusId,
    required int? headId ,
      required int type}) {
  final strings = Get.context!.getStrings();
  return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.show_details,
          titleStyle: kTextRegular.copyWith(
            fontSize: 12,
            color: kSteal,
          ),
          iconPath: AppIcons.jobs,
          iconSize: 28,
          isDivider: false,
        )
      ],
      onSelect: (value) {
        ApplyDetailsListPage.push(context,
            companyId: companyId, statusId: statusId, headId: headId, type: type);
      });
}
