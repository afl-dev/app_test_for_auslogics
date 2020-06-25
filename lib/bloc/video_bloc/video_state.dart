part of 'video_bloc.dart';

abstract class VideoState {
  const VideoState();
}

class InitialVideoState extends VideoState {}

class LoadingVideoState extends VideoState {}

class LoadedVideoState extends VideoState {}

class VideoPlayedVideoState extends VideoState {}

class VideoPausedVideoState extends VideoState {}

class VideoEndedVideoState extends VideoState {}
