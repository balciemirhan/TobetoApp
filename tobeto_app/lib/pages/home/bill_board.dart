import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';

class BillBoard extends StatelessWidget {
  const BillBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      width: 400,
      height: 200,
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 91, 73, 164),
              Color.fromARGB(255, 142, 122, 179)
            ])),
        child: const Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image(
                image: AssetImage(AppImage.billBoard),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            /*    Padding(
              padding: EdgeInsets.all(25.0),
              child: Image(
                image: AssetImage("assets/images/billboard.gif"),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ), */
            // Image.network(
            //     "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Image.png?alt=media&token=8256c357-cf86-4f76-8c4d-4322d1ebc06c"),
            /*     const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Uygulamamızı\ndenediniz mi ?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
