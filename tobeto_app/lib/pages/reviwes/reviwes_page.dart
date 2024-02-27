import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/background_image.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/reviwsList.dart';

class Revister extends StatelessWidget {
  const Revister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset(
            'assets/images/tobeto-logo.png',
            height: 40,
            width: 50,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMainContent(),
                const SizedBox(height: 20),
                _buildContainer(context),
                const SizedBox(height: 20),
                _buildSecondRow(),
                const SizedBox(height: 20),
                _buildSkillList(),
              ],
            ),
          ),
        ),
      ),
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
    return Container(
      width: 430,
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 196, 132, 207), Color(0xFF4C2E8C)],
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tobeto İşte Başarı Modeli ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/quizStart");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("BAŞLA"),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 411,
          height: 110,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 77, 12, 216),
                Color.fromARGB(255, 160, 139, 206)
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomLeft: Radius.circular(45),
            ),
          ),
          child: const Column(
            children: [
              Text(
                "Yazılımda Başarı Testi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Çoktan seçmeli soruşar ile teknil bilgini  test et",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillList() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ReviewsList(title: "front"),
        SizedBox(height: 20),
        ReviewsList(
          title: "Full Stack",
          icon: Icon(Icons.heart_broken),
        ),
        SizedBox(height: 20),
        ReviewsList(
          title: "Back End",
          icon: Icon(Icons.heart_broken),
        ),
        SizedBox(height: 20),
        ReviewsList(
          title: "Microsoft SQL Server",
          icon: Icon(Icons.heart_broken),
        ),
        SizedBox(height: 20),
        ReviewsList(
          title: "Masaüstü Programlama",
          icon: Icon(Icons.heart_broken),
        ),
      ],
    );
  }
}
