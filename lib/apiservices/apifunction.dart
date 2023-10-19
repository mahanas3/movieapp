import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/playingmodel.dart';

class Api {
  Future<List<Results>> getPlaying() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1&api_key=108bf3bd3841b1bc748b170761656099'));
    if (response.statusCode == 200) {
      var jsonData = (jsonDecode(response.body));
      var playinglist = jsonData['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return playinglist;
    } else {
      throw Exception('Failed');
    }
  }

  Future getPopular() async {
    final response1 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response1.statusCode == 200) {
      var jsonData1 = (jsonDecode(response1.body));
      var popular = jsonData1['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Results>> getUpcoming()async{
    final response1 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response1.statusCode == 200) {
      var jsonData1 = (jsonDecode(response1.body));
      var popular = jsonData1['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw Exception('Error');
    }
  }
  Future<List<Results>> getToprated()async{
    final response1 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response1.statusCode == 200) {
      var jsonData1 = (jsonDecode(response1.body));
      var popular = jsonData1['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw Exception('Error');
    }
  }
}
