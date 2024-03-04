import 'dart:async';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/pages/application/application_dialog.dart';

class BillBoard extends StatefulWidget {
  const BillBoard({super.key});

  @override
  State<StatefulWidget> createState() => _BillBoardState();
}

class _BillBoardState extends State<BillBoard> {
  int pageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/tobeto_billboard.gif",
        ),
        fit: BoxFit.cover,
      )),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const ApplicationDialog(),
    ),
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/kodluyor_billboard.gif",
        ),
        fit: BoxFit.cover,
      )),
    ),
  ];

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
    return Container(
      child: Column(
        children: [
          NeuBox(
            height: 200,
            width: 350,
            child: SizedBox(
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
      ),
    );
  }
}
