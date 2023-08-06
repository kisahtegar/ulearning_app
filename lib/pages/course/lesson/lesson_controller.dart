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
}
