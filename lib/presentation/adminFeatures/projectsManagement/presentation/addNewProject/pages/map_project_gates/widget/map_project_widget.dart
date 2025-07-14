import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/map_project_gates/employee_gates/employee_gates_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';

import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';

class MapPojectWidget extends StatefulWidget {
  final GoogleMapController? mapController;
  final Function() detectMyLocation;
  final LocationGateProjectDto locationGateProjectDto;
  final Function({required String name, required String emp}) getMarker;

  const MapPojectWidget(
      {super.key,
      required this.mapController,
      required this.getMarker,
      required this.locationGateProjectDto,
      required this.detectMyLocation});
  @override
  State<StatefulWidget> createState() {
    return MapDataScreen(
        getMarker: getMarker,
        locationGateProjectDto: locationGateProjectDto,
        mapController: mapController,
        detectMyLocation: detectMyLocation);
  }
}

class MapDataScreen extends State<MapPojectWidget> {
  final Function() detectMyLocation;
  final LocationGateProjectDto locationGateProjectDto;

  final Function({required String name, required String emp}) getMarker;
  BitmapDescriptor? customIcon;
  GoogleMapController? mapController;

  MapDataScreen(
      {required this.mapController,
      required this.getMarker,
      required this.locationGateProjectDto,
      required this.detectMyLocation});
  var locationFeched = false;

  Set<Marker> markers = {};

  @override
  void initState() {
    setAllMarkers();
    super.initState();
  }

  setAllMarkers() async {
    if (widget.locationGateProjectDto.locationsProject!.isNotEmpty) {
      for (int i = 0;
          i < widget.locationGateProjectDto.locationsProject!.length;
          i++) {
        markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            onTap: () {
              showAppModalBottomSheet(
                  context: context,
                  isDivider: false,
                  isCloseButton: false,
                  titleWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              widget.locationGateProjectDto.locationsProject?[i]
                                      .name ??
                                  "",
                              style: kTextBold.copyWith(
                                  color: kPrimary, fontSize: 16)),
                          UnderlineWidget(
                            width: 60,
                            color: kOrange00,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                            " ${widget.locationGateProjectDto.locationsProject?[i].countOfEmployee} موظف ",
                            style: kTextMedium.copyWith(
                                color: kOrange00, fontSize: 13)),
                      ),
                    ],
                  ),
                  titlePadding: EdgeInsets.all(20),
                  child: EmployeeGatesPage(
                    idPoint: widget.locationGateProjectDto.locationsProject?[i]
                            .locationProjectCode ??
                        "",
                  ));
            },
            position: LatLng(
                double.parse(widget
                        .locationGateProjectDto.locationsProject?[i].latitude ??
                    ""),
                double.parse(widget.locationGateProjectDto.locationsProject?[i]
                        .longitude ??
                    "")),
            icon: await getMarker(
                emp:
                    "${widget.locationGateProjectDto.locationsProject?[i].countOfEmployee ?? ""}  موظف",
                name:
                    "   ${widget.locationGateProjectDto.locationsProject?[i].name}\n"),
          ),
        );
      }
      setState(() {});
    }
  }

  @override
  build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (controller) async {
            mapController = controller;
            mapController!.setMapStyle(getMapStyle());
            detectMyLocation();
          },
          markers: markers,
          initialCameraPosition: CameraPosition(
            target: markers.isNotEmpty
                ? markers.first.position
                : const LatLng(24.78878, 46.6989),
            zoom: 5.0,
          ),
        ),
      ],
    );
  }
}
