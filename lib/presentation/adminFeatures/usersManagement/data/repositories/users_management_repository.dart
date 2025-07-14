import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';


import '../datasource/users_management_provider.dart';
import '../models/index.dart';
import '../models/user_by_phone_dto.dart';

@injectable
class UsersManagementRepository {

  final UsersManagementAPI _api;

  UsersManagementRepository(this._api);


  Future<List<UserManagementDto>> fetchUsers(int type) async {
    final response = await _api.fetchUsers(type);
    return response.payload!;
  }

  Future<String> changeUserStatus(String id) async {
    final response = await _api.changeUserStatus(id);
    return response.message!;
  }

  Future<ApiResponse<String>> addNewUser(AddNewUserParams params) async {
    final response = await _api.addNewUser(params);
    return response;
  }

  Future<ApiResponse<String>> updateUserData(AddNewUserParams params) async {
    final response = await _api.updateUserData(params);
    return response;
  }

  Future<String> changePassword(ChangeUserPasswordParams params) async {
    final response = await _api.changePassword(params);
    return response.message!;
  }

  Future<InfoUserManagerDto> fetchInfoUserManager() async {
    final response = await _api.fetchInfoUserManager();
    return response.payload!;
  }

  Future<List<BrandDto>> fetchBrands(int CompanyId) async {
    final response = await _api.fetchBrands(CompanyId);
    return response.payload!;
  }

  Future<List<ShiftByListProjectIdDto>> fetchShiftByListProjectId(List<int> projectIds) async {
    final response = await _api.fetchShiftByListProjectId(projectIds);
    return response.payload!;
  }

  Future<List<CommonListItem>> fetchListProjectsByCompanyId(int CompanyId) async {
    final response = await _api.fetchListProjectsByCompanyId(CompanyId);
    return response.payload?.map((e) => CommonListItem.fromDto(e)).toList() ?? [];
  }

  Future<List<UserAreaDto>> fetchAllUserAreas() async {
    final response = await _api.fetchAllUserAreas();
    return response.payload!;
  }
  Future<UserByPhoneDto> fetchUserByPhone(String phoneOrIdNumber) async {
    final response = await _api.fetchUserByPhone(phoneOrIdNumber);
    return response.payload!;
  }
}
