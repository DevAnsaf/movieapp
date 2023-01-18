import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/movies/view/MovieDetails.dart';
import '../pages/movies/viewModel/MoviesListViewModel.dart';
import '../utils/Color.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({Key? key}) : super(key: key);

  @override
  State<NewMovies> createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  @override
  void initState() {
    super.initState();
    final movieProvider =
        Provider.of<MoviesListViewModel>(context, listen: false);
    movieProvider.getAllMovieListByType("New Movie");
  }

  @override
  Widget build(BuildContext context) {
    final moviesPro = Provider.of<MoviesListViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                child: Text("All List >",
                    style: TextStyle(
                      color: ColorConstants.commonAppColor,
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, "movieList");
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        moviesPro.loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int n = 0; n < (moviesPro.newMovie?.length ?? 0); n++)
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetails(movie: moviesPro.newMovie![n]),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            height: 320,
                            margin: const EdgeInsets.only(left: 12, bottom: 12, top: 5, right: 10),
                            decoration: BoxDecoration(
                                color: ColorConstants.cardBackground,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.8),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    moviesPro.newMovie?[n].imageUrl ?? "pictures/img$n.jpg",
                                    height: 220,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        moviesPro.newMovie?[n].name ?? "",
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                       Text(
                                        moviesPro.newMovie?[n].category?.name ?? "Action",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons
                                                .star,
                                            color: Colors.orange,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            moviesPro.newMovie?[n].rating ?? "5",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                  ],
                ),
              )
      ],
    );
  }
}
