import 'package:flutter_task/src/core/constants/cache_keys.dart';
import 'package:flutter_task/src/core/hive_service/hive_service.dart';
import 'package:flutter_task/src/data/model/category_model.dart';
import 'package:flutter_task/src/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import 'local_data_source.dart';

@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> addProduct(ProductModel product) async {
    await HiveService.instance.addValue(CacheKeys.ckProductsBox, product);
  }

  @override
  List<CategoryModel> fetchCategories() {
    return HiveService.instance
        .fetchAllData<CategoryModel>(CacheKeys.ckCategoryBox);
  }

  @override
  List<ProductModel> fetchProducts() {
    return HiveService.instance
        .fetchAllData<ProductModel>(CacheKeys.ckProductsBox);
  }
}
