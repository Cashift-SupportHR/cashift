import 'package:shiftapp/common/data/exceptions/app_exception.dart';

class EmptyListException extends AppException {

  @override
  String get messageAr => 'لا يوجد بيانات ';

  @override
  String get messageEn => 'No Data';

 }