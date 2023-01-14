import 'package:flutter/material.dart';
import 'package:movies/model/CategoryData.dart';
import 'package:movies/model/CategoryResponse.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/pages/category/repository/CategoryClassRepository.dart';

import '../repository/CategoryRepo.dart';

class CategoryViewModel with ChangeNotifier {
  CategoryResponse? categoryResponse;
  List<CategoryData>? categories;
  bool loading = false;
  CategoryClassRepository? categoryClassRepository;

  CategoryViewModel({this.categoryResponse, this.categoryClassRepository});

  getAllCategories() async {
    var vieModel =  CategoryViewModel(categoryClassRepository: CategoryRepo());
    loading = true;
    categoryResponse = await vieModel.categoryClassRepository?.getAllCategory();
    categories = categoryResponse?.categoryData;
    loading = false;
    notifyListeners();
  }
}
