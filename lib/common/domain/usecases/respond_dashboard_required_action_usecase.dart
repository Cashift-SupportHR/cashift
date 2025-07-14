
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/usecase/usecase.dart';

import '../../data/repositories/joboffers/job_offers_repository.dart';
import '../params/dashboard_required_action_respond_params.dart';

@Injectable()
class RespondDashboardRequiredActionUseCase extends UseCase<String,DashboardRequiredActionRespondParams>{
  final JobOffersRepository jobOffersRepository ;

  RespondDashboardRequiredActionUseCase(this.jobOffersRepository);

  @override
  Future<String> call({DashboardRequiredActionRespondParams? params}) async {
    final response = await jobOffersRepository.confirmDashBoardAction(type:params!. type, objectData: params.objectData);
    return response.message ?? '';
  }

}