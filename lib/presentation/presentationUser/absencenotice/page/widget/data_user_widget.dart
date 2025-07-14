import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../resources/constants.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';

import '../../../../../common/components/image_builder.dart';


class DataUserWidget extends BaseStatelessWidget {
  DataUserWidget({required this.employeeName, required this.projectName,required this.job,  required this.idNumber} );
   final String employeeName;
  final  String projectName;
  final   String job;
  final  String idNumber;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: Decorations.createRectangleWithColorDecoration(
            kPrimary, kWhite, 10),
        child: Wrap(
          runSpacing: 10,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textAndValue(
                    name: strings.employee_name,
                    value: employeeName,
                    isImage: true,
                    path: "userimge"),
                const SizedBox(
                  height: 12,
                ),
                textAndValue(
                    name: strings.project_name,
                    value: projectName,
                    isImage: true,
                    path: "bankimage"),
              ],
            ),
            // const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textAndValue(
                    name: strings.job, value: job, isImage: false, path: ""),
                const SizedBox(
                  height: 12,
                ),
                textAndValue(
                    name: strings.id_number,
                    value: idNumber,
                    isImage: false,
                    path: ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget textAndValue({
    required String name,
    required String value,
    required String? path,
    required bool isImage,
  }) {
    return Row(
      children: [

        isImage == true ? kLoadSvgInCircle(path!) : Container(),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: kTextMedium.copyWith(
            color: kPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: kTextMedium.copyWith(
            color: kGrey,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }




}
