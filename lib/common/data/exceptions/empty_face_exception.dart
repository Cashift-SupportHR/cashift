import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class EmptyFaceException extends AppException {

  @override
  String get messageAr => 'ليس لديك بصمة وجه مسجله';

  @override
  String get messageEn => 'Do not have face registered';

 }