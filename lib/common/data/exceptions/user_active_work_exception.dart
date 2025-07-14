
import 'app_exception.dart';

class UserActiveWorkException extends AppException {

  @override
  String get messageAr => 'لديك عمل نشط الان لذلك لا يمكنك تسجيل الخروج';

  @override
  String get messageEn => 'You have an active work right now so you can\'t log out';

 }