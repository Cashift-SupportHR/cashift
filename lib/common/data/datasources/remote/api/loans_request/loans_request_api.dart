
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/loans_request/index.dart';

import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/api_response.dart';

@Injectable()
class LoansRequestAPI {
  final UserEndpoint api;

  LoansRequestAPI(this.api);

  Future<ApiResponse<List<LoanRequestDto>>> fetchLoansRequests(int type){
    return api.fetchLoansRequests(type);
  }

  Future<ApiResponse<String>> addNewLoanRequest(AddLoanRequestParams params){
    return api.addNewLoanRequest(params);
  }

  Future<ApiResponse<List<LoanTypeDto>>> fetchLoansTypes(){
    return api.fetchLoansTypes();
  }

  Future<ApiResponse<LoanNumMonthConditionDto>> fetchLoanNumMonthsConditions(int id){
    return api.fetchLoanNumMonthsConditions(id);
  }

  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumber(String idNumber){
    return api.fetchNamedByIdNumberForLoan(idNumber);
  }
}
