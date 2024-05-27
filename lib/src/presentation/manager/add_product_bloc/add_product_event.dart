part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class AddProduct extends AddProductEvent {
  final ProductParams params;

  AddProduct({required this.params});
}
