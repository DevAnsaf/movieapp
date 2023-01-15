import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';

import '../../../model/LoginResponse.dart';

abstract class UserClassRepository {
  Future<CustomerResponse> getAllCustomer();
  Future<LoginResponse> login(LoginRequest request);
  Future<CustomerResponse> register(RegisterRequest request);
}