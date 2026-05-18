import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/utils.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/data/models/logger/logger_params.dart';
import 'package:shiftapp/data/repositories/auth_session/auth_session_manager.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/data/repositories/logger/logger_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/entities/shared/device.dart';
import '../../../network/interceptor/logging_interceptor.dart';
import 'api_exception.dart';
import 'remote_constants.dart';
import '../../../presentation/adminFeatures/di/injector.dart';

class SafeJsonOnlyTransformer extends Transformer {
   SafeJsonOnlyTransformer();

  @override
  Future<dynamic> transformResponse(RequestOptions options, ResponseBody responseBody) async {
    final bytes = await responseBody.stream.toBytes(); // ✅ مرة واحدة
    final text = utf8.decode(bytes).trim();

    if (options.responseType != ResponseType.json) {
      return null;
    }

    try {
      return jsonDecode(text);
    } catch (_) {
      return <String, dynamic>{
        "message": "Invalid response format",
        "code": "E",
      };
    }
  }

  @override
  Future<String> transformRequest(RequestOptions options) async {
    final data = options.data;
    if (data == null) return '';
    if (data is String) return data;
    if (data is FormData) {
      return data.toString();
    }
    try {
      return jsonEncode(data);
    } catch (_) {
      return data.toString();
    }
  }
}
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
    dio2.transformer =  SafeJsonOnlyTransformer();
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
  final AuthSessionManager? authSessionManager;

  HeaderInterceptor(
    this.userRepository,
    this.localRepository, {
    this.isRequiredAuth,
    required this.device,
    required this.loggerRepository,
    this.authSessionManager,
  });

  static const _retriedKey = 'retried_after_refresh';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[keyAuthorization] =
    'Bearer ${userRepository.getAccessToken()}';
    options.headers[keyLanguage] = Get.locale?.languageCode.toString();
    options.headers[keyApiKey] = apiKeyValue;
    options.headers[deviceIdKey] = device.id;
    options.headers[keyContentType] = keyJson;
    // options.headers[deviceInfoKey] =device.info
   // options.baseUrl=kTestApiUrl;
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
    print('Response Data: $data ${response.statusCode}');
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
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('=== DIO ERROR START ===');
    print('type: ${err.type}');
    print('message: ${err.message}');
    print('error: ${err.error}');
    print('status: ${err.response?.statusCode}');
    print('data: ${err.response?.data}');
    print('headers: ${err.response?.headers}');
    print('uri: ${err.requestOptions.uri}');
    print('=== DIO ERROR END ===');

    if (err.response != null) {
      print('Error: Response statusCode: ${err.response!.statusCode}');
      print('Error: Response Data: ${err.response!.data}');
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
        final alreadyRetried = err.requestOptions.extra[_retriedKey] == true;
        final sessionManager = authSessionManager;
        if (!alreadyRetried && sessionManager != null) {
          final refreshed = await sessionManager.refresh();
          if (refreshed) {
            try {
              final newToken = userRepository.getAccessToken();
              final options = err.requestOptions;
              options.extra[_retriedKey] = true;
              if (newToken.isNotEmpty) {
                options.headers[keyAuthorization] = 'Bearer $newToken';
              } else {
                options.headers.remove(keyAuthorization);
              }

              final response = await getIt.get<Dio>().fetch(options);
              return handler.resolve(response);
            } catch (_) {
              // fallthrough to unauthorized below
            }
          }
        }

        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            type: err.type,
            error: UnAuthorizedException(),
          ),
        );
        return;
      }

      final parsed = _tryParseErrorMap(err.response!.data);
      final message =
          parsed?['message']?.toString() ?? err.message ?? 'Request failed';
      final code = parsed?['code']?.toString() ?? 'E';
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
    handler.next(err);
  }

  // Parse error response safely; servers sometimes return HTML/plain text or empty body.
  Map<String, dynamic>? _tryParseErrorMap(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      final trimmed = data.trim();
      if (trimmed.isEmpty) return null;
      try {
        final decoded = json.decode(trimmed);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}