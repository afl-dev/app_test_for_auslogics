part of 'video_bloc.dart';

abstract class VideoEvent {
  const VideoEvent();
}

class LoadingVideoEvent extends VideoEvent {}

class LoadedVideoEvent extends VideoEvent {}

class VideoPlayedVideoEvent extends VideoEvent {}

class VideoPausedVideoEvent extends VideoEvent {}

class VideoEndedVideoEvent extends VideoEvent {}
