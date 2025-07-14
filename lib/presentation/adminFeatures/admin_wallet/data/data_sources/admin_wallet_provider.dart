import 'package:shiftapp/presentation/adminFeatures/admin_wallet/data/models/index.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/admin_endpoint.dart';
import 'package:injectable/injectable.dart';

@injectable
class AdminWalletAPI {
  final AdminEndpoint api;

  AdminWalletAPI({required this.api});

  Future<ApiResponse<WalletBalanceDto>> fetchWalletBalance() {
    return api.fetchWalletBalance();
  }

  Future<ApiResponse<FilterAndTapDto>> fetchTabAndFilter() {
    return api.fetchTabAndFilter();
  }

  Future<ApiResponse<AdminWalletDto>> fetchAdminWalletData(
      AdminWalletPrams params) {
    return api.fetchAdminWalletData(params);
  }
}
