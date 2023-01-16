import 'package:flutter/cupertino.dart';
import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/model/UserDataResponse.dart';
import 'package:movies/pages/user/repository/UserRepo.dart';


import '../repository/UserClassRepository.dart';

class UserViewModel with ChangeNotifier{
  CustomerResponse? customerResponse;
  UserDataResponse? userDataResponse;
  UserClassRepository? userClassRepository;
  List<CustomerData>? profile;
  bool loading = false;

  TextEditingController _firstname = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  TextEditingController getTotal()
  {
    return _firstname;
  }

  UserViewModel({this.customerResponse, this.userClassRepository});

  getCustomerById() async {
    var viewModel = UserViewModel(userClassRepository: UserRepo());
    loading = true;
    userDataResponse = (await viewModel.userClassRepository) as UserDataResponse?;
    _firstname.text = userDataResponse?.userData?.firstName ?? "";
    _lastname.text = userDataResponse?.userData?.lastName ?? "";
    _email.text = userDataResponse?.userData?.email ?? "";
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


}

class CustomerData {
}