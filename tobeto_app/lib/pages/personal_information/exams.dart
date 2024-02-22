import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_evet.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/models/exam_model.dart';


class Exams extends StatelessWidget {
  const Exams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamInitial) {
          // İlk durumda sınavları getirme işlemini başlat
          context.read<ExamBloc>().add(GetExam());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ExamLoading) {
          // Yükleme durumunda ilerleme çubuğunu göster
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ExamLoaded) {
          // Veri yüklendikten sonra UI'ı güncelle
          final List<Exam> exams = state.exam;
          return Column(
            children: exams.map((exam) {
              return GestureDetector(
                onTap: () {
                  // Tıklandığında showDialog fonksiyonunu kullanarak bir dialog göster
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // AlertDialog oluşturun
                      return AlertDialog(
                        title: Text(exam.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(exam.content),
                           const SizedBox(height: 10),
                            Text("Sınav Süresi ${exam.time}"),
                            Text("Soru sayısı ${exam.questionNumber}"),
                            Text("Soru TİPİ ${exam.examType}"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Dialog kapatılacak
                              Navigator.of(context).pop();
                            },
                            child:const Text("Kapat"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: NeuBox(
                  width: 400,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        exam.name,
                        style:const TextStyle(fontSize: 20),
                      ),
                     const SizedBox(height: 10),
                      Text(
                        exam.examClass,
                        style:const TextStyle(fontSize: 16),
                      ),
                      Text(
                        exam.time.toString(),
                        style:const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
        if (state is ExamError) {
          // Hata durumunda hata mesajını göster
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
