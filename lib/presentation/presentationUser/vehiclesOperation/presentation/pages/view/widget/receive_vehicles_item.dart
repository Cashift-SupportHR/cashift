import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../../core/services/routes.dart';
import '../../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../../adminFeatures/vehicles/data/models/vehicle_traking_details_prams.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../data/models/mainReceiveVehicleArgument.dart';
import '../../../../domain/entities/receiveVehicle.dart';
import '../../add/main_receive_vehicle_page.dart';

class ReceiveVehiclesItem extends BaseStatelessWidget {
  final int tabId;
  ReceiveVehicleData data;
  final Function() onRefresh;
  ReceiveVehiclesItem(
      {super.key,
      required this.onRefresh,
      required this.tabId,
      required this.data});
  @override
  Widget build(BuildContext context) {
    print(data.handoverId);
    print("tabId");
    return Container(
      decoration: Decorations.decorationTabs,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          headerVehicles(),
          ListRowTextsIcons(
            iconColor: kGray_86,
            titleStyle: kTextMedium.copyWith(fontSize: 12, color: kGray_86),
            icons: [
              AppIcons.carNumber,
              AppIcons.calander5,
              AppIcons.carTime,
              AppIcons.timer5,
              AppIcons.handUser,
            ],
            titles: [
              strings.plate_number,
              strings.date,
              strings.time,
              strings.working_period,
              strings.name_receipt,
            ],
            values: [
              data.vehiclePlateNumber ?? "",
              data.vehicleHandoverDate ?? "",
              data.vehicleHandoverTime ?? "",
              data.shiftName ?? "",
              data.freelancerName ?? "",
            ],
          ),
          detailsButton(context),
        ],
      ),
    );
  }

  String get vehicleHandoverTimeFormatted =>
      DateFormatter.repairApiTime(data.vehicleHandoverTime ?? "" ?? '');

  Widget headerVehicles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kBuildCircleImage(data.vehicleImage ?? "", size: 40),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.vehicleModel ?? "",
                style: kTextBold.copyWith(fontSize: 16),
              ),
              Text(
                "${strings.project_name} : ${data.projectName}",
                style: kTextRegular.copyWith(fontSize: 12, color: kPrimaryDark),
              ),
            ],
          ),
        ),
        _OptionsMenuButton(
          data: data,
          tabId: tabId,
          onRefresh: onRefresh,
        ),
      ],
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.receiveVehicleDetailsPage,
            arguments: data.id);
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final ReceiveVehicleData data;
  final Function() onRefresh;
  int tabId;
  _OptionsMenuButton(
      {required this.tabId, required this.data, required this.onRefresh});
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);

    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.track_vehicle_on_map,
          titleStyle: titleStyle,
          isDivider: false,
        ),
        if (tabId == 2)
          BuildPopupMenuItemContent(
            title: strings.complete_receipt_information,
            titleStyle: titleStyle,
            isDivider: false,
          ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          Navigator.pushNamed(context, Routes.vehiclesTrackingPage,
              arguments: VehicleTrakingDetailsPrams(
                vehicleHandoverId: data.handoverId,
                isVehicleHandover: true,
                vehicleId: data.vehicleId,
              ));
        } else if (value == 1) {
          MainReceiveVehiclePage.push(context,
              mainReceiveVehicleArg:
                  MainReceiveVehicleArg(isEdit: true, receiveVehicleData: data),
              onSuccess: () {
            onRefresh();
          });
        }
      },
    );
  }
}
