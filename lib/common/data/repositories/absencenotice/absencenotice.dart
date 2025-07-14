import 'package:injectable/injectable.dart';
import '../../datasources/remote/api/absencenotice/absencenotice_api.dart';
import '../../models/absence_notation/absencenotice.dart';
import '../../models/absence_notation/add_absence_notice_params.dart';

@injectable
class AbsenceNoticeRepository {
  final AbsenceNoticeAPI api;
  AbsenceNoticeRepository(this.api);
  Future<List<AbsenceDateParams>> fetchAbsenceDate() async {
    final response = await api.fetchAbsenceDate();
    return response.payload!;
  }

  Future<String> addAbsenceNotice({required AddAbsenceNoticeParams addAbsenceNoticeParams}) async {
    final response = await api.addAbsenceNotice(addAbsenceNoticeParams);
    return response.payload!;
  }
}
