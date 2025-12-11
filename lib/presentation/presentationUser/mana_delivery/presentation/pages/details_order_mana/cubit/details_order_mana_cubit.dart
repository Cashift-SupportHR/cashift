import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';

import '../../../../data/repositories/mana_delivery_repo.dart';

@injectable
class DetailsOrderManaCubit extends BaseCubit {
  final ManaDeliverRepository _repository;

  DetailsOrderManaCubit(
    this._repository,

  );

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
}
