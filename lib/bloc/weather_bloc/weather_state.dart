part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {}

class RefreshWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final wmi.WeatherItem weatherModel;
  final DateTime dateTime;
  final String day;
  final String buttonNameLeft;
  final String buttonNameRight;

  const LoadedWeatherState(
      {this.buttonNameLeft,
      this.buttonNameRight,
      @required this.weatherModel,
      @required this.dateTime,
      @required this.day})
      : assert(dateTime != null, weatherModel != null);
}

class TodayWeatherState extends WeatherState {}

class TomorrowWeatherState extends WeatherState {}

class YesterdayWeatherState extends WeatherState {}

class ErrorStateWeatherState extends WeatherState {
  final wmi.WeatherItem weatherModel;
  final DateTime dateTime;
  final String day;
  final String buttonNameLeft;
  final String buttonNameRight;

  const ErrorStateWeatherState(
      {this.buttonNameLeft,
      this.buttonNameRight,
      @required this.weatherModel,
      @required this.dateTime,
      @required this.day})
      : assert(dateTime != null, weatherModel != null);
}
