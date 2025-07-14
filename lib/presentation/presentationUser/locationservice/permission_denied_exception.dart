import 'package:shiftapp/common/data/exceptions/app_base_exception.dart';

class LocationPermissionDeniedException  extends AppBaseException {
  @override
  String messageEn  ='Sorry, you have to go to the application settings and allow permission to access the location so that we can determine your geographical location and ensure that you are within the framework of the workplace';
  @override
  String messageAr  = 'عذرا ، يجب عليك الذهاب إلى إعدادات التطبيق والسماح بإذن الوصول إلي الموقع حتي نتمكن من تحديد موقعك الجغرافي والتأكد من وجودك في إطار مكان  العمل   !' ;

}
