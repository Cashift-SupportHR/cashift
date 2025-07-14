
import '../../../../../common/data/models/api_response.dart';
 import '../../../../../common/network/source/admin_endpoint.dart';
import '../models/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class TermandConditionAPI {

    final AdminEndpoint api;

    TermandConditionAPI({required this.api});


  Future<ApiResponse<List<TermandConditionDto>>> fetchTermandCondition(  int type){return  api.fetchTermandCondition(type);}


  Future<ApiResponse> deleteTermandCondition(  int id){
    return  api.deleteTermandCondition(id);
  }


  Future<ApiResponse> updateType(  int id){return  api.updateType(id);}


  Future<ApiResponse<TermandConditionDto>> fetchTermandConditionById(  int id){
    return  api.fetchTermandConditionById(id);
  }


  Future<ApiResponse> addEditTermandCondition(  TermsAndConditionsPrams termsAndConditionsPrams){return  api.addEditTermandCondition(termsAndConditionsPrams);}


  Future<ApiResponse<List<TermandConditionDto>>> fetchTasks(  int type){
    return  api.fetchTasks(type);
  }


  Future<ApiResponse<TermandConditionDto>> fetchTasksById(  int id){
    return  api.fetchTasksById(id);
  }


  Future<ApiResponse> addEditTask( TermsAndConditionsPrams termsAndConditionsPrams){
    return  api.addEditTask(termsAndConditionsPrams);
  }
}
