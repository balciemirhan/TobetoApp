import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticationService {
  /*  ------ GoogleSignIn ------ */

  Future<UserCredential> signInWithGoogle() async {
    // begin interactive sign in process --->
    // e-posta seçmeme olanak tanıyacak.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // obtain auth details from request --->
    // e postayı içe aktarma
    // kimlik doğrulama ==> googleAuth
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // create a new credential for user --->
    // işlem tamamlandıktan sonra kimlik bilgisi oluşturalım.
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, // erişim belirteci
      idToken: googleAuth?.idToken, // kimlik belirteci
    );

    // finally, lets sign in --->
    // ve son olarak kimlik bilgisine sahip olduğumuzda,
    // sadece oturum açmak için Firebase yönetimini kullanmamız gerekiyor.
    return await FirebaseAuth.instance.signInWithCredential(credential);

    // En son işlem, firebase tarafında parmak izi eklenmesi.
  }

  /*  ------ GoogleSignOut ------ */

  Future<GoogleSignInAccount?> signOutWithGoogle() async {
    return await GoogleSignIn().signOut();
  }
}
