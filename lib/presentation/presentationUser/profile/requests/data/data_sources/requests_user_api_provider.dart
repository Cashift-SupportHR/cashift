import 'dart:io';

import 'package:shiftapp/common/data/models/api_response.dart';

import 'package:injectable/injectable.dart';

import '../../../../../../common/network/source/user_endpoint.dart';
import '../models/terms_and_conditions_requests_prams.dart';
import '../models/add_request_prams.dart';
import '../models/confirm_reques_prams.dart';
import '../models/requests_user_dto.dart';
import '../models/shift_rquest_type_dto.dart';
import '../models/terms_and_conditions_requests_dto.dart';
import '../models/upload_file_request_prams.dart';

@injectable
class RequestsUserAPI {
  final UserEndpoint api;

  RequestsUserAPI({required this.api});

  Future<ApiResponse<List<RequestsUserDto>>> fetchRequestsUser() {
    return api.fetchRequestsUser();
  }


  Future<ApiResponse<List<TermsAndConditionsRequestsDto>>> fetchTermsAndConditionsRequests(TermsAndConditionsRequestsPrams termsAndConditionsRequestsPrams) {
    return api.fetchTermsAndConditionsRequests(termsAndConditionsRequestsPrams);
  }

  Future<ApiResponse<List<ShiftRquestTypeDto>>> fetchRequestsUserType() {
    return api.fetchRequestsUserType();
  }

  Future<ApiResponse> addRequest(AddRequestPrams addRequestPrams) {
    return api.addRequest(addRequestPrams);
  }

  Future<ApiResponse> confirmRequest(ConfirmRequesPrams confirmRequesPrams) {
    return api.confirmRequest(confirmRequesPrams);
  }

  Future<ApiResponse> addFileRequest(
      UploadFileRequestPrams uploadFileRequestPrams, File file) {
    return api.addFileRequest(uploadFileRequestPrams, file);
  }
}
