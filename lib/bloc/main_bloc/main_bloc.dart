import 'dart:async';
import 'package:bloc/bloc.dart';

part 'main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is YesterdayMainEvent) {
      yield YesterdayMainState();
    }
    if (event is TodayMainEvent) {
      yield TodayMainState();
    }
    if (event is TomorrowMainEvent) {
      yield TomorrowMainState();
    }
    if (event is YesterdayMainEvent) {
      yield YesterdayMainState();
    }
    if (event is VideoLoadMainEvent) {
      yield VideoMainState();
    }
  }
}
