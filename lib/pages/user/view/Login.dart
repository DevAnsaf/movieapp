import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/utils/Helper.dart';

import '../../../utils/Color.dart';
import '../../../utils/Theme.dart';
import '../../movies/view/Home.dart';
import '../repository/UserRepo.dart';
import '../viewModel/UserViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userViewModel = UserViewModel(userClassRepository: UserRepo());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  void showSnackBar(String message, int status) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: status == 1000 ? CupertinoColors.activeGreen : Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 20.0),
            Form(
                key: _formKey,
              child: Column(
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
                    child: const Text(
                      "login to enjoy",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: ThemeConstant.commonText),
                  ),
                  Container(
                    child:Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        title: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Enter email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!validateEmail(value)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: ThemeConstant.commonText),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      title: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorConstants.commonAppColor,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
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
                        if (_formKey.currentState!.validate()) {
                          var request = LoginRequest();
                          request.username = emailController.text.toString();
                          request.password = passwordController.text.toString();

                          var response =
                              await userViewModel.customerLogin(request);

                          print(response);



                          if (response.status == 1000){
                            showSnackBar(response.message!, response.status!);
                            Helper.saveUserData(response.data!);
                            Navigator. pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                            //Navigator.pushNamed(context, "home");
                          }else {

                          }
                        } else {}

                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text(
                        'Register',
                        style: TextStyle(color: ColorConstants.commonAppColor),
                      ),
                      onPressed: () {
                        emailController.text = "";
                        passwordController.text = "";

                        Navigator.pushNamed(context, "register");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
