import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../../main_index.dart';
import '../../../../../../../utils/app_icons.dart';
import '../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';

class VehicleViolationDetailsScreen extends BaseStatelessWidget {
  final ContractViolation data;

  VehicleViolationDetailsScreen({Key? key, required this.data})
      : super(key: key);

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
              icon: AppIcons.violation_type,
              title: strings.violation_type,
              value: data.contractViolationType ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.buildingsOutline,
              title: strings.company_name,
              value: data.companyName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.streetName,
              title: strings.street_name,
              value: data.streetName ?? '',
            ),
            buildIconDoubleText(
              icon: AppIcons.details,
              title: strings.details,
              value: data.details ?? '',
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
