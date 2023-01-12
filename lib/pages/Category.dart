import 'package:flutter/material.dart';
import 'package:movies/widgets/customBar.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
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
                      height: 30,
                    ),
                    const Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    for(int i = 1; i < 5; i++ )
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: [
                            ClipRect(
                              child: Image.asset(
                                "pictures/img$i.jpg",
                                height: 70,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 23,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const customBar(),
    );
  }
}
