import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
// Buton dokunma yöntemi. --> onTap()
  final void Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // dinamaik blur - offset
    const Offset distance = Offset(28, 28);
    double blur = 30.0;
    // GestureDetector widget --> Container için hareket algılayıcı'dır.
    // Oturum açma sayfasında bu düğmeyi oluşturmamız gerektiğinde kullanacağız. --> onTap()
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 143, 101, 215)),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: -distance,
              color: Colors.white,
            ),
            BoxShadow(
              blurRadius: blur,
              offset: distance,
              color: const Color(0xFFA7A9AF),
            )
          ],
        ),
        child: const Center(
          child: Text(
            "Oturum Aç",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
