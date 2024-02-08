import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/profile/activity_map.dart';
import 'package:tobeto_app/pages/profile/rozet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  personal(BuildContext context,
      {required String image, required String text}) {
    return Row(
      children: [
        Image(height: 25, image: AssetImage(image)),
        const SizedBox(
          width: 10,
        ),
        Text(
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.black87),
            text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        color: Colors.deepPurple.shade100,
        child: Column(
          children: [
            const TopBarWidget(
                leadingIcon: Icon(Icons.person_2_rounded),
                titleText: AppText.profile),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        personal(context,
                            image: AppImage.user, text: AppText.myName),
                        personal(context,
                            image: AppImage.calendar,
                            text: AppText.myBirthDate),
                        personal(context,
                            image: AppImage.phone, text: AppText.myPhone),
                        personal(context,
                            image: AppImage.email, text: AppText.myEmail),
                      ],
                    ),
                    const Image(
                        height: 100, image: AssetImage(AppImage.profileImage))
                  ],
                )),
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade700, blurRadius: 10)
                  ],
                  color: Colors.grey[300],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ActivityMapWidget(),
                      const Rozet(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/personal");
                        },
                        child: Lottie.network(height: 70, AppImage.lottieNext),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
