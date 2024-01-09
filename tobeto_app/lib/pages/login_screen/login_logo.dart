import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_app/config/constant/login/login_image.dart';
import 'package:tobeto_app/config/constant/login/login_text.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mwidth = mediaQueryData.size.width;
    Brightness brightness = Theme.of(context).brightness;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: mHeight / 15,
          image: AssetImage(getLogo(brightness)),
        ),
        SizedBox(height: mHeight / 40),
        Text(
          tobetoText,
          style: GoogleFonts.concertOne(
            textStyle: TextStyle(
                letterSpacing: 5,
                color: const Color.fromARGB(181, 255, 255, 255),
                fontSize: mHeight / 25,
                fontWeight: FontWeight.bold,
                shadows: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 158, 154, 154),
                    blurRadius: 25,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 165, 164, 164),
                    blurRadius: 15,
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
