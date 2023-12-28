import 'package:flutter/material.dart';

import 'package:tobeto_app/config/constant/theme/text.dart';

class HomepageRichText extends StatelessWidget {
  const HomepageRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: tobetoPurple,
                style: TextStyle(
                  color: Color.fromARGB(240, 153, 51, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: welcome,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
