import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final auth = FirebaseAuth.instance;

  Future signInWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else if (e.code == 'user-disabled') {
        return 'User disabled';
      }
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-user') {
        return 'Email already';
      } else if (e.code == 'weak-password') {
        return 'Weak pasword';
      }
    }
  }
  Future signWithInAnonymously() async {
    await auth.signInAnonymously();
  }
}
