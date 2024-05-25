part of 'manager_bloc.dart';

@immutable
abstract class ManagerEvent {}

enum ManagerEvents { addProduct, fetchProducts, fetchCategories }

class ManagerEventHolder<T> extends ManagerEvent {
  final ManagerEvents event;
  final T? params;

  ManagerEventHolder({required this.event, this.params});
}
