import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/logger/index.dart';
import 'package:shiftapp/common/network/source/user_endpoint.dart';


@Injectable()
class LoggerAPI {
  final Dio dio;
  final UserEndpoint _api;

  LoggerAPI(this.dio)
      : _api = UserEndpoint(dio); // Initialize _api using the initializer list

  Future<ApiResponse<bool>> sendLog(LoggerParams params) {
    return _api.sendLog(params); // Use the initialized _api
  }
}
