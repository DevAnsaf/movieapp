import 'package:flutter/material.dart';
import 'package:movies/pages/movies/viewModel/MoviesListViewModel.dart';
import 'package:movies/widgets/customBar.dart';
import 'package:movies/widgets/newMovies.dart';
import 'package:movies/widgets/upcomingWidgets.dart';
import 'package:provider/provider.dart';

import '../../user/viewModel/UserViewModel.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<UserViewModel>(context, listen: false);
    postMdl.getUserData();
  }
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<UserViewModel>(context);
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
                        ("${postMdl.firstname.text} ${postMdl.lastname.text}") ?? '',
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
                      "pictures/logo.png",
                      height: 60,
                      width: 50,
                      color: Colors.white,
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
            UpComing(),
            SizedBox(
              height: 30,
            ),
            NewMovies(),
          ],
        ),
      ),
      bottomNavigationBar: customBar(),
    );
  }
}
