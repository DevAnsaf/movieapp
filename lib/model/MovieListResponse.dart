import 'Movie.dart';

class MovieListResponse {
  MovieListResponse({
      this.movie, 
      this.status, 
      this.message,});

  MovieListResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      movie = [];
      json['data'].forEach((v) {
        movie?.add(Movie.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<Movie>? movie;
  int? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['data'] = movie?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}