import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile/personal/personal_widget.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  socialMedia(BuildContext context, {required String image}) {
    return Image(height: 40, image: AssetImage(image));
  }

  @override
  Widget build(BuildContext context) {
    return PersonalWidget(
        text: "Medya Hesaplarım",
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialMedia(context, image: "assets/images/linkedin.png"),
            socialMedia(context, image: "assets/images/github.png")
          ],
        ));
  }
}
