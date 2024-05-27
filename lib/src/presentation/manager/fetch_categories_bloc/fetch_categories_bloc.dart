import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/dependency_injection/di.dart';
import 'package:flutter_task/src/core/response/data_response.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';
import 'package:flutter_task/src/domain/use_case/fetch_categories_use_case.dart';
import 'package:flutter_task/src/domain/use_case/use_case.dart';

part 'fetch_categories_event.dart';

part 'fetch_categories_state.dart';

class FetchCategoriesBloc
    extends Bloc<FetchCategoriesEvent, FetchCategoriesState> {
  late final FetchCategoriesUserCase _fetchCategories;

  static FetchCategoriesBloc get(BuildContext context) =>
      BlocProvider.of(context);

  FetchCategoriesBloc() : super(FetchCategoriesInitial()) {
    _fetchCategories = getIt<FetchCategoriesUserCase>();
    on<FetchCategoriesEvent>((event, emit) {
      _fetchCategoriesCall(emit);
    });
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
