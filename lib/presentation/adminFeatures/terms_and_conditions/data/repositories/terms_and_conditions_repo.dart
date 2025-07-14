import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../data_sources/terms_and_conditions_api.dart';
import '../models/index.dart';

@injectable
class TermandConditionRepository {
  final TermandConditionAPI _api;

  TermandConditionRepository(this._api);

  Future<List<TermandConditionDto>> fetchTermandCondition({required int type}) async {
    final response = await _api.fetchTermandCondition(type);
    return response.payload!;
  }

  Future<TermandConditionDto> fetchTermandConditionById({required int id}) async {
    final response = await _api.fetchTermandConditionById(id);
    return response.payload!;
  }

  Future<String> deleteTermandCondition({required int id}) async {
    final response = await _api.deleteTermandCondition(id);
    return response.message!;
  }

  Future<String> updateType({required int id}) async {
    final response = await _api.updateType(id);
    return response.message!;
  }

  Future<ApiResponse> addEditTermandCondition({required TermsAndConditionsPrams termsAndConditionsPrams}) async {
    return await _api.addEditTermandCondition(termsAndConditionsPrams);
  }

  Future<List<TermandConditionDto>> fetchTasks(int type) async {
    final response = await _api.fetchTasks(type);
    return response.payload!;
  }

  Future<TermandConditionDto> fetchTasksById(int id) async {
    final response = await _api.fetchTasksById(id);
    return response.payload!;
  }

  Future<String> addEditTask(TermsAndConditionsPrams termsAndConditionsPrams) async {
    final response = await _api.addEditTask(termsAndConditionsPrams);
    return response.message!;
  }
}
