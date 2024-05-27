import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/repository/manager_repository.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddProductUserCase
    implements UseCase<Future<DataResponse<ProductEntity>>, ProductParams> {
  final ManagerRepository _repo;

  AddProductUserCase({required ManagerRepository repo}) : _repo = repo;

  @override
  Future<DataResponse<ProductEntity>> call(ProductParams params) =>
      _repo.addProduct(params);
}

class ProductParams {
  final String id;
  final String name;
  final num price;
  final CategoryEntity category;
  final String store;
  final List<String> images;

  ProductParams({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.store,
    required this.images,
  });
}
