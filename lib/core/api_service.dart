
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/model/NewReleases.dart';
import 'package:movies_app/model/TopRated.dart';


import 'package:movies_app/model/movies.dart';

import '../features/home/top_rated.dart';


class ApiService{
  static Future<Movie> getPopularMovies()async {
    Uri url = Uri.https(ApiConstants.baseURl,ApiConstants.popular);

    try {
      var response = await http.get(url, headers: {

        'Authorization': ApiConstants.authorization
      });
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e){
      throw e;
    }
  }

  static Future<NewReleases> getUpComingMovies()async {
    Uri url = Uri.https(ApiConstants.baseURl,ApiConstants.upComing);

    try {
      var response = await http.get(url, headers: {

        'Authorization': ApiConstants.authorization
      });
      var data = jsonDecode(response.body);
      var newmovies = NewReleases.fromJson(data);
      return newmovies;
    } catch (e){
      throw e;
    }
  }

  static Future<TopRated> getTopRatedMovies()async {
    Uri url = Uri.https(ApiConstants.baseURl,ApiConstants.topRated);

    try {
      var response = await http.get(url, headers: {

        'Authorization': ApiConstants.authorization
      });
      var data = jsonDecode(response.body);
      var topmovies = TopRated.fromJson(data);
      return topmovies;
    } catch (e){
      throw e;
    }
  }
}