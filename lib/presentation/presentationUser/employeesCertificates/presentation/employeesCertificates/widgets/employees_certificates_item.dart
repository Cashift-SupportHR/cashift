import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../shared/components/base/user_info_widget.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/buttons/icon_text_button.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../data/models/index.dart';

///  Created by harbey on 7/16/2023.
class EmployeesCertificatesItem extends StatelessWidget {
  final EmployeeCertificate item;
  final Function() onShareEmployeeCertificate;
  final Function() onDownLoadEmployeeCertificate;

  const EmployeesCertificatesItem(
      {Key? key, required this.item, required this.onShareEmployeeCertificate, required this.onDownLoadEmployeeCertificate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, right: 4, left: 4),
         padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: Decorations.shapeDecoration(color: kWhite, radius: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 60),
                        child: UserInfoWidget(
                          image: item.logoUser ?? '',
                          name: item.name ?? '',
                          subTitle: item.birthDate ?? '',
                        ),
                      ),
                    ),
                    kBuildImageFixedSize(item.logo ?? '', border: 0, height: 80, width: 80),
                  ],
                ),
              ),
              Divider(
                color: kGrey_CA,
                thickness: 0.5,
                height: 1,
              ),
              _Footer(
                item: item,
                onShareEmployeeCertificate: onShareEmployeeCertificate,
                onDownLoadEmployeeCertificate: onDownLoadEmployeeCertificate,
              ),
            ],
          ),
        ),
        _Header(
          item: item
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final EmployeeCertificate item;
  const _Header({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 16),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.certificateBackground,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 5, start: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kBuildImageFixedSize(
                  item.logoHead ?? '',
                  border: 0,
                  width: 20,
                  height: 40,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  item.titleHead ?? '',
                  textAlign: TextAlign.center,
                  style: kTextMedium.copyWith(fontSize: 12, color: kWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends BaseStatelessWidget {
  final EmployeeCertificate item;
  final Function() onShareEmployeeCertificate;
  final Function() onDownLoadEmployeeCertificate;

  _Footer({
    Key? key,
    required this.item,
    required this.onShareEmployeeCertificate,
    required this.onDownLoadEmployeeCertificate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconTextButton(
            text: strings.share,
            icon: AppIcons.shareOutline,
            onTap: () {
              onShareEmployeeCertificate();
            },
          ),
          SizedBox(
            height: 30,
            width: 1,
            child: VerticalDivider(
              color: kGrey_C9,
              width: 1,
            ),
          ),
          IconTextButton(
            text: strings.vision_certificate,
            icon: AppIcons.visibilityOutline,
            onTap: () => Navigator.pushNamed(context, Routes.employeeCertificateDetails, arguments: item.id),
          ),
          SizedBox(
            height: 30,
            width: 1,
            child: VerticalDivider(
              color: kGrey_C9,
              width: 1,
            ),
          ),
          IconTextButton(
            text: strings.download_file,
            icon: AppIcons.downloadSquareOutline,
            onTap: () => onDownLoadEmployeeCertificate(),
          ),
        ],
      ),
    );
  }

  showDialogReset(BuildContext context) {
    return DialogsManager.baseDialog(
      context,
      confirmButtonName: strings.confirm_button,
      message: item.titleHead ?? '',
      icon: AppIcons.informationFill,
      hideCancelButton: false,
      onClickOk: () {
        onDownLoadEmployeeCertificate();
      },
    );
  }
}
