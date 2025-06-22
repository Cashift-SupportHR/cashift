import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shiftapp/data/datasources/remote/remote_constants.dart';
import 'package:shiftapp/data/models/api_response.dart';

import '../../presentation/adminFeatures/shared/data/models/index.dart';
part 'configuration_endpoint.g.dart';

@Injectable()
@RestApi()
abstract class ConfigurationEndpoint {
  @factoryMethod
  factory ConfigurationEndpoint(Dio dio) = _ConfigurationEndpoint;



}
