import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/last_course/progress_bar_animation.dart';

class LastCourseVideo extends StatefulWidget {
  const LastCourseVideo({Key? key}) : super(key: key);

  @override
  _LastCourseVideoState createState() => _LastCourseVideoState();
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
              child: Text("En son izlediğiniz ders", style: AppText.title),
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
                    image: AssetImage("assets/images/flutter_icon.png"),
                  ),
                ),
                const ProgressBarAnimation(),
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
