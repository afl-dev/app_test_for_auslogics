import 'dart:async';
import 'package:app_test_for_auslogics/models/weather_model.dart' as wmi;
import 'package:app_test_for_auslogics/repo/weather_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_test_for_auslogics/repo/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'weather_event.dart';

part 'weather_state.dart';
// Блок отвечает за экран с погодой

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  Weather weather;

  WeatherBloc({@required this.weatherRepo}) : assert(weatherRepo != null);

   static Weather _weatherFromSqlModel({dynamic weatherHttp, String day, int index}) {
    return Weather(
        weatherState: weatherHttp.weatherState.toString(),
        minTemp: weatherHttp.minTemp.toString(),
        name: day,
        formattedWeatherState: weatherHttp.formattedWeatherState.toString(),
        created: weatherHttp.created.toString(),
        id: index,
        maxTemp: weatherHttp.maxTemp.toString(),
        temp: weatherHttp.temp.toString(),
        lastUpdated: weatherHttp.lastUpdated as DateTime);
  }

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      yield LoadingWeatherState();
      int index;
      DateTime date;
      String buttonNameLeft;
      String buttonNameRight;
      var error = false;
      wmi.WeatherItem weatherHttp;
      dynamic weatherSelectedSql;
      // Настраиваем параметры для UI
      switch (event.day) {
        case 'Yesterday':
          index = 1;
          date = DateTime.now().add(Duration(days: -1));
          buttonNameLeft = null;
          buttonNameRight = 'Today';
          break;
        case 'Today':
          index = 2;
          date = DateTime.now();
          buttonNameLeft = 'Yesterday';
          buttonNameRight = 'Tomorrow';
          break;
        case 'Tomorrow':
          index = 3;
          date = DateTime.now().add(Duration(days: 1));
          buttonNameLeft = 'Today';
          buttonNameRight = 'Video';
          break;
        default:
          index = 2;
          date = DateTime.now();
          buttonNameLeft = 'Yesterday';
          buttonNameRight = 'Tomorrow';
      }
      print('$index $date $buttonNameLeft $buttonNameRight');

      try {
        weatherSelectedSql = await weatherRepo?.select(index);
// Для очистки sql раскомментировать, указать index
        /* weather = Weather(
            weatherState: '9',
            minTemp: '9',
            name: event.day,
            formattedWeatherState: '9',
            created: '9',
            id: 2,
            maxTemp: '9',
            temp: '9',
            lastUpdated: DateTime.now());
        await weatherRepo.deleteWeather(weather);*/
        if (weatherSelectedSql == null) {
          try {
            weatherHttp = await weatherRepo?.getWeatherHttp(event.city, date);
            weather = _weatherFromSqlModel(
                weatherHttp: weatherHttp, index: index, day: event.day) as Weather;
            await weatherRepo?.insertWeather(weather);
          } catch (e) {
            throw Exception('error insertWeather $e');
          }
        } else {
          int diffDays =
              weatherSelectedSql.lastUpdated.difference(DateTime.now()).inDays as int;

          if (diffDays != 0) {
            try {
              weatherHttp = await weatherRepo?.getWeatherHttp(event.city, date);
              weather = _weatherFromSqlModel(
                  weatherHttp: weatherHttp, index: index, day: event.day) as Weather;
              await weatherRepo?.updateWeather(weather);
            } catch (e) {
              throw ('error updateWeather $e');
            }
          } else {
            weatherHttp = wmi.WeatherItem.returnWeatherForm(weatherSelectedSql);
          }
        }
      } catch (e) {
        error = true;
        if (weatherSelectedSql != null) {
          weatherHttp = wmi.WeatherItem.returnWeatherForm(weatherSelectedSql);
        }
        yield ErrorStateWeatherState(
            weatherModel: weatherHttp,
            dateTime: date,
            day: event.day,
            buttonNameLeft: buttonNameLeft,
            buttonNameRight: buttonNameRight);
        throw (e);
      } finally {
        if (!error) {
          yield LoadedWeatherState(
              weatherModel: weatherHttp,
              dateTime: date,
              day: event.day,
              buttonNameLeft: buttonNameLeft,
              buttonNameRight: buttonNameRight);
        }
      }
    }
  }
}
