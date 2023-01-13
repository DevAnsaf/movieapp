import 'package:flutter/material.dart';

import '../utils/Color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
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
                      const Text('Register',
                        style:TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10.0, ),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.black,),
                          title: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter first name",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10.0, ),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.black,),
                          title: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter last name",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10.0, ),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.black,),
                          title: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter email",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10.0, ),
                        child: ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Colors.black,),
                          title: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter password",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10.0,),
                        child: ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Colors.black,),
                          title: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15 ),
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                      backgroundColor: ColorConstants.commonAppColor),
                  child: const Text('Save'),
                  onPressed: () async {
                    Navigator.pushNamed(context, "home");
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                   const Text("Already a Member?",
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text('Login', style: TextStyle(
                          color: ColorConstants.commonAppColor
                      ),),
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
}
