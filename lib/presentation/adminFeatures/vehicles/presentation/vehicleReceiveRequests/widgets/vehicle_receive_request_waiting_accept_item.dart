import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../domain/entities/vehicle_receive_request.dart';

class VehicleReceiveRequestWaitingAcceptItem extends BaseStatelessWidget {
  final VehicleReceiveRequest item;
  final Function()? onFinalAction;

  VehicleReceiveRequestWaitingAcceptItem({
    Key? key,
    required this.item,
    this.onFinalAction,
  }) : super(key: key);

  TextStyle titleStyle = kTextMedium.copyWith(color: kPrimary, fontSize: 14);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          vehicleData(),
          SizedBox(height: 20),
          otherData(context),
          if (onFinalAction != null) buildActionButton(context),
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

  TextValue buildTextValue({required String title, required String value}) {
    return TextValue(
      text: title,
      value: value,
      textStyle: titleStyle,
      valueStyle: valueStyle,
      isExpanded: false,
    );
  }

  InkWell notesWithImages(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: [item.attachmentPath],
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: Decorations.boxDecorationBorder(
            radius: 0, borderColor: kGray_70.withOpacity(0.41)),
        child: Column(
          children: [
            TextValue(
              text: strings.notes,
              value: "",
              textStyle: titleStyle,
              valueStyle: valueStyle,
            ),
            SizedBox(height: 10),
            listImages(context, item.attachmentPath ?? ''),
          ],
        ),
      ),
    );
  }

  Row listImages(BuildContext context, String image) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(strings.images + ": ", style: titleStyle),
        SizedBox(width: 10),
        Container(
          clipBehavior: Clip.antiAlias,
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
                  height: 36,
                  width: 50,
                  borderRadius: 0,
                ),
        ),
      ],
    );
  }

  vehicleData() {
    return Container(
      decoration: Decorations.shapeDecorationShadow(),
      child: ExpansionTile(
        title: Text(strings.vehicle_data, style: titleStyle),
        children: [
          ListRowTextsIconsV2(
            isExpanded: false,
            padding: EdgeInsets.symmetric(horizontal: 10),
            paddingItem: EdgeInsets.only(bottom: 10),
            titleStyle: titleStyle,
            valueStyle: titleStyle,
            isMark: true,
            items: [
              ListRowTextItem(
                icon: AppIcons.vehicle,
                title: strings.type,
                value: item.type ?? '',
              ),
              ListRowTextItem(
                icon: AppIcons.receiver_cashifter,
                title: strings.receiver_cashifter,
                value: item.freelancerName ?? '',
              ),
              ListRowTextItem(
                icon: AppIcons.timeOutline,
                title: strings.receive_period,
                value: item.shiftName ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }

  otherData(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: Decorations.boxDecorationBorder(
        radius: 0,
      ),
      child: Column(
        children: [
          buildIconDoubleText(
            icon: AppIcons.vehicle_number,
            title: strings.vehicle_number,
            value: item.vehiclePlateNumber ?? '',
            colorText: kPrimary,
          ),
          buildIconDoubleText(
            icon: AppIcons.dateOutline,
            title: strings.receive_date,
            value: item.vehicleHandoverDate ?? '',
            colorText: kPrimary,
          ),
          notesWithImages(context),
          buildTextValue(
            title: strings.the_problem_causer,
            value: item.actionTaken ?? '',
          ),
          SizedBox(height: 10),
          buildTextValue(
            title: strings.status,
            value: item.statusName ?? '',
          ),
        ],
      ),
    );
  }

  AppCupertinoButton buildActionButton(BuildContext context) {
    return AppCupertinoButton(
      onPressed: onFinalAction,
      text: strings.take_final_action,
      margin: EdgeInsets.only(top: 10),
      radius: BorderRadius.circular(5),
    );
  }
}
