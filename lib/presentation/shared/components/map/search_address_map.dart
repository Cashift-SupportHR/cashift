// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:sizer/sizer.dart';
// import 'package:google_maps_webservice/places.dart';
//
// import '../../../../config.dart';
// import '../../../../../domain/job_offer_dto.dart';
// import '../../../presentationUser/resources/colors.dart';
// import '../../../presentationUser/resources/constants.dart';
//
// class PlaceItem{
//   final String name ;
//   final LatLng latLng ;
//
//   PlaceItem({required this.name,required this.latLng});
//
// }
//
// class SearchPlacesWidget extends StatelessWidget {
//   final Function(PlaceItem) onSelectPlace;
//   final List<JobOfferDto> offers;
//   var selectAddress = false;
//
//   final textController = TextEditingController();
//   FocusNode focusNode = FocusNode();
//   Future<PlacesSearchResponse>? searchObserver;
//   final geocoding = GoogleMapsPlaces(apiKey: Config.GOOGLE_API_KEY);
//   final _offersStreamController = BehaviorSubject<List<PlaceItem>>();
//
//   Stream<List<PlaceItem>> get offersListStream =>
//       _offersStreamController.stream;
//   fetchPlaces(String text) async {
//     print('fetchPlaces ${text.isEmpty}');
//
//     if (text.isEmpty) {
//       _offersStreamController.sink.addopportunityemployee([]);
//     } else {
//       final offerSearch = offers.where((element) => element.toString().contains(text));
//       if (offerSearch.isNotEmpty) {
//         _offersStreamController.sink.addopportunityemployee(offerSearch.map((e) => PlaceItem(name: '${e.jobName} - ${e.projectName} , ${e.projectAddress}',latLng: e.location())).toList());
//       } else {
//         searchObserver = geocoding.searchByText(text,
//             language: Get.locale!.languageCode.toString(), region: 'SA');
//         PlacesSearchResponse response = await searchObserver!;
//         if (textController.text.isNotEmpty) {
//           _offersStreamController.sink.addopportunityemployee(response.results.map((e) => PlaceItem(name: e.formattedAddress??e.name , latLng: LatLng(e.geometry!.location.lat,e.geometry!.location.lng))).toList());
//         } else {
//           _offersStreamController.sink.addopportunityemployee([]);
//         }
//       }
//     }
//   }
//
//   SearchPlacesWidget(
//       {Key? key, required this.onSelectPlace, required this.offers})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Material(
//           elevation: 2,
//           borderRadius: const BorderRadius.all(Radius.circular(27)),
//           child: TextFormField(
//             style: kTextMedium.copyWith(fontSize: 16),
//             controller: textController,
//             onChanged: (t) {
//               if (!selectAddress) {
//                 print('onChanged controller ');
//                 fetchPlaces(t);
//               } else {
//                 selectAddress = false;
//               }
//             },
//             focusNode: focusNode,
//             decoration: kSearchDecoration.copyWith(
//                 suffixIcon: const Icon(Icons.search),
//                 hintText: 'ابحث عن موقعك',
//                 hintStyle: kTextRegular.copyWith(
//                     fontSize: 10.sp, color: kBattleShipGrey)),
//           ),
//         ),
//         Expanded(
//           child: StreamBuilder<List<PlaceItem>>(
//               stream: offersListStream,
//               builder: (context, snapshot) {
//                 print('onStreamBuilder ${snapshot.hasData}');
//                 return snapshot.data != null && snapshot.data!.isNotEmpty
//                     ? Container(
//                   color: Colors.white,
//                   child: ListView.builder(
//                       itemCount: snapshot.requireData.length,
//                       itemBuilder: (con, pos) {
//                         final item = snapshot.requireData[pos];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                             onTap: () {
//                               selectAddress = true;
//                               textController.text =
//                               item.name;
//                               print('onTap ${item.name}');
//                               onSelectPlace(item);
//                               _offersStreamController.sink.addopportunityemployee([]);
//                             },
//                             child: Column(
//                               crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   item.name.toString(),
//                                   maxLines: 2,
//                                 ),
//                                 const Divider(
//                                   height: 1,
//                                   color: Colors.grey,
//                                 ),
//                                 const SizedBox(
//                                   height: 4,
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                 )
//                     : Container();
//               }),
//         )
//       ],
//     );
//   }
// }