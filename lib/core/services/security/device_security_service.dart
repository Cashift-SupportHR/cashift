import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:protect_app/protect_app.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:root_checker_plus/root_checker_plus.dart';

class DeviceSecurityService {
  /// Returns true only if the device passes every platform-appropriate check.
  static Future<bool> isDeviceSecure() async {
    if (Platform.isAndroid) {
      // // 1️⃣ Only allow release builds
      if (!kReleaseMode) return false;

      // 2️⃣ Android-only checks
      final protector = ProtectApp();


      // 2a. Developer Options OFF
      final devMode = await RootCheckerPlus.isDeveloperMode() ?? true;
      if (devMode) return false;
      // 3️⃣ Common to both platforms
      // 3a. Emulator / Simulator
      final isRealDevice = await protector.isItRealDevice() ?? false;
      if (!isRealDevice) return false;
      // 2b. Root detection
      final rooted = await RootCheckerPlus.isRootChecker() ?? true;
      if (rooted) return false;
    }


    // 4️⃣ iOS-only checks
    if (Platform.isIOS) {
      // 4a. Jailbreak detection
      final jailbroken = await RootCheckerPlus.isJailbreak() ?? true;
      if (jailbroken) return false;

      // 4b. Tamper (bundle-ID repackaging)
      // final tampered = await JailbreakRootDetection.instance.isNotTrust;
      // if (tampered) return false;
    }

    // If we get here, every platform check passed
    return true;
  }
}
