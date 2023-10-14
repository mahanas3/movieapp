import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> createRegistration(
      String email, String password) async {
    try {

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
     } catch (e) {
      print(e);
    }
    throw Text('sdf');
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } catch (e) {
      print(e);
    }
  }
}
