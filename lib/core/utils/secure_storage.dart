
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shiftapp/data/models/auth/login_params.dart';

class SecureStorage {
  static const loginKey = 'loginKey';
  final _storage = const FlutterSecureStorage();

  Future<LoginParams?> readLoginParams() async {
    final loginString = await _storage.read(key: loginKey,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    if(loginString!=null) {
      final loginJson =  jsonDecode(loginString);
      return LoginParams.fromJson(loginJson);
    }
    print('on readLoginParams S ${loginString}');

    return null ;
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> addLoginItem(LoginParams params ) async {
    try {
      await _storage.write(
        key: loginKey,
        value:jsonEncode(params.toJson()),
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );

      final all = await _storage.readAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );

    }catch(e){
      print('ON WRITE STORAG ERROR ${e.toString()}');
    }
  }

  IOSOptions _getIOSOptions() => const IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true,);

}