import 'package:flutter/material.dart';
import 'package:movieapp/services/firebase_services.dart';
import '../apiservices/apifunction.dart';
import '../model/playingmodel.dart';

class FirebaseProvider extends ChangeNotifier {
  bool loading = false;

  late List<Results> datas;

  late List<Results> populardata;

  late List<Results> upcomingdata;

  late List<Results> toprateddata;

  void signUpProvider(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseServices().createRegistration(email, password);
      Navigator.pushNamed(context, '/home');
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
      Navigator.pushNamed(context, '/home');
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }

  void nowPlaying(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      datas = await Api().getPlaying();
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }

  void popularMovie() async {
    try {
      populardata = await Api().getPopular();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void upcomingMovie() async {
    try {
      upcomingdata = await Api().getUpcoming();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void topratedMovies() async {
    toprateddata = await Api().getToprated();
    notifyListeners();
  }
}
