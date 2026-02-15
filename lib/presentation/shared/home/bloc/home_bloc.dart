import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/data/repositories/home/home_repository.dart';
import 'package:shiftapp/data/repositories/profile/profile_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../domain/entities/attendance/attendance_offline_query.dart';
import '../../../presentationUser/vehiclesOperation/data/repositories/vehicles_operation_repository.dart';
import '../../../presentationUser/vehiclesOperation/presentation/currentTourMap/view/bloc/current_tour_map_state.dart';

@Injectable()
class HomeBloc extends BaseCubit {
  final HomeRepository homeRepository;
  final ProfileRepository profileRepository;
  final UserRepository _userRepository;
  final ReceiveVehiclesRepository _receiveVehiclesRepository;

  HomeBloc(
    this.homeRepository,
    this.profileRepository,
    this._userRepository,
    this._receiveVehiclesRepository,
  );

  fetchAppVersion() async {
    try {
      final appVersion = await homeRepository.fetchVersion();
      emit(NewUpdateAvailable(appVersion));
    } catch (e) {
      print(e);
    }
  }

  bool wasOffline = false;

  checkUserRolePrivilege() async {
    if (_userRepository.isLogged()) {
      try {
        final isHasConnection = await InternetConnection().hasInternetAccess;
        print(isHasConnection);
        print("isHasConnection");
        if (isHasConnection) {
          _fetchInitData();
        } else {
          wasOffline = true;
          emit(OfflineState(''));
        }
        InternetConnection().onStatusChange.listen((status) async {
          if (status == InternetStatus.connected) {
            if (wasOffline) {
              _fetchInitData();
            }
          } else {
            emit(OfflineState(''));
            wasOffline = true;
          }
        });
      } catch (e) {
        emit(InitializedUser());
      }
    } else {
      emit(InitializedUser());
    }
  }

  // checkInternetConnection() async {
  //   final isHasConnection = await InternetConnectionChecker.instance.hasConnection;
  //
  //   if (!isHasConnection) {
  //     emit(OfflineState(''));
  //     wasOffline = true;
  //   }
  // }

  _fetchInitData() async {
    try {
      wasOffline = false;
      emit(LoadingState());
      final hasAdminFeature =
          await profileRepository.getAccountServicesRemote();
      final inAdminMode = _userRepository.isEnableAdmin();
      print('_fetchInitData wasOffline ${hasAdminFeature.adminEnable}');

      if (hasAdminFeature.adminEnable == true && inAdminMode) {
        emit(InitializedAdmin());
      } else {
        emit(InitializedUser());
      }
      fetchAllAttendanceQueryOffline();
    } catch (e) {
      emit(InitializedUser());
    }
  }

  Future<void> fetchAllAttendanceQueryOffline() async {
    print('start fetchAllAttendanceQueryOffline');
    try {
      final isHasConnection = await InternetConnection().hasInternetAccess;
      ;
      if (isHasConnection) {
        List<AttendanceOfflineQuery>? data =
            await homeRepository.fetchAllAttendanceQueryOffline();
        print('end fetchAllAttendanceQueryOffline ${data?.length}');
        if (data != null && data.isNotEmpty) {
          await homeRepository.attendanceCashiftOffLine(data);
          homeRepository.deleteOfflineAttendance();
        }
      }
    } catch (e) {
      print('checkFreeLanceHaveBankInfo ${e}');
    }
  }

  Future<void> fetchCurrentTrip() async {
    try {
      final currentTrip = await _receiveVehiclesRepository.fetchCurrentTrip();
      if (currentTrip.id != null) {
        emit(CurrentTourMapState(currentRoundTrip: currentTrip));
      }
    } catch (e) {
      print('fetchCurrentTrip Error ${e}');
    }
  }
}
