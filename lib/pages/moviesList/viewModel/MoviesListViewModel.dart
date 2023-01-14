import 'package:movies/model/CustomerResponse.dart';
import 'package:movies/model/RegisterRequest.dart';
import 'package:movies/pages/moviesList/repository/MoviesListClassRepository.dart';


class MoviesListViewModel {
  CustomerResponse? customerResponse;
  MoviesListClassRepository? movieslistClassRepository;

  MoviesListViewModel({
    this.customerResponse,
    this.movieslistClassRepository
  });

  Future<CustomerResponse> customerRegister(RegisterRequest request) async {
    customerResponse = await movieslistClassRepository?.register(request);
    return customerResponse!;
  }
}