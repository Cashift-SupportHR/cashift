import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class NoPhoneWalletException extends AppException {

  @override
  String get messageAr => 'ليس لديك محفظة ';

  @override
  String get messageEn => 'you don\'t have wallet';

 }