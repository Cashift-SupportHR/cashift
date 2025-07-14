import '../../../../../common/data/models/api_response.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/request_attendance_departure_details_dto.dart';
import '../models/request_track_attendance_departure_params.dart';
import '../models/track_attendance_departure_dto.dart';
import '../models/track_attendance_departure_image_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrackAttendanceDepartureAPI {
  final AdminEndpoint api;

  TrackAttendanceDepartureAPI({required this.api});

  Future<ApiResponse<List<TrackAttendanceDepartureDto>>>
      fetchTrackAttendanceDepartureRequests() {
    return api.fetchTrackAttendanceDepartureRequests();
  }

  Future<ApiResponse<List<TrackAttendanceDepartureImageDto>>>
      fetchTrackAttendanceDepartureRequestsImages(int requestId) {
    return api.fetchTrackAttendanceDepartureRequestsImages(requestId);
  }


  Future<ApiResponse< RequestAttendanceDepartureDetailsDto>> fetchTrackAttendanceDepartureRequestsDetails(  int requestId) {
    return api.fetchTrackAttendanceDepartureRequestsDetails(requestId);
  }

  Future<ApiResponse> createRequestTrackAttendanceDeparture(
      RequestTrackAttendanceDepartureParams params) {
    return api.createRequestTrackAttendanceDeparture(params);
  }

  Future<ApiResponse> updateTrackAttendanceDeparture(
      RequestTrackAttendanceDepartureParams params) {
    return api.updateTrackAttendanceDeparture(params);
  }
}
