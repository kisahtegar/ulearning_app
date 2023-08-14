import 'package:flutter/material.dart' show BuildContext, ModalRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/entities.dart';
import 'bloc/lesson_bloc.dart';

/// Implement `LessonController` class.
class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  LessonController({required this.context});

  /// Initialize controller.
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //set the earlier video to false means, stop playing
    context.read<LessonBloc>().add(const TriggerPlay(false));
    await asyncLoadLessonData(args['id']);
  }

  /// This function is used to load lesson data.
  Future<void> asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonDetail(params: lessonRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        context.read<LessonBloc>().add(TriggerLessonVideo(result.data!));
        if (result.data!.isNotEmpty) {
          var url = result.data!.elementAt(0).url;
          print('my url is ${url}');
          //this url is important for init video player
          videoPlayerController = VideoPlayerController.networkUrl(
            Uri.parse(url!),
          );
          //here actually stream starts to happen
          var initPlayer = videoPlayerController?.initialize();
          context.read<LessonBloc>().add(TriggerUrlItem(initPlayer));
        }
      }
    }
  }

  // This function is used to to play video
  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    // Redo everything we done already
    context.read<LessonBloc>().add(const TriggerPlay(false));
    context.read<LessonBloc>().add(const TriggerUrlItem(null));
    // initialize the video player
    var initPlayer = videoPlayerController?.initialize().then((_) {
      // setting to beginning video
      videoPlayerController?.seekTo(const Duration(milliseconds: 0));
    });
    context.read<LessonBloc>().add(TriggerUrlItem(initPlayer));
    context.read<LessonBloc>().add(const TriggerPlay(true));
    videoPlayerController?.play();
  }
}
