import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../presentation/presentationUser/map_picker/pages/map_picker_page.dart';
import '../../../presentation/presentationUser/map_picker/widgets/map_picker_item.dart';
import '../base/base_stateless_widget.dart';
//
// ///  Created by harbey on 7/23/2023.
// class MapPicker extends BaseStatelessWidget {
//   final LatLng? displayLocation;
//   MapPicker({Key? key, this.displayLocation}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PlacePicker(
//       'AIzaSyAd_vUDBk1i9jcfCAp-ghIv4BKNW6Dd6x0',
//       displayLocation: displayLocation,
//       localizationItem: LocalizationItem(
//         languageCode: Localizations.localeOf(context).languageCode,
//         nearBy: strings.nearby_places,
//         findingPlace: strings.finding_place,
//         tapToSelectLocation: strings.tap_map_get_address,
//         unnamedLocation: '',
//         noResultsFound: strings.no_results_found,
//       ),
//     );
//   }
// }
//
Future<MapPickerItem> navigatorMapPicker(BuildContext context, {LatLng? displayLocation}) async {
  MapPickerItem result = await Navigator.of(context).push(MaterialPageRoute(
       builder: (context) =>
           MapPickerPage(
             initialLatLng: displayLocation,
           )));
   return result;
 }
