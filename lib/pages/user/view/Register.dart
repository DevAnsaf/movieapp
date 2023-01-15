import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';

import '../../../utils/Color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var userViewModel = UserViewModel(userClassRepository: UserRepo());
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _cpasswordVisible = false;

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initState() {
    _passwordVisible = false;
    _cpasswordVisible = false;
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter first name';
                                }
                                return null;
                              },
                              controller: firstnameController,
                              decoration: const InputDecoration(
                                hintText: "Enter first name",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              controller: lastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter last name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter last name",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
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
                              obscureText: !_cpasswordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter confirm password';
                                } else if (value !=
                                    passwordController.text.toString()) {
                                  return 'Password not match';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Confirm password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _cpasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: ColorConstants.commonAppColor,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _cpasswordVisible = !_cpasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                      backgroundColor: ColorConstants.commonAppColor),
                  child: const Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var request = RegisterRequest();
                      request.firstName = firstnameController.text.toString();
                      request.lastName = lastNameController.text.toString();
                      request.email = emailController.text.toString();
                      request.password = passwordController.text.toString();

                      print(request);

                      var response = await userViewModel
                          .customerRegister(request);

                      showSnackBar(response.message!,response.status!);
                      if (response.status == 1000){
                        Navigator.pop(context);
                      }


                      //print(response);
                    } else {}
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a Member?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: ColorConstants.commonAppColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
