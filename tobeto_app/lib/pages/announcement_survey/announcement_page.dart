import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/announcement_survey/announcement_item.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextTheme.medium("Duyuru", context),
        const Spacer(),
        CarouselSlider(
            items: [
              AnnouncementItem(
                  title: "20 Şubat Kampüs Buluşması Hk.", date: DateTime.now()),
              AnnouncementItem(title: "Mindset Anketi", date: DateTime.now()),
              AnnouncementItem(
                  title: "Ocak Ayı Tercih Formu Bilgilendirmesi",
                  date: DateTime.now()),
              AnnouncementItem(
                  title: "11 Ocak Kampüs Buluşması", date: DateTime.now()),
            ],
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
            )),
        const Spacer()
      ],
    );
  }
}
