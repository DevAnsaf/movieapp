import 'package:flutter/material.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/pages/movies/repository/MoviesListRepo.dart';
import '../../../model/MovieListResponse.dart';
import '../repository/MoviesListClassRepository.dart';


class MoviesListViewModel with ChangeNotifier {
  MovieListResponse? movieListResponse;
  MoviesListClassRepository? movieslistClassRepository;
  bool loading = false;

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
}