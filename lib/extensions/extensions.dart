import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/data/datasources/remote/api_exception.dart';
import '../../../../common/data/datasources/remote/resume_not_complete_exception.dart';
import '../../../../common/data/datasources/remote/unauthorized_exception.dart';
import '../../../../common/data/exceptions/app_exception.dart';
import '../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../common/domain/entities/api_code.dart';
import '../l10n/app_localizations.dart';
extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }


}
extension ListEx on List{

}

extension StringInLine on String {
  String addCurrency(BuildContext context) {
    var stringRes = context.getStrings().sar;
    return '$this $stringRes' ;
  }
  String addCurrencyShort(BuildContext context) {
    var stringRes = context.getStrings().rs;
    return '$this $stringRes' ;
  }


}
extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty ;
  }
  bool isNotNullOrEmpty() {
    return !isNullOrEmpty();
  }
}

extension NullOrEmptyFile on File? {
  bool isNullOrEmpty() {
    return this == null || this!.path.trim().isEmpty;
  }
  bool isNotNullOrEmpty() {
    return this != null && this!.path.trim().isNotEmpty;
  }
}


extension DioErrorExtension on DioError {
  bool emptyListException() {
    return (error is ApiException) &&
        (error as ApiException).code == ApiCode.EMPTY;
  }
}

extension ObjectExtension on Object {
  bool isDioError() {
    return this is DioError;
  }

  DioError toDioError() {
    return this as DioError;
  }

  bool emptyListException() {
    if (isDioError() && toDioError().error is ApiException) {
      return (toDioError().error as ApiException).code == ApiCode.EMPTY;
    }
    return this is EmptyListException;
  }

  bool requiredContactItException() {
    if (isDioError() && toDioError().error is ApiException) {
      return (toDioError().error as ApiException).code ==
          ApiCode.REQUIRED_CONTATC;
    }
    return this is EmptyListException;
  }
}

extension ContextExtension on BuildContext {
  T? getArguments<T>() {
    final args = MyModalRoute.of(this)!.settings.arguments;
    if (args != null && args is T) {
      return MyModalRoute.of(this)!.settings.arguments as T;
    }
    return null;
  }

  Locale getLocal() {
    Locale myLocale = Localizations.localeOf(this);
    return myLocale;
  }

  bool isRTL() => getLocal().languageCode == 'ar';

  removeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  double getScreenHeight() {
    final screenHeight = MediaQuery.of(this).size.height - 20;
    return screenHeight;
  }

  String handleApiErrorMessage({required dynamic exception}) {
    String message = getStrings().undefine_error;
    if (exception is String) {
      message = exception;
    }
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = getStrings().error_internet_connection;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException ||
          exception.type == DioExceptionType.connectionTimeout) {
        message = getStrings().error_internet_connection;
      } else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        print('handleApiError whenApiException is dio   $message');
      } else if (isRequireLogin(exception)) {
        message = getStrings().required_login;
      }  else {
        message = getStrings().undefine_error;
      }
    }

    if (exception is ResumeNotCompletedException) {
      return getStrings().complete_cv;
    }

    if (exception is ApiException) {
      message = exception.message;
    }

    if (exception is AppException) {
      message = exception.toString();
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().error_internet_connection;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().check_network_connection;
    }

    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = getStrings().undefine_error;
    String code = "0";
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = getStrings().error_internet_connection;
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException ||
          exception.type == DioExceptionType.connectionTimeout) {
        message = getStrings().error_internet_connection;
      } else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code;
      } else {
        message = getStrings().undefine_error;
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().error_internet_connection;
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = getStrings().check_network_connection;
    }

    print('handleApiError message ${message}');
    return ApiException(message, code);
  }

  bool isRequireLogin(exception) {
    return (exception is DioError &&
        exception.error is UnAuthorizedException) ||
        exception is UnAuthorizedException;
  }
}

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isSameDate(DateTime date) {
    return date.day == day && date.month == month && date.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}



/// replace ModalRoute.of(context)
@pragma('vm:entry-point')
class MyModalRoute {
  /// Finds the nearest ancestor InheritedWidget that has a `route` property
  /// of type [ModalRoute<T>] and returns it.
  @pragma('vm:entry-point')
  static ModalRoute<T>? of<T>(BuildContext context) {
    ModalRoute<T>? found;
    context.visitAncestorElements((element) {
      final widget = element.widget;
      // Only InheritedWidgets can be ancestor Route-carriers
      if (widget is InheritedWidget) {
        try {
          // `as dynamic` so we can test for a `route` field at runtime
          final candidate = (widget as dynamic).route;
          if (candidate is ModalRoute<T>) {
            found = candidate;
            return false; // stop walking
          }
        } catch (_) {
          // no `.route` field, or not the right type
        }
      }
      return true; // keep walking
    });
    return found;
  }
}