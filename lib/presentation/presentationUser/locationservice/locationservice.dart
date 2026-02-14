import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart'
    show Placemark, placemarkFromCoordinates;
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/location_service_disabled_exception.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/permission_denied_exception.dart';
import 'package:shiftapp/presentation/shared/components/app_button.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';

class LocationService {
  static Future<bool> requestLocationPermission(BuildContext context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    print('_permissionGranted $_permissionGranted');

    // If permission is permanently denied, don't show dialog - just return error
    if (_permissionGranted == PermissionStatus.deniedForever) {
      return Future.error(LocationPermissionDeniedException());
    }

    // Only request permission if it hasn't been asked yet (denied = not asked OR soft-denied)
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted &&
          _permissionGranted != PermissionStatus.grantedLimited) {
        return Future.error(LocationPermissionDeniedException());
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(
          const geolocator.LocationServiceDisabledException(),
        );
      }
    }
    return true;
  }

  static Future<LocationData> determinePosition(BuildContext context) async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _permissionGranted = await location.hasPermission();
    print('_permissionGranted $_permissionGranted');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('_permissionGranted not grant');
        return Future.error(LocationPermissionDeniedException());
      }
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(AppLocationServiceDisabledException());
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  static Future<Stream<Position>> startPositionStream() async {
    // Request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // Check if location services are enabled
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error('Location services are disabled');
    }

    // Configure location settings
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: geolocator.LocationAccuracy.best,
        // timeLimit: Duration(seconds: 1),
        distanceFilter: 2, // Update only if the user moves 10 meters
      ),
    );
  }

  static Future<Stream<LocationData>>
  startPositionStreamWithoutDetectPermission() async {
    Location location = Location();

    bool _serviceEnabled;
    location.enableBackgroundMode(enable: true);

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(AppLocationServiceDisabledException());
      }
    }
    final nlocation = await location.getLocation();
    print('nlocation ${nlocation.latitude}');
    return location.onLocationChanged;
  }

  static void handleFetchLocationException(e, BuildContext context) {
    if (e is LocationPermissionDeniedException) {
      DialogsManager.showConfirmationAnimatedDialog(
        context,
        message: e.toString(),
        buttonName: context.getStrings().open_app_settings,
        onConfirm: () {
          geolocator.Geolocator.openAppSettings();
        },
      );
    } else if (e is AppLocationServiceDisabledException) {
      DialogsManager.showConfirmationAnimatedDialog(
        context,
        message: e.toString(),
        buttonName: context.getStrings().open_location_settings,
        onConfirm: () {
          geolocator.Geolocator.openLocationSettings();
        },
      );
    } else {
      DialogsManager.showMessageDialog(context, e.toString(), onClickOk: () {});
    }
  }

  static Future<String> getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    return '${placemarks.first.street}, ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea}';
  }

  static Future<bool> isPermissionGranted() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
}
