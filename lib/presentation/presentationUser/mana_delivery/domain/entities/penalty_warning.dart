import '../../data/models/penalty_warning_dto.dart';

class PenaltyWarningEntity {
  final String? title;
  final String? message;
  final String? severity;
  final String? confirmButtonText;
  final String? cancelButtonText;

  PenaltyWarningEntity({
    this.title,
    this.message,
    this.severity,
    this.confirmButtonText,
    this.cancelButtonText,
  });

  /// 🔁 تحويل من DTO إلى Entity
  factory PenaltyWarningEntity.fromDto(PenaltyWarningDto dto) {
    return PenaltyWarningEntity(
      title: dto.title,
      message: dto.message,
      severity: dto.severity,
      confirmButtonText: dto.confirmButtonText,
      cancelButtonText: dto.cancelButtonText,
    );
  }

  /// 🔁 تحويل List<DTO> إلى List<Entity>
  static List<PenaltyWarningEntity> fromDtoList(
      List<PenaltyWarningDto> dtos,
      ) =>
      dtos
          .map((dto) => PenaltyWarningEntity.fromDto(dto))
          .toList();
}
