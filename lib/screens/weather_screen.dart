import 'package:app_test_for_auslogics/bloc/main_bloc/main_bloc.dart';
import 'package:app_test_for_auslogics/bloc/weather_bloc/weather_bloc.dart';
import 'package:app_test_for_auslogics/widgets/weather_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatelessWidget {
  String buttonNameLeft = 'Today';
  String buttonNameRight = 'Video';
  bool oldData = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
      if (state is LoadedWeatherState) {
        buttonNameLeft = state?.buttonNameLeft;
        buttonNameRight = state?.buttonNameRight;
        oldData = false;
      }
      if (state is ErrorStateWeatherState) {
        oldData = true;
        buttonNameLeft = state?.buttonNameLeft;
        buttonNameRight = state?.buttonNameRight;
      }
    }, builder: (context, state) {
      if (state is LoadedWeatherState || state is ErrorStateWeatherState) {
        return Column(
          children: <Widget>[
            Spacer(flex: 2),
            Flexible(
                flex: 14,
                child: (state is ErrorStateWeatherState &&
                        state.weatherModel == null)
                    ? Center(
                        child: Text(
                          'Connection error, try again',
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                      )
                    : WeatherWidget(
                        height: height,
                        state: state,
                        oldData: oldData,
                      )),
            Spacer(flex: 2),
            Flexible(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Expanded(
                      flex: 10,
                      child: buttonNameLeft != null
                          ? FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.grey[300],
                              child: Text(
                                '$buttonNameLeft',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                switch (buttonNameLeft) {
                                  case 'Yesterday':
                                    BlocProvider.of<WeatherBloc>(context)
                                        .add(GetWeatherEvent(day: 'Yesterday'));
                                    break;
                                  case 'Today':
                                    BlocProvider.of<WeatherBloc>(context)
                                        .add(GetWeatherEvent(day: 'Today'));
                                    break;
                                  case 'Tomorrow':
                                    BlocProvider.of<WeatherBloc>(context)
                                        .add(GetWeatherEvent(day: 'Tomorrow'));
                                    break;
                                  case 'Video':
                                    BlocProvider.of<MainBloc>(context)
                                        .add(VideoLoadMainEvent());
                                    break;
                                }
                              },
                            )
                          : SizedBox()),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      flex: 10,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.grey[300],
                        child: Text(
                          '$buttonNameRight',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          switch (buttonNameRight) {
                            case 'Yesterday':
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(GetWeatherEvent(day: 'Yesterday'));
                              break;
                            case 'Today':
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(GetWeatherEvent(day: 'Today'));
                              break;
                            case 'Tomorrow':
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(GetWeatherEvent(day: 'Tomorrow'));
                              break;
                            case 'Video':
                              BlocProvider.of<MainBloc>(context)
                                  .add(VideoLoadMainEvent());
                              break;
                          }
                        },
                      )),
                  Spacer(),
                ],
              ),
            ),
            Spacer(flex: 3),
          ],
        );
      } else {
        return Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ));
      }
    });
  }
}
