import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies/pages/movies/view/Home.dart';
import 'package:movies/pages/movies/view/MovieDetails.dart';
import 'package:movies/pages/movies/view/MovieListView.dart';
import 'package:movies/pages/splash/view/SplashScreen.dart';
import 'package:movies/pages/user/view/Profile.dart';
import 'package:movies/pages/category/view/Category.dart';
import 'package:movies/pages/category/viewModel/CategoryViewModel.dart';
import 'package:movies/pages/movies/viewModel/MoviesListViewModel.dart';
import 'package:movies/pages/user/view/Register.dart';
import 'package:movies/pages/user/view/Login.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';
import 'package:movies/utils/Helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}



List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CategoryViewModel>(create: (_) => CategoryViewModel()),
  ChangeNotifierProvider<MoviesListViewModel>(
      create: (_) => MoviesListViewModel()),
  ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isUserAvailable = false;
  @override
  void initState() {
    final postMdl = Provider.of<UserViewModel>(context, listen: false);
    postMdl.getUserData();

    FlutterNativeSplash.remove();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<UserViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black54,
      ),
      initialRoute: postMdl.isUser ? "home": "login" ,
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
