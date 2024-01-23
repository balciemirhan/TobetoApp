import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile/information.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  profileList(
      BuildContext context, String information, IconData icon, Widget page) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(information),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => page)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
          children: [
            profileList(
              context,
              "BİLGİLERİM",
              Icons.person,
              const Information(),
            ),
            profileList(
              context,
              "BİLDİRİMLER",
              Icons.notifications,
              const Information(),
            ),
            profileList(
              context,
              "AYARLAR",
              Icons.settings,
              const Information(),
            ),
            profileList(
              context,
              "HAKKIMDA",
              Icons.info,
              const Information(),
            ),
            profileList(
              context,
              "YETENEKLERİM",
              Icons.star,
              const Information(),
            ),
            profileList(
              context,
              "YABANCI DİLLERİM",
              Icons.language,
              const Information(),
            ),
            profileList(
              context,
              "SERTİFİKALARIM",
              Icons.badge,
              const Information(),
            ),
            profileList(
              context,
              "MEDYA HESAPLARI",
              Icons.account_circle,
              const Information(),
            ),
          ],
        ),
      ),
    );
  }
}
