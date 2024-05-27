import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/dependency_injection/di.dart';
import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/use_case/fetch_products_use_case.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';

part 'fetch_products_event.dart';

part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  late final FetchProductsUseCase _fetchProducts;

  static FetchProductsBloc get(BuildContext context) =>
      BlocProvider.of(context);

  FetchProductsBloc() : super(FetchProductsInitial()) {
    _fetchProducts = getIt<FetchProductsUseCase>();
    on<FetchProductsEvent>((event, emit) {
      _fetchProductsCall(emit);
    });
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
}
