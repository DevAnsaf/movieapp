import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/pages/category/repository/CategoryClassRepository.dart';

class CategoryViewModel {
  CustomerResponse? customerResponse;
  CategoryClassRepository? categoryClassRepository;

  CategoryViewModel({
    this.customerResponse,
    this.categoryClassRepository
  });

  Future<CustomerResponse> customerRegister(RegisterRequest request) async {
    customerResponse = await categoryClassRepository?.register(request);
    return customerResponse!;
  }
}