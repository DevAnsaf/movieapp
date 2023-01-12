import 'package:flutter/material.dart';

import '../widgets/MovieDetailsButtons.dart';
import '../widgets/RecommendMovies.dart';
import '../widgets/customBar.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Behind image
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              "pictures/img1.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Image and play button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          /*boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8,
                            ),
                          ],*/
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "pictures/img1.jpg",
                            height: 200,
                            width: 180,
                          ),
                        ),
                      ),
                      //Play button
                      Container(
                        margin: const EdgeInsets.only(right: 50, top: 50),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MovieDetailsButtons(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Movie title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You can write the description of the movie here.You can write the description of the movie here.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RecommendMovies(),
              ],
            ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: customBar(),
    );
  }
}