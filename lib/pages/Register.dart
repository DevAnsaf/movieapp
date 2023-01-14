import 'package:flutter/material.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          )
                      ),
                      onPressed: (){}, child: const Text("Save")
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Text("Already a Member?Click here!",
                     style: TextStyle(
                       color: Colors.white,
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
