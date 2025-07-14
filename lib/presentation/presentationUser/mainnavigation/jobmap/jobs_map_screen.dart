import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';
 import 'package:google_maps_flutter/google_maps_flutter.dart' hide Cluster, ClusterManager;
import 'package:rxdart/rxdart.dart';
 import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/jobs_list/jobs_list_screen.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/job_offer_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/main_index.dart';
import 'package:flutter/foundation.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui' as ui;

import '../../../../common/components/base/base_stateless_widget.dart';
import 'Place.dart';

class MapScreen extends StatelessWidget {
  final List<JobOfferDto> offers;
  Function onRefresh;

  MapScreen({Key? key, required this.offers, required this.onRefresh})
      : super(key: key);

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          offers: offers,
          onMapCreated: (mMapController) {
            mapController = mMapController;
          },
          onRefresh: onRefresh,
        ),
        Positioned(
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 10),
              child: SearchPlacesWidget(
                onSelectPlace: (item) {
                  if (mapController != null) {
                    mapController!.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target:item.latLng,
                            zoom: 14)));
                  }
                },
                offers: offers,
              )),
        ),
      ],
    );
  }
}

class PlaceItem{
  final String name ;
  final LatLng latLng ;

  PlaceItem({required this.name,required this.latLng});

}

class SearchPlacesWidget extends BaseStatelessWidget {
  final Function(PlaceItem) onSelectPlace;
  final List<JobOfferDto> offers;
  var selectAddress = false;

  final textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final _offersStreamController = BehaviorSubject<List<PlaceItem>>();

  Stream<List<PlaceItem>> get offersListStream =>
      _offersStreamController.stream;
  fetchPlaces(String text) async {
    print('fetchPlaces ${text.isEmpty}');

    if (text.isEmpty) {
      _offersStreamController.sink.add([]);
    } else {
      final offerSearch = offers.where((element) => element.toString().contains(text));
      if (offerSearch.isNotEmpty) {
        _offersStreamController.sink.add(offerSearch.map((e) => PlaceItem(name: '${e.jobName} - ${e.projectName} , ${e.projectAddress}',latLng: e.location())).toList());
      } else {
        if (textController.text.isNotEmpty) {
          _offersStreamController.sink.add([]);
        }
      }
    }
  }

  SearchPlacesWidget(
      {Key? key, required this.onSelectPlace, required this.offers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.all(Radius.circular(27)),
          child: TextFormField(
            style: kTextMedium.copyWith(fontSize: 16),
            controller: textController,
            onChanged: (t) {
              if (!selectAddress) {
                print('onChanged controller ');
                fetchPlaces(t);
              } else {
                selectAddress = false;
              }
            },
            focusNode: focusNode,
            decoration: kSearchDecoration.copyWith(
                suffixIcon: const Icon(Icons.search),
                hintText: strings.search_your_job_location,
                hintStyle: kTextRegular.copyWith(
                    fontSize: 10.sp, color: kBattleShipGrey)),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<PlaceItem>>(
              stream: offersListStream,
              builder: (context, snapshot) {
                print('onStreamBuilder ${snapshot.hasData}');
                return snapshot.data != null && snapshot.data!.isNotEmpty
                    ? Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: snapshot.requireData.length,
                      itemBuilder: (con, pos) {
                        final item = snapshot.requireData[pos];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              selectAddress = true;
                              textController.text =
                                  item.name;
                              onSelectPlace(item);
                              _offersStreamController.sink.add([]);
                            },
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.name.toString(),
                                  maxLines: 2,
                                ),
                                const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 4,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
                    : Container();
              }),
        )
      ],
    );
  }
}

class MapWidget extends StatefulWidget {
  final List<JobOfferDto> offers;
  Function onRefresh;
  final Function(GoogleMapController) onMapCreated;
  MapWidget(
      {Key? key,
        required this.offers,
        required this.onMapCreated,
        required this.onRefresh})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MapWidgetState();
  }
}

class MapWidgetState extends State<MapWidget> {
  BitmapDescriptor? markerIcon;
  //PlacesSearchResult? selectedPlace;
  Set<Marker> _markers = Set();
  GoogleMapController? mapController;
  late ClusterManager _manager;
  LatLng? lastUserLocation;
  var locationFeched = false;
  double initZoom = 14;
  final Completer<GoogleMapController> _controller = Completer();

  ClusterManager<Place> _initClusterManager() {
    return ClusterManager<Place>(getPlaces(), _updateMarkers,
        markerBuilder: _markerBuilderCast);
  }
  Future<Marker> _markerBuilderCast(dynamic cluster) {
    return _markerBuilder(cluster as Cluster<Place>);
  }

  List<Place> getPlaces() {
    final List<Place> list = [];
    widget.offers.forEach((element) {
      list.add(Place(
          latitude: element.latitude!,
          job: element.jobName ?? '',
          longitude: element.longtude!,
          salary: element.salaryRound(),
          name: DateFormatter.formatDateString(
              element.workingDate, 'MM/dd/yyyy', 'dd MMM'),
          title: element.projectName.toString(),
          id: element.id!));
    });

    return list;
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      _markers = markers;
    });
  }

  void showJobDetailsSheet(JobOfferDto jobOffer) {}

  void showOffersListSheet(List<JobOfferDto> offers) {}

  void showJobsListDetailsSheet(List<int> map) {
    final List<JobOfferDto> offers = [];
    if (map.length == 1) {
      showJobDetailsSheet(
          widget.offers.firstWhere((element) => element.id == map.first));
    } else {
      for (var id in map) {
        offers.add(widget.offers.firstWhere((element) => element.id == id));
      }
      showOffersListSheet(offers);
    }
  }

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
          (cluster) async {
        final name = cluster.items.length > 1
            ? '${cluster.items.length} ${context.getStrings().offers}'
            : cluster.items.first.name;
        cluster.items.forEach((element) {
          print('${element.salary} ClusterMarker ${name}');
        });
        print('\n ---------------------- \n');
        final salary = cluster.items.map((e) => e.salary).reduce(max);
        return cluster.items.length == 1
            ? Marker(
            markerId: MarkerId(cluster.getId()),
            position: cluster.location,
            infoWindow:
            InfoWindow(title: cluster.items.first.title, snippet: name),
            icon: await createCustomMarkerBitmap(
              '${salary} \n ${cluster.items.first.job}',
              backgroundColor: kPrimary,
              textStyle:
              kTextSemiBold.copyWith(fontSize: 48, color: Colors.white),
            ))
            : Marker(
            markerId: MarkerId(cluster.getId()),
            position: cluster.location,
            infoWindow:
            InfoWindow(title: cluster.items.first.title, snippet: name),
            onTap: () {
              navigateToOffers(cluster.items.map((e) => e.id).toList());
            },
            icon: await createCustomMarkerBitmap(
              '${salary} \n ${name}',
              backgroundColor: kPrimary,
              textStyle:
              kTextSemiBold.copyWith(fontSize: 48, color: Colors.white),
            ));
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()
      ..color = kPrimary
      ..strokeWidth = 8
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: kTextMedium.copyWith(fontSize: size / 3, color: Colors.white),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  locationPermissionDisclosure(BuildContext context, {required Function() onConfirm}) async {
   final permission = await Geolocator.checkPermission();
   if(permission== LocationPermission.denied){
     DialogsManager.showConfirmationAnimatedDialog(context, message: context.getStrings().location_disclosure, onConfirm: onConfirm);
   }

  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Geolocator.openAppSettings();
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Geolocator.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  detectMyLocation() async {
    if (lastUserLocation != null) {
      final p = CameraPosition(
          target:
          LatLng(lastUserLocation!.latitude, lastUserLocation!.longitude),
          zoom: initZoom);
      mapController?.animateCamera(CameraUpdate.newCameraPosition(p));
    }
    print('detectMyLocation');
    locationPermissionDisclosure(context,onConfirm: (){
      _determinePosition().then((value) {
        print('detectMyLocation focusToPosition');
        focusToPosition(value);
      }, onError: (e) async {
        await Geolocator.openLocationSettings();
      });
    });

  }

  focusToPosition(Position position) {
    final p = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: initZoom);
    lastUserLocation = LatLng(position.latitude, position.longitude);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onCameraMove: _manager.onCameraMove,
          onCameraIdle: _manager.updateMap,
          onMapCreated: (controller) async {
            mapController = controller;
            mapController!.setMapStyle(getMapStyle());
            _manager.setMapId(controller.mapId);
            widget.onMapCreated(mapController!);
            detectMyLocation();
          },
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _markers.isNotEmpty
                ? _markers.first.position
                : const LatLng(24.78878, 46.6989),
            zoom: 5.0,
          ),
        ),
        PositionedDirectional(
          start: 10,
          bottom: 230,
          child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 8, start: 1),
              child: FloatingActionButton(
                backgroundColor: kWhiteOff,
                onPressed: () {
                  detectMyLocation();
                },
                child: Icon(
                  Icons.my_location,
                  color: kPrimaryDark,
                ),
              )),
        ),
        PositionedDirectional(
          bottom: 50,
          end: 0,
          start: 20,
          child: buildCashierListWidget(widget.offers),
        )
      ],
    );
  }

  String? getMapStyle() {
    return '''
    [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#000"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#000"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#67C1CA"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#000"
      }
    ]
  }
]
    ''';
  }

  buildCashierListWidget(List<JobOfferDto> jobOffers) {
    return SizedBox(
      height: 190,
      child: PageView.builder(
          itemCount: jobOffers.length,
          controller: PageController(
            viewportFraction: 0.8,
            initialPage: 0,
          ),
          onPageChanged: (index) {
            print('onPageChanged ${jobOffers[index].location()}');
            animateToOffer(jobOffers[index]);
          },
          itemBuilder: (con, index) {
            final jobOffer = jobOffers[index];
            return InkWell(
              onTap: () {
                animateToOffer(jobOffer);
              },
              child: JobOfferItemWidget(
                jobOffer,
                onClickApply: () {
                  widget.onRefresh();
                },
                mapView: true,
              ),
            );
          }),
    );
  }

  void animateToOffer(JobOfferDto jobOffers) {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: jobOffers.location(), zoom: initZoom)));
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title,
      {required TextStyle textStyle,
        Color backgroundColor = Colors.blueAccent}) async {
    TextSpan span = TextSpan(
      style: textStyle,
      text: title,
    );
    TextPainter painter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textWidthBasis: TextWidthBasis.longestLine,
      textDirection:
      context.isRTL() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
    );
    painter.text = TextSpan(
      text: title.toString(),
      style: textStyle,
    );
    ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    Canvas canvas = Canvas(pictureRecorder);
    painter.layout();
    painter.paint(canvas, const Offset(20.0, 10.0));
    int textWidth = painter.width.toInt();
    int textHeight = painter.height.toInt();
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(0, 0, textWidth + 40, textHeight + 20,
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10)),
        Paint()..color = backgroundColor);
    var arrowPath = Path();
    arrowPath.moveTo((textWidth + 40) / 2 - 15, textHeight + 20);
    arrowPath.lineTo((textWidth + 40) / 2, textHeight + 40);
    arrowPath.lineTo((textWidth + 40) / 2 + 15, textHeight + 20);
    arrowPath.close();
    canvas.drawPath(arrowPath, Paint()..color = backgroundColor);
    painter.layout();
    painter.paint(canvas, const Offset(20.0, 10.0));
    ui.Picture p = pictureRecorder.endRecording();
    ByteData? pngBytes = await (await p.toImage(
        painter.width.toInt() + 40, painter.height.toInt() + 50))
        .toByteData(format: ui.ImageByteFormat.png);
    Uint8List data = Uint8List.view(pngBytes!.buffer);
    return BitmapDescriptor.fromBytes(data);
  }

  void navigateToOffers(List<int> ids) {
    final List<JobOfferDto> offers = [];

    for (var id in ids) {
      offers.add(widget.offers.firstWhere((element) => element.id == id));
    }
    showAppModalBottomSheet(
        context: context,
        child: Container(
          child: JobsListScreen(
            offers,
            onApplyOffer: () {},
          ),
        ),
        title: context.getStrings().offers);
  }
}
