import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shiftapp/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/data/datasources/remote/base_client.dart';
import 'package:shiftapp/data/datasources/remote/unauthorized_exception.dart';
import 'package:shiftapp/data/models/logger/logger_params.dart';
import 'package:shiftapp/data/repositories/auth_session/auth_session_manager.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/data/repositories/logger/logger_repository.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';
import 'package:shiftapp/domain/entities/account/user.dart';
import 'package:shiftapp/domain/entities/shared/device.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockLocalRepository extends Mock implements LocalRepository {}
class MockLoggerRepository extends Mock implements LoggerRepository {}
class MockAuthSessionManager extends Mock implements AuthSessionManager {}
class MockRequestInterceptorHandler extends Mock implements RequestInterceptorHandler {}
class MockResponseInterceptorHandler extends Mock implements ResponseInterceptorHandler {}
class MockErrorInterceptorHandler extends Mock implements ErrorInterceptorHandler {}
class MockDio extends Mock implements Dio {}

void main() {
  test('mocks compile', () {
    expect(true, true);
  });
}

