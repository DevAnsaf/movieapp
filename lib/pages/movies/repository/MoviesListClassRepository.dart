import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';

import '../../../model/MovieListResponse.dart';

abstract class MoviesListClassRepository {
  Future<MovieListResponse> getAllMoviesList();
  Future<MovieListResponse> getAllMoviesListByType(String type);
  Future<MovieListResponse> getAllMoviesListByCategory(int id);

}