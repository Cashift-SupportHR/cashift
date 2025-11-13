import 'package:json_annotation/json_annotation.dart';

part 'add_logistics_prams.g.dart';

@JsonSerializable()
class AddLogisticPrams {
  @JsonKey(name: "jobOfferCarTypeId")
    int? jobOfferCarTypeId;
  // @JsonKey(name: "license")
  //   License? license;
  @JsonKey(name: "location")
    Location? location;
  @JsonKey(name: "preferredDistrictIds")
    List<int>? preferredDistrictIds;
  @JsonKey(name: "termsAccepted")
    bool? termsAccepted;


  AddLogisticPrams ({
    this.jobOfferCarTypeId,
   // this.license,
    this.location,
    this.preferredDistrictIds,
    this.termsAccepted,

  });

  factory AddLogisticPrams.fromJson(Map<String, dynamic> json) {
    return _$AddLogisticPramsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddLogisticPramsToJson(this);
  }
}

@JsonSerializable()
class License {
  @JsonKey(name: "licenseNumber")
    String? licenseNumber;
  @JsonKey(name: "expiryDate")
    String? expiryDate;

  License ({
    this.licenseNumber,
    this.expiryDate,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return _$LicenseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LicenseToJson(this);
  }
}

@JsonSerializable()
class Location {
  @JsonKey(name: "latitude")
    double? latitude;
  @JsonKey(name: "longitude")
  double? longitude;
  @JsonKey(name: "cityId")
    int? cityId;

  Location ({
    this.latitude,
    this.longitude,
    this.cityId,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}


