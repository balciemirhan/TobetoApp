import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text("Yetkinlik Rozetlerim"),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
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
        ],
      ),
    );
  }
}
