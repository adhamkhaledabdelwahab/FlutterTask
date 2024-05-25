import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/repository/manager_repository.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchCategoriesUserCase
    implements UseCase<DataResponse<List<CategoryEntity>>, NoParams> {
  final ManagerRepository _repo;

  FetchCategoriesUserCase({required ManagerRepository repo}) : _repo = repo;

  @override
  DataResponse<List<CategoryEntity>> call(NoParams params) =>
      _repo.fetchCategories();
}
