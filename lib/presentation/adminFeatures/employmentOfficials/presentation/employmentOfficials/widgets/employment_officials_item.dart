import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../../../common/components/texts/list_row_texts_icons.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/employment_official.dart';
import '../../../domain/entities/employment_officials_status.dart';
import '../../addEmploymentOfficial/pages/add_employment_official_page.dart';

///  Created by harbey on 7/4/2023.
class EmploymentOfficialItem extends BaseStatelessWidget {
  final EmploymentOfficial item;
  final int type;
  final Function() onRefresh;
  final Function() onDeactivate;

  EmploymentOfficialItem({
    Key? key,
    required this.item,
    required this.type,
    required this.onRefresh,
    required this.onDeactivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          ListRowTextsIcons(
            padding: EdgeInsetsDirectional.only(
                start: 16, top: 16, bottom: 6, end: 5),
            icons: [
              AppIcons.employeeLine,
              AppIcons.cityOutline,
              AppIcons.phoneSolid,
              AppIcons.locationOnOutline,
              AppIcons.clockLight,
              AppIcons.workOutline,
              AppIcons.renameOutline,
            ],
            titles: [
              strings.manager_name,
              strings.city_name,
              strings.mobile_number,
              strings.address,
              strings.shift_hours,
              strings.workdays,
              strings.notes,
            ],
            values: [
              item.name ?? '',
              item.cityName ?? '',
              item.phone ?? '',
              item.address ?? '',
              item.timesOfWork ?? '',
              item.workDays ?? '',
              lang == 'ar' ? item.descriptionAr ?? '' : item.descriptionEn ?? '',
            ],
          ),
          _OptionsMenuButton(
            item: item,
            type: type,
            onRefresh: onRefresh,
              onDeactivate: onDeactivate,
          ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final EmploymentOfficial item;
  final int type;
  final Function() onRefresh;
  final Function() onDeactivate;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.type,
    required this.onRefresh,
    required this.onDeactivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_employment_official_data,
          titleStyle: kTextBold.copyWith(fontSize: 10, color: kGreen_54),
          isDivider: type == EmploymentOfficialsStatus.active,
        ),
        if(type == EmploymentOfficialsStatus.active)
        BuildPopupMenuItemContent(
          title: strings.deactivate_employment_official,
          titleStyle: kTextBold.copyWith(fontSize: 10, color: kGreen_54),
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(
              context, Routes.addEmploymentOfficialPage,
              arguments: item);
          if (isRefresh is bool && isRefresh) {
            onRefresh();
          }
        } else if (value == 1) {
          onDeactivate();
        }
      },
    );
  }
}
