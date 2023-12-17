import 'package:flutter/material.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class MyButton extends StatelessWidget {
// Buton dokunma yöntemi. --> onTap()
  final void Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    // GestureDetector widget --> Container için hareket algılayıcı'dır.
    // Oturum açma sayfasında bu düğmeyi oluşturmamız gerektiğinde kullanacağız. --> onTap()
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/home"),
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 143, 101, 215)),
          color: themeManager.theme.canvasColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            //    BoxShadowLogin2().boxShadowLogin2,
            BoxShadowLogin(context).boxShadowLogin
          ],
        ),
        child: Center(
          child: Text(
            "Oturum Aç",
            style: TextStyle(
              color: themeManager.theme.indicatorColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
