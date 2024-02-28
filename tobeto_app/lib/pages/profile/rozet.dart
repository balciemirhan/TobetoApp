import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Rozet extends StatelessWidget {
  const Rozet({Key? key}) : super(key: key);

  rozet(BuildContext context, {required String url}) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      child: Image(image: AssetImage(url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfilWidget(
      text: "Yetkinlik Rozetlerim",
      widget: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            rozet(context, url: "assets/images/istKodluyor.jpg"),
            rozet(context, url: "assets/images/iletisimBecerileri.jpg"),
            rozet(context, url: "assets/images/isBecerileri.jpg"),
            rozet(context, url: "assets/images/isYonetimiBecerileri.jpg"),
            rozet(context, url: "assets/images/iletisimBecerileri.jpg"),
          ],
        ),
      ),
    );
  }
}
