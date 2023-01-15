import 'package:flutter/material.dart';

import '../utils/Color.dart';

class newMovies extends StatelessWidget {
  const newMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int n = 1; n < 6; n++)
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "movie");
                    },
                    child: Container(
                      width: 200,
                      height: 320,
                      margin: const EdgeInsets.only(left: 12, bottom: 12),
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              "pictures/new$n.jpg",
                              height: 220,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Movies title$n",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Action/Adventure",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_purple500_outlined,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "3.5",
                                      style: TextStyle(
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
