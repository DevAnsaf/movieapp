import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/pages/Home.dart';
import 'package:movies/pages/MovieDetails.dart';
import 'package:movies/pages/profile2.dart';
import 'package:movies/pages/user/view/Register.dart';
import 'package:movies/pages/moviesList/view/MovieListView.dart';
import 'package:movies/pages/user/view/Login.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/Category.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );

}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
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
      home: const LoginScreen(),
      //home: const Home(),
      routes: {
        "login": (context) => const LoginScreen(),
        "register": (context) => const Register(),
        "home": (context) => const Home(),
        "category": (context) => const Category(),
        "movie": (context) => const MovieDetails(),
        "movieList": (context) => const MovieListView(),
        "profile": (context) => const Profile(),
        "favourite":(context) => const MovieListView()
      },
    );
  }
}
