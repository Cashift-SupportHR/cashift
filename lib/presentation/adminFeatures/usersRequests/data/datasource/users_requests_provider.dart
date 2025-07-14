
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item_dto.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_request.dart';
import '../models/reject_user_request_params.dart';
import '../models/user_request_dto.dart';
import '../models/user_request_terms_params.dart';

@injectable
class UsersRequestsAPI {
  final AdminEndpoint api;

  UsersRequestsAPI({required this.api});

  Future<ApiResponse<List<CommonListItemDto>>> fetchUsersRequestTabs() async {
    return await api.fetchUsersRequestTabs();
  }

  Future<ApiResponse<List<UserRequestDto>>> fetchUsersRequests(int type) async {
    return await api.fetchUsersRequests(type);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchUserRequestTerms(UserRequestTermsParams params) async {
    return await api.fetchUserRequestTerms(params);
  }

  Future<ApiResponse> acceptRejectUserRequest(RejectUserRequestParams params) async {
    return await api.acceptRejectUserRequest(params);
  }

}
