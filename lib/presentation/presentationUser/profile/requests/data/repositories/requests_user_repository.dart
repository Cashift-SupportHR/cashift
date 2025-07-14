import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../common/data/models/api_response.dart';
import '../../domain/entities/RequestsUser.dart';
import '../../domain/entities/ShiftRquestType.dart';
import '../../domain/entities/TermsAndConditionsRequests.dart';
import '../data_sources/requests_user_api_provider.dart';
import '../models/terms_and_conditions_requests_prams.dart';
import '../models/add_request_prams.dart';
import '../models/confirm_reques_prams.dart';
import '../models/upload_file_request_prams.dart';

@injectable
class RequestsUserRepository {
  final RequestsUserAPI _api;

  RequestsUserRepository(this._api);

  Future<List<RequestsUser>> fetchRequestsUser() async {
    final response = await _api.fetchRequestsUser();
    final data = response.payload?.map((e) => RequestsUser.fromDto(e)).toList();

    return data ?? [];
  }

  Future<List<TermsAndConditionsRequests>> fetchTermsAndConditionsRequests(
      {required TermsAndConditionsRequestsPrams
          termsAndConditionsRequestsPrams}) async {
    final response = await _api
        .fetchTermsAndConditionsRequests(termsAndConditionsRequestsPrams);
    final data = response.payload
        ?.map((e) => TermsAndConditionsRequests.fromDto(e))
        .toList();

    return data ?? [];
  }

  Future<List<ShiftRquestType>> fetchRequestsUserType() async {
    final response = await _api.fetchRequestsUserType();
    final data =
        response.payload?.map((e) => ShiftRquestType.fromDto(e)).toList();

    return data ?? [];
  }

  Future<ApiResponse> addRequest(
      {required AddRequestPrams addRequestPrams}) async {
    final response = await _api.addRequest(addRequestPrams);
    return response;
  }

  Future<ApiResponse> confirmRequest(
      {required ConfirmRequesPrams confirmRequesPrams}) async {
    final response = await _api.confirmRequest(confirmRequesPrams);
    return response;
  }

  Future<ApiResponse> addFileRequest(
      {required UploadFileRequestPrams uploadFileRequestPrams,
      required File file}) async {
    final response = await _api.addFileRequest(uploadFileRequestPrams, file);
    return response;
  }
}
