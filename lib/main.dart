import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/pages/movies/view/Home.dart';
import 'package:movies/pages/movies/view/MovieDetails.dart';
import 'package:movies/pages/movies/view/MovieListView.dart';
import 'package:movies/pages/Profile.dart';
import 'package:movies/pages/category/view/Category.dart';
import 'package:movies/pages/category/viewModel/CategoryViewModel.dart';
import 'package:movies/pages/movies/viewModel/MoviesListViewModel.dart';
import 'package:movies/pages/user/view/Register.dart';
import 'package:movies/pages/user/view/Login.dart';
import 'package:movies/utils/Helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
  ChangeNotifierProvider<MoviesListViewModel>(create: (_) => MoviesListViewModel()),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    //
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: Helper.isUserAvailable().toString() != ''
          ? const Home()
          : const LoginScreen(),
      //home: const Home(),
      routes: {
        "login": (context) => const LoginScreen(),
        "register": (context) => const Register(),
        "home": (context) => const Home(),
        "category": (context) => const Category(),
        "movie": (context) => const MovieDetails(),
        "movieList": (context) => const MovieListView(),
        "profile": (context) => const Profile(),
        "favourite": (context) => const MovieListView()
      },
    );
  }
}
