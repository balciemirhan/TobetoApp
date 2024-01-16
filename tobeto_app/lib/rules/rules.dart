//  Koşul kuralları

// Map function ile kullanıcı arayüzü'nün durum yönetimini sağladık.

/* Bu yaklaşım, bir dizi if-else deyimi kullanmaktan daha özlü ve okunması daha kolaydır. Ayrıca gelecekte yeni hata mesajları eklemeyi de kolaylaştırır. */

// Bu kod, verilen FirebaseAuthException kodu için uygun hata mesajını almak üzere FirebaseAuthExceptionRules haritasını kullanır.

// yani [e.code] == email-already-in-use ise 'E-posta Zaten Kullanılıyor.' mesajını döndürür. vs.

const firebaseAuthExceptionRulesRegister = {
  'email-already-in-use': 'E-posta Zaten Kullanılıyor',
  'wrong-password': 'Hatalı Şifre',
  'weak-password': 'zayıf şifre: minimum 6 karakter giriniz.',
  'invalid-email': 'Geçersiz E-posta',
};

const firebaseAuthExceptionRulesLogin = {
  'invalid-email': 'Geçersiz E-posta',
  'wrong-password': 'Hatalı Şifre',
  'user-not-found': 'Kullanıcı Bulunamadı',
  'network-request-failed': 'Ağ Hatası',
  'too-many-requests': 'Çok Fazla İstek',
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

// -------------------- login form optimizasyon örneği --------------------

/* Eski Hali:

Future login(context) async {
  // giriş  düğmesine tıkladığımızda yapmak istediklerimiz:
  // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // ---------- catch bloğu içerisinde Hata yönetimi: ----------
  } on FirebaseAuthException catch (e) {
    String message;
    if (e.code == 'invalid-email') {
      message = "Geçersiz E-posta";
      snackBarMessage(context, message);
    } else if (e.code == 'wrong-password') {
      message = "Hatalı Şifre";
      return snackBarMessage(context, message);
    } else if (e.code == 'user-not-found') {
      message = "Kullanıcı Bulunamadı";
      return snackBarMessage(context, message);
    } else if (e.code == 'network-request-failed') {
      message = "Ağ Hatası";
      return snackBarMessage(context, message);
    } else if (e.code == 'too-many-requests') {
      message = "Çok Fazla İstek";
      return snackBarMessage(context, message);
    }
    /* else {
        message = "Bilinmeyen Hata: ${e.code}";
        snackBarMessage(context, message);
      } */
  }
} */

/* Yeni Hali 

  Future login(context) async {
    // giriş  düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ---------- catch bloğu içerisinde Hata yönetimi: ----------
    } on FirebaseAuthException catch (e) {
      String message =
          firebaseAuthExceptionRulesLogin[e.code] ?? "Lütfen bir Değer girin";
      snackBarMessage(context, message);
    }
  }
 */
