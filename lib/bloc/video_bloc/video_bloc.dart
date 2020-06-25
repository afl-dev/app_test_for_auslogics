import 'dart:async';
import 'package:bloc/bloc.dart';

part 'video_event.dart';

part 'video_state.dart';
// Блок отвечает за экран с видеопреером
class VideoBloc extends Bloc<VideoEvent, VideoState> {
  @override
  VideoState get initialState => InitialVideoState();

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is LoadingVideoEvent) {
      yield LoadingVideoState();
    }
    if (event is LoadedVideoEvent) {
      yield LoadedVideoState();
    }
    if (event is VideoEndedVideoEvent) {
      yield VideoEndedVideoState();
    }
    if (event is VideoPlayedVideoEvent) {
      yield VideoPlayedVideoState();
    }
    if (event is VideoPausedVideoEvent) {
      yield VideoPausedVideoState();
    }
  }
}
