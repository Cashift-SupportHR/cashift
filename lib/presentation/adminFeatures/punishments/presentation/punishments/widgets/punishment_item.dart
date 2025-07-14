import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';
import 'package:shiftapp/common/components/texts/list_row_texts.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/divider/custom_divider.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/punishment.dart';
import '../../../domain/entities/punishments_status.dart';
import '../../addPunishment/pages/add_punishment_page.dart';

class PunishmentItem extends BaseStatelessWidget {
  final int type;
  final Punishment punishment;
  final Function() onRefresh;
  final Function() onActivate;
  final Function() onDelete;

  PunishmentItem(
      {Key? key,
      required this.type,
      required this.punishment,
      required this.onRefresh,
      required this.onActivate,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16),
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconText(
                text: punishment.violationTypeName ?? '',
                icon: punishment.logo ?? '',
                isImage: true,
                iconSize: 30,
                sizedBoxWidth: 0,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              _OptionsMenuButton(
                id: punishment.id ?? 0,
                type: type,
                onRefresh: onRefresh,
                onActivate: onActivate,
                onDelete: onDelete,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30),
            child: ListRowTexts(
              flex: 2,
              spaceVert: 14,
              titles: [
                strings.punishment_name,
                if(punishment.typesOfViolation == PunishmentsStatus.financialDiscount)
                strings.discount_value,
                strings.company_name,
                if(punishment.typesOfViolation == PunishmentsStatus.temporaryDiscount)
                strings.num_prohibited_days,
              ],
              values: [
                punishment.typesOfViolationName ?? '',
                if(punishment.typesOfViolation == PunishmentsStatus.financialDiscount)
                punishment.amountViolation.toString(),
                punishment.companyName ?? '',
                if(punishment.typesOfViolation == PunishmentsStatus.temporaryDiscount)
                punishment.totalViolationDays.toString() ?? '',
              ],
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final int id;
  final int type;
  final Function() onRefresh;
  final Function() onActivate;
  final Function() onDelete;

  _OptionsMenuButton({
    Key? key,
    required this.id,
    required this.type,
    required this.onRefresh,
    required this.onActivate,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_punishment,
          iconPath: AppIcons.editPenOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: type == PunishmentsStatus.active
              ? strings.deactivate_punishment
              : strings.activate_punishment,
          iconPath: AppIcons.statusChange,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.delete_punishment,
          iconPath: AppIcons.deleteOutline,
          titleStyle: titleStyle.copyWith(color: kRed),
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          AddPunishmentPage.push(context, id: id, onSuccess: () {
            onRefresh();
          });
        } else if (value == 1) {
          onActivate();
        } else if (value == 2) {
          onDelete();
        }
      },
    );
  }
}
