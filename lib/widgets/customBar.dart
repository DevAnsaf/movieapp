import 'package:flutter/material.dart';

class customBar extends StatelessWidget {
  const customBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 18),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //home
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "home");
            },
            child: Icon(
              Icons.home,
              size: 40,
              color: Colors.white70,
            ),
          ),
          //category
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "category");
            },
            child: Icon(
              Icons.list_rounded,
              size: 40,
              color: Colors.white70,
            ),
          ),
          //favourite
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "favourite");
            },
            child: Icon(
              Icons.bookmark_added_rounded,
              size: 40,
              color: Colors.white70,
            ),
          ),
          //Account
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "login");
            },
            child: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
