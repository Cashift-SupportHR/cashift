import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'configuration_endpoint.g.dart';

@Injectable()
@RestApi()
abstract class ConfigurationEndpoint {
  @factoryMethod
  factory ConfigurationEndpoint(Dio dio) = _ConfigurationEndpoint;



}
