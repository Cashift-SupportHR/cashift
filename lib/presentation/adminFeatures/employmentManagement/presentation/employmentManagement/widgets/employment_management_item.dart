import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentManagement/presentation/resetMobileNumber/pages/reset_mobile_number_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/texts/text_value.dart';
import 'package:shiftapp/presentation/shared/components/texts/underline_text.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/components/base/user_info_widget_with_icon.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/dialogs/block_employee_dialog.dart';
import '../../../../../shared/components/checkbox/check_box_terms_and_conditions.dart';
import '../../../../../shared/components/checkbox/warning_check_box_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/dialogs_manager.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../../shared/components/texts/list_row_texts.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../data/models/add_block_employee_params.dart';
import '../../../data/models/popup_employment_management_dto.dart';
import '../../../domain/entities/employee_data.dart';
import '../../../domain/entities/popup_employment_management.dart';
import '../../../domain/entities/reset_phone_args.dart';
import '../page/employment_management_builder.dart';

///  Created by harbey on 7/31/2023.
class EmploymentManagementItem extends BaseStatelessWidget {
  final bool isDecorations;
  final EmployeeData item;
  final Function()? onRefresh;
  final PopupEmploymentManagement? popups;
  final Function(AddBlockEmployeeParams) onBlockEmployee;
  final Function(int) onAllowEditFaceRecognition;

  EmploymentManagementItem({
    Key? key,
    this.isDecorations = true,
    required this.item,
    this.onRefresh,
    this.popups,
    required this.onBlockEmployee,
    required this.onAllowEditFaceRecognition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // color: isDecorations ? null : kWhite,
      decoration: isDecorations ? Decorations.shapeDecoration() : null,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          if (isDecorations)
            _OptionsMenuButton(
              item: item,
              onRefresh: onRefresh ?? () {},
              popups: popups,
              onBlockEmployee: onBlockEmployee,
              onAllowEditFaceRecognition: onAllowEditFaceRecognition,
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoWidgetWithIcon(
                  image: item.logo ?? '',
                  name: item.name ?? '',
                  phone: item.phone ?? '',
                  email: item.email ?? '',
                  job: item.favoriteJob ?? '',
                ),
                Divider(
                  color: kGrey_DF,
                  height: 25,
                  thickness: 0.7,
                ),
                TextValue(
                  text: strings.qualification + ':',
                  value: item.qualificationDataName ?? '',
                  textStyle: kTextSemiBold.copyWith(fontSize: 18, color: kPrimary),
                  isExpanded: false,
                  valueStyle: kTextMedium.copyWith(fontSize: 12, color: kBattleShipGrey),
                ),
                SizedBox(height: 5),
                _Footer(
                  item: item,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final EmployeeData item;
  final Function() onRefresh;
  final PopupEmploymentManagement? popups;
  final Function(AddBlockEmployeeParams) onBlockEmployee;
  final Function(int) onAllowEditFaceRecognition;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
    this.popups,
    required this.onBlockEmployee,
    required this.onAllowEditFaceRecognition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextRegular.copyWith(fontSize: 14, color: kBlack.withOpacity(0.5));
    double iconSize = 16;
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.procedures,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        // BuildPopupMenuItemContent(
        //   title: strings.more_details,
        //   titleStyle: titleStyle,
        //   iconSize: iconSize,
        // ),
        BuildPopupMenuItemContent(
          title: strings.company_wide_ban,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.reset_face_fingerprint,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.reset_mobile_number,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          showEmployeeDataSheet(context);
        } else if (value == 1) {
          showBlockEmployeeDialog(context);
        } else if (value == 2) {
          showResetFaceFingerprintDialog(context);
        } else if (value == 3) {
          showResetMobileNumberDialog(context);
        }
      },
    );
  }

  showEmployeeDataSheet(BuildContext context) {
    showAppModalBottomSheet(
      context: context,
      radius: 18,
      isDivider: false,
      padding: EdgeInsets.zero,
      titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      titleWidget: UnderlineText(
        text: strings.chashifter_data,
        fontSize: 16,
      ),
      child: EmployeeDataBuilder(
        onRefresh: onRefresh,
        employeeData: item,
      ),
    );
  }

  showResetFaceFingerprintDialog(BuildContext context) {
    StreamStateInitial<bool> isConfirmButtonStream = StreamStateInitial();
    isConfirmButtonStream.setData(false);
    DialogsManager.baseDialog(
      context,
      message: popups?.faceDto?.headerLabel ?? '',
      description: popups?.faceDto?.detailsLabel ?? '',
      icon: popups?.faceDto?.icon ?? AppIcons.info_reset_mobile,
      confirmButtonName: popups?.faceDto?.confirmButtonName ?? '',
      negativeButtonName: popups?.faceDto?.canelButtonName ?? '',
      isActiveConfirmButtonStream: isConfirmButtonStream,
      hideCancelButton: false,
      cutomBodyWidegt: CheckBoxTermsAndConditions(
        onChanged: (value) {
          isConfirmButtonStream.setData(value ?? false);
        },
      ),
      onClickOk: () {
        Navigator.pop(context);
        onAllowEditFaceRecognition(item.freeLanceId ?? 0);
      },
    );
  }

  showBlockEmployeeDialog(BuildContext context) {
    DialogsManager.baseDialog(
      context,
      message: popups?.blockDto?.headerLabel ?? '',
      description: popups?.blockDto?.detailsLabel ?? '',
      icon: popups?.blockDto?.icon ?? AppIcons.info_reset_mobile,
      confirmButtonName: popups?.blockDto?.confirmButtonName ?? '',
      negativeButtonName: popups?.blockDto?.canelButtonName ?? '',
      hideCancelButton: false,
      onClickOk: () {
        Navigator.pop(context);
        DialogsManager.customDialog(
          context,
          child: BlockEmployeeDialog(
            popup: popups?.blockDto ?? BlockDto(),
            onConfirm: (value) {
              Navigator.pop(context);
              onBlockEmployee(
                AddBlockEmployeeParams(
                  freeLancerId: item.freeLanceId ?? 0,
                  banReason: value,
                ),
              );
            },
          ),
        );
      },
    );
  }

  showResetMobileNumberDialog(BuildContext context) {
    DialogsManager.baseDialog(
      context,
      message: popups?.updateDto?.headerLabel ?? '',
      description: popups?.updateDto?.detailsLabel ?? '',
      icon: popups?.updateDto?.icon ?? AppIcons.info_reset_mobile,
      confirmButtonName: popups?.updateDto?.confirmButtonName ?? '',
      negativeButtonName: popups?.updateDto?.canelButtonName ?? '',
      hideCancelButton: false,
      onClickOk: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.resetMobileNumberPage,
            arguments: ResetPhoneArgs(
              employee: item,
              popups: popups ?? PopupEmploymentManagement(),
            ));
      },
    );
  }
  //
  // confirmationDialog(BuildContext context, BlockDto? blockDto){
  //   DialogsManager.baseDialog(
  //     context,
  //
  //   );
  // }
}

class _Footer extends BaseStatelessWidget {
  final EmployeeData item;

  _Footer({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListRowTexts(
            flex: -2,
            spaceHoriz: 5,
            titles: [
              strings.age,
              strings.id_number,
              strings.weight,
            ],
            values: [
              item.age ?? '',
              item.idNumber ?? '',
              item.weight ?? '',
            ],
          ),
        ),
        Expanded(
          child: ListRowTexts(
            flex: -2,
            // titleStyle: titleStyle,
            // valueStyle: valueStyle,
            spaceHoriz: 5,
            titles: [
              strings.city,
              strings.nationality,
              strings.height,
            ],
            values: [
              item.cityName ?? '',
              item.national ?? '',
              item.length ?? '',
            ],
          ),
        ),
      ],
    );
  }
}
