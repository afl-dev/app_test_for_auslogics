import 'package:app_test_for_auslogics/models/weather_model.dart'
    as weatherItem;
import 'package:app_test_for_auslogics/repo/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../api/weather_api.dart';
import 'weathers_dao.dart';

class WeatherRepo {
  final WeatherApi weatherApi;
  WeatherDao _dao = WeatherDao(AppDatabase());

  WeatherRepo({@required this.weatherApi}) : assert(weatherApi != null);

  Future<Weather> select(int id) => _dao.getWeather(id);

  Future insertWeather(Weather weather) => _dao.insertWeather(weather);

  Future updateWeather(Weather weather) => _dao.updateWeather(weather);

  Future deleteWeather(Weather weather) => _dao.deleteWeather(weather);

  Future<weatherItem.WeatherItem> getWeatherHttp(int city, DateTime date) async {
    return weatherApi.getHttpWeather(city, date);
  }
}
