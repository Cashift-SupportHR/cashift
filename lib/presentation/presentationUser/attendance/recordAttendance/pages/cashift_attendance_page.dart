import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:shiftapp/common/domain/entities/attendance/index.dart';

import 'package:location/location.dart';
import 'package:shiftapp/common/data/models/shift/start_shift_params.dart';
import 'package:shiftapp/common/domain/entities/attendancerecoginatin/register_attendance_request_cashift.dart';
import 'package:shiftapp/common/domain/entities/attendancerecoginatin/register_attendance_request_shift.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/stepper/easy_step.dart';

import '../../../../../common/data/models/attendance/attendance_config_dto.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/attendance_model.dart';
import '../../../../../common/domain/entities/attendancerecoginatin/register_attendance_offline_request_shift.dart';
import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../common/domain/entities/shift/applied_offer.dart';
import '../../../../../common/components/error_handler_widget.dart';
import '../../../../../common/components/map/current_location_realtime_map.dart';
import '../../../locationservice/locationservice.dart';
import '../../registerfacerecognition/attendance_params.dart';
import '../../../resources/colors.dart';
import '../bloc/cashift_attendance_cubit.dart';
import 'record_attendance_screen_v2.dart';

class CashiftAttendancePage
    extends BaseBlocWidget<Initialized<String?>, CashiftAttendanceCubit> {

  bool locationDetectedMoreOneTime = false;

  StreamStateInitial<LocationData?> locationStream =
  StreamStateInitial<LocationData?>();
  void handleArguments(RegisterAttendanceRequest arguments) {
    if (arguments is RegisterAttendanceRequestCashift) {
    } else if (arguments is RegisterAttendanceRequestShift) {
    } else {
      throw Exception('Invalid argument type');
    }
  }

  @override
  String? title(BuildContext context) {
    if(attendanceModel(context) is RegisterAttendanceRequestCashift) {
      final mode = attendanceModel(context) as RegisterAttendanceRequestCashift;
      return statusButtonName(mode.cashift);
  }
    return strings.record_attendance ;
  }
  String statusButtonName(AppliedOffer shift) {
    return shift.isAccept() ? strings.checkin : strings.checkout;
  }

  LocationData? position;

  @override
  Widget buildWidget(BuildContext context, Initialized<String?> state) {
    final args = getArguments<RegisterAttendanceRequest>(context);
    print('RegisterAttendanceRequest ${args?.attendanceConfigDto().toJson()}');
    if (args != null) {
      return RecordAttendanceScreenV2(
        registeredFace: state.data,
          locationStream:locationStream,
        descriptionQrCode: descriptionQrCode(),
        titleButton: title(context),
        isOffline: args is RegisterAttendanceOfflineRequestShift,
        registerAttendanceRequest: args,
        onPerformAttendance: (AttendanceParams params) {
          performAttendance(params);
        },
      );
    } else
      return ErrorPlaceHolderWidget(
        error: 'Shift not defined',
      );
  }

  String? descriptionQrCode(){
    final model = attendanceModel(context);
    switch (model) {
      case RegisterAttendanceRequestShift():
        {
          return strings.scan_qr_code_project_confirm_shift;
        }
      case RegisterAttendanceRequestCashift():
        {
          return strings.check_qr_code_opportunity;
        }
    }
    return null;
  }
  RegisterAttendanceRequest? attendanceModel(BuildContext context) =>
      getArguments<RegisterAttendanceRequest>(context);
  @override
  void loadInitialData(BuildContext context) {
    final args = attendanceModel(context);
    if (args != null) {
      bloc.fetchRegisteredFace(args.allowedToDetectFace(),false);
    }
    fetchCurrentLocation();
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  void confirmLocationDialog({required Function() onConfirm}){
    DialogsManager.customDialog(context, child: AlertDialog(
      insetPadding: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(8),
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: kWhite,
      titlePadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('تحقق من موقعك',style: kTextBold,),
      ),

      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8,),
          CurrentLocationRealtimeMap(
            padding: const EdgeInsets.all(8),
            isActive: true,
            heightLocation: 350,
            locationStream: locationStream,
            onGetLocation: (loc ) {
              position = LocationData.fromMap({'latitude':loc.latitude,'longitude':loc.longitude,'isMock':loc?.isMock});
            },
          ),
          SizedBox(height: 16,),
          AppCupertinoButton(onPressed: (){
            locationDetectedMoreOneTime = false;
            Navigator.pop(context);
            onConfirm();
          },text: strings.confirm_button,),
          SizedBox(height: 16,),
        ],
      ),
    ));
  }
  void performAttendance(AttendanceParams attendanceParams) {
    if(locationDetectedMoreOneTime){
      confirmLocationDialog(onConfirm: (){
        performAttendance(attendanceParams);
      });
    }else if(this.position==null) {
      showErrorDialog('خدمة الموقع في جهازك غير مفعلة بشكل دقيق حاول مرة اخرى',
          publicContext, onClickOk: () async {
            Navigator.pop(context);
            locationDetectedMoreOneTime = true;
            position = await LocationService.determinePosition(context);
            performAttendance(attendanceParams);
          });
    }else{
      //onLocationConfirmed(attendanceParams,);
      final args = getArguments<RegisterAttendanceRequest>(context);
      attendanceParams.position = position;
      if(args!=null)
      bloc.performAttendance(attendanceParams, args);
    }

  }



  Future<void> fetchCurrentLocation() async {
    try {
      final stream = await LocationService.startPositionStream();
      stream.listen((event) {
        print('locationStream ${event.latitude}');
          position = LocationData.fromMap({'latitude':event.latitude,'longitude':event.longitude,'isMock':event.isMocked,
          'accuracy':event.accuracy});
          locationStream.setData(position);
      });
    } catch (e) {
      LocationService.handleFetchLocationException(e, context);
    }
  }

  @override
  void onSuccessDismissed(){
   Navigator.pop(context, true);
  }
}
