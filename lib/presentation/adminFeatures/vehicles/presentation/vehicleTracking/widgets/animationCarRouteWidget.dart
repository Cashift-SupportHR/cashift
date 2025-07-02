import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/decorations/decorations.dart';
import '../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../domain/entities/vehicleTraking.dart';

class AnimationCarRouteWidget extends StatefulWidget {
  final List<RoutePoint> points;
  const AnimationCarRouteWidget({Key? key, required this.points}) : super(key: key);

  @override
  _AnimationCarRouteWidgetState createState() => _AnimationCarRouteWidgetState();
}

class _AnimationCarRouteWidgetState extends State<AnimationCarRouteWidget> with TickerProviderStateMixin {
  GoogleMapController? _mapController;
  Marker? _movingMarker;
  int _currentIndex = 0;
  int _currentDisplayedSpeed = 0;
  bool _isAnimating = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  DateTime _lastUpdate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if( widget.points.isNotEmpty){
      _animationController = AnimationController(vsync: this);
      _currentDisplayedSpeed = widget.points[_currentIndex].speed;
      _loadCustomMarker();
    }

  }

  Future<void> _loadCustomMarker() async {
    await _updateCarMarker(widget.points[_currentIndex], widget.points[_currentIndex].speed);
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: widget.points[_currentIndex].point,
      zoom: 18,
    )));
  }

  Future<void> _updateCarMarker(RoutePoint point, int speed) async {
    final icon = await getMarkerIcon(speed: "$speed ${_getSpeedUnit()}");
    final marker = Marker(
      markerId: const MarkerId('moving_car'),
      position: point.point,
      rotation: point.angle.toDouble(),
      flat: true,
      anchor: const Offset(.1, .3),
      icon: icon,
    );
    setState(() {
      _movingMarker = marker;
      _currentDisplayedSpeed = speed;
    });
    _mapController?.animateCamera(CameraUpdate.newLatLng(point.point));
  }

  double calculateAngleBetween(LatLng start, LatLng end) {
    final double lat1 = start.latitude * pi / 180;
    final double lon1 = start.longitude * pi / 180;
    final double lat2 = end.latitude * pi / 180;
    final double lon2 = end.longitude * pi / 180;
    final double dLon = lon2 - lon1;
    final double y = sin(dLon) * cos(lat2);
    final double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    final double bearing = atan2(y, x);
    return (bearing * 180 / pi + 360) % 360;
  }

  Future<void> _animateToNextPoint() async {
    if (_currentIndex >= widget.points.length - 1) return;
    final start = widget.points[_currentIndex];
    final end = widget.points[_currentIndex + 1];
    final speed = start.speed.toDouble();

    double durationSeconds;
    if (speed > 0) {
      double distance = Geolocator.distanceBetween(
        start.point.latitude,
        start.point.longitude,
        end.point.latitude,
        end.point.longitude,
      );
      durationSeconds = distance / ((speed * 1000) / 3600);
      if (durationSeconds.isInfinite || durationSeconds.isNaN || durationSeconds == 0) durationSeconds = 1;
    } else {
      durationSeconds = 1;
    }

    _animationController.dispose();
    _animationController = AnimationController(
      duration: Duration(milliseconds: (durationSeconds * 1000).round()),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animationController.addListener(() async {
      final t = _animation.value;
      if (DateTime.now().difference(_lastUpdate).inMilliseconds < 50) return;
      _lastUpdate = DateTime.now();

      final lat = start.point.latitude + (end.point.latitude - start.point.latitude) * t;
      final lng = start.point.longitude + (end.point.longitude - start.point.longitude) * t;
      final angle = calculateAngleBetween(start.point, end.point);
      final currentLatLng = LatLng(lat, lng);

      int interpolatedSpeed = (start.speed + ((end.speed - start.speed) * t)).round();
      final icon = await getMarkerIcon(speed: "$interpolatedSpeed ${_getSpeedUnit()}");

      setState(() {
        _movingMarker = Marker(
          markerId: const MarkerId('moving_car'),
          position: currentLatLng,
          rotation: angle,
          flat: true,
          anchor: const Offset(.1, .3),
          icon: icon,
        );
        _currentDisplayedSpeed = interpolatedSpeed;
      });

      _mapController?.animateCamera(CameraUpdate.newLatLng(currentLatLng));
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _currentIndex++);
        if (_currentIndex < widget.points.length - 1 && _isAnimating) _animateToNextPoint();
      }
    });

    _animationController.forward();
  }

  void _play() {
    if (_currentIndex < widget.points.length - 1) {
      setState(() => _isAnimating = true);
      _animateToNextPoint();
    }
  }

  void _pause() {
    setState(() => _isAnimating = false);
    _animationController.stop();
  }

  void _toggleAnimation() {
    _isAnimating ? _pause() : _play();
  }

  void _onSliderChanged(double value) async {
    _pause();
    final index = value.toInt();
    if (index >= 0 && index < widget.points.length) {
      final point = widget.points[index];
      await _updateCarMarker(point, point.speed);
      setState(() => _currentIndex = index);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = Get.context!.getStrings();
    final Set<Marker> markers = {};
    if (_movingMarker != null) markers.add(_movingMarker!);

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target:widget.points.isEmpty?LatLng(24.7248315, 47.1521875): widget.points.first.point,
            zoom: 18,
          ),
          markers: markers,
          polylines: {
            Polyline(
              polylineId: const PolylineId('route'),
              points: widget.points.map((e) => e.point).toList(),
              color: kPrimary,
              width: 4,
            ),
          },
          onMapCreated: (controller) => _mapController = controller,
        ),
        if(widget.points.isNotEmpty)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: Decorations.decorationOnlyRadius(radius: 0, color: kBlack.withOpacity(.8)),
            child: Column(
              children: [
                Text("${strings.speed} $_currentDisplayedSpeed ${_getSpeedUnit()}",
                  style: kTextMedium.copyWith(fontSize: 14, color: Colors.white),
                ),
                Slider(
                  value: _currentIndex.clamp(0, widget.points.length - 1).toDouble(),
                  min: 0,
                  max: (widget.points.length - 1).toDouble(),
                  onChanged: _onSliderChanged,
                  divisions: widget.points.length - 1,
                  label: "${strings.position} $_currentIndex",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: AppCupertinoButton(
                    onPressed: _toggleAnimation,
                    text: _isAnimating ? strings.stop : strings.play,
                    backgroundColor: _isAnimating ? kRed_00 : kPrimary,
                    radius: BorderRadius.circular(5),
                    padding: const EdgeInsets.symmetric(vertical: 11),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  String _getSpeedUnit() {
    final lang = Get.locale?.languageCode ?? "ar";
    return lang == "en" ? "km/h" : "كم/س";
  }

  Future<BitmapDescriptor> getMarkerIcon({required String speed}) async {
    Size s = Size(100, 100);
    var icon = await createCustomMarkerBitmapWithNameAndImage(size: s, name: speed);
    return icon;
  }

  Future<BitmapDescriptor> createCustomMarkerBitmapWithNameAndImage({
    required Size size,
    required String name,
  }) async {
    TextSpan span = TextSpan(
      children: [
        TextSpan(
          text: name,
          style: kTextMedium.copyWith(color: Colors.white, overflow: TextOverflow.ellipsis, fontSize: 22.0),
        ),
      ],
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    tp.layout();

    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);

    Paint textBgBoxPaint = Paint()..color = kPrimary;
    Rect rect = Rect.fromCenter(center: ui.Offset(40, 10), width: tp.width + 80, height: tp.height + 50);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(1.0)), textBgBoxPaint);
    tp.paint(canvas, Offset(5.0, 5.0));

    Rect oval = Rect.fromLTWH(tp.width / 3.7, 50, size.width - 30, size.height - 30);
    canvas.clipPath(Path()..addOval(oval));

    ui.Image image = await getImageFromAssets();
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.contain);

    ui.Picture p = recorder.endRecording();
    ByteData? pngBytes = await (await p.toImage(200, 200)).toByteData(format: ui.ImageByteFormat.png);
    Uint8List data = Uint8List.view(pngBytes!.buffer);
    return BitmapDescriptor.fromBytes(data);
  }

  Future<ui.Image> getImageFromAssets() async {
    final ByteData data = await rootBundle.load("assets/icons/car_orange.png");
    final Uint8List bytes = data.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(bytes, (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }
}
