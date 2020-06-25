import 'package:app_test_for_auslogics/bloc/main_bloc/main_bloc.dart';
import 'package:app_test_for_auslogics/bloc/weather_bloc/weather_bloc.dart';
import 'package:app_test_for_auslogics/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'video_player_screeen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state is TodayMainState) {
            BlocProvider.of<WeatherBloc>(context)
                .add(GetWeatherEvent(day: 'Today'));
          }
          if (state is TomorrowMainState) {
            BlocProvider.of<WeatherBloc>(context)
                .add(GetWeatherEvent(day: 'Tomorrow'));
          }
        },
        builder: (context, state) {
          if (state is VideoMainState) {
            return VideoPlayerScreen();
          } else {
            return WeatherScreen();
          }
        },
      ),
    );
  }
}
