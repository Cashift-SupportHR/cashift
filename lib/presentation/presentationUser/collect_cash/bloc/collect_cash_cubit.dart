
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/common/data/repositories/collect_cash/collect_cash_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../core/bloc/base_cubit.dart';

@Injectable()
class CollectCashCubit extends BaseCubit {

  final CollectCashRepository _collectCashRepository;
  CollectCashCubit(this._collectCashRepository);

  final _codeStreamController = BehaviorSubject<CommonState>();

  Stream<CommonState> get codeStream => _codeStreamController.stream;

  Future<void> loadInitialData(int jobId) async {
    executeEmitterData(() => _collectCashRepository.fetchCashierList(jobId));
  }

  void fetchCode(int id, int type) async{
    _codeStreamController.sink.add(LoadingState());
   try {
     final response = await _collectCashRepository.generateReceiveCashCode(id, type );
     _codeStreamController.sink.add(Initialized(data: response));
   } catch(e){
     _codeStreamController.sink.add(ErrorState(e));
   }
 }

  void fetchCollectedAndNonCollectedJobs(bool isActive) {
    executeEmitterData(() => _collectCashRepository.fetchCollectedAndNonCollectedJobs(isActive?1:2));
  }
}
