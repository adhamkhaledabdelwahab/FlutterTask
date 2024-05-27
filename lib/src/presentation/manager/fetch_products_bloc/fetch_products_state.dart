part of 'fetch_products_bloc.dart';

@immutable
abstract class FetchProductsState {
  final BlocState state;
  final List<ProductEntity>? data;
  final ResponseError? error;

  const FetchProductsState({
    this.state = BlocState.initial,
    this.data,
    this.error,
  });

  @override
  String toString() {
    return "State: $state";
  }
}

class FetchProductsInitial extends FetchProductsState {}

class FetchProductsStateHolder extends FetchProductsState {
  const FetchProductsStateHolder({
    super.state,
    super.data,
    super.error,
  });
}
