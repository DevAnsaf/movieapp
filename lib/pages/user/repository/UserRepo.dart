import 'dart:convert';

import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:http/http.dart' as http;

import '../../../model/LoginResponse.dart';
import '../../../utils/Constants.dart';
import 'UserClassRepository.dart';

class UserRepo extends UserClassRepository {
  Map<String, String> header = {"Content-Type": "application/json"};

  @override
  Future<CustomerResponse> getAllCustomer() {
    // TODO: implement getAllCustomer
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      var endpoint = Constants.getEndpoint("customers/login");
      http.Response response = await http.post(Uri.parse(endpoint),
          headers: header, body: jsonEncode(request.toJson()));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(jsonData);
        print(loginResponse.toJson());
        return loginResponse;
      } else {
        print("status code# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("Error");
  }

  @override
  Future<CustomerResponse> register(RegisterRequest request) async {
    try {
      var endpoint = Constants.getEndpoint("customers/add");
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
    throw Exception("Error");
  }

}
