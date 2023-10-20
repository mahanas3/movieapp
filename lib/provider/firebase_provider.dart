import 'package:flutter/material.dart';
import 'package:movieapp/services/firebase_services.dart';
import '../apiservices/apifunction.dart';
import '../model/playingmodel.dart';

class FirebaseProvider extends ChangeNotifier {
  bool loading = false;

  List<Results>? datas;

  List<Results>? populardata;

  List<Results>? upcomingdata;

  List<Results>? toprateddata;

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

  void popularMovie(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      populardata = await Api().getPopular();
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

  void upcomingMovie(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      upcomingdata = await Api().getUpcoming();
      print(upcomingdata);
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

  void topratedMovies(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      toprateddata = await Api().getToprated();
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
}
