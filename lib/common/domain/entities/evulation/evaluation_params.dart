import 'package:shiftapp/common/data/models/evulation/evulation_params_dto.dart';
import 'package:shiftapp/common/domain/entities/evulation/evaluation_item.dart';

class EvaluationParams extends EvulationParamsDto{
  final int transactionId ;
  EvaluationParams({required this.transactionId , required List<EvaluationItem> evaluations, required String comment}) : super(evaluations: evaluations, comment: comment);
}