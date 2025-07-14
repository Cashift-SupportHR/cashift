import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_follow_up_violation_params.dart';
import '../../../data/models/final_action_follow_up_violation_params.dart';
import '../../../data/models/index.dart';
import '../../../domain/entities/follow_up_violation.dart';
import '../../../domain/entities/index.dart';

@Injectable()
class FollowUpViolationsCubit extends BaseCubit {
  final GeneralViolationsRepository repository;

  FollowUpViolationsCubit(this.repository);

  StreamDataStateInitial<List<FollowUpViolation>?>
  followUpViolationsStream = StreamDataStateInitial();
  List<FollowUpViolation> followUpViolations = [];

  void fetchInitialData() async {
    executeBuilder(
      () => repository.fetchTypesTabsOfContractViolation(),
      onSuccess: (data) {
        if (data.isNotEmpty) {
          fetchUsersRequests(data[0].id!);
        }
        emit(Initialized<List<CommonListItem>>(data: data));
      },
    );
  }

  void fetchUsersRequests(int type) async {
    try {
      followUpViolationsStream.start();
      final data = await repository.fetchFollowUpViolationsByType(type);
      followUpViolations = data;
      followUpViolationsStream.setData(data);
    } catch (e) {
      followUpViolationsStream.setError(e);
    }
  }

  void searchByText(String value) {
    followUpViolationsStream.start();
    if (value.isEmpty) {
      followUpViolationsStream.setData(followUpViolations);
    } else {
      final filteredList = followUpViolations.where((element) {
        return element.violationType!
            .toLowerCase()
            .contains(value.toLowerCase()) || element.companyName!
            .toLowerCase()
            .contains(value.toLowerCase()) || element.importantLevel!
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
      print('filteredList: $filteredList');
      if (filteredList.isEmpty) {
        followUpViolationsStream.setError(EmptyListException());
      } else {
        followUpViolationsStream.setData(filteredList);
      }
    }
  }

  void finalActionFollowUpViolation(FinalActionFollowUpViolationParams params) async {
    executeEmitterListener(() => repository.finalActionFollowUpViolation(params));
  }
}
