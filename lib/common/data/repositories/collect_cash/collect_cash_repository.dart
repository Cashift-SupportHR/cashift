import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/collect_cash/collect_cash_api_provider.dart';
import 'package:shiftapp/common/domain/entities/collect_cash/index.dart';

@Injectable()
class CollectCashRepository {
  final CollectCashAPI api;

  CollectCashRepository(this.api);

  Future<List<DuesItem>> fetchCollectedAndNonCollectedJobs(int statusId) async {
    final response = await api.fetchCollectedAndNonCollectedJobs(statusId);
    return response.payload!;
  }

  Future<List<JobCash>> fetchWallet() async {
    final response = await api.fetchWallet();
    return response.payload!;
  }

  Future<List<Cashier>> fetchCashierList(int id) async {
    final response = await api.fetchCashierList(id);
    return response.payload!;
  }

  Future<String> generateReceiveCashCode(int id, int type) async {
    final response = await api.generateReceiveCashCode(id, type);
    return response.payload!;
  }
}
