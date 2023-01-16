import 'package:flutter/material.dart';
import 'package:movies/pages/category/repository/CategoryRepo.dart';
import 'package:movies/pages/category/viewModel/CategoryViewModel.dart';
import 'package:movies/utils/Color.dart';
import 'package:movies/widgets/customBar.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}


class _CategoryState extends State<Category> {
  //var categoryViewModel = CategoryViewModel(categoryClassRepository: CategoryRepo());
  @override
  void initState() {
    super.initState();
    final provide = Provider.of<CategoryViewModel>(context,listen: false);
    provide.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final provided = Provider.of<CategoryViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child:provided.loading ? Center(child: const CircularProgressIndicator()) : Column(
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
                      for(int i = 0; i < (provided.categories?.length ?? 0); i++ )
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "movieList");
                            },
                            child:Card(
                              elevation: 0.5,
                              color: ColorConstants.cardBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0)),
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
                                   Text(
                                    "${provided.categories![i].name}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const customBar(),
    );
  }
}
