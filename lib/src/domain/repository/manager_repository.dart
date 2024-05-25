import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/use_case/add_product_use_case.dart';

abstract class ManagerRepository {
  DataResponse<List<ProductEntity>> fetchProducts();

  DataResponse<List<CategoryEntity>> fetchCategories();

  Future<DataResponse<void>> addProduct(ProductParams params);
}
