// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/logger/logger_api_provider.dart';
import 'package:shiftapp/common/data/datasources/remote/base_client.dart';
import 'package:shiftapp/common/data/models/logger/logger_params.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';

@Injectable()
class LoggerRepository {
  final LoggerAPI api  =  LoggerAPI(ClientCreator().create());

  final UserRepository userRepository;

  LoggerRepository(this.userRepository);

  sendLog(LoggerParams params) async {
    params.phoneNumber = userRepository.getUser()?.phone;
    final response = await api.sendLog(params);
    print('onsendLog response ${response}');
  }
}
