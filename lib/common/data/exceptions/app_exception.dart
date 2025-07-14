import 'package:get/get.dart';
import 'package:shiftapp/common/data/exceptions/app_base_exception.dart';

abstract class AppException implements AppBaseException {

  @override
  String toLocalize(String local) {
    return  local == "ar" ?messageAr : messageAr ;
  }


  @override
  String toString() {
    final  lang = Get.locale!.languageCode.toString() ;
    return  lang == "ar" ?messageAr : messageEn ;
  }

  @override
  String toLocalizeMessage() {
    final  lang = Get.locale!.languageCode.toString() ;
    return toLocalize(lang);
  }



}
