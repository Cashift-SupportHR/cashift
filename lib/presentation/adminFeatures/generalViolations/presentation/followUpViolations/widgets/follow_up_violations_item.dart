import 'package:shiftapp/domain/constants/codes_constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../domain/entities/follow_up_violation.dart';

class FollowUpViolationItem extends BaseStatelessWidget {
  final String code;
  final FollowUpViolation item;
  final Function() onAction;

  FollowUpViolationItem({
    Key? key,
    required this.code,
    required this.item,
    required this.onAction,
  }) : super(key: key);

  TextStyle titleStyle = kTextMedium.copyWith(color: kPrimary, fontSize: 14);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          ListRowTextsIconsV2(
            isExpanded: false,
            paddingItem: EdgeInsets.only(bottom: 10),
            titleStyle: titleStyle,
            valueStyle: valueStyle,
            isMark: true,
            items: items(),
          ),
          notesWithImages(context),
          if (code == CodesConstants.reviewed) responsibleResponse(),
          if (code != CodesConstants.waitingReview)
            Column(
              children: [
                buildTextValue(
                  title: strings.the_problem_causer,
                  value: item.adminAction ?? '',
                ),
              ],
            ),
          SizedBox(height: 10),
          buildTextValue(
            title: strings.status,
            value: item.importantLevel ?? '',
          ),
          buildActionButton(context),
        ],
      ),
    );
  }

  List<ListRowTextItem> items() {
    return [
      ListRowTextItem(
        icon: AppIcons.violation_type,
        title: strings.violation_type,
        value: item.violationType ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.buildingsOutline,
        title: strings.company_name,
        value: item.companyName ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.streetName,
        title: strings.street_name,
        value: item.streetName ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.submission_date,
        title: strings.submission_date,
        value: item.getSubmissionDate ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.details,
        title: strings.details,
        value: item.details ?? '',
      ),
    ];
  }

  Padding buildIconText(
      {required String icon, required String title, Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconText(
        icon: icon,
        text: title + ' :',
        textStyle: titleStyle,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Container notesWithImages(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorder(
          radius: 0, borderColor: kGray_70.withOpacity(0.41)),
      child: Column(
        children: [
          buildIconText(
            icon: AppIcons.attachments_hazard,
            title: strings.attached_attachments,
          ),
          SizedBox(height: 10),
          listImages(context),
          Divider(
            height: 40,
            color: kGray_70.withOpacity(0.20),
          ),
          buildTextValue(
            title: strings.the_problem_causer,
            value: item.adminAction ?? '',
          ),
          SizedBox(height: 10),
          buildTextValue(
            title: strings.status,
            value: item.importantLevel ?? '',
          ),
        ],
      ),
    );
  }

  InkWell listImages(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: item.imagesPath,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: item.imagesPath
                ?.map((image) => Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: Decorations.boxDecorationShaded(radius: 5),
                      child: image.contains(".pdf")
                          ? Icon(
                              Icons.picture_as_pdf_outlined,
                              color: kWhite,
                              size: 40,
                            )
                          : kBuildImage(
                              image,
                              border: 0,
                              height: 42,
                              width: 60,
                              borderRadius: 0,
                            ),
                    ))
                .toList() ??
            [],
      ),
    );
  }

  TextValue buildTextValue({required String title, required String value}) {
    return TextValue(
      text: title,
      value: value,
      textStyle: titleStyle,
      valueStyle: valueStyle,
      isExpanded: false,
    );
  }

  Container responsibleResponse() {
    return Container(
      margin: EdgeInsets.only(top: 10),
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
                item.shiftAdminAction ?? '',
                style: kTextRegular.copyWith(fontSize: 14, color: kBlack_3C),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppCupertinoButton buildActionButton(BuildContext context) {
    return AppCupertinoButton(
      onPressed: onAction,
      text: code == CodesConstants.waitingReview
          ? strings.take_action
          : strings.final_action,
      margin: EdgeInsets.only(top: 15),
      radius: BorderRadius.circular(5),
    );
  }
}
