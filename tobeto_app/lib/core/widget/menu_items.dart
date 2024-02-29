import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/image.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1st menu option
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImage.tobetoLogo,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImage.whatsappIcon,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImage.chatBotIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
