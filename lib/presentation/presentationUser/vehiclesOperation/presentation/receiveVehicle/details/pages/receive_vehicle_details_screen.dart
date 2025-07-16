import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/customExpansionTile.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/maintenanceBreakdownsWidget.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/vehicleComponentsOrCovenantWidget.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/vehicleDataWidget.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/vehicleViolationsWidget.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/vehicle_performance_widget.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/violationsFactoryWidget.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../../../../../utils/app_icons.dart';
import '../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
import '../../../../../../adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../../../../../shared/components/map/points_map_screen.dart';
import '../../../../data/models/download_vehicle_violation_picture_params.dart';
import '../../../../domain/entities/custody_handover.dart';
import '../../../../domain/entities/driver_violation.dart';
import '../../../../domain/entities/vehicle_component_handover.dart';
import '../../../../domain/entities/vehicle_performance.dart';
import '../bloc/receive_vehicle_details_state.dart';

class ReceiveVehicleDetailsScreen extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  final Function(int) onFetchVehiclePerformance;
  final Function(int) onFetchDriverViolations;
  final Function(int) onFetchViolationsFactory;
  final Function(int) onFetchRoundsMaintenance;
  final Function(DownloadVehicleViolationPictureParams)
  onDownloadViolationPicture;

  ReceiveVehicleDetailsScreen({
    Key? key,
    required this.state,
    required this.onFetchVehiclePerformance,
    required this.onFetchViolationsFactory,
    required this.onFetchRoundsMaintenance,
    required this.onFetchDriverViolations,
    required this.onDownloadViolationPicture,
  }) : super(key: key);

  TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VehicleDataWidget(state: state,),
          if (state.details.vehicleHandoverImages?.isNotEmpty ?? false)
            vehicleImages(context),
          vehicleComponents(context),
          vehicleCovenant(context),
          VehiclePerformanceWidget(
            onFetchVehiclePerformance: onFetchVehiclePerformance,
            state: state,
          ),
          VehicleViolationsWidget(
            onFetchDriverViolations: onFetchDriverViolations,
            state: state,
            onDownloadViolationPicture: onDownloadViolationPicture,
          ),
          ViolationsFactoryWidget(
            state: state,
            onFetchViolationsFactory: onFetchViolationsFactory,),
          MaintenanceBreakdownsWidget(onFetchRoundsMaintenance: onFetchRoundsMaintenance, state: state),
        ],
      ),
    );
  }



  Widget vehicleImages(BuildContext context) {
    return CustomExpansionTile(
      title: strings.vehicle_image,
      icon: AppIcons.pickerImageOutline,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.filesPreviewPage,
            arguments: state.details.vehicleHandoverImages,
          );
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                state.details.vehicleHandoverImages?.map((e) {
                  return kBuildImage(
                    e,
                    border: 0,
                    height: 50,
                    width: 50,
                    borderRadius: 0,
                    showFullImage: false,
                  );
                }).toList() ??
                [],
          ),
        ),
      ),
    );
  }



 

  Widget vehicleComponents(BuildContext context) {
    return VehicleComponentsOrCovenantWidget(
      title: strings.vehicle_components,
      icon: AppIcons.vehicle_components,
      countStream: state.vehicleTrueComponentsCountStream,
      vehiclesComponentsHandovers:
          state.details.vehiclesComponentsHandovers ?? [],
    );
  }

  Widget vehicleCovenant(BuildContext context) {
    return VehicleComponentsOrCovenantWidget(
      title: strings.covenant,
      icon: AppIcons.covenantReceivedOutline,
      countStream: state.vehicleTrueCustodiesCountStream,
      vehiclesComponentsHandovers:
          CustodyHandover.toVehiclesComponentsHandovers(
            state.details.vehiclesCustodiesHandovers ?? [],
          ),
    );
  }
 

 


}
