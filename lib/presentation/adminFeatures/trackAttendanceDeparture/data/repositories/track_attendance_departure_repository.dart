import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import '../../domain/entities/RequestAttendanceDepartureDetails.dart';
import '../../domain/entities/track_attendance_departure.dart';
import '../../domain/entities/track_attendance_departure_image.dart';
import '../datasource/track_attendance_departure_provider.dart';
import '../models/request_track_attendance_departure_params.dart';

@injectable
class TrackAttendanceDepartureRepository {
  final TrackAttendanceDepartureAPI _api;

  TrackAttendanceDepartureRepository(this._api);

  Future<ApiResponse> updateTrackAttendanceDeparture(RequestTrackAttendanceDepartureParams params) async {
    return await _api.updateTrackAttendanceDeparture(params);
  }

  Future<ApiResponse> createRequestTrackAttendanceDeparture(RequestTrackAttendanceDepartureParams params) async {
    return await _api.createRequestTrackAttendanceDeparture(params);
  }

  Future<List<TrackAttendanceDepartureImage>> fetchTrackAttendanceDepartureRequestsImages(int requestId) async {
    final response = await _api.fetchTrackAttendanceDepartureRequestsImages(requestId);
    return TrackAttendanceDepartureImage.fromListDto(response.payload ?? []);
  }

  Future<RequestAttendanceDepartureDetails> fetchTrackAttendanceDepartureRequestsDetails(int requestId) async {
    final response = await _api.fetchTrackAttendanceDepartureRequestsDetails(requestId);
    return  RequestAttendanceDepartureDetails.fromDto(response.payload!);
  }

  Future<List<TrackAttendanceDeparture>> fetchTrackAttendanceDepartureRequests() async {
    final response = await _api.fetchTrackAttendanceDepartureRequests();
    return TrackAttendanceDeparture.fromListDto(response.payload ?? []);
  }
}
