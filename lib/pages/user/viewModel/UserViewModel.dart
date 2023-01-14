import 'package:flutter/material.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';


import '../../../model/LoginResponse.dart';
import '../repository/UserClassRepository.dart';

class UserViewModel extends ChangeNotifier {

   TextEditingController firstnameController = TextEditingController();
   TextEditingController lastNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  CustomerResponse? customerResponse;
   LoginResponse? loginResponse;
  UserClassRepository? userClassRepository;

  UserViewModel({
    this.customerResponse,
    this.userClassRepository
});

  TextEditingController firstName(){
    return firstnameController;
  }



  Future<CustomerResponse> customerRegister(RegisterRequest request) async {
    customerResponse = await userClassRepository?.register(request);
    return customerResponse!;
  }

   Future<LoginResponse> customerLogin(LoginRequest request) async {
     loginResponse = await userClassRepository?.login(request);
     return loginResponse!;
   }
}