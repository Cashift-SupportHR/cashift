import 'package:geolocator/geolocator.dart';
import 'package:livelyness_detection/index.dart';
import 'package:livelyness_detection/livelyness_detection.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/facerecognation/face_matching_result.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';

import '../../../../common/data/models/attendance/attendance_config_dto.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/app_icons.dart';
import '../../../presentationUser/attendance/facerecognation/faces_matching.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../common/components/image_builder.dart';
import '../../../../common/components/outlint_button.dart';
import '../../../../common/components/index.dart';

class FaceDetectorWidget extends StatefulWidget {
  final AttendanceConfigDto attendanceConfigDto;
  final String  refImageBase64;
  final Function(bool) onFaceDetection;
  FaceDetectorWidget({required this.attendanceConfigDto, required this.onFaceDetection,required this.refImageBase64});

  @override
  State<FaceDetectorWidget> createState() => _M7ExpampleScreenState();
}

class _M7ExpampleScreenState extends BaseState<FaceDetectorWidget> {
  //* MARK: - Private Variables
  //? =========================================================
  FaceMatchingResult? matchingResult;


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
    return  Padding(
        padding: const EdgeInsets.all(24.0), child: Header(context));
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
        matchingResult == null
            ? SizedBox.shrink()
            : Expanded(
                child: Image.file(
                  File(matchingResult!.path),
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
    print('widget.attendanceConfigDto ${widget.attendanceConfigDto.toJson()}');

    bool isDirectDetectFace = widget.attendanceConfigDto.isDirectDetectFace ?? false;
    if (isDirectDetectFace) {
      Future.delayed(Duration(milliseconds: 500), () {
        _onStartLivelyness();
      });
    }
  }

  void _onStartLivelyness() async {
    setState(() => matchingResult = null);

    matchingResult =await  FaceMatchingUtils.startMatching(context, refImageBase64: widget.refImageBase64,config: widget.attendanceConfigDto);



    setState(() {});
    if (isDirectDetectFace) {
      confirmAction(matchingResult);
    }

  }

  Widget footer(BuildContext context) {
    return Column(
      children: [
        AppOutlineButton(
          text: strings.scan_now,
          radius: 6,
          height: 50,
          width: double.infinity,
          onClick: matchingResult != null
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
          onPressed: confirmAction(matchingResult),
        ),
      ],
    );
  }

  confirmAction(FaceMatchingResult?  matching) {
    print('confirmAction');
    if (matching != null) {
      Future.delayed(Duration(milliseconds: 500), () {
        widget.onFaceDetection(matching.match);
      });
    } else {
      return null;
    }
  }


}
