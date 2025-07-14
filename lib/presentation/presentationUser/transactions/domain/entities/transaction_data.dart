
import '../../data/models/transactions_dto.dart';

class Transactions {
  int? id;
  String? destination;
  String? description;
  String? startDateTime;
  String? endDateTime;
  int? status;
  String? statusName;
  String? finalSummary;
  int? freelancerId;
  String? freelancerName;
  String? freelancerProfileImage;
  String? freelancerPhoneNumber;

  Transactions({
    this.id,
    this.destination,
    this.description,
    this.startDateTime,
    this.endDateTime,
    this.status,
    this.statusName,
    this.finalSummary,
    this.freelancerId,
    this.freelancerName,
    this.freelancerPhoneNumber,
    this.freelancerProfileImage,
  });

  factory Transactions.fromDto(TransactionsDto dto) => Transactions(
    id: dto.id,
    destination: dto.destination,
    description: dto.description,
    startDateTime: dto.startDateTime,
    endDateTime: dto.endDateTime,
    status: dto.status,
    statusName: dto.statusName,
    finalSummary: dto.finalSummary,
    freelancerId: dto.freelancerId,
    freelancerName: dto.freelancerName,
    freelancerProfileImage: dto.freelancerProfileImage,
    freelancerPhoneNumber: dto.freelancerPhoneNumber,
  );

  static List<Transactions> fromDtoList(List<TransactionsDto> dtos) =>
      dtos.map((dto) => Transactions.fromDto(dto)).toList();
}
