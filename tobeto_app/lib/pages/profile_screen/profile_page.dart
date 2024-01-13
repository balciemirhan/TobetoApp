import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/pages/curved_bar.dart/top_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBarWidget(
                titleText: "Profil",
                leadingIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 23, 62, 128),
                ),
              ),
              const SizedBox(
                height: 16, // İstediğiniz bir boşluk değerini buraya ekleyin
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 400,
                      height: 170,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.deepPurple, Colors.purple],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16, // İstediğiniz bir boşluk değerini buraya ekleyin
              ),
              const NeuBox(
                height: 250,
                width: 385,
                child: Column(
                  children: [
                    Row(
                      children: [
                        NeuBox(
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "Ad SoyAd",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "isminiz",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        NeuBox(
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "Doğum Tarihi",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Doğum Trihiniz",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        NeuBox(
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "E-Posta Adersi",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "e postanız",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        NeuBox(
                          height: 50,
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "Telefon Numarası",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Telefon Numaranız",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hakkımda",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Yeteneklerim",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Yabancı Dillerim",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sertifikalar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tobeto İşte Başarı Modelim ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.visibility)
                      ],
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "işte Başarı Modelideğerlendirmesiyle yeteneklerini ölç",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Başla"))
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Yetkinlik Rozetlerim",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              const SizedBox(
                height: 13,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Tobeto Seviye Testlerim",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yuvarlatma miktarını ayarlayabilirsiniz
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // Gölgenin konumunu ayarlayabilirsiniz
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text("SINAV BİLGİSİ"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aktivite Haritam",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              NeuBox(
                height: 150,
                width: 385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Eğtim Hayatım ve Deneyimlerim",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1, // Çizgi boyutunu buradan ayarlayabilirsiniz
                      width: 320,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Altındaki Yazı",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
