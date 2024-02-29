import 'package:flutter/material.dart';

import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/pages/reviwes/reviwes_list.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/revist_model.dart';

import 'package:url_launcher/url_launcher.dart';

class RevisterPage extends StatelessWidget {
  const RevisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextTheme.londrinaShadow("Kendini Degerlendir", context),
                const SizedBox(height: 15),
                _buildContainer(context),
                const SizedBox(height: 15),
                _buildSecondRow(),
                const SizedBox(height: 15),
                _buildLists(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLists() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reviwestlisr.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isEven) {
            final itemIndex = index ~/ 2; // Gerçek öğe indeksini hesapla
            final item = reviwestlisr[itemIndex];
            return ReviwesList(
              trailing: ElevatedButton(
                  onPressed: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, "/quizStart");
                    }
                  },
                  child: index == 0
                      ? const Icon(
                          Icons.lock_open) // İlk öğe için yıldız simgesi
                      : const Icon(Icons
                          .lock)), // Diğer öğeler için kilit simgesi// Diğer öğeler için kilit simgesi
              title: item.isim,
              onTap: () {
                // onTap fonksiyonu tanımlanabilir
              },
              icon: Image.asset(
                'assets/images/feedback.png',
                width: 45, // Genişlik
                height: 45, // Yükseklik
              ),
            );
          } else {
            return const SizedBox(height: 20);
          }
        },
      ),
    );
  }

  Widget _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 160, 139, 206),
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Yazılımda Başarı Testi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Çoktan seçmeli soruşar ile teknik bilgini test et",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(BuildContext context) {
    final Uri url = Uri.parse('https://form.jotform.com/240584391740963');

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _launchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        width: 420,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 132, 207),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tobeto İşte Başarı Modeli ',
              style: TextStyle(
                fontSize: 24,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(195, 255, 254, 254),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchUrl();
                //Navigator.pushNamed(context, "/quizStart");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 154, 104, 241),
                textStyle: const TextStyle(fontSize: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "BAŞLA",
                style: TextStyle(
                  fontSize: 15,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
