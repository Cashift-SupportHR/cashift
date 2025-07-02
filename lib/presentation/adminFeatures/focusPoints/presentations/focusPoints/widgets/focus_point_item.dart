import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../presentationUser/workerWorkPlaces/widgets/point_name_and_status.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/divider/divider_vertical.dart';
import '../../../../../shared/components/icons/icon_text.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../../shared/components/texts/icon_double_text.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/focus_point.dart';
import '../../edit/edit_covenant_received_page.dart';
import '../../edit/edit_focus_point_data_page.dart';
import '../../trackingFocusPoints/widgets/point_image.dart';

///  Created by harbey on 5/7/2023. required this.gate,
class FocusPointItem extends BaseStatelessWidget {
  final FocusPoint point;
  final Function()? onRefresh;
  final Function(int) onDeleteFocusPoint;

  FocusPointItem(
      {Key? key,
      required this.point,
      this.onRefresh,
      required this.onDeleteFocusPoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: Decorations.decorationWithGradientNotSpreadRadius(
            offset: const Offset(2, 0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PointImage(
                    image: point.image ?? '',
                    margin: EdgeInsets.zero,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FocusPointNameAndStatus(
                          name: point.focusPointName ?? '',
                          status: point.statusName ?? '',
                          styleName: kTextSemiBold.copyWith(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconText(
                                icon: AppIcons.location,
                                iconSize: 18,
                                text: point.projectName ?? '',
                                textStyle: kTextSemiBold.copyWith(fontSize: 16),
                              ),
                              const DividerVertical(),
                              Text(point.freelanceType ?? '',
                                  style: kTextMedium.copyWith(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _BodyMyGate(point: point),
            ],
          ),
        ),
        PositionedDirectional(
          end: 0,
          child: OptionsMenuButton(
            options: [
              BuildPopupMenuItemContent(
                title: strings.edit_focus_point_data,
                iconPath: AppIcons.editPenOutline,
                isDivider: false,
              ),
              // BuildPopupMenuItemContent(
              //   title: strings.edit_focus_point_times,
              //   iconPath: AppIcons.editPenOutline,
              //   isDivider: false,
              // ),
              BuildPopupMenuItemContent(
                title: strings.edit_covenant_received,
                iconPath: AppIcons.editPenOutline,
                isDivider: false,
              ),
              BuildPopupMenuItemContent(
                title: strings.delete_focus_point,
                iconPath: AppIcons.deleteOutline,
                isDivider: false,
              )
            ],
            onSelect: (index) async {
              if (index == 0) {
                final isRefresh = await Navigator.pushNamed(
                    context, Routes.editFocusPointDataPage,
                    arguments: point.id);
                if (isRefresh == true) {
                  onRefresh!();
                }
              }
              // else if (index == 1) {
              //   Navigator.pushNamed(context, EditFocusPointTimesPage.routeName,
              //       arguments: point
              //   );
              // }
              else if (index == 1) {
                Navigator.pushNamed(context, Routes.editCovenantReceivedPage,
                    arguments: point.id);
              } else {
                onDeleteFocusPoint(point.id!);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _BodyMyGate extends BaseStatelessWidget {
  final FocusPoint point;

  _BodyMyGate({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDoubleText(
            icon: AppIcons.typeGate,
            iconColor: kOrange_03,
            name: strings.gate_type,
            nameStyle: kTextMedium.copyWith(color: kOrange_03, fontSize: 13),
            value: point.focusPointType ?? '',
          ),
          const SizedBox(
            height: 12,
          ),
          IconDoubleText(
            icon: AppIcons.calendarOutline,
            iconColor: kOrange_03,
            name: strings.added_date,
            nameStyle: kTextMedium.copyWith(color: kOrange_03, fontSize: 13),
            value: DateFormatter.repairApiTime(
              point.addedDate!,
              apiPattern: DateFormatter.DATE_Api_DD_MM_YYYY,
              pattern: DateFormatter.DATE_D_MMM_YYYY,
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              kLoadSvgInCirclePath(
                AppIcons.bagTimeOutline,
                color: kOrange_03,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                strings.working_period + ' : ',
                style: kTextMedium.copyWith(color: kOrange_03, fontSize: 13),
              ),
              const SizedBox(
                width: 5,
              ),
             Wrap(
               spacing: 5,
               children:
                 point.shifts!.map((e) => Chip(
                   label: Text(e.shiftName ?? '', style: kTextRegular.copyWith(color: kPrimary, fontSize: 10),),
                   backgroundColor: kGrey_EF.withOpacity(0.60),
                   labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(6),
                   ),
                 )).toList(),
             ),

            ],
          )
        ],
      ),
    );
  }
}
