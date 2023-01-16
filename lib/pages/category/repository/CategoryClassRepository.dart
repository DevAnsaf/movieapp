import 'package:movies/model/CategoryResponse.dart';

abstract class CategoryClassRepository {
  Future<CategoryResponse> getAllCategory();
}