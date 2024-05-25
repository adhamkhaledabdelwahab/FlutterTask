import 'package:flutter_task/src/data/model/category_model.dart';
import 'package:flutter_task/src/data/model/product_model.dart';

abstract class LocalDataSource {
  List<ProductModel> fetchProducts();

  List<CategoryModel> fetchCategories();

  Future<void> addProduct(ProductModel product);
}
