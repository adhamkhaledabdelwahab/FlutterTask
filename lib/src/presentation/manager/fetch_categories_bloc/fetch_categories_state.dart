part of 'fetch_categories_bloc.dart';

@immutable
abstract class FetchCategoriesState {
  final BlocState state;
  final List<CategoryEntity>? data;
  final ResponseError? error;

  const FetchCategoriesState({
    this.state = BlocState.initial,
    this.data,
    this.error,
  });

  @override
  String toString() {
    return "State: $state";
  }
}

class FetchCategoriesInitial extends FetchCategoriesState {}

class FetchCategoriesStateHolder extends FetchCategoriesState {
  const FetchCategoriesStateHolder({
    super.state,
    super.data,
    super.error,
  });
}
