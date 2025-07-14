import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/repositories/joboffers/job_offers_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../entities/required_tasks/in_app_required_task.dart';

@Injectable()
class RequiredTasksUseCase extends UseCase<List<InAppRequiredTask>,dynamic>{
  final JobOffersRepository jobOffersRepository ;

  RequiredTasksUseCase(this.jobOffersRepository);
  @override
  Future<List<InAppRequiredTask>> call({params}) async {
    final response =  await  jobOffersRepository.fetchInAppRequiredTasks();
    return response.payload??[];
  }


  Future<String> confirmDashBoardAction({String? type, String? objectData}) async {
    final response = await jobOffersRepository.confirmDashBoardAction(type: type, objectData: objectData);
    return response.message ?? '';
  }

}