import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';

import '../../../model/UserDataResponse.dart';

import '../../../model/LoginResponse.dart';

abstract class UserClassRepository {
  Future<UserDataResponse> getUserById(int id);
  Future<LoginResponse> login(LoginRequest request);
  Future<CustomerResponse> register(RegisterRequest request);
}