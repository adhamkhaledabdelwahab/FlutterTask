import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/data/data_source/local_data_source.dart';
import 'package:flutter_task/src/data/model/category_model.dart';
import 'package:flutter_task/src/data/model/product_model.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/repository/manager_repository.dart';
import 'package:flutter_task/src/domain/use_case/add_product_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ManagerRepository)
class ManagerRepositoryImpl implements ManagerRepository {
  final LocalDataSource _source;

  ManagerRepositoryImpl({required LocalDataSource source}) : _source = source;

  @override
  Future<DataResponse<ProductEntity>> addProduct(ProductParams params) async {
    try {
      final product = ProductModel(
        id: params.id,
        name: params.name,
        price: params.price,
        categoryModel: CategoryModel(
          id: params.category.id,
          name: params.category.name,
          image: params.category.image,
          imageType: params.category.imageType,
        ),
        store: params.store,
        image: params.images.first,
        imageType: ImageType.external,
      );
      await _source.addProduct(product);
      return DataResponse<ProductEntity>(
        responseType: ResponseType.success,
        data: product,
      );
    } catch (e) {
      return DataResponse<ProductEntity>(
        responseType: ResponseType.error,
        error: ResponseError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  DataResponse<List<CategoryEntity>> fetchCategories() {
    try {
      final data = _source.fetchCategories();
      return DataResponse<List<CategoryEntity>>(
        responseType: ResponseType.success,
        data: data,
      );
    } catch (e) {
      return DataResponse<List<CategoryEntity>>(
        responseType: ResponseType.error,
        error: ResponseError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  DataResponse<List<ProductEntity>> fetchProducts() {
    try {
      final data = _source.fetchProducts();
      return DataResponse<List<ProductEntity>>(
        responseType: ResponseType.success,
        data: data,
      );
    } catch (e) {
      return DataResponse<List<ProductEntity>>(
        responseType: ResponseType.error,
        error: ResponseError(
          message: e.toString(),
        ),
      );
    }
  }
}
