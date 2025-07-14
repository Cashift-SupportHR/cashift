import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/evaluation/evaluation_api_provider.dart';
import 'package:shiftapp/common/domain/entities/evulation/index.dart';




@Injectable()
class EvaluationRepository {
  final EvaluationApi api;
  EvaluationRepository(this.api);

  Future<String> saveEvaluations(EvaluationParams request) async {
    final response = await api.saveEvaluations(request,request.transactionId);
    return response.message??'';
  }
  Future<List<EvaluationItem>> fetchEvaluationItems(int transactionId) async {
    final response = await api.fetchEvaluationItems(transactionId);
    return response.payload??[];
  }
}
