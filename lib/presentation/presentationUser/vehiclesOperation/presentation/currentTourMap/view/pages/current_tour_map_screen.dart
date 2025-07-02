import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/currentTourMap/tour_history/pages/tour_history_page.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/startTour/pages/start_tour_page.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/presentation/shared/components/text_field/text_field_search.dart';

import '../../../../../../../main_index.dart';
import '../../../../../../../core/utils/app_icons.dart';
import '../../../../../../adminFeatures/areapolygones/data/models/add_vehicle_zone_params.dart';
import '../../../../../attendance/shiftAttendance/widgets/timer_counter.dart';
import '../../../../../salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../domain/entities/index.dart';
import '../../../startTour/widgets/job_duties_tour.dart';
import '../../gasStationsPlan/page/gas_stations_plane_page.dart';
import '../bloc/current_tour_map_state.dart';
import '../../chnage_operating_plane/pages/change_operating_plane_page.dart';

class CurrentTourMapScreen extends StatefulWidget {
  final CurrentTourMapState state;
  final Function() onEndRoundTrip;
  final Function() onRefresh;
  final Function(int) onFetchRoundTypeTermsAndCondition;

  CurrentTourMapScreen({
    Key? key,
    required this.state,
    required this.onRefresh,
    required this.onEndRoundTrip,
    required this.onFetchRoundTypeTermsAndCondition,
  }) : super(key: key);

  @override
  _FilterVehiclesZoneScreenState createState() =>
      _FilterVehiclesZoneScreenState();
}

class _FilterVehiclesZoneScreenState extends State<CurrentTourMapScreen> {
  late GoogleMapController mapController;
  List<LatLng> polygonPoints = [];
  Set<Polygon> polygons = Set<Polygon>();
  Set<Marker> markers = Set<Marker>();
  CurrentRoundTrip currentRoundTrip = CurrentRoundTrip();

  TextEditingController companyController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  int? companyId;
  int? projectId;
  int? shiftId;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    displayPolygonPoints();
  }

  void _clearPolygon() {
    setState(() {
      polygonPoints.clear();
      polygons.clear();
      markers.clear(); // Clear the markers as well
    });
  }

  late AppLocalizations strings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentRoundTrip = widget.state.currentRoundTrip ?? CurrentRoundTrip();
  }

  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    strings = context.getStrings();
    canPop = MyModalRoute.of(context)?.canPop ?? false;
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194), // Set the initial location
            zoom: 16, // Set the initial zoom level
          ),
          polygons: polygons,
          markers: markers,
          // Display markers on the map
          // onTap: _onTap, // Register tap events
        ),

        infoTour(),
        if (currentRoundTrip.isRequiredPubup == true &&
            currentRoundTrip.roundTypeCode == "FillGas")
          carGasMassage(),
        // searchWidget(),
        if (canPop) BackButton(),
        buttonsActions(),

        endFieldSurveyButton(),
      ],
    );
  }

  Align endFieldSurveyButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AppCupertinoButton(
        text: strings.end_field_survey,
        margin: EdgeInsets.all(16),
        backgroundColor: kRed_01,
        onPressed: () {
          onEndRoundTripPressed();
        },
      ),
    );
  }

  onEndRoundTripPressed() {
    widget.onEndRoundTrip();
  }

  LatLngBounds _calculatePolygonBounds(List<LatLng> polygonCoordinates) {
    double north = polygonCoordinates.first.latitude;
    double south = polygonCoordinates.first.latitude;
    double east = polygonCoordinates.first.longitude;
    double west = polygonCoordinates.first.longitude;

    for (var coord in polygonCoordinates) {
      if (coord.latitude > north) north = coord.latitude;
      if (coord.latitude < south) south = coord.latitude;
      if (coord.longitude > east) east = coord.longitude;
      if (coord.longitude < west) west = coord.longitude;
    }

    return LatLngBounds(
      northeast: LatLng(north, east),
      southwest: LatLng(south, west),
    );
  }

  IntrinsicHeight searchWidget() {
    return IntrinsicHeight(
      child: TextFieldSearch(
        title: strings.search_for_areas,
        margin: EdgeInsets.only(top: canPop ? 50 : 30, left: 10, right: 10),
        onTap: () {},
      ),
    );
  }

  PositionedDirectional buttonsActions() {
    return PositionedDirectional(
      bottom: 100,
      start: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconButton(
            icon: AppIcons.factoryViolations,
            onPressed: () {
              Navigator.pushNamed(context, Routes.factoryViolationsPlanePage,arguments:currentRoundTrip.id );
            },
          ),
          iconButton(
            icon: AppIcons.maintenances,
            onPressed: () {
              Navigator.pushNamed(context, Routes.maintenanceBreakdownsPlanPage,arguments:currentRoundTrip.id);
            },
          ),
          iconButton(
            icon: AppIcons.staution,
            onPressed: () {
              showGasStationsBottomSheet();
            },
          ),
          iconButton(
            icon: AppIcons.operating_plan_colored,
            onPressed: () {
              showChangeOperatingPlaneBottomSheet();
            },
          ),
          iconButton(
            icon: AppIcons.follow_tour_colored,
            onPressed: () {
              showTourHistoryBottomSheet();
            },
          ),
          iconButton(
            icon: AppIcons.job_duties_colored,
            onPressed: () {
              widget.onFetchRoundTypeTermsAndCondition(
                currentRoundTrip.roundTypeId ?? 0,
              );
              showJobDutiesBottomSheet();
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  PositionedDirectional carGasMassage() {
    return PositionedDirectional(
      bottom: 300,
      start: 70,
      end: 5,
      child: Container(
        decoration: Decorations.decorationOnlyRadius(
          color: kOrangeE1,
          radius: 20,
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentRoundTrip.pubupMessage ?? "",
                    style: kTextRegular.copyWith(fontSize: 12, color: kBlack),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 80,
                    child: AppCupertinoButton(
                      onPressed: () {
                        showChangeOperatingPlaneBottomSheet();
                      },
                      text: strings.end_but,
                      elevation: 0,
                      height: 30,
                      backgroundColor: kRed,
                      radius: BorderRadius.circular(8),
                      textStyle: kTextBold.copyWith(
                        fontSize: 12,
                        color: kWhite,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(AppIcons.car_gas),
            ),
          ],
        ),
      ),
    );
  }

  Padding iconButton({required String icon, required Function() onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: FloatingActionButton(
        child: kLoadSvgInCirclePath(icon),
        // elevation: 1,
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
        onPressed: onPressed,
      ),
    );
  }

  showChangeOperatingPlaneBottomSheet() {
    showAppModalBottomSheet(
      context: context,
      title: strings.change_operating_plan,
      isScrollControlled: true,
      padding: EdgeInsets.zero,
      child: ChangeOperatingPlanePage(
        currentRoundTrip: currentRoundTrip,
        onRefresh: widget.onRefresh,
      ),
    );
  }

  showGasStationsBottomSheet() {
    showAppModalBottomSheet(
      context: context,
      title: strings.gas_stations,
      isScrollControlled: true,
      padding: EdgeInsets.zero,
      child: GasStationsPlanePage(
        currentRoundTrip: currentRoundTrip,
        onRefresh: widget.onRefresh,
      ),
    );
  }

  showTourHistoryBottomSheet() {
    showAppModalBottomSheet(
      context: context,
      title: strings.tour_history,
      isScrollControlled: true,
      padding: EdgeInsets.zero,
      child: TourHistoryPage(currentRoundTrip: currentRoundTrip),
    );
  }

  showJobDutiesBottomSheet() {
    showAppModalBottomSheet(
      context: context,
      title: strings.job_duties,
      isScrollControlled: false,
      padding: EdgeInsets.zero,
      child: StreamBuilder<List<RoundTypeTermsAndCondition>?>(
        stream: widget.state.roundTypeTermsAndConditionStream?.stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingView();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: JobDutiesTour(data: snapshot.data ?? []),
          );
        },
      ),
    );
  }

  Future<Set<Marker>> mapPointsMarkers(List<LatLng> polygonPoints) async {
    if (polygonPoints.isEmpty) {
      return Set();
    }
    Uint8List iconData = await loadAndResizePng(
      Assets.imagesLocation,
      width: 50,
      height: 50,
    );
    final list =
        polygonPoints.map((e) {
          return Marker(
            markerId: MarkerId('marker_${e}'),
            position: e,
            icon: BitmapDescriptor.fromBytes(iconData),
          );
        }).toList();
    return Set<Marker>.of(list);
  }

  Set<Polygon> mapPolygons(List<LatLng> polygonPoints) {
    if (polygonPoints.isEmpty) {
      return Set();
    }
    final list =
        polygonPoints.map((e) {
          return Polygon(
            polygonId: PolygonId('polygon_${e}'),
            points: polygonPoints,
            strokeWidth: 2,
            strokeColor: kPrimary,
            fillColor: kPrimary.withOpacity(0.1),
          );
        }).toList();
    return Set<Polygon>.of(list);
  }

  Future<void> displayPolygonPoints() async {
    List<LatLng> polygonPoints = VehicleZoneLatLng.toLatLngList(
      widget.state.currentRoundTrip?.latlngs ?? [],
    );
    print('polygonPoints: $polygonPoints');
    if (polygonPoints.isNotEmpty) {
      polygons = mapPolygons(polygonPoints);
      markers = await mapPointsMarkers(polygonPoints);
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          _calculatePolygonBounds(polygonPoints),
          50,
        ), // 50 is padding
      );
      setState(() {});
    } else {
      _clearPolygon();
    }
  }

  Future<Uint8List> loadAndResizePng(
    String assetPath, {
    int width = 100,
    int height = 100,
  }) async {
    // Load the PNG image as Uint8List
    final ByteData data = await rootBundle.load(assetPath);

    // Decode the image to resize it
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
      targetHeight: height,
    );
    ui.FrameInfo frameInfo = await codec.getNextFrame();

    // Convert the resized image back to Uint8List
    final ByteData? byteData = await frameInfo.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return byteData!.buffer.asUint8List();
  }

  Container infoTour() {
    return Container(
      margin: EdgeInsets.only(top: 45, left: 16, right: 16),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: Decorations.shapeDecorationShadow(),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        title: buildIconDoubleText(
          icon: AppIcons.operating_plan,
          title: context.getStrings().operating_plan,
          value: currentRoundTrip.vehiclesZoneName ?? '',
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: buildIconDoubleText(
                  icon: AppIcons.tour_type,
                  title: context.getStrings().tour_type,
                  value: currentRoundTrip.roundTypeName ?? '',
                ),
              ),
              SizedBox(
                height: 20,
                child: TimerCounter(
                  endTimeDateTime: currentRoundTrip.startRound ?? '',
                  style: kTextMedium.copyWith(fontSize: 16, color: kYellow_00),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          buildIconDoubleText(
            icon: AppIcons.violation_name,
            title: context.getStrings().violations_num,
            value:
                (currentRoundTrip.numberOfViolations?.toString() ?? '0') +
                ' ' +
                context.getStrings().violation,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              addViolationButton(),
              SizedBox(width: 20),
              addMaintenanceButton(),
            ],
          ),
        ],
      ),
    );
  }

  IconDoubleText buildIconDoubleText({
    required String icon,
    required String title,
    required String value,
    Color? colorText,
  }) {
    return IconDoubleText(
      icon: icon,
      name: title + ' :',
      value: value,
      nameStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
      valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Padding addViolationButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10, start: 5),
      child: OutlinedButton.icon(
        icon: Icon(Icons.add, color: kPrimary, size: 20),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: kPrimary, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        label: Text(
          context.getStrings().add_violation,
          style: kTextRegular.copyWith(color: kPrimary, fontSize: 14),
        ),
        onPressed: () async {
          final isRefresh = await Navigator.pushNamed(
            context,
            Routes.addViolationVehiclePage,
            arguments: currentRoundTrip.getVehicleViolationArgs(),
          );
          print('isRefresh $isRefresh');
          if (isRefresh == true) {
            widget.onRefresh();
          }
        },
      ),
    );
  }

  Padding addMaintenanceButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10, start: 5),
      child: OutlinedButton.icon(
        icon: Icon(Icons.car_rental_outlined, color: kOrange00, size: 20),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: kOrange00, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        label: Text(
          context.getStrings().add_maintenance,
          style: kTextRegular.copyWith(color: kOrange00, fontSize: 14),
        ),
        onPressed: () async {
          final isRefresh = await Navigator.pushNamed(
            context,
            Routes.addMaintenanceBreakdownsPage,
            arguments: currentRoundTrip.id,
          );
          print('isRefresh $isRefresh');
          if (isRefresh == true) {
            widget.onRefresh();
          }
        },
      ),
    );
  }
}
