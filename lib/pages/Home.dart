import 'package:flutter/material.dart';
import 'package:movies/widgets/customBar.dart';
import 'package:movies/widgets/newMovies.dart';
import 'package:movies/widgets/upcomingWidgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ansaf",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "what to watch",
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      )
                    ],
                  ),
                  ClipRRect(
                    child: Image.asset(
                      "pictures/teqto_logo.jpg",
                      height: 60,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Flexible(
                    //width: 300,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Your Movies",
                        hintStyle: TextStyle(color: Colors.white12),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 33,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            upcomingWidgets(),
            SizedBox(
              height: 30,
            ),
            newMovies(),
          ],
        ),
      ),
      bottomNavigationBar: customBar(),
    );
  }
}
