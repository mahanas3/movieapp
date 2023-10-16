import 'package:flutter/material.dart';
import 'package:movieapp/services/firebase_services.dart';

class FirebaseProvider extends ChangeNotifier {
  void signUpProvider(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseServices().createRegistration(email, password);
      Navigator.pushNamed(context, '/signup');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const Signup()));
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }

  void loginProvider(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseServices().signInWithEmailandPassword(email, password);
      Navigator.pushNamed(context, '/login');
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const BottomNavigation()));
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }
}
