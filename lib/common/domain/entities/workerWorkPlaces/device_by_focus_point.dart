

import '../../../data/models/workerWorkPlaces/index.dart';



class DeviceByFocusPoint {

  int? countDevice;
  int? countCar;
  List<ListDevice>? listDevices;

  DeviceByFocusPoint({
      this.countDevice, 
      this.countCar, 
      this.listDevices,});

  factory DeviceByFocusPoint.fromDto(DeviceByFocusPointDto json) {
    return DeviceByFocusPoint(
      countDevice: json.countDevice ?? 0,
      countCar: json.countCar ?? 0,
      listDevices: json.listDevices,
    );
  }
}