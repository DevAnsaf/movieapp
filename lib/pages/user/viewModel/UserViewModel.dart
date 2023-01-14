import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/RegisterRequest.dart';


import '../repository/UserClassRepository.dart';

class UserViewModel {
  CustomerResponse? customerResponse;
  UserClassRepository? userClassRepository;

  UserViewModel({
    this.customerResponse,
    this.userClassRepository
});

  Future<CustomerResponse> customerRegister(RegisterRequest request) async {
    customerResponse = await userClassRepository?.register(request);
    return customerResponse!;
  }
}