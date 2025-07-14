// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceAPP {
  final SharedPreferences sharedPreference;

  SharedPreferenceAPP(this.sharedPreference);

  SharedPreferences getPref() => sharedPreference;
}

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._privateConstructor();
  factory LocalStorage() {
    return _instance;
  }
  SharedPreferences? _prefs;

  SharedPreferences ? getPref() => _prefs;
  LocalStorage._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }
}
