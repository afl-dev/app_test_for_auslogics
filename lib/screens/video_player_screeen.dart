import 'dart:async';

import 'package:app_test_for_auslogics/bloc/video_bloc/video_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../bloc/main_bloc/main_bloc.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoBloc _videoBloc;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  ChewieController _chewieController;

  /* final chewieController = ChewieController(
    videoPlayerController: _controller,
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: true,
  );*/
  List<VideoPlayerController> _controllers = [];
  List<String> _assets = [
    'assets/trim1.mp4',
    'assets/trim2.mp4',
    'assets/trim3.mp4'
  ];
  int indexVideo = 0;
  bool isButtonPress = false;
  int helpDetectPlayed = 0;

  @override
  void initState() {
    _videoBloc = BlocProvider.of<VideoBloc>(context);
    for (int i = 0; i < _assets.length; i++) {
      _controllers.add(VideoPlayerController.asset(_assets[i]));
    }
    _initializeController(_controllers[0]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    // _videoBloc.close();

    super.dispose();
  }

  void _changeVideo  (bool forward) {
    _videoBloc.add(LoadingVideoEvent());
    if (forward) {
      indexVideo++;
    } else {
      indexVideo--;
    }
    //_chewieController.dispose();
    _controller.pause();
    _controller.seekTo(Duration(seconds: 0));
    _initializeController(_controllers[indexVideo]);
  }

  void _initializeController(VideoPlayerController controller) async {
    _controller = controller;
    _initializeVideoPlayerFuture = _controller.initialize();
    _initializeVideoPlayerFuture
        .then((value) => {_videoBloc.add(LoadedVideoEvent())});
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: true,
      allowFullScreen: false,
    );
    _controller.addListener(() async {
      print('$helpDetectPlayed $isButtonPress');
      if (_controller.value.isPlaying) {
        if (!isButtonPress && helpDetectPlayed < 1) {
          helpDetectPlayed++;
          _videoBloc.add(VideoPlayedVideoEvent());
        }
      }
      if (_controller.value.position != _controller.value.duration &&
          _controller.value.position != Duration(seconds: 0) &&
          !_controller.value.isPlaying) {
        helpDetectPlayed = 0;
        isButtonPress = false;
        print(_controller.value.isPlaying);
        _videoBloc.add(VideoPausedVideoEvent());
      }
      if (_controller.value.position == _controller.value.duration) {
        _videoBloc.add(VideoEndedVideoEvent());
        print('video ended');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoBloc, VideoState>(listener: (context, state) {
      if (state is VideoEndedVideoState) {
        helpDetectPlayed = 0;
      }
    }, builder: (context, state) {
      return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text(
              'Video',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(TomorrowMainEvent());
              },
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Center(
                  child: state is LoadedVideoState ||
                          state is VideoEndedVideoState ||
                          state is VideoPlayedVideoState ||
                          state is VideoPausedVideoState
                      ? Chewie(
                          controller: _chewieController,
                        )
                      : Center(child: CircularProgressIndicator())),
            ),
            Spacer(flex: 7),
            Flexible(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(_controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                        isButtonPress = true;
                      }

                      _videoBloc.add(VideoPlayedVideoEvent());
                    },
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.fast_rewind),
                    onPressed: () {
                      if (indexVideo > 0) {
                        _changeVideo(false);
                      }
                    },
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.fast_forward),
                    onPressed: () {
                      if (indexVideo < 2) {
                        _changeVideo(true);
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      );
    });
  }
}
