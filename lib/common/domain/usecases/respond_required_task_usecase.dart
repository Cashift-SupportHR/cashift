
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/usecase/usecase.dart';

import '../../data/repositories/joboffers/job_offers_repository.dart';

@Injectable()
class RespondRequiredTaskUseCase extends UseCase<String,int>{
  final JobOffersRepository jobOffersRepository ;

  RespondRequiredTaskUseCase(this.jobOffersRepository);

  @override
  Future<String> call({int? params}) async {
    final response = await jobOffersRepository.confirmRequiredTask(params!);
    return response.message ?? '';
  }

}