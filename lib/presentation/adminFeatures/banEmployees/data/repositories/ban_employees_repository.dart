import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';


import '../datasource/ban_employees_provider.dart';

import '../models/index.dart';@injectable
class BanEmployeesRepository {
  final BanEmployeesAPI _api;

  BanEmployeesRepository(this._api);

  Future<List<BanEmployeeTabDto>> fetchStaffBanTabTabsData() async {
    final response = await _api.fetchBanEmployeesTabData();
    return response.payload!;
  }

  Future<List<BanEmployeeDto>> fetchEmployeesBanData(BanEmployeeParams params) async {
    final response = await _api.fetchBanEmployeesData(params);
    return response.payload!;
  }

  Future<ApiResponse<String>> updateEmployeeBanStatus(BanEmployeeStatusParams params) async {
    final response = await _api.updateBanEmployeesStatus(params);
    return response;
  }

  Future<ApiResponse<BanEmployeeDetailsDto>> fetchEmployeeCVDetails(int id) async {
    final response = await _api.fetchEmployeeCVDetails(id);
    return response;
  }

  Future<List<JobEvaluationsEmployeeDto>> fetchJobEvaluationsEmployee(int freelanceId) async {
    final response = await _api.fetchJobEvaluationsEmployee(freelanceId);
    return response.payload!;
  }


}
