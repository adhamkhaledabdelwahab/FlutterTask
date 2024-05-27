part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {
  final BlocState state;
  final ProductEntity? product;
  final ResponseError? error;

  const AddProductState({
    this.state = BlocState.initial,
    this.product,
    this.error,
  });

  @override
  String toString() {
    return "State: $state";
  }
}

class AddProductInitial extends AddProductState {}

class AddProductStateHolder extends AddProductState {
  const AddProductStateHolder({
    super.state,
    super.product,
    super.error,
  });
}
