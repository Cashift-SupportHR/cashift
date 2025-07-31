
import '../../../../../main_index.dart';
import '../../data/models/round_trip_details_dto.dart';

class RoundTripDetails {
  int? id;
  String? notes;
  String? typeName;
  String? startRound;
  String? endRound;
  String? roundTime;

  RoundTripDetails(
      {this.id,
      this.notes,
      this.typeName,
      this.startRound,
      this.endRound,
      this.roundTime});

  factory RoundTripDetails.fromDto(RoundTripDetailsDto json) =>
      RoundTripDetails(
          id: json.id,
          notes: json.notes,
          typeName: json.typeName,
          startRound: json.startRound,
          endRound: json.endRound,
          roundTime: json.roundTime);

  static List<RoundTripDetails> fromListDto(List<RoundTripDetailsDto> listDto) {
    return listDto.map((e) => RoundTripDetails.fromDto(e)).toList();
  }

  String timeRange(AppLocalizations strings) {
    return '${strings.from} ${startRound ?? ''} ${strings.to} ${endRound ?? ''}';
  }
}
