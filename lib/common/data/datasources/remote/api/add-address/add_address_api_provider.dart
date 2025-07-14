
import 'package:injectable/injectable.dart';
 import 'package:shiftapp/common/data/models/api_response.dart';
 import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/add-address/add_home_location_params.dart';
import '../../../../models/add-address/index.dart';

@Injectable()
 class AddAddressAPI {
  final UserEndpoint api;

  AddAddressAPI(this.api);

  Future<ApiResponse<List<AddressDto>>> fetchFavoriteAddresses(){
    return api.fetchFavoriteAddresses();
  }

  Future<ApiResponse<bool>> addFavoriteAddresses(AddressDto address){
    return api.addFavoriteAddresses(address);
  }

  Future<ApiResponse<String>> editFavoriteAddresses(AddressDto address){
    return api.editFavoriteAddresses(address);
  }

  Future<ApiResponse> addHomeAddress(AddHomeLocationParams params){
    return api.addHomeAddress(params);
  }

}
