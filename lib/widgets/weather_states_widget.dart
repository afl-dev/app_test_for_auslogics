import 'package:app_test_for_auslogics/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherStates extends StatelessWidget {
  final WeatherState weatherState;

  WeatherStates({Key key, @required this.weatherState})
      : assert(weatherState != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(weatherState);

  Image _mapConditionToImage(WeatherState state) {
    Image image;
    switch (state) {
      case WeatherState.snow:
        image = Image.asset('assets/sn.png');
        break;
      case WeatherState.sleet:
        image = Image.asset('assets/sl.png');
        break;
      case WeatherState.hail:
        image = Image.asset('assets/h.png');
        break;
      case WeatherState.thunderstorm:
        image = Image.asset('assets/t.png');
        break;
      case WeatherState.heavyRain:
        image = Image.asset('assets/hr.png');
        break;
      case WeatherState.lightRain:
        image = Image.asset('assets/lr.png');
        break;
      case WeatherState.showers:
        image = Image.asset('assets/s.png');
        break;
      case WeatherState.heavyCloud:
        image = Image.asset('assets/hc.png');
        break;
      case WeatherState.lightRain:
        image = Image.asset('assets/lr.png');
        break;
      case WeatherState.lightCloud:
        image = Image.asset('assets/lc.png');
        break;
      case WeatherState.unknown:
      case WeatherState.clear:
        image = Image.asset('assets/c.png');
        break;
    }
    return image;
  }
}
