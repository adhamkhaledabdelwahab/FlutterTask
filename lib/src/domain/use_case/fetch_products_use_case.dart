import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/repository/manager_repository.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchProductsUseCase
    implements UseCase<DataResponse<List<ProductEntity>>, NoParams> {
  final ManagerRepository _repo;

  FetchProductsUseCase({required ManagerRepository repo}) : _repo = repo;

  @override
  DataResponse<List<ProductEntity>> call(NoParams params) =>
      _repo.fetchProducts();
}
