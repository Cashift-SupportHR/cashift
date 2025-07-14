import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/icons/icon_text.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../../../common/components/texts/icon_double_text.dart';
import '../../../domain/entities/index.dart';

class GeneralTypeViolationItem extends BaseStatelessWidget {
  final ViolationType item;
  final bool details;
  final Function() onRefresh;

  GeneralTypeViolationItem({
    Key? key,
    required this.item,
    required this.details,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      // padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _OptionsMenuButton(
            onRefresh: onRefresh,
            item: item,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildIconDoubleText(
                  icon: AppIcons.buildingsOutline,
                  title: strings.company_name,
                  value: item.companyName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.projectName,
                  title: strings.project_name,
                  value: item.projectName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.violation_name,
                  title: strings.violation_name_ar,
                  value: item.nameAr ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.violation_name,
                  title: strings.violation_name_en,
                  value: item.nameEn ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.violation_type,
                  title: strings.violation_type,
                  value: item.scheduleViolationsTypeName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.discount,
                  title: strings.discount_value,
                  value: item.violationAmount?.toString() ?? '',
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIconDoubleText(
      {required String icon,
      required String title,
      required String value,
      Color? colorText,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 10),
      child: IconDoubleText(
        icon: icon,
        name: title + ' :',
        value: value,
        nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final ViolationType item;
  final Function() onRefresh;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      padding: EdgeInsets.all(16),
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(
              context, Routes.addTypeViolationPage,
              arguments: item);
          if (isRefresh == true) {
            onRefresh();
          }
        }
      },
    );
  }
}
