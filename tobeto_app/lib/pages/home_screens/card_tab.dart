import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/home_screens/education_card.dart';

class CardTab extends StatelessWidget {
  const CardTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 25,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                istnabulImage,
                width: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                freeEducation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(isImage, width: 250),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: Colors.deepPurpleAccent,
                ),
                child: const TabBar(
                  labelColor: Color.fromARGB(255, 255, 255, 255),
                  unselectedLabelColor: Color.fromARGB(112, 255, 255, 255),
                  indicatorColor: Colors.purple,
                  isScrollable: true, // Kaydırılabilir
                  // başlangıç kısmına geçmesini sağlıyor
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.person_search_outlined),
                      text: "Başvurularım",
                    ),
                    Tab(
                      icon: Icon(Icons.cast_for_education_sharp),
                      text: "Eğitimlerim",
                    ),
                    Tab(
                      icon: Icon(Icons.newspaper),
                      text: "Duyuru ve Haberlerim",
                    ),
                    Tab(
                      icon: Icon(Icons.question_answer),
                      text: "Anketlerim",
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 4 / 2,
              child: TabBarView(children: [
                // --------- İstanbul kodluyor başvurularım START  ---------
                Container(
                  width: 370,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xFF076B34),
                        width: 10,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "İstanbul Kodluyor\nBilgilendirme",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.38,
                              decoration: const BoxDecoration(
                                color: Color(0xFF076B34),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Kabul Edildi",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.done,
                            color: Color(0xFF076B34),
                          ),
                          Text("İstanbul Kodluyor Başvuru Formu \nOnaylandı."),
                        ],
                      ),
                      const Row(
                        children: <Widget>[
                          Icon(
                            Icons.done,
                            color: Color(0xFF076B34),
                          ),
                          Text(
                              "İstanbul Kodluyor Belge Yükleme \nFormu Onaylandı."),
                        ],
                      ),
                    ],
                  ),
                ),

                // --------- İstanbul kodluyor başvurularım END ---------

                // --------- İstanbul kodluyor Eğitimlerim START ---------
                Container(
                  width: 370,
                  height: 150,
                  // --> ListView yerine --> PageView
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      EducationCard(),
                      EducationCard(),
                      EducationCard(),
                      EducationCard(),
                    ],
                  ),
                ),

                // --------- İstanbul kodluyor Eğitimlerim END ---------

                // --------- İstanbul kodluyor Duyuru / Haberlerim START ---------
                Container(
                  width: 370,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: const Border(
                      left: BorderSide(
                        color: Color(0xFF076B34),
                        width: 10,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Duyuru",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF076B34),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Center(
                              child: Text(
                                "İstanbul Kodluyor",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF076B34),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Yeni Grupların Discord'a Katılımı",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFF076B34),
                          ),
                          Text("07.12.2023"),
                          Text("Devamını Oku..."),
                        ],
                      ),
                    ],
                  ),
                ),

                // --------- İstanbul Kodluyor Duyuru / Haberlerim END ---------

                // --------- İstanbul kodluyor Anketlerim START ---------
                Text("Anketler"),
                // --------- İstanbul kodluyor Anketlerim END ---------
              ]),
            )
          ],
        ),
      ),
    );
  }
}
