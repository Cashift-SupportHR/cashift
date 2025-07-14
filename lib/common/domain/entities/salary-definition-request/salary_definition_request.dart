
import '../../../data/models/salary-definition-request/index.dart';

class SalaryDefinitionRequest{
  final String? id;
  final String? title;
  final String? slipForDistination;
  final String? resonF;
  final String? needStamp;
  final String? createdDate;
  final String? rejectReason;
  final String? fileAttachment;


  SalaryDefinitionRequest({this.id, this.title, this.slipForDistination, this.resonF, this.needStamp, this.createdDate, this.rejectReason, this.fileAttachment});

  factory SalaryDefinitionRequest.fromJson(SalaryDefinitionRequestDto json) {
    return SalaryDefinitionRequest(
      id: json.id,
      title: json.title,
      slipForDistination: json.slipForDistination,
      resonF: json.resonF,
      needStamp: json.needStamp,
      createdDate: json.createdDate,
      rejectReason: json.rejectReason,
      fileAttachment: json.fileAttachment,
    );
  }
}