import 'package:shiftapp/presentation/adminFeatures/usersManagement/data/models/index.dart';

import '../../../../../common/data/models/api_response.dart';

import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../../shared/models/common_list_item_dto.dart';

import '../models/user_by_phone_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class UsersManagementAPI {
  final AdminEndpoint api;

  UsersManagementAPI({required this.api});

  Future<ApiResponse<List<UserManagementDto>>> fetchUsers(int type) {
    return api.fetchUsers(type);
  }

  Future<ApiResponse<String>> changeUserStatus(String id) {
    return api.changeUserStatus(id);
  }

  Future<ApiResponse<String>> addNewUser(AddNewUserParams params) {
    return api.addNewUser(params);
  }

  Future<ApiResponse<String>> updateUserData(AddNewUserParams params) {
    return api.updateUserData(params);
  }

  Future<ApiResponse<String>> changePassword(ChangeUserPasswordParams params) {
    return api.changePassword(params);
  }

  Future<ApiResponse<InfoUserManagerDto>> fetchInfoUserManager() {
    return api.fetchInfoUserManager();
  }

  Future<ApiResponse<List<BrandDto>>> fetchBrands(int CompanyId) {
    return api.fetchBrands(CompanyId);
  }

  Future<ApiResponse<List<ShiftByListProjectIdDto>>> fetchShiftByListProjectId(
      List<int> projectIds) {
    return api.fetchShiftByListProjectId(projectIds);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchListProjectsByCompanyId(
      int companyId) {
    return api.fetchListProjectsByCompanyId(companyId);
  }

  Future<ApiResponse<List<UserAreaDto>>> fetchAllUserAreas() {
    return api.fetchAllUserAreas();
  }

  Future<ApiResponse<UserByPhoneDto>> fetchUserByPhone(String phoneOrIdNumber) {
    return api.fetchUserByPhone(phoneOrIdNumber);
  }
}
