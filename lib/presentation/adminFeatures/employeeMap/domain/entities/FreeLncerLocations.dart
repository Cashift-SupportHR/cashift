import '../../data/models/emp_map_dto.dart';

class FreeLncerLocations {
  FreeLncerLocations({
      this.id, 
      this.cityId, 
      this.jobId, 
      this.lat, 
      this.lng, 
      this.name, 
      this.icone, 
      this.gender, 
      this.isActive,
      this.isFirstCameraZoom = false,
  });


  int? id;
  int? cityId;
  int? jobId;
  double? lat;
  double? lng;
  String? name;
  String? icone;
  bool? gender;
  bool? isActive;
  bool isFirstCameraZoom;

  factory FreeLncerLocations.fromDto(FreeLncerLocation json) {
    return FreeLncerLocations(
      id: json.id,
      cityId: json.cityId,
      jobId: json.jobId,
      lat: json.lat,
      lng: json.lng,
      name: json.name,
      icone: json.icone,
      gender: json.gender,
      isActive: json.isActive,

    );
  }

}