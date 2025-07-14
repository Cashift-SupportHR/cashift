
import '../../../data/models/bail_requests/index.dart';

class BailRequest {

  int? id;
  String? freelanceName;
  String? phoneNumber;
  String? descriptionRequest;
  int? totalMoney;
  int? totalInstallment;
  String? statusName;
  String? descriptionReject;
  BailRequest({
    this.id,
    this.freelanceName,
    this.phoneNumber,
    this.descriptionRequest,
    this.totalMoney,
    this.totalInstallment,
    this.statusName,
    this.descriptionReject,
  });

  factory BailRequest.fromDto(BailRequestDto json) {
    return BailRequest(
      id: json.id,
      freelanceName: json.freelanceName,
      phoneNumber: json.phoneNumber,
      descriptionRequest: json.descriptionRequest,
      totalMoney: json.totalMoney,
      totalInstallment: json.totalInstallment,
      statusName: json.statusName,
      descriptionReject: json.descriptionReject,
    );
  }

}