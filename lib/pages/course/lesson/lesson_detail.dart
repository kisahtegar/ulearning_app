import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';

import 'bloc/lesson_bloc.dart';
import 'lesson_controller.dart';
import 'lesson_detail_widgets.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    context.read<LessonBloc>().add(const TriggerUrlItem(null));
    context.read<LessonBloc>().add(const TriggerVideoIndex(0));
    _lessonController.init();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, lessonState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(titleText: "Lesson detail"),
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 25.w,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        //video preview
                        videoPlayer(lessonState, _lessonController),
                        //video buttons
                        videoControls(lessonState, _lessonController, context)
                      ],
                    ),
                  ),
                ),
                videoList(lessonState, _lessonController),
              ],
            ),
          ),
        );
      },
    );
  }
}
