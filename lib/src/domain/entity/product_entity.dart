import 'package:equatable/equatable.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/domain/entity/category_entity.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final num price;
  final CategoryEntity category;
  final String store;
  final String image;
  final ImageType imageType;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.store,
    required this.image,
    required this.imageType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        category,
        store,
        image,
        imageType,
      ];
}
