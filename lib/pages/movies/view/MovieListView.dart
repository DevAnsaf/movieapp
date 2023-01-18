import 'package:flutter/material.dart';
import 'package:movies/pages/movies/view/MovieDetails.dart';
import 'package:movies/pages/movies/viewModel/MoviesListViewModel.dart';
import 'package:movies/utils/Color.dart';
import 'package:provider/provider.dart';

import '../../../utils/Theme.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<MoviesListViewModel>(context, listen: false);
    if (widget.id != null) {
      provider.getAllMovieListByCategory(widget.id!);
    } else {
      provider.getAllMovieList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provided = Provider.of<MoviesListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text((widget.id != null)
            ? "${provided.movieListResponse?.movie?[0].category?.name}"
            : "Movies"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: provided.loading
            ? Center(child: const CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? 2
                        : 4,
                    childAspectRatio: 0.75),
                shrinkWrap: true,
                itemCount: provided.movieListResponse?.movie?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                movie:
                                    provided.movieListResponse?.movie?[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: ColorConstants.cardBackground,
                        margin: EdgeInsets.all(8),
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstants.cardBackground
                                    .withOpacity(1.0),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 5,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0)),

                                  // ignore: prefer_interpolation_to_compose_strings
                                  child: Image.network(
                                      '${provided.movieListResponse?.movie?[index].imageUrl}',
                                      height: 200,
                                      //width: 180,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${provided.movieListResponse?.movie?[index].name}',
                                    textAlign: TextAlign.center,
                                    style: ThemeConstant.movieListTitle,
                                    maxLines: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                }),
      ),
    );
  }
}
