import 'package:flutter/material.dart';
import 'package:movies/widgets/customBar.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBar(),
    );
  }
}
