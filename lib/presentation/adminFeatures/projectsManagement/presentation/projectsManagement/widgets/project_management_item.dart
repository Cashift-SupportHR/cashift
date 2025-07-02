import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../../shared/components/texts/list_row_texts.dart';
import '../../../domain/entities/project_management.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../addNewProject/pages/addAdditionalLocations/add_additional_locations_page.dart';
import '../../addNewProject/pages/addProject/add_new_project_page.dart';
import '../../addNewProject/pages/periodPricing/period_pricing_page.dart';
import '../../addNewProject/pages/projectSuccessfullyPage/pages/project_successfully_page.dart';
import '../../addNewProject/pages/projectSuccessfullyPage/pages/show_qr_code_page.dart';
import '../../addNewProject/pages/workingPeriodsProject/working_periods_project_page.dart';

///  Created by harbey on 7/4/2023.
class ProjectManagementItem extends BaseStatelessWidget {
  final ProjectManagement item;
  final Function() onRefresh;
  final Widget? moreFooter;
  final bool isShowOptionsMenu;

  ProjectManagementItem({
    Key? key,
    required this.item,
    required this.onRefresh,
    this.moreFooter,
    this.isShowOptionsMenu = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, top: 16, end: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(
                      nameAr: item.nameAr ?? '',
                      nameEn: item.nameEn ?? '',
                    ),
                  ],
                ),
              ),
              _Footer(
                item: item,
              ),

              // This widget used in ProjectSuccessfullyScreen
              if (moreFooter != null) moreFooter!,
            ],
          ),

          if (isShowOptionsMenu)
            _OptionsMenuButton(
              item: item,
              onRefresh: onRefresh,
            ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final ProjectManagement item;
  final Function() onRefresh;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 18;
    return OptionsMenuButton(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(end: 10, top: 10, start: 40, bottom: 40),
        child: kLoadSvgInCirclePath(
          AppIcons.menu,
          height: 6,
          width: 6,
        ),
      ),
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_project_data,
          iconPath: AppIcons.buildingsOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.edit_additional_sites,
          iconPath: AppIcons.locationAdjustmentOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.adjust_periods,
          iconPath: AppIcons.adjustPeriodsOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.pricing_adjustment,
          iconPath: AppIcons.pricingAdjustmentOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.print_qr_code,
          iconPath: AppIcons.qrCodeBorder,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
        BuildPopupMenuItemContent(
          title: strings.show_focus_points_in_map,
          iconPath: AppIcons.location_,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(context, Routes.addNewProject, arguments: item.id);
          if (isRefresh is bool && isRefresh) {
            onRefresh();
          }
        } else if (value == 1) {
          Navigator.pushNamed(context,  Routes.addAdditionalLocationsPage , arguments: item.id);
        } else if (value == 2) {
          Navigator.pushNamed(context, Routes.workingPeriodsProjectPage, arguments: PraWorkingPeriod(idProject: item.id ?? 0, idCompany: item.companyId ?? 0));
        } else if (value == 3) {
          Navigator.pushNamed(context, Routes.periodPricingPage, arguments: PraPeriodPricing(idProject: item.id ?? 0, idCompany: item.companyId ?? 0));
        } else if (value == 4) {
          Navigator.pushNamed(context, Routes.showQrCodePage, arguments: item);
        }else if (value == 5) {
          Navigator.pushNamed(context, Routes.mapProjectGatesPage, arguments: item);
        }
      },
    );
  }
}

class _Header extends StatelessWidget {
  final String nameAr;
  final String nameEn;

  _Header({
    Key? key,
    required this.nameAr,
    required this.nameEn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kLoadSvgInCirclePath(
          AppIcons.buildingsOutline,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameAr,
                style: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                nameEn,
                style: kTextMedium.copyWith(fontSize: 14, color: kGreen_65),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Footer extends BaseStatelessWidget {
  final ProjectManagement item;

  _Footer({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4, bottom: 16, end: 16, start: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalDivider(
                  color: kYellow_00,
                  thickness: 1,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.project_data,
                        style: kTextMedium.copyWith(fontSize: 14, color: kYellow_00),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListRowTexts(
                        flex: -2,
                        titles: [
                          strings.city,
                          strings.address,
                          strings.attendance_departure_report,
                        ],
                        values: [
                          item.cityName ?? '',
                          item.addressName ?? '',
                          item.typeAttendance ?? '',
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowText({required String title, required String value}) {
    return Row(
      children: [
        Text(title, style: kTextMedium.copyWith(fontSize: 14, color: kGreen_55)),
        Text(value, style: kTextRegular.copyWith(fontSize: 14, color: kGreen_85)),
      ],
    );
  }
}
