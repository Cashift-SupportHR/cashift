import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/texts/icon_double_text.dart';
import '../../../../../../common/components/texts/list_row_texts_icons.dart';
import '../../../domain/entities/RequestAttendanceDepartureDetails.dart';
import '../../../domain/entities/track_attendance_departure_image.dart';

class TrackUserItem extends BaseStatelessWidget {
  final RequestAttendanceDepartureDetails data;

  TrackUserItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: 130,
      width: double.infinity,
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          Text(
            data.freelancerName??"",
            style: kTextBold.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListRowTextsIcons(
                      titleStyle: kTextRegular.copyWith(fontSize: 12,color: kPrimary),
                      icons: [
                        AppIcons.nationality,
                        AppIcons.phoneSolid,
                        AppIcons.id,
                      ],
                      titles: [
                        strings.nationality,
                        strings.phone,
                        strings.id_number,
                      ],
                      values: [
                       data.freelancerNationality??"",
                        data.freelancerPhoneNumber??'',
                        data.freelancerIdNumber??'',
                      ]),
                ),
                SizedBox(
                  width: 82,
                  height: 82,
                  child: InkWell(
                      onTap: () {
                        // List<String> images = [item.faceRecognitionPath ?? ""];
                        // Navigator.pushNamed(context, Routes.filesPreviewPage,
                        //     arguments: images);
                      },
                      child: kBuildImage(
                       data.freelancerProfileImage?? '',
                        width: double.infinity,
                        height: 82,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
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
