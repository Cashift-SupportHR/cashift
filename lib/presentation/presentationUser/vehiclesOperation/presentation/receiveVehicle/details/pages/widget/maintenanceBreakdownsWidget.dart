import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/showImagesListWidget.dart';

 import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
 import '../../../../../../../shared/components/index.dart';

import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

import '../../bloc/receive_vehicle_details_state.dart';
import 'customExpansionTile.dart';

class MaintenanceBreakdownsWidget extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  final Function(int) onFetchRoundsMaintenance;

  MaintenanceBreakdownsWidget({
    super.key,
    required this.onFetchRoundsMaintenance,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
    TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

    return CustomExpansionTile(
      title: strings.breakdown_maintenance,
      icon: AppIcons.maintenancev2,
      isShowBorder: false,
      countStream: state.maintenanceStream,
      onExpansionChanged: (value) {
        if (state.maintenanceBreakdowns.data == null) {
          onFetchRoundsMaintenance(state.details.roundTripId ?? 0);
        }
      },
      child: StreamDataStateWidget<MaintenanceData?>(
        stream: state.maintenanceBreakdowns,
        builder: (context, data) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data?.data?.length ?? 0,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = data?.data?[index];

              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: Decorations.boxDecorationBorder(radius: 0),
                child: Column(
                  children: [
                    ListRowTextsIconsV2(
                      titleStyle: titleStyle.copyWith(color: kPrimary),
                      valueStyle: valueStyle,
                      isExpanded: false,
                      iconColor: kPrimary,
                      paddingItem: EdgeInsets.only(bottom: 10),
                      items: [
                        ListRowTextItem(
                          icon: AppIcons.typeOperation,
                          title: strings.type_operation,
                          value: item?.faultMaintenanceType ?? "",
                        ),
                        ListRowTextItem(
                          icon: AppIcons.details,
                          title: strings.details,
                          value: item?.description ?? "",
                        ),

                        ListRowTextItem(
                          icon: AppIcons.submission_date,

                          title: strings.submission_date,
                          value: item?.dateFaultApplying ?? "",
                        ),
                      ],
                    ),
                    imagesMaintenance(
                      context,
                      item?.faultMaintenanceImagesAfter,
                      strings.image_after_maintenance,
                    ),
                    SizedBox(height: 10),
                    imagesMaintenance(
                      context,
                      item?.faultMaintenanceImagesBefore,
                      strings.image_before_maintenance,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

  Widget imagesMaintenance(
    BuildContext context,
    List<String>? images,
    String title,
  ) {
    return Column(
      children: [
        buildIconText(icon: AppIcons.attachments_hazard, title: title),

        ShowImagesListWidget(images: images),
      ],
    );
  }

  Padding buildIconText({
    required String icon,
    required String title,
    Color? colorText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: IconText(
        icon: icon,
        text: title + ' :',

        textStyle: titleStyle.copyWith(color: kPrimary),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
