import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/showImagesWidget.dart';

import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';
import '../../../../../domain/entities/vehicle_component_handover.dart';
import '../../bloc/receive_vehicle_details_state.dart';
import 'customExpansionTile.dart';

class VehicleDataWidget extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  VehicleDataWidget({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: strings.vehicle_data,
      icon: AppIcons.vehicle_data,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoWidget(
            image: state.details.vehicleImage ?? "",
            name: state.details.vehicleBrand ?? "",
            subTitle: state.details.vehicleModel ?? "",
          ),
          Text(
            strings.vehicles_info,
            style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
          ),
          SizedBox(height: 10),
          ListRowTextsV2(
            titleStyle: titleStyle,
            valueStyle: valueStyle,
            flex: 1,
            items: state.details.basicInfo(strings),
          ),
          SizedBox(height: 15),
          Text(
            strings.plate_license_info,
            style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
          ),
          SizedBox(height: 10),
          ListRowTextsV2(
            titleStyle: titleStyle,
            valueStyle: valueStyle,
            flex: 1,
            items: state.details.plateAndLicenseInfo(strings),
          ),
          SizedBox(height: 15),
          Text(
            strings.additional_specifications,
            style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
          ),
          SizedBox(height: 10),
          ListRowTextsV2(
            titleStyle: titleStyle,
            valueStyle: valueStyle,
            flex: 1,
            items: state.details.additionalSpecifications(strings),
          ),
        ],
      ),
    );
  }

  TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);
}
