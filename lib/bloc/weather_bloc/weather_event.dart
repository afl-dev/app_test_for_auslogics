part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  final int city;
  final String day;

  GetWeatherEvent({this.day, this.city = 1105779})
      : assert(city != null, day != null);
}

class TodayWeatherEvent extends WeatherEvent {}

class TomorrowWeatherEvent extends WeatherEvent {}

class YesterdayWeatherEvent extends WeatherEvent {}
