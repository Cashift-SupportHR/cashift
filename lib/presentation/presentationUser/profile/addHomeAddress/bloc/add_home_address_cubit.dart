import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' as Get;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../../common/data/repositories/add-address/add_address_repository.dart';
import '../../../../../common/data/repositories/resume/resume_repository.dart';
import '../../../../../common/domain/entities/resume/index.dart';
import '../../../common/stream_data_state.dart';
import '../../../locationservice/locationservice.dart';
import '../../../map_picker/widgets/map_picker_item.dart';
import '../../../map_picker/widgets/map_prediction.dart';
import '../../../../../common/data/models/add-address/add_home_location_params.dart';
import 'add_home_address_state.dart';

@Injectable()
class AddHomeAddressCubit extends BaseCubit {
  final AddAddressRepository repository;
  final ResumeRepository _resumeRepository;

  AddHomeAddressCubit(this.repository, this._resumeRepository);

  StreamDataStateInitial<List<DistrictItem>> districtsStream =
      StreamDataStateInitial();

  StreamStateInitial<List<MapPrediction>?> predictionsSearchStream =
      StreamStateInitial();
  StreamStateInitial<MapPickerItem?> placeDetailsStream = StreamStateInitial();

  Future<void> fetchAllCities() async {
    executeBuilder(() => _resumeRepository.fetchAllCities(),
        onSuccess: (data) async {
      LatLng? myLocation = await location();
      emit(Initialized<AddHomeAddressState>(
          data: AddHomeAddressState(myLocation: myLocation, cities: data)));
    });
  }

  Future<LatLng?> location() async {
    // emit(LoadingStateListener());
    try {
      LocationPermission status =
          await GeolocatorPlatform.instance.requestPermission();
      if (status == LocationPermission.denied ||
          status == LocationPermission.deniedForever) {
        return null;
      }
      final position =
          await LocationService.determinePosition(Get.Get.context!);
      print('position $position');
      return LatLng(position.latitude!, position.longitude!);
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchDistricts(int cityId) async {
    try {
      final result = await _resumeRepository.fetchDistricts(cityId);
      districtsStream.setData(result);
    } catch (e) {
      districtsStream.setError(e);
    }
  }

  addAddress(AddHomeLocationParams params) {
    executeEmitterListener(() => repository.addHomeAddress(params));
  }

  Future<void> fetchPlacesAutocomplete(String input) async {
    predictionsSearchStream.setData(null);
    try {
      Response response = await fetchLocationData(input);
      List<MapPrediction> data = response.data['predictions']
          .map<MapPrediction>((item) => MapPrediction.fromJson(item))
          .toList();
      predictionsSearchStream.setData(data);
    } catch (e) {
      predictionsSearchStream.setError(e);
      throw Exception('Failed to fetch places autocomplete');
    }
  }

  Future<Response> fetchLocationData(String input) async {
    Dio dio = Dio();

    String sessionToken = Uuid().v4();
    Map<String, dynamic> queryParams = {
      'key': Config.GOOGLE_API_KEY,
      'input': input,
      // 'language': Get.locale!.languageCode,
      // 'location': '${item.geometry!.location!.lat},${item.geometry!.location!.lng}',
      //     'radius': 150,
      'sessiontoken': sessionToken,
    };
    Response response = await dio.get(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      queryParameters: queryParams,
    );
    print(response.data);
    return response;
  }

  Future<void> fetchPlaceDetails(String placeId) async {
    placeDetailsStream.setData(null);
    Dio dio = Dio();
    Map<String, dynamic> queryParams = {
      'key': Config.GOOGLE_API_KEY,
      //  'location': '-33.866489%2C-151.1958561',
      'place_id': placeId,
      'language': Get.Get.locale!.languageCode,
    };
    Response response = await dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: queryParams,
    );
    try {
      print('response ${response.data['result']}');
      MapPickerItem pickerItem =
          MapPickerItem.fromJson(response.data['result']);
      print('responseJson ${pickerItem.toJson()}');

      placeDetailsStream.setData(pickerItem);
    } catch (e) {
      print(e);
      placeDetailsStream.setError(e);
      throw Exception('Failed to decode place');
    }
  }
}
