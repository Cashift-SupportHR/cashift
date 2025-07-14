import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../common/domain/entities/attendance/attendance_offline_query.dart';
import 'attendance_offline_query_dao.dart';

part 'init_floor_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [AttendanceOfflineQuery])
abstract class InitFloorDatabase extends FloorDatabase {
  AttendanceOfflineQueryDao get attendanceQueryOfflineDao;

  static init () async {
    final database = await $FloorInitFloorDatabase.databaseBuilder('offline_database.db').build();
    return database;
  }
}
