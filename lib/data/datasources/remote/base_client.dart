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
import '../../../network/interceptor/logging_interceptor.dart';
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



    // Add custom interceptor if provided
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    dio2.interceptors.add(LoggingInterceptor());
    // Add ChuckerDioInterceptor for debug/test environments
    if (Config.isDebuggable || Config.isTestVersion) {
      dio2.interceptors.add(
        ChuckerDioInterceptor(),
      );
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
  final keyContentType = "content-type";

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
    options.headers[keyContentType] = keyJson;
    // options.headers[deviceInfoKey] =device.info;

    options.headers['platform'] = Config.platformName;
    options.headers['AppVersion'] = Config.AppVersion;
    options.headers[requestTypeKey] = true;

    print('Header  Params ${options.data} ${options.headers}');
    // 2) forward to next interceptor
    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      final status = data['status'] as String? ?? '';
      if (status != 'success') {
        final message = data['message'] as String? ?? 'Unknown error';
        final code = data['code'] as String? ?? 'E';
        final apiEx = ApiException(message, code);
        final dioErr = DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
          message: message,
          error: apiEx,
        );
        return handler.reject(dioErr, true);
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final statusCode = err.response!.statusCode;
      // Log only on errors: 401 if required, 403, 500
      if ((statusCode == 401 && isRequiredAuth == true) ||
          statusCode == 403 ||
          statusCode == 500) {
        final params = LoggerParams(
          tagName: err.requestOptions.path,
          description: 'HeaderInterceptor get error $statusCode',
          object: err.requestOptions.data.toString(),
          error: err.error.toString(),
          phoneNumber: userRepository.getUser()?.phone.toString(),
        );
        loggerRepository.sendLog(params);
      }

      if (statusCode == 401 && isRequiredAuth == true) {
        handler.reject(
          DioError(
            requestOptions: err.requestOptions,
            response: err.response,
            type: err.type,
            error: UnAuthorizedException(),
          ),
        );
        return;
      } else {
        final errorData = err.response!.data;
        final parsed = errorData is String
            ? json.decode(errorData) as Map<String, dynamic>
            : errorData as Map<String, dynamic>;
        final message = parsed['message']?.toString() ?? 'Error';
        final code = parsed['code']?.toString() ?? 'E';
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            type: err.type,
            message: message,
            error: ApiException(message, code),
          ),
        );
        return;
      }
    }
    handler.next(err);
  }
}