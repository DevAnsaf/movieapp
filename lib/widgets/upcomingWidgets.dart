import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies/utils/Color.dart';

// ignore: camel_case_types
class upcomingWidgets extends StatelessWidget {
  const upcomingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                child:Text("All List >",style: TextStyle(
                  color: ColorConstants.commonAppColor,
                ))
                , onPressed: () {
                Navigator.pushNamed(context, "movieList");
              },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 1; i < 5; i++)
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "pictures/img$i.jpg",
                      height: 172,
                      width: 290,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
