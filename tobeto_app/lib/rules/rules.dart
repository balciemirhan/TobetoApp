//  Koşul kuralları:

/* Bu yaklaşım, bir dizi if-else deyimi kullanmaktan daha özlü ve okunması daha kolaydır. Ayrıca gelecekte yeni hata mesajları eklemeyi de kolaylaştırır. */

// Bu kod, verilen FirebaseAuthException kodu için uygun hata mesajını almak üzere FirebaseAuthExceptionRules haritasını kullanır.

// yani [e.code] == email-already-in-use ise  'E-posta Zaten Kullanılıyor.' döndür mantığı.

const firebaseAuthExceptionRules = {
  'email-already-in-use': 'E-posta Zaten Kullanılıyor',
  'wrong-password': 'Hatalı Şifre',
  'weak-password': 'zayıf şifre: minimum 6 karakter giriniz.',
};

/* String message = firebaseAuthExceptionRules[e.code]!;
      snackBarMessage(context, message); */

// yukarıdaki ile aşağıdaki aynı şeydir.

/* if (e.code == 'email-already-in-use') {
        message = "E-posta Zaten Kullanılıyor.";
        return snackBarMessage(context, message);
      } else if (e.code == 'weak-password') {
        message = "zayıf şifre: minimum 6 karakter giriniz.";
        snackBarMessage(context, message);
      } */
