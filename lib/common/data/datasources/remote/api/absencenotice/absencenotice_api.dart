//absencenotice

 import 'package:injectable/injectable.dart';
 import 'package:shiftapp/common/data/models/absence_notation/index.dart';
 import '../../../../../network/source/user_endpoint.dart';
import '../../../../models/api_response.dart';

@Injectable()
class AbsenceNoticeAPI {
  final UserEndpoint api;
  AbsenceNoticeAPI(this.api);

  Future<ApiResponse<List<AbsenceDateParams>>> fetchAbsenceDate() async {
    return await api.fetchAbsenceDate();
  }

  Future<ApiResponse<String>> addAbsenceNotice(AddAbsenceNoticeParams addAbsenceNoticeParams) async {
    return await api.addAbsenceNotice(addAbsenceNoticeParams);
  }

}
