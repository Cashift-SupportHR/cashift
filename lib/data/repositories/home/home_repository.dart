
import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/datasources/remote/api/home/home_api_provider.dart';
import 'package:shiftapp/domain/entities/shared/AppVersionApdate.dart';

import '../../../domain/entities/attendance/attendance_offline_query.dart';
import '../../../presentation/shared/components/datepicker/package_info.dart';
import '../../datasources/local/init_floor_database.dart';
import '../../models/api_response.dart';

@Injectable()
class HomeRepository {
  final HomeAPI homeAPI ;
  HomeRepository(this.homeAPI);
  Future<AppVersionAppUpdate> fetchVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    print('fetchVersion ${info.buildNumber}');

    final version = await homeAPI.fetchAppVersion();
    print('fetchVersion ${info.buildNumber} > ${version.payload!.getVersion()}');

    if (version.payload!.getVersion()! <= int.parse(info.buildNumber)) {
      return AppVersionAppUpdate(needToUpdate: false, isForceUpdate: false);
    } else {
      return AppVersionAppUpdate(
          needToUpdate: true, isForceUpdate: version.payload!.isForceUpdate());
    }
  }

  Future<ApiResponse<String>> attendanceCashiftOffLine(List<AttendanceOfflineQuery> attendanceOfflineQuery) async{
    return await homeAPI.attendanceCashiftOffLine(attendanceOfflineQuery);
  }

  Future<List<AttendanceOfflineQuery>?> fetchAllAttendanceQueryOffline() async {
    InitFloorDatabase database = await InitFloorDatabase.init();
    return await database.attendanceQueryOfflineDao.fetchAllAttendanceQueryOffline();
  }
  deleteOfflineAttendance() async {
    InitFloorDatabase database = await InitFloorDatabase.init();
    database.database.delete('AttendanceOfflineQuery');

  }
}
