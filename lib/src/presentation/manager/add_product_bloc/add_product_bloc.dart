import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/dependency_injection/di.dart';
import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';
import 'package:flutter_task/src/domain/use_case/add_product_use_case.dart';

part 'add_product_event.dart';

part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  late final AddProductUserCase _addProduct;

  static AddProductBloc get(BuildContext context) => BlocProvider.of(context);

  AddProductBloc() : super(AddProductInitial()) {
    _addProduct = getIt<AddProductUserCase>();
    on<AddProductEvent>((event, emit) async {
      await _addProductCall((event as AddProduct).params, emit);
    });
  }

  Future _addProductCall(ProductParams params, Emitter emit) async {
    emit(const AddProductStateHolder(state: BlocState.loading));
    final response = await _addProduct.call(params);
    switch (response.responseType) {
      case ResponseType.success:
        emit(
          AddProductStateHolder(
            state: BlocState.success,
            product: response.data!,
          ),
        );
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
}
