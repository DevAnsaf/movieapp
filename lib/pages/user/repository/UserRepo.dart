import 'dart:convert';

import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:http/http.dart' as http;
import 'package:movies/model/UserDataResponse.dart';

import '../../../utils/Constants.dart';
import 'UserClassRepository.dart';

class UserRepo extends UserClassRepository {
  Map<String, String> header = {"Content-Type": "application/json"};

  @override
  Future<CustomerResponse> login(LoginRequest request) {
    // TODO: implement login
    throw UnimplementedError();
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

  @override
  Future<UserDataResponse> getUserById(int id) async {
    try {
      var endpoint = Constants.getEndpoint("customers/$id");
      http.Response response = await http.get(Uri.parse(endpoint),
          headers: header);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData);
        UserDataResponse userDataResponseResponse = UserDataResponse.fromJson(jsonData);
        print(userDataResponseResponse.toJson());
        return userDataResponseResponse;
      } else {
        print("status code# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);

    }
    throw Exception("Error");
  }
}
