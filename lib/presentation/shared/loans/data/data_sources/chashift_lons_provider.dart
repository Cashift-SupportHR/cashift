import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/presentation/shared/loans/data/models/index_loan.dart';
import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';


@Injectable()
class ChashiftLonsAPI {
  final UserEndpoint api;

  ChashiftLonsAPI(this.api);

  Future<ApiResponse<TabsAndTotalLoansDto>> fetchTabsAndTotalLoans(
      bool isAdmin) {
    return api.fetchTabsAndTotalLoans(isAdmin);
  }

  Future<ApiResponse<List<LoanDataDto>>> fetchLoans(
    bool isAdmin,
    int status,
  ) {
    return api.fetchLoans(isAdmin, status);
  }
}
