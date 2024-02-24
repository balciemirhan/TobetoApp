import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/models/announcement_model.dart';
import 'package:tobeto_app/pages/announcement_survey/announcement_item.dart';

class AnnouncementCarousel extends StatelessWidget {
  final List<AnnouncementModel>? announcement;

  const AnnouncementCarousel({Key? key, this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: announcement != null
          ? announcement!.map<Widget>((announ) {
              return AnnouncementItem(announcement: announ);
            }).toList()
          : [const SizedBox()],
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(seconds: 6),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
