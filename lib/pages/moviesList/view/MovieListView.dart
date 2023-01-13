import 'package:flutter/material.dart';
import 'package:movies/utils/Color.dart';

import '../../../utils/Theme.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  List image = [
    'img1.jpg',
    'img2.jpg',
    'img3.jpg',
    'img4.jpg',
    'img5.jpg',
    'img2.jpg',
    'img3.jpg',
    'img4.jpg',
    'img1.jpg',
    'img3.jpg',
    'img5.jpg'
  ];

  List imageText = [
    'Treasure Planet',
    'Up',
    'Brave',
    'Lion King',
    'Finding Nemo',
    'Up',
    'Brave',
    'Lion King',
    'Treasure Planet',
    'Brave',
    'Finding Nemo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white,
            onPressed:() {
              Navigator.pop(context);
            },
        ),
        title: const Text("Movies"),
        centerTitle: true,
        backgroundColor: ColorConstants.commonAppColor,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 4,
          childAspectRatio: 0.75
          ),
          shrinkWrap: true,
          itemCount: image.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "movie");
              },
                child:Card(
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
                          color: ColorConstants.cardBackground.withOpacity(1.0),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0)),

                          // ignore: prefer_interpolation_to_compose_strings
                          child: Image.asset(
                              'pictures/'+image[index],
                              height: 200,
                              // width: 120,
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            imageText[index],
                            style: ThemeConstant.movieListTitle,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            );

          }),
    );
  }
}
