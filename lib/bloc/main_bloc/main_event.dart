part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class VideoLoadMainEvent extends MainEvent {}

class TodayMainEvent extends MainEvent {}

class YesterdayMainEvent extends MainEvent {}

class TomorrowMainEvent extends MainEvent {}
