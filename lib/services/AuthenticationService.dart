import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';

class AuthenticationService {
  static Future<bool> login(String email, String password) async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  static Future<bool> register(String email, String password) async {
    try {
      await Firebase.initializeApp();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User updateUser = FirebaseAuth.instance.currentUser;
      updateUser.updateEmail(email);
      addUser(email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The entered password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
