import 'dart:convert';

import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/Data.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/pages/category/repository/CategoryClassRepository.dart';
import 'package:movies/utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:movies/utils/Helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/CategoryResponse.dart';

class CategoryRepo extends CategoryClassRepository {


  @override
  Future<CategoryResponse> getAllCategory() async {
    var prefs = await SharedPreferences.getInstance();
    final myString = prefs.getString(Helper.userData) ?? '';
    Map userMap = jsonDecode(myString);
    var user = Data.fromJson(userMap);

    Map<String, String> tokenHeader = {
      "Content-Type": "application/json",
      "authorization": "Bearer ${user.token}"
    };
    try {
      var endpoint = Constants.getEndpoint("category/all");
      http.Response response = await http.get(Uri.parse(endpoint),
          headers: tokenHeader);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        CategoryResponse categoryResponse = CategoryResponse.fromJson(jsonData);
        print(categoryResponse.toJson());
        return categoryResponse;
      } else {
        print("status code# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    // TODO: implement register
    throw Exception("Error");
  }

}