import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/utils.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/data/models/logger/logger_params.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/data/repositories/logger/logger_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/entities/shared/device.dart';
import 'api_exception.dart';
import 'remote_constants.dart';

class ClientCreator {
  final Interceptor? interceptor;

  ClientCreator({this.interceptor});

  Dio create() {
    final dio2 = Dio();

    // Set timeouts
    dio2.options.connectTimeout = Duration(seconds: 60); // Connection timeout
    dio2.options.receiveTimeout = Duration(seconds: 60); // Receive timeout
    dio2.options.sendTimeout = Duration(seconds: 60);    // Send timeout

    // Set base URL
    dio2.options.baseUrl =kBASE_URL;  // Replace with your base URL

    // Add ChuckerDioInterceptor for debug/test environments
    if (Config.isDebuggable || Config.isTestVersion) {
      dio2.interceptors.add(ChuckerDioInterceptor());
    }

    // Add LogInterceptor for logging requests/responses in debug/test environments
    dio2.interceptors.add(LogInterceptor(responseBody: Config.isDebuggable || Config.isTestVersion));

    // Add custom interceptor if provided
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    return dio2;
  }

}

class HeaderInterceptor extends Interceptor {
  final keyJson = "application/json";

  final keyAuthorization = "authorization";
  final keyApiKey = "apiKey";
  final deviceIdKey = "deviceid";
  final deviceInfoKey = "deviceinfo";

  final apiKeyValue = "Nas@manpoweragent";
  final keyLanguage = "Language";
  final requestTypeKey = "IsAndroidRequest";

  final UserRepository userRepository;
  final LocalRepository localRepository;
  final bool? isRequiredAuth;
  final Device device;
  final LoggerRepository loggerRepository;

  HeaderInterceptor(this.userRepository, this.localRepository,
      {this.isRequiredAuth,
      required this.device,
      required this.loggerRepository});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[keyAuthorization] =
        'Bearer ${userRepository.getAccessToken()}';
    options.headers[keyLanguage] = Get.locale?.languageCode.toString();
    options.headers[keyApiKey] = apiKeyValue;
    options.headers[deviceIdKey] = device.id;
    // options.headers[deviceInfoKey] =device.info;
    options.headers['platform'] = Config.platformName;
    options.headers['AppVersion'] = Config.AppVersion;
    options.headers[requestTypeKey] = true;
    print('Header  Params ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'DIO ERROR onError ${err.response != null} =>error message is  ${err.error}');
    if (err.response != null) {
      //print('DIO ERROR onError known ${(err.response!.statusCode==401 && isRequiredAuth==true) || err.response!.statusCode == 500}');

      if ((err.response!.statusCode == 401 && isRequiredAuth == true) ||
          err.response!.statusCode == 500) {
        final params = LoggerParams(
            tagName: err.requestOptions.path,
            description:
                "HeaderInterceptor get error ${err.response?.statusCode}",
            object: err.requestOptions.data.toString(),
            error: err.error.toString(),
            phoneNumber: userRepository.getUser()?.phone.toString());
        loggerRepository.sendLog(params);
      }

      if (err.response!.statusCode == 401 && isRequiredAuth == true) {
        throw UnAuthorizedException();
      } else {
        Map<String, dynamic> data = json.decode(err.response.toString());
        print('DIO ERROR Response ${data}');

        final message = data.containsKey('message') ? data['message'] : "Error";
        final status = data.containsKey('status') ? data['status'] : "Error";
        String code = data.containsKey('code') ? data['code'] : "E";
        throw ApiException(message, code);
      }
    } else {
      print('DIO ERROR Unknown${err.error} => ${err.message}');

      /*  final params = LoggerParams(
          tagName: err.requestOptions.path, description: "HeaderInterceptor get error ${err.response?.statusCode}" ,
          object: err.requestOptions.data.toString(), error: err.error.toString());

        loggerRepository.sendLog(params);*/

      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Map<String, dynamic> data = response.data;
    final message = data.containsKey('message') ? data['message'] : "Error";
    final status = data.containsKey('status') ? data['status'] : "Error";
    String code = data.containsKey('code') ? response.data['code'] : "E";
    debugPrint('onResponse  => ${code != 'Ok'}');
    if (status != 'success') {
      print('IS ERROR ${message}');
      throw ApiException(message, code);
    }
  }
}
