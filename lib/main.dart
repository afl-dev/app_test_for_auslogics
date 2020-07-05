import 'package:app_test_for_auslogics/bloc/video_bloc/video_bloc.dart';
import 'package:app_test_for_auslogics/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc/main_bloc.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'bloc/weather_bloc/weather_bloc.dart';
import 'api/weather_api.dart';
import 'repo/weather_repo.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  final WeatherRepo _weatherRepo = WeatherRepo(
    weatherApi: WeatherApi(
      httpClient: http.Client(),
    ),
  );
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
            create: (context) => MainBloc()..add(TodayMainEvent())),
        BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(weatherRepo: _weatherRepo)),
        BlocProvider<VideoBloc>(create: (context) => VideoBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // рут
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test APP',
      theme: ThemeData(
        primaryColor: Colors.green[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
