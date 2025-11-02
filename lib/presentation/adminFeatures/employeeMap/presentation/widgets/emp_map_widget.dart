 import 'dart:ui' as ui;
import 'package:flutter/services.dart';

 import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';

// ignore: unused_import
import '../../domain/entities/EmpMap.dart';
import '../../domain/entities/FreeLncerLocations.dart';

class SearchEmployeeMapWidget extends StatefulWidget {
  final List<FreeLncerLocations> locations;

  const SearchEmployeeMapWidget({super.key, required this.locations});
  @override
  State<StatefulWidget> createState() {
    return MapDataScreen();
  }
}

class MapDataScreen extends State<SearchEmployeeMapWidget> {
  var locationFeched = false;

  Set<Marker> markers = {};

  @override
  void initState() {
    setAllMarkersInBatches();
    super.initState();
  }

  setAllMarkersInBatches() async {
    if (widget.locations.isNotEmpty) {
      const batchSize = 70;
      int currentBatchStart = 0;

      while (currentBatchStart < widget.locations.length) {
        // Add markers for the current batch
        final int currentBatchEnd =
        (currentBatchStart + batchSize).clamp(0, widget.locations.length);

        for (int i = currentBatchStart; i < currentBatchEnd; i++) {
          markers.add(
            Marker(
                infoWindow: InfoWindow(title: widget.locations[i].name),
                markerId: MarkerId(i.toString()),
                position: LatLng(widget.locations[i].lat ?? 0.0,
                    widget.locations[i].lng ?? 0.0),
                icon: await BitmapDescriptor.fromBytes(await getBytesFromAsset(
                    getImage(widget.locations[i].isActive ?? false,
                        widget.locations[i].gender ?? false),
                    80))),
          );
        }

        setState(() {}); // Update the UI after adding the current batch

        if (currentBatchEnd < widget.locations.length) {
          // Wait 3 seconds before adding the next batch
          await Future.delayed(const Duration(seconds: 3));
        }

        currentBatchStart = currentBatchEnd; // Move to the next batch
      }
    }
  }
  setAllMarkers() async {
    if (widget.locations.isNotEmpty) {
      for (int i = 0; i < widget.locations.length; i++) {
        markers.add(
          Marker(
              infoWindow: InfoWindow(title: widget.locations[i].name),
              markerId: MarkerId(i.toString()),
              position: LatLng(widget.locations[i].lat ?? 0.0,
                  widget.locations[i].lng ?? 0.0),
              icon: await BitmapDescriptor.fromBytes(await getBytesFromAsset(
                  getImage(widget.locations[i].isActive ?? false,
                      widget.locations[i].gender ?? false),
                  80))),
        );
      }
      setState(() {});
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  GoogleMapController? mapController;
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
            if (widget.locations
                .any((location) => location.isFirstCameraZoom == true)) {
              final firstZoomLocation = widget.locations
                  .firstWhere((location) => location.isFirstCameraZoom == true);
              if (mapController != null) {
                await mapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(firstZoomLocation.lat ?? 0.0,
                            firstZoomLocation.lng ?? 0.0),
                        zoom: 8.0,
                      ),
                    ));
              }
            } else {
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: markers.isNotEmpty
                      ? markers.first.position
                      : const LatLng(24.78878, 46.6989),
                  zoom: 8.0,
                ),
              ));
            }
          },
          markers: markers,
          initialCameraPosition: CameraPosition(
            target: markers.isNotEmpty
                ? markers.first.position
                : const LatLng(24.78878, 46.6989),
            zoom: 8.0,
          ),
        ),
      ],
    );
  }

  String getImage(bool active, bool gender) {
    if (active == true && gender == true) {
      return "assets/icons/male_active.png";
    } else if (active == true && gender == false) {
      return "assets/icons/femal_active.png";
    } else if (active == false && gender == false) {
      return "assets/icons/femal_not_active.png";
    } else {
      return "assets/icons/male_not_active.png";
    }
  }
}
