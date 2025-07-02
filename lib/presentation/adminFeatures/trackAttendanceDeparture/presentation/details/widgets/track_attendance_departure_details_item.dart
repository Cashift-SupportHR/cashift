import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/texts/icon_double_text.dart';
import '../../../../../shared/components/texts/list_row_texts_icons.dart';
import '../../../domain/entities/TrackFaceRecognitionDetailsList.dart';

class TrackAttendanceDepartureDetailsItem extends BaseStatelessWidget {
  final TrackFaceRecognitionDetailsList item;

  TrackAttendanceDepartureDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                List<String> images = [item.faceRecognitionPath ?? ""];
                Navigator.pushNamed(context, Routes.filesPreviewPage,
                    arguments: images);
              },
              child: kBuildImage(
                item.faceRecognitionPath ?? '',
                width: double.infinity,
                height: 82,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 10,
          ),
          ListRowTextsIcons(
              iconColor: kGray_64,
              flex: 2,
              titleStyle: kTextRegular.copyWith(color: kBlack_00, fontSize: 9),
              valueStyle: kTextRegular.copyWith(
                fontSize: 9,
              ),
              icons: [
                AppIcons.calendar,
                AppIcons.time3,
                AppIcons.type_1,
                AppIcons.projectName,
              ],
              titles: [
                strings.date,
                strings.time,
                strings.fingerprint_type,
                strings.project_name,
              ],
              values: [
                item.dateFormat ?? '',
                item.timeFormat ?? '',
                item.status ?? '',
                item.projectName ?? '',
              ]),
        ],
      ),
    );
  }

  Padding buildIconDoubleText(
      {required String icon,
      required String title,
      required String value,
      Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
