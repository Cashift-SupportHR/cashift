import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../domain/entities/user_request.dart';
import '../datasource/users_requests_provider.dart';
import '../models/reject_user_request_params.dart';
import '../models/user_request_terms_params.dart';

@injectable
class UsersRequestsRepository {
  final UsersRequestsAPI _api;

  UsersRequestsRepository(this._api);

  Future<List<CommonListItem>> fetchUsersRequestTabs() async {
    final res = await _api.fetchUsersRequestTabs();
    return CommonListItem.fromDtoList(res.payload ?? []);
  }

  Future<List<UserRequest>> fetchUsersRequests(int statusId) async {
    final res = await _api.fetchUsersRequests(statusId);
    return UserRequest.fromDtoList(res.payload ?? []);
  }

  Future<List<CommonListItem>> fetchUserRequestTerms(
      UserRequestTermsParams params) async {
    final res = await _api.fetchUserRequestTerms(params);
    return CommonListItem.fromDtoList(res.payload ?? []);
  }

  Future<ApiResponse> acceptRejectUserRequest(
      RejectUserRequestParams params) async {
    return await _api.acceptRejectUserRequest(params);
  }
}
