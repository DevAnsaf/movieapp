import 'package:flutter/material.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/pages/movies/repository/MoviesListRepo.dart';
import '../../../model/Movie.dart';
import '../../../model/MovieListResponse.dart';
import '../repository/MoviesListClassRepository.dart';


class MoviesListViewModel with ChangeNotifier {
  MovieListResponse? movieListResponse;
  MoviesListClassRepository? movieslistClassRepository;
  bool loading = false;
  List<Movie>? upcoming = <Movie>[];
  List<Movie>? newMovie = <Movie>[];

  MoviesListViewModel({
    this.movieListResponse,
    this.movieslistClassRepository
  });

  getAllMovieList() async {
    loading = true;
    var viewModel = MoviesListViewModel(movieslistClassRepository: MoviesListRepo());
    movieListResponse = await viewModel.movieslistClassRepository?.getAllMoviesList();
    loading = false;
    notifyListeners();

  }

  getAllMovieListByType(String type) async {
    loading = true;
    var viewModel = MoviesListViewModel(movieslistClassRepository: MoviesListRepo());
    movieListResponse = await viewModel.movieslistClassRepository?.getAllMoviesListByType(type);
    if(type == "New Movie"){
      newMovie = movieListResponse?.movie;
    }else {
      upcoming = movieListResponse?.movie;
    }
    loading = false;
    notifyListeners();

  }

  getAllMovieListByCategory(int id) async {
    loading = true;
    var viewModel = MoviesListViewModel(movieslistClassRepository: MoviesListRepo());
    movieListResponse = await viewModel.movieslistClassRepository?.getAllMoviesListByCategory(id);
    loading = false;
    notifyListeners();

  }
}