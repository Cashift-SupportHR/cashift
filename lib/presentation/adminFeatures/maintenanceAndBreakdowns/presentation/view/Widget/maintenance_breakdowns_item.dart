import 'package:shiftapp/common/domain/constants/codes_constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../domain/entities/maintenance.dart';

class MaintenanceBreakdownsItem extends BaseStatelessWidget {
  final String code;
  final int tapId;
  final Maintenance item;
  bool isPlan;
  final Function() onAction;

  //
  MaintenanceBreakdownsItem({
    Key? key,
    required this.code,
    required this.item,
    required this.isPlan,
    required this.tapId,
    required this.onAction,
  }) : super(key: key);

  TextStyle titleStyle = kTextMedium.copyWith(color: kPrimary, fontSize: 12);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    print(tapId);
    print("jkjkjkjk");

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
          ListRowTextsIconsV2(
            isExpanded: false,
            paddingItem: EdgeInsets.only(bottom: 10),
            titleStyle:  kTextBold.copyWith(fontSize: 12, color: kOrange00),
            valueStyle: valueStyle,
            isMark: true,
            iconColor: kOrange00,

            items: [

              ListRowTextItem(
                icon: AppIcons.details,
                title: strings.details,

                value: item.description ?? "",
              ),
            ],
          ),
          imagesBefore(context),
          imagesAfter(context),
      if(isPlan==false)    ...[
            SizedBox(
              height: 5,
            ),
            if (tapId != 1)
              ListRowTextsV2(
                isExpanded: false,
                titleStyle: titleStyle,
                valueStyle: valueStyle,
                isMark: true,
                items: items2(),
              ),
            if (code == CodesConstants.reviewed) responsibleResponse(context),
            if (code != CodesConstants.reviewed) buildActionButton(context),
          ]

        ],
      ),
    );
  }

  List<ListRowTextItem> items() {
    return [
      ListRowTextItem(
        icon: AppIcons.typeOperation,
        title: strings.type_operation,
        value: item.faultMaintenanceType ?? "",
      ),
      ListRowTextItem(
        icon: AppIcons.submission_date,

        title: strings.submission_date,
        value: item.dateFaultApplying ?? "",
      ),

    ];
  }

  List<ListRowTextItem> items2() {
    return [
      if (item.shiftAdminAction != null || item.shiftAdminAction != "")
        ListRowTextItem(
          title: strings.action_taken,
          value: item.shiftAdminAction ?? "",
        ),
      if (item.importantLevel != null || item.importantLevel != "")
        ListRowTextItem(
          title: strings.status,
          value: item.importantLevel ?? "",
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

  Container imagesAfter(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorder(
          radius: 0, borderColor: kGray_70.withOpacity(0.41)),
      child: Column(
        children: [
          buildIconText(
            icon: AppIcons.attachments_hazard,
            title: strings.image_after_maintenance,
          ),
          SizedBox(height: 10),
          listImages(context, item.faultMaintenanceImagesAfter ?? []),
        ],
      ),
    );
  }

  Container imagesBefore(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorder(
          radius: 0, borderColor: kGray_70.withOpacity(0.41)),
      child: Column(
        children: [
          buildIconText(
            icon: AppIcons.attachments_hazard,
            title: strings.image_before_maintenance,
          ),
          SizedBox(height: 10),
          listImages(context, item.faultMaintenanceImagesBefore ?? []),
        ],
      ),
    );
  }

  InkWell listImages(BuildContext context, List<String>? imagesPath) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: imagesPath,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: imagesPath
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

  Container responsibleResponse(context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: Decorations.decorationOnlyRadius(
        radius: 4,
        color: kOrange_29,
      ),
width: MediaQuery.of(context).size.width-40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.responsible_response,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.responsible_response,
                  style:
                      kTextRegular.copyWith(fontSize: 14, color: kOrange00),
                ),
                SizedBox(height: 5),
                Text(
                  item.adminAction ?? '',

                  style:
                      kTextRegular.copyWith(fontSize: 13, color: kBlack_3C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppCupertinoButton buildActionButton(BuildContext context) {
    return AppCupertinoButton(
      onPressed: onAction,
      text: code == CodesConstants.waitingReview || code == ""
          ? strings.take_action
          : strings.final_action,
      margin: EdgeInsets.only(top: 15),
      radius: BorderRadius.circular(5),
    );
  }
}
