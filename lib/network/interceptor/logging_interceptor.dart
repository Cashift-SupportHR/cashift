import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curlCommand = _buildCurlCommand(options);
    print('📤 CURL:\n$curlCommand : CurlLogger');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('✅ RESPONSE [${response.statusCode}] => ${response.requestOptions.uri}');
    print('📦 Body: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ ERROR [${err.response?.statusCode}] => ${err.requestOptions.uri}');
    print('💥 Message: ${err.message}');
    if (err.response?.data != null) {
      print('📦 Error Body: ${err.response?.data}');
    }
    handler.next(err);
  }

  String _buildCurlCommand(RequestOptions options) {
    final buffer = StringBuffer();

    buffer.write("curl -X ${options.method} '${options.uri}'");

    for (final entry in options.headers.entries) {
      buffer.write(" -H '${entry.key}: ${entry.value}'");
    }

    if (options.data != null) {
      try {
        final dataStr = jsonEncode(options.data).replaceAll("'", "\\'");
        buffer.write(" -d '$dataStr'");
      } catch (_) {
        final raw = options.data.toString().replaceAll("'", "\\'");
        buffer.write(" -d '$raw'");
      }
    }

    return buffer.toString();
  }
}
