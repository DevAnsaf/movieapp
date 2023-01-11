import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/pages/Home.dart';

import 'pages/Category.dart';

void main() {
  runApp(const MyApp());
}

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
      routes: {
        "home": (context) => const Home(),
        "category": (context) => const Category(),

        // "favourite": (context) => const Favourite(),
      },
    );
  }
}
