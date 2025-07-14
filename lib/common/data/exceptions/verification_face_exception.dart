import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class VerificationFaceException extends AppException {

  @override
  String get messageAr => 'مطلوب التحقق من بصمة الوجه';

  @override
  String get messageEn => 'Face verification is required';

 }