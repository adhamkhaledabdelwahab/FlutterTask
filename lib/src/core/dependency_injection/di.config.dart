// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/local_data_source.dart' as _i3;
import '../../data/data_source/local_data_source_impl.dart' as _i4;
import '../../data/respository/manager_repository_impl.dart' as _i6;
import '../../domain/repository/manager_repository.dart' as _i5;
import '../../domain/use_case/add_product_use_case.dart' as _i7;
import '../../domain/use_case/fetch_categories_use_case.dart' as _i8;
import '../../domain/use_case/fetch_products_use_case.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocalDataSource>(() => _i4.LocalDataSourceImpl());
    gh.factory<_i5.ManagerRepository>(
        () => _i6.ManagerRepositoryImpl(source: gh<_i3.LocalDataSource>()));
    gh.factory<_i7.AddProductUserCase>(
        () => _i7.AddProductUserCase(repo: gh<_i5.ManagerRepository>()));
    gh.factory<_i8.FetchCategoriesUserCase>(
        () => _i8.FetchCategoriesUserCase(repo: gh<_i5.ManagerRepository>()));
    gh.factory<_i9.FetchProductsUseCase>(
        () => _i9.FetchProductsUseCase(repo: gh<_i5.ManagerRepository>()));
    return this;
  }
}
