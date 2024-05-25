import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/core/dependency_injection/di.dart';
import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/use_case/add_product_use_case.dart';
import 'package:flutter_task/src/domain/use_case/fetch_categories_use_case.dart';
import 'package:flutter_task/src/domain/use_case/fetch_products_use_case.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';

part 'manager_event.dart';

part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  late final AddProductUserCase _addProduct;
  late final FetchCategoriesUserCase _fetchCategories;
  late final FetchProductsUseCase _fetchProducts;

  static ManagerBloc get(BuildContext context) => BlocProvider.of(context);

  ManagerBloc() : super(const InitialStateHolder()) {
    _addProduct = getIt<AddProductUserCase>();
    _fetchCategories = getIt<FetchCategoriesUserCase>();
    _fetchProducts = getIt<FetchProductsUseCase>();
    on<ManagerEvent>((event, emit) {
      switch ((event as ManagerEventHolder).event) {
        case ManagerEvents.addProduct:
          _addProductCall(event.params as ProductParams, emit);
          break;
        case ManagerEvents.fetchProducts:
          _fetchProductsCall(emit);
          break;
        case ManagerEvents.fetchCategories:
          _fetchCategoriesCall(emit);
          break;
      }
    });
  }

  Future _addProductCall(ProductParams params, Emitter emit) async {
    emit(const AddProductStateHolder(state: BlocState.loading));
    final response = await _addProduct.call(params);
    switch (response.responseType) {
      case ResponseType.success:
        emit(const AddProductStateHolder(state: BlocState.success));
        break;
      case ResponseType.error:
        emit(
          AddProductStateHolder(
            state: BlocState.error,
            error: response.error,
          ),
        );
        break;
    }
  }

  void _fetchProductsCall(Emitter emit) {
    emit(const FetchProductsStateHolder(state: BlocState.loading));
    final response = _fetchProducts.call(NoParams());
    switch (response.responseType) {
      case ResponseType.success:
        emit(
          FetchProductsStateHolder(
            state: BlocState.success,
            data: response.data,
          ),
        );
        break;
      case ResponseType.error:
        emit(
          FetchProductsStateHolder(
            state: BlocState.error,
            error: response.error,
          ),
        );
        break;
    }
  }

  void _fetchCategoriesCall(Emitter emit) {
    emit(const FetchCategoriesStateHolder(state: BlocState.loading));
    final response = _fetchCategories.call(NoParams());
    switch (response.responseType) {
      case ResponseType.success:
        emit(
          FetchCategoriesStateHolder(
            state: BlocState.success,
            data: response.data,
          ),
        );
        break;
      case ResponseType.error:
        emit(
          FetchCategoriesStateHolder(
            state: BlocState.error,
            error: response.error,
          ),
        );
        break;
    }
  }
}
