
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/loans_request/index.dart';

import '../../datasources/remote/api/loans_request/loans_request_api.dart';
import '../../models/api_response.dart';


@Injectable()
class LoansRequestRepository {

  final LoansRequestAPI _api;

  LoansRequestRepository(this._api);

  Future<List<LoanRequestDto> > fetchLoansRequests(int type) async {
    final service = await _api.fetchLoansRequests(type);
    return service.payload!;
  }


  Future<String> addNewLoanRequest(AddLoanRequestParams params) async {
    final response = await _api.addNewLoanRequest(params);
    return response.message!;
  }

  Future<List<LoanTypeDto>> fetchLoansTypes() async {
    final service = await _api.fetchLoansTypes();
    return service.payload!;
  }

  Future<LoanNumMonthConditionDto> fetchLoanNumMonthsConditions(int id) async {
    final service = await _api.fetchLoanNumMonthsConditions(id);
    return service.payload!;
  }
  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumber(
      {required String idNumber}) {
    return _api.fetchNamedByIdNumber(idNumber);
  }
}