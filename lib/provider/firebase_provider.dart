import 'package:flutter/material.dart';
import 'package:movieapp/services/firebase_services.dart';

import '../screens/bottomnavigation.dart';
import '../screens/signup.dart';

class FirebaseProvider extends ChangeNotifier {
  void loginProvider(String email, String password, BuildContext context) {
    FirebaseServices().createRegistration(email, password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
  }

  void signUpProvider(String email, String password, BuildContext context) {
    FirebaseServices().signInWithEmailandPassword(email, password);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
  }
}
