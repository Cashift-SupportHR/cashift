
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/add-address/index.dart';

import '../../models/add-address/add_home_location_params.dart';
import '../../datasources/remote/api/add-address/add_address_api_provider.dart';
import '../../models/api_response.dart';

@Injectable()
class AddAddressRepository {

  final AddAddressAPI _api;

  AddAddressRepository(this._api);

  Future<List<AddressDto>> fetchFavoriteAddresses() async {
    final response = await _api.fetchFavoriteAddresses();
    return response.payload ?? [];
  }

  Future<String> addFavoriteAddresses(AddressDto address) async {
    final response = await _api.addFavoriteAddresses(address);
    return response.message ?? '';
  }

  Future<String> editFavoriteAddresses(AddressDto address) async {
    final response = await _api.editFavoriteAddresses(address);
    return response.message ?? '';
  }

  Future<ApiResponse> addHomeAddress(AddHomeLocationParams params) async {
    final response = await _api.addHomeAddress(params);
    return response ;
  }

}
