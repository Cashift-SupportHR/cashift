import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/presentation/shared/components/text_field/text_field_search.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/picker/projects_picker_stream.dart';
import '../../../../../shared/components/picker/shifts_picker_stream.dart';
import '../../../../usersManagement/presentation/addNewUser/widgets/company_picker.dart';
import '../../../data/models/add_vehicle_zone_params.dart';
import '../../../data/models/filter_vehicle_zone_params.dart';
import '../../../domain/entities/vehicle_zone.dart';
import '../bloc/filter_vehicles_zone_state.dart';

class FilterVehiclesZoneScreen extends StatefulWidget {
  final FilterVehiclesZoneState state;
  final Function(int) onFetchProjectsCompanyId;
  final Function(int id) onFetchShiftsByProjectId;
  final Function(FilterVehicleZoneParams params) onFetchVehiclesZoneAreasByProjectId;

  FilterVehiclesZoneScreen({
    Key? key,
    required this.state,
    required this.onFetchProjectsCompanyId,
    required this.onFetchShiftsByProjectId,
    required this.onFetchVehiclesZoneAreasByProjectId,
  }) : super(key: key);

  @override
  _FilterVehiclesZoneScreenState createState() =>
      _FilterVehiclesZoneScreenState();
}

class _FilterVehiclesZoneScreenState extends State<FilterVehiclesZoneScreen> {
  late GoogleMapController mapController;
  List<LatLng> polygonPoints = [];
  Set<Polygon> polygons = Set<Polygon>();
  Set<Marker> markers = Set<Marker>();

  TextEditingController companyController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  int? companyId;
  int? projectId;
  int? shiftId;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    streamVehiclesZoneAreasByProjectIdStream();
  }

  void _clearPolygon() {
    setState(() {
      polygonPoints.clear();
      polygons.clear();
      markers.clear(); // Clear the markers as well
    });
  }

  @override
  Widget build(BuildContext context) {
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
        searchWidget(),
        _areaPolygonesList(),
        BackButton(),
      ],
    );
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

  searchWidget() {
    return IntrinsicHeight(
      child: TextFieldSearch(
        title: 'ابحث عن المنطقة باسم المشروع والشركة',
        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
        onTap: () {
          showFilterDataBottomSheet();
        },
      ),
    );
  }

  showFilterDataBottomSheet() {
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().filter,
      isScrollControlled: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          companiesPicker(),
          projectsPickerStream(),
          shiftsPickerStream(),
          RowButtons(
            textSaveButton: context.getStrings().search,
            textCancelButton: context.getStrings().cancel,
            onCancel: () {
              Navigator.pop(context);
            },
            onSave: () {
              Navigator.pop(context);
              onSearch();
            },
          )
        ],
      ),
    );
  }

  onSearch(){
    widget.onFetchVehiclesZoneAreasByProjectId(FilterVehicleZoneParams(
      projectId: projectId,
      shiftId: shiftId,
    ));
  }

  CompanyPicker companiesPicker() {
    return CompanyPicker(
      items: widget.state.companies,
      initialValue: companyController.text,
      onSelectItem: (item) {
        companyController.text = item.value;
        companyId = item.index;
        projectId = 0;
        projectController.clear();
        shiftController.clear();
        widget.onFetchProjectsCompanyId(companyId!);
      },
    );
  }

  ProjectsPickerStream projectsPickerStream() {
    return ProjectsPickerStream(
      projectsStream: widget.state.projectsStream,
      projectController: projectController,
      onSelectItem: (id) {
        shiftController.clear();
        projectId = id;
        shiftId = 0;
        widget.onFetchShiftsByProjectId(projectId!);
      },
    );
  }

  ShiftsPickerStream shiftsPickerStream() {
    return ShiftsPickerStream(
      shiftsStream: widget.state.shiftsStream,
      controller: shiftController,
      onSelectItem: (id) {
        shiftId = id;
      },
    );
  }
  Future<Set<Marker>> mapPointsMarkers(List<List<LatLng>> polygonPoints) async{
    if (polygonPoints.isEmpty) {
      return Set();
    }
    String icon = AppIcons.location;
    // convert icon to bytes
    Uint8List iconData = await loadAndResizePng(Assets.imagesLocation, width: 50, height: 50);
    final list = polygonPoints.map((e) {
      return e.map((e) {
        return Marker(
          markerId: MarkerId(e.toString()),
          position: e,
          icon: BitmapDescriptor.fromBytes(iconData, size: Size(20, 20)),
          infoWindow: InfoWindow(
            title: 'Marker',
            snippet: 'Position: ${e.latitude}, ${e.longitude}',
          ),
        );
      }).toList();
    }).toList();
    return Set<Marker>.of(list.expand((element) => element));
  }

  Set<Polygon> mapPolygons(List<List<LatLng>> polygonPoints) {
    if (polygonPoints.isEmpty) {
      return Set();
    }
    final list = polygonPoints.map((e) {
      Color strokeColor = Color((Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
      return Polygon(
        polygonId: PolygonId('polygon_${e.first}'),
        points: e,
        strokeWidth: 2,
        strokeColor: strokeColor ,
        fillColor: strokeColor.withOpacity(0.1),
      );
    }).toList();
    return Set<Polygon>.of(list);
  }

  Widget _areaPolygonesList() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: StreamDataStateWidget<List<VehicleZone>?>(
          stream: widget.state.vehiclesZoneAreasByProjectIdStream,
          onReload: () {
            onSearch();
          },
          builder: (context, data) {
            ;
            return data == null || data.isEmpty
                ? SizedBox.shrink()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      topWidget(data),
                      bottomWidget(data),
                    ],
                  );
          }),
    );
  }

  Container topWidget(List<VehicleZone> data) {
    return Container(
      margin: EdgeInsets.only(top: 100, left: 16, right: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: Decorations.shapeDecorationShadow(),
      child: Column(
        children: [
          buildIconDoubleText(
            icon: AppIcons.buildingsOutline,
            title: context.getStrings().company_name,
            value: data[0].companyName ?? '',
          ),
          SizedBox(height: 10),
          buildIconDoubleText(
            icon: AppIcons.projectName,
            title: context.getStrings().project_name,
            value: data[0].projectName ?? '',
          ),
        ],
      ),
    );
  }

  Container bottomWidget(List<VehicleZone> data) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: Decorations.decorationTabsOnlyTop(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: Decorations.decorationOnlyRadius(color: kGray_C4),
            height: 8,
            width: 80,
            margin: EdgeInsets.only(bottom: 20),
          ),
          headerBottomWidget(),
          SizedBox(height: 10),
          listAreas(data),
        ],
      ),
    );
  }

  Widget headerBottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnderlineText(
          text: context.getStrings().areas,
        ),
        AppCupertinoButtonIcon(
          startIcon: Icon(Icons.add, color: kWhite, size: 20),
          text: context.getStrings().add_area,
          raduis: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          iconColor: kWhite,
          onPressed: () {
            Navigator.pushNamed(context, Routes.vehiclesZonePage);
          },
        )
      ],
    );
  }

  Widget listAreas(List<VehicleZone> data) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          bool isSelected = currentZoneFilter == data[index];
          Color textColor = isSelected ? kWhite : kPrimary;
          return InkWell(
            onTap: () => data.length > 1 ? onFilterAreas(data[index], data) : null,
            child: Container(
              width: 200,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(10),
              decoration: Decorations.shapeDecorationShadow(
                color: isSelected ? kPrimary : kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[index].name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: kTextSemiBold.copyWith(
                          fontSize: 20, color: textColor)),
                  SizedBox(height: 10),
                  IconDoubleText(
                    icon: AppIcons.vehicle,
                    name: context.getStrings().vehicle + ': ',
                    iconColor: textColor,
                    valueWidget: Text(
                      data[index].plateNumber ?? '',
                      style:
                          kTextMedium.copyWith(fontSize: 14, color: textColor),
                    ),
                    nameStyle:
                        kTextRegular.copyWith(fontSize: 14, color: textColor),
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconDoubleText buildIconDoubleText(
      {required String icon,
      required String title,
      required String value,
      Color? colorText}) {
    return IconDoubleText(
      icon: icon,
      name: title + ' :',
      value: value,
      nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
      valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  void streamVehiclesZoneAreasByProjectIdStream() {
    widget.state.vehiclesZoneAreasByProjectIdStream.stream.listen((event) async {
      if (event.data != null && event.data!.isNotEmpty) {
        List<List<LatLng>> polygonPoints = event.data!
            .map((e) => VehicleZoneLatLng.toLatLngList(e.latlngs ?? []))
            .toList();
        polygons = mapPolygons(polygonPoints);
        markers = await mapPointsMarkers(polygonPoints);
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
              _calculatePolygonBounds(polygonPoints.first),
              50), // 50 is padding
        );
        setState(() {});
      } else {
        _clearPolygon();
      }
    });
  }

  VehicleZone currentZoneFilter = VehicleZone();

  onFilterAreas(
      VehicleZone data, List<VehicleZone> vehiclesZoneAreasByProjectId) async {
    List<List<LatLng>> polygonPoints = [];
    if (data != currentZoneFilter) {
      currentZoneFilter = data;
      polygonPoints = [VehicleZoneLatLng.toLatLngList(data.latlngs ?? [])];
    } else {
      currentZoneFilter = VehicleZone();
      polygonPoints = vehiclesZoneAreasByProjectId
          .map((e) => VehicleZoneLatLng.toLatLngList(e.latlngs ?? []))
          .toList();
    }
    polygons = mapPolygons(polygonPoints);
    markers = await mapPointsMarkers(polygonPoints);
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
          _calculatePolygonBounds(polygonPoints.first), 50), // 50 is padding
    );
    setState(() {});
  }


  Future<Uint8List> loadAndResizePng(String assetPath, {int width = 100, int height = 100}) async {
    // Load the PNG image as Uint8List
    final ByteData data = await rootBundle.load(assetPath);

    // Decode the image to resize it
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width, targetHeight: height);
    ui.FrameInfo frameInfo = await codec.getNextFrame();

    // Convert the resized image back to Uint8List
    final ByteData? byteData = await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}
