import 'package:moor_flutter/moor_flutter.dart';

class Weathers extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get weatherState => text().withLength(min: 1, max: 50)();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  DateTimeColumn get lastUpdated => dateTime().nullable()();

  TextColumn get formattedWeatherState => text().withLength(min: 1, max: 50)();

  TextColumn get minTemp => text().withLength(min: 1, max: 20)();

  TextColumn get temp => text().withLength(min: 1, max: 20)();

  TextColumn get maxTemp => text().withLength(min: 1, max: 20)();

  TextColumn get created => text().withLength(min: 1, max: 35)();

  @override
  Set<Column> get primaryKey => {id};
}
