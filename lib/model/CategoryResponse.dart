import 'CategoryData.dart';

class CategoryResponse {
  CategoryResponse({
      this.categoryData, 
      this.status, 
      this.message,});

  CategoryResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      categoryData = [];
      json['data'].forEach((v) {
        categoryData?.add(CategoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  List<CategoryData>? categoryData;
  int? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categoryData != null) {
      map['data'] = categoryData?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}