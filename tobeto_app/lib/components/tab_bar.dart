import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: ListView(
          shrinkWrap: true,
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "Başvurularım",
                ),
                Tab(
                  text: "Eğitimlerim",
                ),
                Tab(
                  text: "Duyuru ve Haberlerim",
                ),
                Tab(
                  text: "Anketlerim",
                )
              ],
            ),
            AspectRatio(
              aspectRatio: 4 / 2,
              child: TabBarView(
                children: [
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                            Text(
                                "İstanbul Kodluyor Başvuru Formu \nOnaylandı."),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Container(
                      width: 400,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Profilini Oluştur",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26)),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor:
                                    const Color.fromRGBO(152, 51, 250, 1),
                                foregroundColor: Colors.white),
                            onPressed: () {},
                            child: const Text(
                              "Başla",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Container(
                      width: 400,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Kendini Değerlendir",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26)),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor:
                                    const Color.fromRGBO(152, 51, 250, 1),
                                foregroundColor: Colors.white),
                            onPressed: () {},
                            child: const Text(
                              "Başla",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Container(
                      width: 400,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Öğrenmeye Başla",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26)),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor:
                                    const Color.fromRGBO(152, 51, 250, 1),
                                foregroundColor: Colors.white),
                            onPressed: () {},
                            child: const Text(
                              "Başla",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
