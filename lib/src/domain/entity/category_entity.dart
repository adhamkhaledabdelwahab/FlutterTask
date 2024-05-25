import 'package:equatable/equatable.dart';
import 'package:flutter_task/src/core/constants/enums.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final ImageType imageType;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageType,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, imageType, image];
}
