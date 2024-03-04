import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/core/drawer/my_appbar.dart';
import 'package:tobeto_app/core/drawer/my_drawer.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/exam_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://form.jotform.com/240604305130944');

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _launchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: MyDrawer(),
      controller: drawerController,
      child: BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              DrawerTopBar(
                  drawerController: drawerController,
                  title: "Sinavlar",
                  image: AppImage.exam),
              const SizedBox(height: 40),
              BlocBuilder<ExamBloc, ExamState>(
                builder: (context, state) {
                  if (state is ExamInitial) {
                    context.read<ExamBloc>().add(GetExam());
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ExamLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ExamLoaded) {
                    final List<Exam> exams = state.exam;
                    return Column(
                      children: exams.map((exam) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: AppTextTheme.small(exam.name, context,
                                      textAlign: TextAlign.center),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Text(exam.content),
                                      ),
                                      AppTextTheme.xSmall(
                                          "Sınav Süresi : ${exam.time}",
                                          context,
                                          fontWeight: FontWeight.normal),
                                      AppTextTheme.xSmall(
                                          "Soru sayısı : ${exam.questionNumber}",
                                          context,
                                          fontWeight: FontWeight.normal),
                                      AppTextTheme.xSmall(
                                          "Soru tipi : ${exam.examType}",
                                          context,
                                          fontWeight: FontWeight.normal),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _launchUrl();
                                        },
                                        child: const Text("Başla")),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Kapat"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: NeuBox(
                            width: 250,
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: AppTextTheme.concertOne(
                                      exam.name, context,
                                      textAlign: TextAlign.center,
                                      fontSize: 20),
                                ),
                                const Icon(
                                  Icons.keyboard_double_arrow_right_rounded,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  if (state is ExamError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
