
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

  import '../../../../../common/domain/entities/resume/index.dart';

class AddHomeAddressState extends CommonStateFBuilder{
  final LatLng? myLocation;
  final List<CityItem> cities;

  AddHomeAddressState({
    this.myLocation,
    required this.cities,
  });
}
