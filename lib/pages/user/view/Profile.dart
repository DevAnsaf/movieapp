
import 'package:flutter/material.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';
import 'package:movies/pages/user/view/Login.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';
import 'package:provider/provider.dart';
import '../../../utils/Color.dart';
import '../../../utils/Helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  get user => null;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var userViewModel = UserViewModel(userClassRepository: UserRepo());

  // final TextEditingController _firstnameController = TextEditingController();
  // final TextEditingController _lastnameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();


  @override
  void initState()  {
    super.initState();

    final postMdl = Provider.of<UserViewModel>(context, listen: false);
    postMdl.getUserData();

    // var response =
    // userViewModel.customerById(2);
    // print(response.toString());
    //
    // _firstnameController.text = "Sreeginy";
    // _lastnameController.text = "giny";
    // _emailController.text = "abc@gmail.com";

  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View User Profile'),
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(icon: Icon(Icons.arrow_back
        ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:Container(
        child: postMdl.loading
            ? Container(
          child: CircularProgressIndicator(),
        ):

        Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      //show image
                    CircleAvatar(

                        radius: 100,
                      backgroundImage: AssetImage('pictures/profile.png'),
                      ),
                      ]
                 ),
                // Padding(padding: EdgeInsets.only(left: 100),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.black54,
                //     child: IconButton(
                //       icon: const Icon(
                //         Icons.edit,
                //         color: Colors.white,
                //       ), onPressed: () {},
                //     ),
                //   ),
                // ),
                const SizedBox(
                  width: 20,
                  height:40,
              ),
                Container
                  (margin: EdgeInsets.only(top: 20),
                  child:Card(
                    color: Colors.white,
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
                         controller: postMdl.firstname,
                          decoration: const InputDecoration(
                          hintText: "Enter first name",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:Card(
                    color: Colors.white,
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
                         controller: postMdl.lastname,
                        decoration: const InputDecoration(
                          hintText: "Enter Last name",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      title: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                         controller: postMdl.email,
                        decoration: const InputDecoration(
                          hintText: "Enter Mail",
                        ),
                      ),
                    ),
                  ),
                ),
          Container(
          margin:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: double.maxFinite,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // <-- Radius
              ),
              backgroundColor: ColorConstants.commonAppColor),
          child: const Text('Logout'),
          onPressed: ()  {
            Helper.removeAllPref();

            Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);

          },
        ),
      ),
      ]
        ),
      ],
        ),
    ),
    );

  }

}


