
import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../shared/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/vehicle_video_params.dart';
import 'index.dart';

class CameraSearchResultArgs {
  VehicleVideoParams vehicleVideoParams;
  List<VehicleCamera> vehicleCameras;
  Vehicle vehicle;
  VehicleCamera? initialCamera;

  CameraSearchResultArgs({
    required this.vehicleVideoParams,
    required this.vehicleCameras,
    required this.vehicle,
    this.initialCamera,
  });
}
