import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/data/models/add-address/index.dart';

 import '../../../../../common/data/repositories/add-address/add_address_repository.dart';
import '../../../map_picker/bloc/map_picker_state.dart';
import '../../../map_picker/data/repositories/map_picker_repository.dart';
import '../../../map_picker/widgets/map_picker_item.dart';
import '../../../map_picker/widgets/map_prediction.dart';

@Injectable()
class AddAddressCubit extends BaseCubit {
  final AddAddressRepository repository;
  final MapPickerRepository _mapPickerRepository;

  AddAddressCubit(this.repository, this._mapPickerRepository);

  StreamStateInitial<List<MapPrediction>?> predictionsSearchStream =
  StreamStateInitial();
  StreamStateInitial<MapPickerItem?> placeDetailsStream = StreamStateInitial();

  void fetchInitialData(){
    emit(Initialized<MapPickerState>(
      data: MapPickerState(
        predictionsSearchStream: predictionsSearchStream,
        placeDetailsStream: placeDetailsStream,
        onFetchPlaces: (String input) => fetchPlacesAutocomplete(input),
        onFetchPlaceDetails: (String placeId) => fetchPlaceDetails(placeId),
      ),
    ));
  }

  Future<void> fetchFavoriteAddresses() async {
    emit(LoadingState());
    try {
      final result = await repository.fetchFavoriteAddresses();

      emit(Initialized(data: result));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }

  }

  Future<void> addFavoriteAddresses(AddressDto address, bool isEdit) async {
    String message = '';
    emit(LoadingStateListener());
    try {
      if (isEdit) {
        message = await repository.editFavoriteAddresses(address);
      } else {
        message =  await repository.addFavoriteAddresses(address);
      }
      emit(SuccessStateListener(data: message));
    } catch (e) {
      emit(FailureStateListener(e));
    }

  }

  Future<void> fetchPlacesAutocomplete(String input) async {
    predictionsSearchStream.setData(null);
    try {
      List<MapPrediction> data = await _mapPickerRepository.fetchPlacesAutocomplete(
        input,
      );
      predictionsSearchStream.setData(data);
    } catch (e) {
      predictionsSearchStream.setError(e);
      throw Exception('Failed to fetch places autocomplete');
    }
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    placeDetailsStream.setData(null);
    try {
      MapPickerItem pickerItem = await _mapPickerRepository.fetchPlaceDetails(placeId);
      placeDetailsStream.setData(pickerItem);
    } catch (e) {
      print(e);
      placeDetailsStream.setError(e);
      throw Exception('Failed to decode place');
    }
  }
}
