import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

class CardExam extends StatelessWidget {
  const CardExam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      // Sınavlarım yazan Card
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                exam,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),

                // Sınavı gösteren Card
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 10,
                  child: SizedBox(
                    width: 180,

                    // Sınavı tıklanabilir yapma özelliği
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Herkes için kodlama 2a değerlendirme sınavı
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      examEveryone,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(Icons.check_box,
                                    color: Colors.green, size: 30),
                              ],
                            ),

                            // herkes için kodlama - 2a
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                everyone,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            // 45 dk
                            Row(
                              children: [
                                Icon(Icons.alarm_outlined,
                                    color: Color.fromARGB(240, 153, 51, 255)),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    time,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
