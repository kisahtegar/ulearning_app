import 'package:flutter/material.dart'
    show BuildContext, ModalRoute, debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/entities.dart';
import 'bloc/lesson_bloc.dart';

/// The controller class for managing lessons.
class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  /// Creates a new instance of [LessonController] with the given [context].
  LessonController({required this.context});

  /// Initializes the lesson controller and loads lesson data.
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // Set the earlier video to false, meaning stop playing
    context.read<LessonBloc>().add(const TriggerPlay(false));
    await asyncLoadLessonData(args['id']);
  }

  /// Loads lesson data asynchronously.
  Future<void> asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonDetail(params: lessonRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        context.read<LessonBloc>().add(TriggerLessonVideo(result.data!));
        if (result.data!.isNotEmpty) {
          var url = result.data!.elementAt(0).url;
          debugPrint('My URL is $url');
          // This URL is important for initializing the video player
          videoPlayerController = VideoPlayerController.networkUrl(
            Uri.parse(url!),
          );
          // Here, the video player is initialized
          var initPlayer = videoPlayerController?.initialize();
          context.read<LessonBloc>().add(TriggerUrlItem(initPlayer));
        }
      }
    }
  }

  /// Plays the video with the given URL.
  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    // Reset everything we have done already
    context.read<LessonBloc>().add(const TriggerPlay(false));
    context.read<LessonBloc>().add(const TriggerUrlItem(null));
    // Initialize the video player
    var initPlayer = videoPlayerController?.initialize().then((_) {
      // Seek to the beginning of the video
      videoPlayerController?.seekTo(const Duration(milliseconds: 0));
    });
    context.read<LessonBloc>().add(TriggerUrlItem(initPlayer));
    context.read<LessonBloc>().add(const TriggerPlay(true));
    videoPlayerController?.play();
  }
}
