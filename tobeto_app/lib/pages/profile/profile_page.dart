import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/pages/profile/profile_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topCenter,
            colors: [
              Colors.deepPurpleAccent,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 50,
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(250, 50),
                            bottomRight: Radius.elliptical(250, 50),
                          )),
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned.fill(
                    top: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(AppImage.profileImage),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("isim"),
                    Text("dogumtarihi"),
                    Text("telefon numarası"),
                    Text("e posta"),
                  ],
                )),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: const ProfileList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
