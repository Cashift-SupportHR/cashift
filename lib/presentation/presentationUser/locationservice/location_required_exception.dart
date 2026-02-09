import 'package:shiftapp/data/exceptions/app_base_exception.dart';

class LocationRequiredException extends AppBaseException {
  @override
  String messageEn =
      'Location permission is required to show nearby delivery orders.';
  @override
  String messageAr = 'إذن الموقع مطلوب لعرض طلبات التوصيل القريبة.';
}
