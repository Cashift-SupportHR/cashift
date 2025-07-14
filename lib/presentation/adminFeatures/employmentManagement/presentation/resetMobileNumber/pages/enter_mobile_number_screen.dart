import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentManagement/presentation/resetMobileNumber/widgets/select_places_send_code_list.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/snckBar/snack_bar_manager.dart';

import '../../../../../../utils/app_utils.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/validation.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../../common/components/selectImage/select_image_gallery.dart';
import '../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../data/models/change_phone_number_params.dart';
import '../../../domain/entities/reset_phone_data.dart';
import '../bloc/reset_mobile_number_state.dart';

class EnterMobileNumberScreen extends BaseStatelessWidget {
  final ResetMobileNumberState state;
  final Function(ChangePhoneNumberParams) onChangePhoneNumber;

  EnterMobileNumberScreen({
    Key? key,
    required this.state,
    required this.onChangePhoneNumber,
  }) : super(key: key);

  File file = File('');
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResetPhoneData resetPhoneData = state.resetPhoneData;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: kBuildImage(
              resetPhoneData.icon ?? '',
              size: 150,
              border: 0,
            ),
          ),
          SizedBox(height: 16),
          Text(
            resetPhoneData.subHeaderLabel ?? '',
            style: kTextRegular.copyWith(
              fontSize: 14,
              color: kGray_64,
            ),
          ),
          SizedBox(height: 10),
          BuildTextFieldItem(
            title: resetPhoneData.inputPhoneNumberLabel ?? '',
            controller: phoneController,
            hintText: resetPhoneData.inputPhoneNumberLabel ?? '',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isNullOrEmpty()) {
                return strings.please_entry_phone;
              } else if (!Validation.isValidPhone(
                  AppUtils.replaceArabicNumber(value))) {
                return strings.invalid_phone;
              }
              return null;
            },
            onChanged: (value) {},
          ),
          Text(
            resetPhoneData.detailsLabel ?? '',
            style: kTextMedium.copyWith(
              fontSize: 14,
              color: kGreen_5F,
            ),
          ),
          SizedBox(height: 16),
          SelectImageGallery(
            uploadLabel: resetPhoneData.uploadLabel ?? '',
            uploadIcon: resetPhoneData.uploadIcon ?? '',
            onPicker: (value) {
              file = value;
            },
          ),
          AppCupertinoButton(
            text: strings.send,
            margin: EdgeInsets.only(top: 25),
            onPressed: () {
              showSelectPlacesSendCodeBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  showSelectPlacesSendCodeBottomSheet(BuildContext context) {
    showAppModalBottomSheet(
      context: context,
      title: 'اين تريد ارسال كود التحقق ؟',
      child: Scaffold(
        body: SelectPlacesSendCodeList(
          notificationTypeCodes: state.notificationTypeCodes,
          onSelect: (id) {
            onResetMobileNumber(id, context);
          },
        ),
      ),
    );
  }

  onResetMobileNumber(int? id, BuildContext context) {
    if (file.path.isEmpty) {
      SnackBarManager.showErrorSnackBar(
        context,
        strings.proof_file_must_uploaded,
      );
    } else if (id == null || id == 0) {
      SnackBarManager.showErrorSnackBar(
        context,
        strings.must_choose_where_send_verification_code,
      );
    } else {
      Navigator.pop(context);
      onChangePhoneNumber(
        ChangePhoneNumberParams(
          freeLanceInfoId: 0,
          newPhoneNumber: phoneController.text,
          attachmentFile: file,
          notificationType: id,
        ),
      );
    }
  }
}
