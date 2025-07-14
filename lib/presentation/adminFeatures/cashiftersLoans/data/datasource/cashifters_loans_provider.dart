
import '../../../../../common/data/models/api_response.dart';
 import '../../../../../common/network/source/admin_endpoint.dart';
import '../../../../shared/models/common_list_item_dto.dart';
import '../models/add_cashifter_loan_params.dart';
import 'package:injectable/injectable.dart';

@injectable
class CashiftersLoansAPI {
  final AdminEndpoint api;

  CashiftersLoansAPI({required this.api});

  Future<ApiResponse<bool>> addCashifterLoan(AddCashifterLoanParams params) {
    return api.addCashifterLoan(params);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchCashifters(int companyId) {
    return api.fetchCashifters(companyId);
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchCashifterLoanTypes() {
    return api.fetchCashifterLoanTypes();
  }

  Future<ApiResponse<List<CommonListItemDto>>> fetchDiscountPercentages() {
    return api.fetchDiscountPercentages();
  }

  Future<ApiResponse<List<CommonListItemDto>>>
      fetchCashiftLoanTermsAndConditions() {
    return api.fetchCashiftLoanTermsAndConditions();
  }
}
