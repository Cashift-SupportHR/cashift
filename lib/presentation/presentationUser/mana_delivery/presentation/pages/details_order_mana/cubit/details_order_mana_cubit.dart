import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';

import '../../../../../common/common_state.dart';
import '../../../../data/models/accept_terms_prams.dart';
import '../../../../data/repositories/mana_delivery_repo.dart';
import 'details_order_mana_state.dart';

@injectable
class DetailsOrderManaCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  DetailsOrderManaCubit(this._repository);

  // fetchCities() async {
  //   executeBuilder(
  //     () async => await _resumeRepository.fetchAllCities(),
  //     onSuccess: (value) {
  //       emit(Initialized<List<CityItem>>(data: value));
  //     },
  //   );
  // }

  // StreamDataState<List<DistrictItem>> districtsStream =
  //     StreamDataStateInitial();
  //
  // Future<void> fetchDistricts(int cityId) async {
  //   try {
  //     final result = await _resumeRepository.fetchDistricts(cityId);
  //     districtsStream.setData(result);
  //   } catch (e) {
  //     districtsStream.setError(e);
  //   }
  // }

  void loadInitialData(int id) async {
    emit(LoadingState());
    try {
      final orderManaEntity = await _repository.fetchDeliveryOrdersById(id);

      final termsManaEntity = await _repository.fetchTermsMana();
      emit(DetailsOrderManaState(orderManaEntity:orderManaEntity,termsManaEntity: termsManaEntity));
    } catch (e) {
      print('ErrorState   ${e}');
      emit(ErrorState(e));
    }
  }

  acceptTerms(AcceptTermsPrams params) async {
    executeEmitterListener(() async =>   _repository.acceptTermsMana(params));

  }

}
