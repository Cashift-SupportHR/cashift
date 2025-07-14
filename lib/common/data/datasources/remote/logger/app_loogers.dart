import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';


class AppLoggers {
  static void setupLogger() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint('LLOOGGER ${record.level.name}: ${record.level.value}: ${record.time}: ${record.message}',wrapWidth: 3000);
    });
  }
}
