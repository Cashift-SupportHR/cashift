import 'dart:io';

import 'package:flutter/foundation.dart';

class Config {

  static const isTestVersion = false;
  static const isDebuggable = false;
  static const AppStoreId = '1593657179';
  static final AppVersion = Platform.isIOS ? '1.7.6' : '1.8.1';
  static final platformName = Platform.isIOS ? 'IOS' : 'Android';
  //static const GOOGLE_API_KEY = "AIzaSyBLJT-I4XT5RLlsxUOc_P1LoUlfov9nW6Q";
  static const GOOGLE_API_KEY = "AIzaSyAd_vUDBk1i9jcfCAp-ghIv4BKNW6Dd6x0";
}
