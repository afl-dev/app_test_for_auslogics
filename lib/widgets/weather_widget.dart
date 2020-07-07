import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weather_states_widget.dart';

class WeatherWidget extends StatelessWidget {
  final double height;
  final state;
  final bool oldData;

  const WeatherWidget({Key key, this.height, this.state, this.oldData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 5,
          child: Text('${state.day}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 5,
          child: Column(
            children: <Widget>[
              Text(
                'Moscow',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text('${DateFormat('dd-MM-yyyy').format(state.dateTime as DateTime)}',
                  style: TextStyle(
                    fontSize: 10,
                  )),
            ],
          ),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 5,
          child: Text(
            '${state.weatherModel.temp.toStringAsFixed(1)}°',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 7,
          child: Container(
            child: WeatherStates(
              weatherState: state.weatherModel.weatherState,
            ),
            height: height * 0.15,
          ),
        ),
        Spacer(flex: 1),
        Flexible(
          flex: 3,
          child: oldData
              ? Text(
                  'Outdated data try again',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                )
              : Text(
                  '${state.weatherModel.formattedWeatherState}',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ],
    );
  }
}
