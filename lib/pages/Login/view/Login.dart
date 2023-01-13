import 'package:flutter/material.dart';

import '../../../utils/Color.dart';
import '../../../utils/Theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Image.asset('pictures/popcorn.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Welcome to Cine Max",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 5),
                  alignment: Alignment.center,
                  child: const Text("login to enjoy", style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("Email", style: ThemeConstant.commonText),
                ),
                SizedBox(
                  height: 46.0,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 8),
                  alignment: Alignment.centerLeft,
                  child:
                  Text("Password", style: ThemeConstant.commonText),
                ),
                SizedBox(
                  height: 46.0,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.maxFinite,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // <-- Radius
                        ),
                        backgroundColor: ColorConstants.commonAppColor),
                    child: const Text('Login'),
                    onPressed: () async {
                      Navigator.pushNamed(context, "home");
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text('Register', style: TextStyle(
                      color: ColorConstants.commonAppColor
                    ),),
                    onPressed: () {
                      Navigator.pushNamed(context, "register");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
