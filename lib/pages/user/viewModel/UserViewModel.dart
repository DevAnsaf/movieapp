
import 'package:flutter/material.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/model/UserDataResponse.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';
import 'package:movies/utils/Helper.dart';


import '../../../model/Data.dart';
import '../../../model/LoginResponse.dart';
import '../repository/UserClassRepository.dart';

class UserViewModel with ChangeNotifier{

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname =  TextEditingController();
  TextEditingController email =  TextEditingController();

  CustomerResponse? customerResponse;
   LoginResponse? loginResponse;
  UserDataResponse? userDataResponse;
  UserClassRepository? userClassRepository;
  bool loading = false;





  UserViewModel({this.customerResponse, this.userClassRepository});

  getCustomerById() async {
    var viewModel = UserViewModel(userClassRepository: UserRepo());
    loading = true;
    userDataResponse = (await viewModel.userClassRepository) as UserDataResponse?;

    loading = false;
  }


  Future<CustomerResponse> customerRegister(RegisterRequest request) async {
    customerResponse = await userClassRepository?.register(request);
    return customerResponse!;
  }

  Future<UserDataResponse> customerById(int id) async {
    userDataResponse = await userClassRepository?.getUserById(id);
    return userDataResponse!;
  }

  Future<LoginResponse> customerLogin(LoginRequest request) async {
    loginResponse = await userClassRepository?.login(request);
    return loginResponse!;
  }

  getUserData() async {
    loading = true;
    await Helper.getUserData().then((value) => {
       firstname.text = value?.firstName ?? "",
       lastname.text = value?.lastName ?? "",
       email.text = value?.email ?? "",

    });
    loading = false;
    notifyListeners();
  }

}

