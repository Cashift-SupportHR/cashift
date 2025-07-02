import 'package:collection/collection.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../main_index.dart';
import '../../../../shared/components/dropdown_filed.dart';
import '../../../../shared/components/tabview/dynamic_tab_bar_view.dart';
import '../../../../shared/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/vehicle_camera_dto.dart';
import '../../data/models/vehicle_video_params.dart';

class VehicleCamera {
  int? id;
  String? cameraNameEn;
  String? cameraNameAr;
  String? cameraIndexCode;
  int? vehicleId;

  VehicleCamera(
      {this.id,
      this.cameraNameEn,
      this.cameraNameAr,
      this.cameraIndexCode,
      this.vehicleId});

  factory VehicleCamera.fromDto(VehicleCameraDto json) => VehicleCamera(
        id: json.id,
        cameraNameEn: json.cameraNameEn,
        cameraNameAr: json.cameraNameAr,
        cameraIndexCode: json.cameraIndexCode,
        vehicleId: json.vehicleId,
      );

  static List<VehicleCamera> fromDtoList(List<VehicleCameraDto> json) {
    return json.map((e) => VehicleCamera.fromDto(e)).toList();
  }

  static List<DynamicItem> toDynamicItems(List<VehicleCamera> cameras) {
    return cameras
        .map((e) => DynamicItem(
              id: e.id ?? 0,
              name: '${e.cameraNameEn} - (${e.cameraNameAr})',
            ))
        .toList();
  }

  static int getInitialIndex(List<VehicleCamera> cameras, int? id) {
    return cameras.indexWhere((e) => e.id == id);
  }

  static VehicleCamera getItemById(List<VehicleCamera> cameras, int? id) {
    return cameras.firstWhereOrNull((e) => e.id == id) ??
        VehicleCamera(
          id: 0,
          cameraNameEn: "",
          cameraNameAr: "",
          cameraIndexCode: "",
        );
  }

  static List<Item> toItems(List<VehicleCamera> cameras) {
    return cameras
        .map((e) => Item(
              index: e.id ?? 0,
              value: '${e.cameraNameEn} - (${e.cameraNameAr})',
              idString: e.cameraIndexCode ?? "",
            ))
        .toList();
  }

  List<ListRowTextItem> items(AppLocalizations strings) => [
        ListRowTextItem(
          title: strings.camera_name_ar,
          value: cameraNameAr ?? "",
          icon: AppIcons.camera_vehicle,
        ),
        ListRowTextItem(
          title: strings.camera_name_en,
          value: cameraNameEn ?? "",
          icon: AppIcons.camera_vehicle,
        ),
        ListRowTextItem(
          title: strings.camera_code,
          value: cameraIndexCode ?? "",
          icon: AppIcons.camera_vehicle_code,
        ),
      ];

  VehicleVideoParams toParams({bool isVideoStream = false}) {
    return VehicleVideoParams(
      vehicleId: vehicleId,
      cameraIndexCode: cameraIndexCode,
      isVideoStream: isVideoStream,
    );
  }

  String get fullName {
    return '${cameraNameAr ?? ''} - ${cameraNameEn ?? ''}';
  }
}
