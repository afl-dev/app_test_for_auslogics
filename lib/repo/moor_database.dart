import 'package:app_test_for_auslogics/models/weather_table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'weathers_dao.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Weathers], daos: [WeatherDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
