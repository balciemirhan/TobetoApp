import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                TopBarWidgetInterval(
                    leadingIcon: const Icon(Icons.notifications_on_rounded),
                    titleText: "Duyurular",
                    iconButton: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded))),
                const NeuBox(
                  width: 350,
                  height: 150,
                  child: Column(
                    children: [
                      Text("20 Şubat Kampüs Buluşması Hk."),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("14.02.24")
                        ],
                      )
                    ],
                  ),
                ),
                const NeuBox(
                  width: 350,
                  child: Column(
                    children: [
                      Text("Mindset Anketi"),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("14.02.24")
                        ],
                      )
                    ],
                  ),
                ),
                const NeuBox(
                  width: 350,
                  child: Column(
                    children: [
                      Text("Ocak Ayı Tercih Formu Bilgilendirmesi"),
                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text("14.02.24")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Lottie.network(
                      "https://lottie.host/2bda282a-2542-404a-8faf-a93864c85de2/LgucCImMo2.json")
                ],
              ))
        ],
      ),
    );
  }
}
