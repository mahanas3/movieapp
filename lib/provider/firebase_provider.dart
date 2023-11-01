import 'package:flutter/material.dart';
import 'package:movieapp/model/detailsmodel.dart';
import 'package:movieapp/services/firebase_services.dart';
import '../apiservices/apifunction.dart';
import '../model/playingmodel.dart';
import '../model/reviewmodel.dart';

class FirebaseProvider extends ChangeNotifier {
  bool loading = false;

  bool _isDark=false;

  bool get isDark => _isDark;

  List<Results>? nowplayingdata;

  List<Results>? populardata;

  List<Results>? upcomingdata;

  List<Results>? toprateddata;

  List<Results>? moviesdata;

  List<Results>? searchdata;

  Details? detailsdata;

  List<Review>? reviewdata;

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
      nowplayingdata = await Api().getPlaying();
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

  void topRatedMovies(BuildContext context) async {
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

  void moviesList(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      moviesdata = await Api().getMovies();
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

  void searchMovies(BuildContext context, String query) async {
    try {
      loading = true;
      notifyListeners();
      searchdata = await Api().getSearch(query);
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

  void details(BuildContext context,String id)async{
    try {
      loading = true;
      notifyListeners();
      detailsdata = await Api().getDetails(id);
      print(detailsdata);
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
  void reviews(BuildContext context,String id)async{
    try {
      loading = true;
      notifyListeners();
      reviewdata = await Api().getReviews(id);
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

  set isDark(bool value) {
    _isDark = value;

    notifyListeners();
  }}
