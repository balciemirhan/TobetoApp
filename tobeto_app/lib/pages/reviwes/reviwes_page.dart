import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/top_bar_widget_evaluat%C4%B1on.dart';
import 'package:tobeto_app/config/constant/core/widget/background_image.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/reviwsList.dart';
import 'package:tobeto_app/pages/reviwes/revist_model.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Revister extends StatelessWidget {
  const Revister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBarWidgetEvalution(
                  iconButton: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(FontAwesomeIcons.angleLeft)),
                ),
                const SizedBox(height: 20),
                _buildMainContent(),
                const SizedBox(height: 20),
                _buildContainer(context),
                const SizedBox(height: 20),
                _buildSecondRow(),
                const SizedBox(height: 20),
                _buildLists(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLists() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reviwestlisr.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isEven) {
            final itemIndex = index ~/ 2; // Gerçek öğe indeksini hesapla
            final item = reviwestlisr[itemIndex];
            return ReviewsList(
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

  Widget _buildMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Yetenek",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[400],
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "lerini ücretsiz ölç,",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "bilgi",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[400],
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "lerini test et",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
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
