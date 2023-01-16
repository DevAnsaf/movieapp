import 'package:flutter/material.dart';
import 'package:movies/main.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';
import 'package:movies/pages/user/viewModel/UserViewModel.dart';
import 'package:movies/widgets/customBar.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userViewModel = UserViewModel(userClassRepository: UserRepo());


  @override
  void initState()  {
    super.initState();
    final postMdl = Provider.of<UserViewModel>(context, listen: false);
    postMdl.customerById(9);

    // var response =
    //      userViewModel.customerById(2);
    // print(response.toString());

  }

  Widget textfield({required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<UserViewModel>(context);
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
      body: Container(
        child: postMdl.loading
            ? Container(
          child: CircularProgressIndicator(),
        ):
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //   TextFormField(
                      //     controller: postMdl.getTotal(),
                      //     decoration: InputDecoration(
                      //     labelText: 'User Name',
                      //   ),
                      // ),
                      // const TextField(
                      //     // controller: postMdl.getTotal(),
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'First Name',
                      //     hintText: 'Enter First name',
                      //
                      //   ),
                      // ),
                      textfield(
                          hintText: 'Mathusan'
                      ),
                      textfield(
                          hintText: 'mathu'
                      ),
                      // TextField(
                      //   controller: postMdl.getTotal(),
                      // ),
                      textfield(
                          hintText: 'mathu@gmail.com'
                      ),
                      Container(
                        height: 55,
                        color: Colors.red,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {

                          },
                          child: const Center(
                            child: Text("Logout", style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            CustomPaint(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('pictures/profile.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 270, left: 184),
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ), onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);


}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 250)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(1, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }


}
