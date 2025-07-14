import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class NoBiometricSavedException extends AppException {

  @override
  String get messageAr => 'لا يوجد بيانات مسجلة لحسابك يجب تسجيل الدخول برقم الهاتف وكلمة المرور اولاً';

  @override
  String get messageEn => 'There is no data registered for your account. You must log in with your phone number and password first';

 }