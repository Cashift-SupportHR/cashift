import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';

import '../../../../shared/models/common_list_item_dto.dart';
import '../datasource/cashifters_loans_provider.dart';
import '../models/add_cashifter_loan_params.dart';

@injectable
class CashiftersLoansRepository {
  final CashiftersLoansAPI _api;

  CashiftersLoansRepository(this._api);

  Future<ApiResponse<bool>> addCashifterLoan(AddCashifterLoanParams params) async {
    return await _api.addCashifterLoan(params);
  }

  Future<List<CommonListItemDto>> fetchCashifters(int companyId) async {
    final response = await _api.fetchCashifters(companyId);
    return response.payload??[];
  }

  Future<List<CommonListItemDto>> fetchCashifterLoanTypes() async {
    final response = await _api.fetchCashifterLoanTypes();
    return response.payload??[];
  }

  Future<List<CommonListItemDto>> fetchDiscountPercentages() async {
    final response = await _api.fetchDiscountPercentages();
    return response.payload??[];
  }

  Future<List<CommonListItemDto>> fetchCashiftLoanTermsAndConditions() async {
    final response = await _api.fetchCashiftLoanTermsAndConditions();
    return response.payload??[];
  }




}
