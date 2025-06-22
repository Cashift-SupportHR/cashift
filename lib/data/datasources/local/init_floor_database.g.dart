// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $InitFloorDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $InitFloorDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $InitFloorDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<InitFloorDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorInitFloorDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $InitFloorDatabaseBuilderContract databaseBuilder(String name) =>
      _$InitFloorDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $InitFloorDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$InitFloorDatabaseBuilder(null);
}

class _$InitFloorDatabaseBuilder implements $InitFloorDatabaseBuilderContract {
  _$InitFloorDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $InitFloorDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $InitFloorDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<InitFloorDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$InitFloorDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$InitFloorDatabase extends InitFloorDatabase {
  _$InitFloorDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AttendanceOfflineQueryDao? _attendanceQueryOfflineDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AttendanceOfflineQuery` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `presentId` INTEGER, `projectId` TEXT, `latitude` REAL, `longitude` REAL, `checkedDateTime` TEXT, `attendanceType` INTEGER, `isMock` INTEGER, `isSafeDevice` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AttendanceOfflineQueryDao get attendanceQueryOfflineDao {
    return _attendanceQueryOfflineDaoInstance ??=
        _$AttendanceOfflineQueryDao(database, changeListener);
  }
}

class _$AttendanceOfflineQueryDao extends AttendanceOfflineQueryDao {
  _$AttendanceOfflineQueryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _attendanceOfflineQueryInsertionAdapter = InsertionAdapter(
            database,
            'AttendanceOfflineQuery',
            (AttendanceOfflineQuery item) => <String, Object?>{
                  'id': item.id,
                  'presentId': item.presentId,
                  'projectId': item.projectId,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'checkedDateTime': item.checkedDateTime,
                  'attendanceType': item.attendanceType,
                  'isMock': item.isMock == null ? null : (item.isMock! ? 1 : 0),
                  'isSafeDevice': item.isSafeDevice == null
                      ? null
                      : (item.isSafeDevice! ? 1 : 0)
                }),
        _attendanceOfflineQueryUpdateAdapter = UpdateAdapter(
            database,
            'AttendanceOfflineQuery',
            ['id'],
            (AttendanceOfflineQuery item) => <String, Object?>{
                  'id': item.id,
                  'presentId': item.presentId,
                  'projectId': item.projectId,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'checkedDateTime': item.checkedDateTime,
                  'attendanceType': item.attendanceType,
                  'isMock': item.isMock == null ? null : (item.isMock! ? 1 : 0),
                  'isSafeDevice': item.isSafeDevice == null
                      ? null
                      : (item.isSafeDevice! ? 1 : 0)
                }),
        _attendanceOfflineQueryDeletionAdapter = DeletionAdapter(
            database,
            'AttendanceOfflineQuery',
            ['id'],
            (AttendanceOfflineQuery item) => <String, Object?>{
                  'id': item.id,
                  'presentId': item.presentId,
                  'projectId': item.projectId,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'checkedDateTime': item.checkedDateTime,
                  'attendanceType': item.attendanceType,
                  'isMock': item.isMock == null ? null : (item.isMock! ? 1 : 0),
                  'isSafeDevice': item.isSafeDevice == null
                      ? null
                      : (item.isSafeDevice! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AttendanceOfflineQuery>
      _attendanceOfflineQueryInsertionAdapter;

  final UpdateAdapter<AttendanceOfflineQuery>
      _attendanceOfflineQueryUpdateAdapter;

  final DeletionAdapter<AttendanceOfflineQuery>
      _attendanceOfflineQueryDeletionAdapter;

  @override
  Future<List<AttendanceOfflineQuery>?> fetchAllAttendanceQueryOffline() async {
    return _queryAdapter.queryList('SELECT * FROM AttendanceOfflineQuery',
        mapper: (Map<String, Object?> row) => AttendanceOfflineQuery(
            id: row['id'] as int?,
            presentId: row['presentId'] as int?,
            projectId: row['projectId'] as String?,
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?,
            checkedDateTime: row['checkedDateTime'] as String?,
            attendanceType: row['attendanceType'] as int?,
            isSafeDevice: row['isSafeDevice'] == null
                ? null
                : (row['isSafeDevice'] as int) != 0,
            isMock:
                row['isMock'] == null ? null : (row['isMock'] as int) != 0));
  }

  @override
  Future<void> insertAttendanceQuery(
      AttendanceOfflineQuery attendanceQuery) async {
    await _attendanceOfflineQueryInsertionAdapter.insert(
        attendanceQuery, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAttendanceQuery(
      AttendanceOfflineQuery attendanceQuery) async {
    await _attendanceOfflineQueryUpdateAdapter.update(
        attendanceQuery, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAttendanceQuery(
      AttendanceOfflineQuery attendanceQuery) async {
    await _attendanceOfflineQueryDeletionAdapter.delete(attendanceQuery);
  }
}
