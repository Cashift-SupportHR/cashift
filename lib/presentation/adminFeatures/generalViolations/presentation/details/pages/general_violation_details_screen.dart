import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/image_builder.dart';
import '../../../../../../common/components/texts/icon_double_text.dart';
import '../../../domain/entities/index.dart';

class GeneralViolationScreen extends BaseStatelessWidget {
  final GeneralViolation item;

  GeneralViolationScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: Decorations.shapeDecorationShadow(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildIconDoubleText(
              icon: AppIcons.buildingsOutline,
              title: strings.company_name,
              value: item.companyName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.projectName,
              title: strings.project_name,
              value: item.projectName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.workingPeriodOutline,
              title: strings.working_period,
              value: item.shiftName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.complaint,
              title: strings.type,
              value: item.scheduleViolationName ?? '',
              colorText: kRed_12,
            ),
            buildIconDoubleText(
              icon: AppIcons.empName,
              title: strings.employee_name,
              value: item.employeeName ?? '',
            ),
            SizedBox(height: 10),
            buildIconDoubleText(
              icon: AppIcons.attachments_hazard,
              title: strings.attached_attachments,
              value: '',
            ),
            showImages(context),
            // SizedBox(height: 16),
            // responsibleResponse(),
          ],
        ),
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

  Container responsibleResponse() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: Decorations.decorationOnlyRadius(
        radius: 4,
        color: kOrange_29,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.responsible_response,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.responsible_response,
                style: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
              ),
              SizedBox(height: 10),
              Text(
                'سوف اراجع الوضع واتخذ الاجراء اللازم',
                style: kTextRegular.copyWith(fontSize: 14, color: kBlack_3C),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell showImages(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: item.imagesUrls ?? [],
        );
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: Decorations.boxDecorationBorder(
          borderColor: kGray_A5,
          radius: 2,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: item.imagesUrls
                .map((e) => Container(
                    alignment: Alignment.center,
                    decoration: Decorations.decorationOnlyRadius(radius: 2),
                    height: 36,
                    width: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    clipBehavior: Clip.antiAlias,
                    child: e.contains(".pdf")
                        ? Icon(
                            Icons.picture_as_pdf_outlined,
                            color: kWhite,
                            size: 40,
                          )
                        : kBuildImage(
                            e,
                            border: 0,
                            height: 36,
                            width: 50,
                            borderRadius: 0,
                          )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
