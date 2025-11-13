import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../../shared/components/map/points_map_screen.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';
import '../../../../../data/models/download_vehicle_violation_picture_params.dart';
import '../../../../../domain/entities/driver_violation.dart';
import '../../../../../domain/entities/vehicle_performance.dart';
import '../../bloc/receive_vehicle_details_state.dart';
import 'customExpansionTile.dart';

class VehicleViolationsWidget extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  final Function(int) onFetchDriverViolations;
  final Function(DownloadVehicleViolationPictureParams)
  onDownloadViolationPicture;
  VehicleViolationsWidget({
    super.key,
    required this.onFetchDriverViolations,
    required this.state,
    required this.onDownloadViolationPicture,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
    TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

    return CustomExpansionTile(
      title: strings.driver_violations,
      icon: AppIcons.violation_type,
      isShowBorder: false,
      onExpansionChanged: (value) {
        if (state.driverViolations.data == null) {
          onFetchDriverViolations(state.details.id ?? 0);
        }
      },
      countStream: state.vehicleViolationsStream,
      child: StreamDataStateWidget<DriverViolation?>(
        stream: state.driverViolations,
        builder: (context, data) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data?.vehicleEvents?.length ?? 0,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = data?.vehicleEvents![index];
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: Decorations.boxDecorationBorder(radius: 0),
                child: Column(
                  children: [
                    ListRowTextsIconsV2(
                      titleStyle: titleStyle,
                      valueStyle: valueStyle,
                      isExpanded: false,
                      paddingItem: EdgeInsets.only(bottom: 10),
                      items: [
                        ListRowTextItem(
                          icon: AppIcons.violation_type,
                          title: strings.violation_type,
                          value: item?.eventType ?? "",
                        ),
                        ListRowTextItem(
                          icon: AppIcons.timeOutline,
                          title: strings.violation_time,
                          value: item?.dateFormated,
                        ),
                        ListRowTextItem(
                          icon: AppIcons.speed,
                          title: strings.speeding_during_violation,
                          value: '${item?.speed} ${strings.km_h}',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppOutlineButtonIcon(
                            text: strings.go_violation_site,
                            icon: AppIcons.locationPickerOutline,
                            iconColor: kOrange00,
                            textColor: kOrange00,
                            strokeColor: kOrange00,
                            iconSize: 18,
                            textStyle: kTextMedium.copyWith(
                              color: kOrange00,
                              fontSize: 12,
                            ),
                            onClick: () {
                              item?.openMap();
                            },
                          ),
                        ),
                        if (item?.isAllowPicture == true) ...[
                          SizedBox(width: 5),
                          Expanded(
                            child: AppOutlineButtonIcon(
                              text: strings.download_violation_image,
                              icon: AppIcons.downloadOutline,
                              iconColor: kPrimary,
                              strokeColor: kPrimary,
                              textStyle: kTextMedium.copyWith(
                                color: kPrimary,
                                fontSize: 12,
                              ),
                              onClick: () {
                                onDownloadViolationPicture(
                                  item!.getDownloadViolationPictureParams(),
                                );
                              },
                            ),
                          ),
                        ],
                      ],
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
}
