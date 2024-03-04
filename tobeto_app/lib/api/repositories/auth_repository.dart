import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUser(
      String email, String password, String confirmPassword) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> userOut() async {
    await _auth.signOut();
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.setLanguageCode('tr');
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  Future<void> changePassword(
      String newPassword, String confirmNewPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.updatePassword(newPassword);
    } else {
      throw Exception('Oturum açan kullanıcı yok');
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      final userCredential = await _auth.signInWithCredential(credential);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> googleSignOut() async {
    await GoogleSignIn().signOut();
  }

  Future<void> deleteUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    await user.delete();
  }
}
