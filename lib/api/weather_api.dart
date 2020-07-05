import 'dart:convert';

import 'package:app_test_for_auslogics/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WeatherApi {
  static const url = 'https://www.metaweather.com';
  final Client httpClient;

  WeatherApi({@required this.httpClient}) : assert(httpClient != null);

  Future<WeatherItem> getHttpWeather(int locationId, DateTime date) async {
    final weatherUrl =
        '$url/api/location/$locationId/${date.year}/${date.month}/${date.day}/';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode == 200) {
      final weatherJson = jsonDecode(weatherResponse.body);
      return WeatherItem.fromJson(weatherJson);
    } else {
      throw Exception('error getting weather for location');
    }
  }
}
