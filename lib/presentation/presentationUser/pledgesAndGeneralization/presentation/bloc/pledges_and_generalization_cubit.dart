import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../data/repositories/pledges_and_generalization_repository.dart';
import '../../domain/entities/pledge_generalization.dart';

@Injectable()
class PledgesAndGeneralizationCubit extends BaseCubit {
  final PledgesAndGeneralizationRepository repository;

  PledgesAndGeneralizationCubit(this.repository);

  Future<void> fetchLoansRequests(int type) async {
    emit(LoadingState());
    try {
   final result = await repository.fetchPledgesAndGeneralization(type);
  final data = result.map((e) => PledgeGeneralization.fromDto(e)).toList();
   // emit(Initialized<List<PledgeGeneralization>>(data: [
   //   PledgeGeneralization(id: 1, logo: "logo", title: "title", subTitle: "subTitle", clearanceText: "clearanceText", statusText: "statusText", clearanceDate: "clearanceDate", hasAction: true),
   // ]));
       emit(Initialized<List<PledgeGeneralization>>(data: data));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

  Future<void> resetPledgesAndGeneralization(int id) async {
    emit(LoadingStateListener());
    try {
      final message = await repository.resetPledgesAndGeneralization(id);
      emit(SuccessStateListener(data: message));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }

}
