import 'dart:convert';

import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/MovieListResponse.dart';
import 'package:movies/utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/Data.dart';
import '../../../utils/Helper.dart';
import 'MoviesListClassRepository.dart';

class MoviesListRepo extends MoviesListClassRepository {

  @override
  Future<MovieListResponse> getAllMoviesList() async {
    var prefs = await SharedPreferences.getInstance();
    final myString = prefs.getString(Helper.userData) ?? '';
    Map userMap = jsonDecode(myString);
    var user = Data.fromJson(userMap);

    Map<String, String> tokenHeader = {
      "Content-Type": "application/json",
      "authorization": "Bearer ${user.token}"
    };
    try {
      var endpoint = Constants.getEndpoint("movie/all");
      http.Response response = await http.get(Uri.parse(endpoint),
          headers: tokenHeader);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        MovieListResponse movieResponse = MovieListResponse.fromJson(jsonData);
        print(movieResponse.toJson());
        return movieResponse;
      } else {
        print("status code# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Error");
  }


}