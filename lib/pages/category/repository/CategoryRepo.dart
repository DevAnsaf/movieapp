import 'dart:convert';

import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/pages/category/repository/CategoryClassRepository.dart';
import 'package:movies/utils/Constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepo extends CategoryClassRepository {
  Map<String, String> header = {"Content-Type": "application/json"};

  @override
  Future<CustomerResponse> getAllCategory() {
    // TODO: implement getAllCategory
    throw UnimplementedError();
  }

  @override
  Future<CustomerResponse> login(LoginRequest request) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<CustomerResponse> register(RegisterRequest request) async {
    try {
      var endpoint = Constants.getEndpoint("categories/all");
      print(jsonEncode(request.toJson()));
      http.Response response = await http.post(Uri.parse(endpoint),
          headers: header, body: jsonEncode(request.toJson()));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        CustomerResponse loginResponse = CustomerResponse.fromJson(jsonData);
        print(loginResponse.toJson());
        return loginResponse;
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