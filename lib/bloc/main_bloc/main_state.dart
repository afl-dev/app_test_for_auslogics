part of 'main_bloc.dart';

abstract class MainState {
  const MainState();
}

class InitialMainState extends MainState {}

class TodayMainState extends MainState {}

class YesterdayMainState extends MainState {}

class TomorrowMainState extends MainState {}

class VideoMainState extends MainState {}

class LoadingMainState extends MainState {}
