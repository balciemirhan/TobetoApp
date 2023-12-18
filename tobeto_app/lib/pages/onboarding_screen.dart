import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tobeto_app/pages/intro_screens/intro_page1.dart';
import 'package:tobeto_app/pages/intro_screens/intro_page2.dart';
import 'package:tobeto_app/pages/intro_screens/intro_page3.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  _OnbordingPageState createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text("skip"),
                ),
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3), //sayfalar arasında yumşak bir geçiş//noktalar
                onLastPage
                    ? GestureDetector(
                        // kullanıcıların cihaz ekranı ile
                        //etkileşimde bulunmasını sağlar ve çeşitli jestlere (dokunma, kaydırma, uzun basma, vb.) tepki verebilir.
                        onTap: () {
                          Navigator.of(context).pushNamed("/home");
                        },
                        child: Text("done"),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("next"),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
