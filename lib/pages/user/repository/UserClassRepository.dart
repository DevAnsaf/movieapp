import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/LoginRequest.dart';
import 'package:movies/model/RegisterRequest.dart';

abstract class UserClassRepository {
  Future<CustomerResponse> getAllCustomer();
  Future<CustomerResponse> login(LoginRequest request);
  Future<CustomerResponse> register(RegisterRequest request);
}