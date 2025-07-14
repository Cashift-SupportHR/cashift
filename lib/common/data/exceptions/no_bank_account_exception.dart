import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class NoBankAccountException extends AppException {

  @override
  String get messageAr => 'ليس لديك حساب بنكي';

  @override
  String get messageEn => 'you don\'t have bank account';

 }