import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import '../../../../../../common/components/base/user_info_widget.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../../../common/components/texts/list_row_texts.dart';
import '../../../../../../common/components/texts/text_value_ratting.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/ban_employee.dart';
import '../../../domain/entities/ban_employee_constants.dart';

class BanEmployeeItem extends BaseStatelessWidget {
  final BanEmployee item;
  final int type;
  final Function(int) onUpdateEmployeeStatus;

  BanEmployeeItem({
    Key? key,
    required this.item,
    required this.type,
    required this.onUpdateEmployeeStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: Decorations.decorationTabs,
            child: Column(
              children: [
                UserInfoWidget(
                  name: item.freelanceName ?? '',
                  image:
                      item.freelanceLogo ?? '',
                  nameStyle: kTextBold.copyWith(color: kBlack_3C, fontSize: 14),
                  imageSize: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                ListRowTexts(
                  spaceVert: 10,
                  isExpanded: false,
                  padding: EdgeInsetsDirectional.only(start: 10),
                  titleStyle: kTextSemiBold.copyWith(color: kPrimaryDark),
                  valueStyle:
                      kTextLabel.copyWith(color: kBattleShipGrey, fontSize: 14),
                  titles: [
                    strings.project,
                    strings.nods,
                  ],
                  values: [
                    item.projectName ?? '',
                    item.freelanceNotes ?? '',
                  ],
                ),
                Divider(
                  color: kGrey_DF,
                  height: 20,
                ),
                TextValueRatting(
                    text: strings.review_project,
                    initialRating: item.evaluationPerProject?.toDouble() ?? 0.0,
                    value: item.evaluationPerProject ?? 0),
                TextValueRatting(
                    text: strings.review_company,
                    initialRating: item.evaluationPerCompany?.toDouble() ?? 0.0,
                    value: item.totalEvaluationPerCompany ?? 0),
                WarningWidget(
                  warningText: item.description ?? strings.more_than_about_emp,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.banEmployeeDetailsPage,
                      arguments: item.freelanceId,
                    );
                  },
                  color: kGreen_2,
                  textClick: strings.click,
                )
              ],
            )),
        _OptionsMenuButton(
          type: type,
          onUpdateEmployeeStatus: onUpdateEmployeeStatus,
        ),
      ],
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final int type;
  final Function(int) onUpdateEmployeeStatus;

  _OptionsMenuButton({
    Key? key,
    required this.type,
    required this.onUpdateEmployeeStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        kTextRegular.copyWith(fontSize: 14, color: kBlack.withOpacity(0.5));
    double iconSize = 16;
    return OptionsMenuButton(
      options: [
        if (type != BanEmployeeConstants.accepted)
          BuildPopupMenuItemContent(
            title: strings.accept_but,
            titleStyle: titleStyle,
            iconSize: iconSize,
            isDivider: type != BanEmployeeConstants.rejected,
          ),
        if (type != BanEmployeeConstants.rejected)
          BuildPopupMenuItemContent(
            title: strings.reject_but,
            titleStyle: titleStyle,
            iconSize: iconSize,
            isDivider: false,
          ),
        // BuildPopupMenuItemContent(
        //   title: strings.more_than,
        //   iconPath: '',
        //   titleStyle: titleStyle,
        //   iconSize: iconSize,
        // ),
      ],
      onSelect: (value) async {
        print('value: $value');
        print('type: $type');
        if (type == BanEmployeeConstants.waitingAccept) {
          if (value == 0) {
            onUpdateEmployeeStatus(BanEmployeeConstants.accepted);
          } else if (value == 1) {
            onUpdateEmployeeStatus(BanEmployeeConstants.rejected);
          }
        } else if (type == BanEmployeeConstants.accepted) {
          if (value == 0) {
            onUpdateEmployeeStatus(BanEmployeeConstants.rejected);
          }
        } else if (type == BanEmployeeConstants.rejected) {
          if (value == 0) {
            onUpdateEmployeeStatus(BanEmployeeConstants.accepted);
          }
        }
      },
    );
  }
}
