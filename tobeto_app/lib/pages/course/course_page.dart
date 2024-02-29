// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/widget/lottie_button.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/core/widget/progress_bar_animation.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course/course_about.dart';
import 'package:tobeto_app/pages/course/course_video_tile.dart';
import 'package:tobeto_app/pages/course/video_player.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  int selectedVideoIndex = 0;

  late final ValueNotifier<String> videoUrlNotifier;

  @override
  void initState() {
    videoUrlNotifier = ValueNotifier<String>(widget.course.videoList[0].link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(children: [
                ValueListenableBuilder<String>(
                  valueListenable: videoUrlNotifier,
                  builder: (context, value, child) {
                    return CustomVideoPlayer(
                      videoUrlNotifier: videoUrlNotifier,
                    );
                  },
                ),
                Positioned(
                    top: 45,
                    left: 20,
                    child: NeuBox(
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 30,
                          )),
                    )),
              ]),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LottieButton(
                          url: AppImage.lottieFavourite,
                        ),
                        Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            child: AppTextTheme.small(
                                widget.course.title, context)),
                        const LottieButton(
                          url: AppImage.lottieSave,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ProgressBarAnimation(
                          progress: widget.course.progress,
                        ),
                        const Spacer(),
                        NeuBox(
                            height: 40,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/note");
                                },
                                icon: const Icon(
                                  Icons.note_alt_outlined,
                                  color: Colors.deepPurple,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: DefaultTabController(
                  length: 2,
                  animationDuration: Durations.long2,
                  child: Column(
                    children: [
                      TabBar(
                        splashBorderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.grey.shade700,
                        labelColor: Colors.deepPurple,
                        labelStyle: const TextStyle(
                            fontSize: 16.5, fontWeight: FontWeight.bold),
                        unselectedLabelStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                            color: Colors.grey.shade300,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(5, 5),
                                  color: Colors.grey.shade500)
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        tabs: const [
                          Tab(
                            text: AppText.courseContent,
                          ),
                          Tab(
                            text: AppText.courseAbout,
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: widget.course.videoList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //print(videoUrlNotifier.value);
                                        videoUrlNotifier.value =
                                            widget.course.videoList[index].link;
                                        //print(videoUrlNotifier.value);
                                        setState(() {
                                          selectedVideoIndex =
                                              index; // Seçili video indeksini güncelleyin
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: NeuBox(
                                          child: CourseListTile(
                                            video:
                                                widget.course.videoList[index],
                                            icon: const Icon(Icons.play_arrow),
                                            iconColor: Colors.black45,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CourseAbout(course: widget.course),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
