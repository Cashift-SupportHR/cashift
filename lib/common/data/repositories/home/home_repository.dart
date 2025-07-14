import 'package:floor/floor.dart';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/home/home_api_provider.dart';
import 'package:shiftapp/common/domain/entities/shared/AppVersionApdate.dart';

import '../../../components/index.dart';
import '../../../domain/entities/attendance/index.dart';
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
