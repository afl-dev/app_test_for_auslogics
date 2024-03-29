import 'package:dart_utils/dart_utils.dart';

enum WeatherState {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class WeatherItem {
  final int id;
  final WeatherState weatherState;
  final String name;
  final DateTime lastUpdated;
  final String formattedWeatherState;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final String created;

  const WeatherItem({
    this.id,
    this.weatherState,
    this.name,
    this.lastUpdated,
    this.formattedWeatherState,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.created,
  });

  List<Object> get props => [
        weatherState,
        formattedWeatherState,
        minTemp,
        temp,
        maxTemp,
        lastUpdated,
        created
      ];

  static WeatherItem fromJson(dynamic json) {
    final dynamic consolidatedWeather = json[0];
    return WeatherItem(
      weatherState:
          _weatherCondition(consolidatedWeather['weather_state_abbr'] as String),
      created: consolidatedWeather['created'] as String,
      formattedWeatherState:
          consolidatedWeather['weather_state_name'] as String,
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      //locationId: json['woeid'] as int,
      lastUpdated: DateTime.now(),
      //  location: json['title'],
    );
  }

  static WeatherState _weatherCondition(String stateInput) {
    WeatherState state;
    switch (stateInput) {
      case 'sn':
        state = WeatherState.snow;
        break;
      case 'sl':
        state = WeatherState.sleet;
        break;
      case 'h':
        state = WeatherState.hail;
        break;
      case 't':
        state = WeatherState.thunderstorm;
        break;
      case 'hr':
        state = WeatherState.heavyRain;
        break;
      case 'lr':
        state = WeatherState.lightRain;
        break;
      case 's':
        state = WeatherState.showers;
        break;
      case 'hc':
        state = WeatherState.heavyCloud;
        break;
      case 'lc':
        state = WeatherState.lightCloud;
        break;
      case 'c':
        state = WeatherState.clear;
        break;
      default:
        state = WeatherState.unknown;
    }
    return state;
  }

  static WeatherItem returnWeatherForm(dynamic data) {
    return WeatherItem(
        weatherState: enumFromString(WeatherState.values, data.weatherState as String),
        minTemp: double.parse(data.minTemp as String),
        name: data.name as String,
        formattedWeatherState: data.formattedWeatherState as String,
        created: data.created as String,
        id: data.id as int,
        maxTemp: double.parse(data.maxTemp as String),
        temp: double.parse(data.temp as String),
        lastUpdated: data.lastUpdated as DateTime);
  }
}
