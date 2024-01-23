import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/config/constant/core/widget/progress_bar_animation.dart';

class LastCourseVideo extends StatefulWidget {
  const LastCourseVideo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LastCourseVideoState();
}

class _LastCourseVideoState extends State<LastCourseVideo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeuBox(
        height: 150,
        width: 600,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("En son izlediğiniz ders", style: AppTextTheme.title),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 70,
                  width: 70,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImage.lastCourse),
                  ),
                ),
                const ProgressBarAnimation(
                  progress: 55,
                ),
                InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.deepPurple,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
