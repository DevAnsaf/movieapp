import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies/utils/Color.dart';
import 'package:provider/provider.dart';

import '../pages/movies/viewModel/MoviesListViewModel.dart';

// ignore: camel_case_types
class UpComing extends StatefulWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  void initState() {
    super.initState();
    final movieProvider =
        Provider.of<MoviesListViewModel>(context, listen: false);
    movieProvider.getAllMovieListByType("Up Coming");
  }

  @override
  Widget build(BuildContext context) {
    final moviesPro = Provider.of<MoviesListViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Movies",
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
          height: 30,
        ),
        moviesPro.loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < (moviesPro.upcoming?.length ?? 0); i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            moviesPro.upcoming?[i].imageUrl ?? "pictures/img$i.jpg",
                            height: 172,
                            width: 290,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              )
      ],
    );
  }
}
