part of 'manager_bloc.dart';

enum BlocState { initial, loading, success, error }

@immutable
abstract class ManagerState<T> {
  final BlocState state;
  final T? data;
  final ResponseError? error;

  const ManagerState({
    this.state = BlocState.initial,
    this.data,
    this.error,
  });

  @override
  String toString() {
    return "State: $state";
  }
}

class InitialStateHolder extends ManagerState<void> {
  const InitialStateHolder() : super();
}

class AddProductStateHolder extends ManagerState<void> {
  const AddProductStateHolder({
    super.state,
    super.error,
  });
}

class FetchCategoriesStateHolder extends ManagerState<List<CategoryEntity>> {
  const FetchCategoriesStateHolder({
    super.state,
    super.data,
    super.error,
  });
}

class FetchProductsStateHolder extends ManagerState<List<ProductEntity>> {
  const FetchProductsStateHolder({
    super.state,
    super.data,
    super.error,
  });
}
