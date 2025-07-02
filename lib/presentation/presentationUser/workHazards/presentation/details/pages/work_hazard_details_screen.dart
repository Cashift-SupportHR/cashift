import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../../shared/components/texts/icon_double_text.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/work_hazard.dart';

class WorkHazardDetailsScreen extends BaseStatelessWidget {
  final WorkHazard data;

  WorkHazardDetailsScreen({Key? key, required this.data}) : super(key: key);

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
              value: data.companyName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.projectName,
              title: strings.project_name,
              value: data.projectName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.workingPeriodOutline,
              title: strings.shift_name,
              value: data.shiftName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.complaint,
              title: strings.type,
              value: data.hazardTypeName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.degree_importance,
              title: strings.degree_importance,
              value: data.hazardPriorityLevelName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.complaint_status,
              title: strings.status,
              value: data.hazardStatusName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.submission_date,
              title: strings.submission_date,
              value: data.getSubmissionDate ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.details,
              title: strings.details,
              value: data.description ?? '',
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

  InkWell showImages(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: data.getImages ?? [],
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
            children: data.getImages
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
