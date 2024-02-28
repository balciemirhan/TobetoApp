import 'dart:async';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';

class BillBoard extends StatefulWidget {
  const BillBoard({super.key});

  @override
  State<StatefulWidget> createState() => _BillBoardState();
}

class _BillBoardState extends State<BillBoard> {
  int pageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // -------------- Slayt Sayfaları --------------

  final List<Widget> _pages = [
    const Opacity(
      opacity: 1,
      child: Flexible(
        child: Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: AssetImage(
            "assets/images/tobeto_light_billboard.gif",
          ),
        ),
      ),
    ),
    const Flexible(
      child: Flexible(
        child: Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: AssetImage(
            "assets/images/kodluyor_billboard.gif",
          ),
        ),
      ),
    ),
    Container(height: 300, color: Colors.green),
  ];

  // -------------- Zamanlayıcı ve Geçiş efekti(curve:)  --------------

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        pageIndex = (pageIndex + 1) % _pages.length;
        _pageController.animateToPage(pageIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeuBox(
          height: 200,
          width: 350,
          child: Container(
            height: 150,
            width: 300,
            child: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),

        // -------------- Slayt Göstergeleri --------------

        NeuBox(
          height: 50,
          width: 150,
          child: CarouselIndicator(
            activeColor: Colors.deepPurple,
            count: _pages.length,
            index: pageIndex,
          ),
        ),
      ],
    );
  }
}



/* class BillBoard extends StatelessWidget {
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
 */
