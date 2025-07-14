
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/common/data/datasources/local/constants.dart';
enum AppLocals{
AR , EN
}

@injectable
class LocalRepository {

  final SharedPreferences? preferences;
  final key = LocalConstants.LOCAL_KEY;

  LocalRepository({this.preferences});

  saveLocal(AppLocals  local) {
    String lang ;
    switch(local){
      case AppLocals.AR:lang = 'ar' ;
      break ;
      case AppLocals.EN:lang = 'en' ;
      break ;
      default: lang = 'en';
    }
    preferences!.setString(key, lang);
  }


  String getLocal() {
    final local = preferences!.getString(key);
    if(local!=null) {
      return local;
    }else {
      return LocalConstants.LOCAL_AR ;
    }
  }

  String toggleLanguage(){
    final lang = getLocal();
    String expectLang ;
    if(lang==LocalConstants.LOCAL_AR){
      expectLang = LocalConstants.LOCAL_EN;
      saveLocal(AppLocals.EN);
    }else{
      expectLang = LocalConstants.LOCAL_AR;
      saveLocal(AppLocals.AR);

    }
    return expectLang;
  }

  bool getFirstTime() {
    preferences?.reload();
    return preferences?.getBool('isFirstTime') ?? true;
  }

  void setFirstTime() {
     preferences?.setBool('isFirstTime', false);
  }

}
