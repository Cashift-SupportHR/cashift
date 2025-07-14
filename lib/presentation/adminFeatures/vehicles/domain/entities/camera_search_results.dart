import '../../../../../config.dart';
import '../../../../../common/data/datasources/remote/remote_constants.dart';
import '../../../../../main_index.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../common/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/camera_search_results_dto.dart';

class CameraSearchResults {
  String? cameraName;
  String? vehiclePlatNo;
  String? url;
  String? endTime;

  CameraSearchResults({this.cameraName, this.vehiclePlatNo, this.url, this.endTime});

  factory CameraSearchResults.fromDto(CameraSearchResultsDto dto) =>
      CameraSearchResults(
        cameraName: dto.cameraName,
        vehiclePlatNo: dto.vehiclePlatNo,
        url: dto.url,
        endTime: dto.endTime,
      );

  bool get isValidValid{
    return url.isNotNullOrEmpty() && (url?.startsWith('http') ?? false);
  }

  String getVideoStream(int id, String cameraIndexCode) {
   return '${Config.isTestVersion ? kTESTServerUrl : kCashiftURL}vehicleVideoStream?id=$id&cameraIndexCode=$cameraIndexCode';
  }
}
