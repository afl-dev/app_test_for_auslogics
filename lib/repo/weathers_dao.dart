import 'moor_database.dart';
import 'package:app_test_for_auslogics/models/weather_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'weathers_dao.g.dart';

@UseDao(tables: [Weathers])
class WeatherDao extends DatabaseAccessor<AppDatabase> with _$WeatherDaoMixin {
  final AppDatabase appDatabase;

  WeatherDao(this.appDatabase) : super(appDatabase);

  Stream<List<Weather>> watchWeathers() => select(weathers).watch();

  Future<List<Weather>> getAllWeathers() => select(weathers).get();

  Future insertWeather(Insertable<Weather> weather) =>
      into(weathers).insert(weather);

  Future updateWeather(Insertable<Weather> weather) =>
      update(weathers).replace(weather);

  Future deleteWeather(Insertable<Weather> weather) =>
      delete(weathers).delete(weather);

  Future<Weather> getWeather(int id) {
    return (select(weathers)..where((weathers) => weathers.id.equals(id)))
        .getSingle();
  }
}
