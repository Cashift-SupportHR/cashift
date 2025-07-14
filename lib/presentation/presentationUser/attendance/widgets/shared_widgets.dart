import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/qrcode_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';

import '../../../../core/services/routes.dart';

Widget employeeInfo(BuildContext context, {required name, required job}) {
  return MaterialText(
    '${welcomeText(context)} \t'
        '${name ?? ''}',
    margin: const EdgeInsetsDirectional.only(start: 12, top: 8),
    style: kTextMediumPrimary.copyWith(fontSize: 12),
    startIcon: Icon(isMorning() ? Icons.sunny : Icons.nightlight_round,color:
    isMorning() ? kButterScotch :Colors.black45,),
    subText: Text(job?.toString() ?? '',style: kTextRegularSilver,),
    startIconPadding: const EdgeInsetsDirectional.only(end: 8),
  );
}

Widget companyInfoCard(BuildContext context,{
  required projectName,
  required city
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: MaterialText(
        projectName ?? '',
        style: kTextRegularPrimary.copyWith(fontSize: 13),
        subText: MaterialText(
        city.toString(),
          startIcon: SvgPicture.asset(
            Assets.shiftappImagesLocation,
            height: 14,
            color: kPrimary,
          ),
          startIconPadding: const EdgeInsetsDirectional.only(end: 4),
          style: kTextRegularGrey.copyWith(fontSize: 10),
        ),
        startIcon:Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child:  kBuildCircleImage('path', size: 60),
        ),
      ),
    ),
  );
}


String welcomeText(BuildContext context) {
  final strings = context.getStrings();
  return isMorning() ? strings.good_morning : strings.good_evening;
}

bool isMorning() =>
    DateTime
        .now()
        .hour < 12;

Future<QrCode> scanQr(BuildContext context, String code) async {
  if(Config.isDebuggable){
    File? file;
    return Future.value(QrCode(code,file));
  }
  return await Navigator.pushNamed(context, Routes.qrScanner) as QrCode;
}

Future<void> performAttendance(BuildContext context , String projectId, bool canSkipQr, {required Function(String projectId) onReadyToAttendance}) async {
  final qr = await scanQr(context, projectId);

  if (qr.code==projectId || canSkipQr==true) {
    onReadyToAttendance(projectId);
  } else {
    DialogsManager.showMessageDialog(context, context.getStrings().error_qr, onClickOk: () {});
  }
}
