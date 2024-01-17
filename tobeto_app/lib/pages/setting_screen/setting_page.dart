import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/setting_screen/setting_widget.dart';
import 'package:tobeto_app/pages/view_more_screen/top_bar_widget_interval.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              TopBarWidgetInterval(
                leadingIcon: const Icon(Icons.settings),
                titleText: "Ayarlar",
                iconButton: IconButton(
                    onPressed: () => Navigator.of(context).pushNamed("/curved"),
                    icon: const Icon(Icons.arrow_back_ios_rounded)),
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsWidget(
                  leadingIcon: const Icon(Icons.person),
                  titleText: "Profil",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next_rounded))),
              SettingsWidget(
                  leadingIcon: const Icon(Icons.palette_outlined),
                  titleText: "Görünüm",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next_rounded))),
              SettingsWidget(
                  leadingIcon: const Icon(Icons.notifications_active),
                  titleText: "Bildirimler",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next_rounded))),
              SettingsWidget(
                  leadingIcon: const Icon(Icons.tips_and_updates_sharp),
                  titleText: "Yenilikler",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next_rounded))),
              SettingsWidget(
                  leadingIcon: const Icon(Icons.help_outline),
                  titleText: "Yardım",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next_rounded))),
              SettingsWidget(
                  leadingIcon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  titleText: "Çıkış Yap",
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.red,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
