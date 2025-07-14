import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../domain/entities/transaction_data.dart';
import '../data_sources/transactions_provider.dart';
import '../models/add_transactions_prams.dart';
import '../models/reschedule_transactions_prams.dart';
import '../models/transactions_prams.dart';
import '../models/update_transactions_prams.dart';

@injectable
class TransactionsRepository {
  final TransactionsAPI _api;

  TransactionsRepository(this._api);

  Future<List<Transactions>> fetchTransactions(TransactionsPrams prams)async {
    final response = await _api.fetchTransactions(prams);
    return Transactions.fromDtoList(response.payload!);
  }
  Future<ApiResponse> addTransactions(AddTransactionsPrams prams)async {
    final response = await _api.addTransactions(prams);
    return response ;
  }
  Future<ApiResponse> updateTransactions(UpdateTransactionsPrams prams)async {
    final response = await _api.updateTransactions(prams);
    return response ;
  }
  Future<ApiResponse> rescheduleTransactions(RescheduleTransactionsPrams prams)async {
    final response = await _api.rescheduleTransactions(prams);
    return response;
  }


}
