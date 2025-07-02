import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:livelyness_detection/index.dart';
import 'package:livelyness_detection/livelyness_detection.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateful_widget.dart';

import '../../../../data/models/attendance/attendance_config_dto.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../generated/assets.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../shared/components/app_cupertino_button.dart';
import '../../../shared/components/image_builder.dart';
import '../../../shared/components/outlint_button.dart';
import '../../resources/constants.dart';

class FaceDetectorPage extends StatefulWidget {
  @override
  State<FaceDetectorPage> createState() => _M7ExpampleScreenState();
}

class _M7ExpampleScreenState extends BaseState<FaceDetectorPage> {
  //* MARK: - Private Variables
  //? =========================================================
  String? _capturedImagePath;
  final bool _isLoading = false;
  bool _startWithInfo = true;
  bool _allowAfterTimeOut = false;
  final List<LivelynessStepItem> _veificationSteps = [];
  int _timeOutDuration = 30;

  //* MARK: - Life Cycle Methods
  //? =========================================================
  @override
  void initState() {
    print('FaceDetectorPage initState');
    super.initState();
  }

  bool isDirectDetectFace = false;

  @override
  void didChangeDependencies() {
    _initValues();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Face Detector',
        body: Padding(
            padding: const EdgeInsets.all(24.0), child: Header(context)));
  }

  Widget Header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            kLoadSvgInCirclePath(
              AppIcons.face_print_background1,
            ),
            kLoadSvgInCirclePath(
              AppIcons.face_print_background2,
            ),
            Image.asset(
              Assets.face_recognition,
              height: 90,
              width: 90,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          strings.face_print,
          style: kTextBold.copyWith(color: kBlack, fontSize: 16),
        ),
        const SizedBox(height: 20),
        _capturedImagePath == null
            ? SizedBox.shrink()
            : Expanded(
                child: Image.file(
                  File(_capturedImagePath!),
                  width: 600,
                  fit: BoxFit.contain,
                ),
              ),
        Spacer(),
        footer(context),
      ],
    );
  }

  int currentStep = 0;
  Position? position;
  String? qr;
  double? simi;
  File? face;

  //* MARK: - Private Methods for Business Logic
  //? =========================================================
  void _initValues() {
    AttendanceConfigDto attendanceConfigDto =
        MyModalRoute.of(context)!.settings.arguments as AttendanceConfigDto;
    print('attendanceConfigDto ${attendanceConfigDto.toJson()}');
    _veificationSteps.addAll(
      [
        if (attendanceConfigDto.eyeCheck == true)
          LivelynessStepItem(
            step: LivelynessStep.blink,
            title: strings.blink_your_eyes,
            isCompleted: false,
          ),
        if (attendanceConfigDto.moveFace == true)
          LivelynessStepItem(
            step: LivelynessStep.turnLeft,
            title: strings.turn_right,
            isCompleted: false,
          ),
        if (attendanceConfigDto.smile == true)
          LivelynessStepItem(
            step: LivelynessStep.smile,
            title: strings.smil,
            isCompleted: false,
          ),
      ],
    );
    if(_veificationSteps.isEmpty) {
      _veificationSteps.add(
        LivelynessStepItem(
          step: LivelynessStep.blink,
          title: strings.blink_your_eyes,
          isCompleted: false,
        ),
      );
      LivelynessStepItem(
        step: LivelynessStep.smile,
        title: strings.smil,
        isCompleted: false,
      );
    }
    LivelynessDetection.instance.configure(
      dotColor: Colors.white,
      thresholds: [
        SmileDetectionThreshold(),
      ],
    );
    bool isDirectDetectFace = attendanceConfigDto.isDirectDetectFace ?? false;
    if (isDirectDetectFace) {
      Future.delayed(Duration(milliseconds: 500), () {
        _onStartLivelyness();
      });
    }
  }

  void _onStartLivelyness() async {
    setState(() => _capturedImagePath = null);
    final response = await LivelynessDetection.instance.detectLivelyness(
      context,
      config: DetectionConfig(
        steps: _veificationSteps,
        startWithInfoScreen: false,
        maxSecToDetect: 60,
        allowAfterMaxSec: false,
        captureButtonColor: Colors.red,
      ),
    );
    if (response?.imgPath == null) {
      return;
    }
    _capturedImagePath = response?.imgPath;
    setState(() {});
    if (isDirectDetectFace) {
      confirmAction();
    }
    print('_capturedImagePath $_capturedImagePath');
  }

  Widget footer(BuildContext context) {
    return Column(
      children: [
        AppOutlineButton(
          text: strings.scan_now,
          radius: 6,
          height: 50,
          width: double.infinity,
          onClick: _capturedImagePath != null
              ? null
              : () {
                  _onStartLivelyness();
                },
        ),
        SizedBox(
          height: 12,
        ),
        AppCupertinoButton(
          text: strings.confirm_button,
          radius: BorderRadius.circular(6),
          onPressed: confirmAction(),
        ),
      ],
    );
  }

  confirmAction() {
    print('confirmAction');
    if (_capturedImagePath != null) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pop(context, _capturedImagePath);
      });
    } else {
      return null;
    }
  }
}
