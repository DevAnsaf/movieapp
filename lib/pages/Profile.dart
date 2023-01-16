import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userViewModel = UserViewModel(userClassRepository: UserRepo());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff555555),
          leading: IconButton(icon: Icon(Icons.arrow_back
          ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: const [
                Text(
                  'Profile Details',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500),

                ),
                SizedBox(
                  height: 20,
                  // color: Colors.white,
                ),
                TextField(
                  // controller: _nameController,
                      decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'First Name',
                      hintText: 'Enter First name',

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: _phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                      hintText: 'Enter Last name',
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ));
  }
}
