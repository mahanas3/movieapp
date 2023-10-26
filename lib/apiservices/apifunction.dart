import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/detailsmodel.dart';
import 'package:movieapp/model/playingmodel.dart';
import 'package:movieapp/utilities/networkerror.dart';

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
      throw NetworkError.networkError(response.statusCode);
    }
  }

  Future getPopular() async {
    final response2 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response2.statusCode == 200) {
      var jsonData1 = (jsonDecode(response2.body));
      var popular = jsonData1['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw NetworkError.networkError(response2.statusCode);
    }
  }

  Future<List<Results>> getUpcoming() async {
    final response3 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response3.statusCode == 200) {
      var jsonData3 = (jsonDecode(response3.body));
      var popular = jsonData3['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw NetworkError.networkError(response3.statusCode);
    }
  }

  Future<List<Results>> getToprated() async {
    final response4 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response4.statusCode == 200) {
      var jsonData4 = (jsonDecode(response4.body));
      var popular = jsonData4['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return popular;
    } else {
      throw NetworkError.networkError(response4.statusCode);
    }
  }

  Future<List<Results>> getMovies() async {
    final response5 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response5.statusCode == 200) {
      var jsonData5 = (jsonDecode(response5.body));
      var movies = jsonData5['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return movies;
    } else {
      throw NetworkError.networkError(response5.statusCode);
    }
  }

  Future<List<Results>> getSearch(String query) async {
    final response6 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=108bf3bd3841b1bc748b170761656099&query=$query'));
    if (response6.statusCode == 200) {
      var jsonData6 = (jsonDecode(response6.body));
      var search = jsonData6['results'].map<Results>((data) {
        return Results.fromJson(data);
      }).toList();
      return search;
    }
    throw NetworkError.networkError(response6.statusCode);
  }


  Future getDetails(String id) async {
    final response8 = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=108bf3bd3841b1bc748b170761656099'));
    if (response8.statusCode == 200) {
      var jsonData8 = jsonDecode(response8.body);
      var moviedetails = Details.fromJson(jsonData8);
      return moviedetails;
    }
    throw NetworkError.networkError(response8.statusCode);
  }
}
