import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/domain/entity/product_entity.dart';

import 'category_model.dart';

class ProductModel extends ProductEntity {
  final CategoryModel categoryModel;

  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required this.categoryModel,
    required super.store,
    required super.image,
    required super.imageType,
  }) : super(category: categoryModel);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      categoryModel: CategoryModel.fromJson(
        Map<String, dynamic>.from(json['category']),
      ),
      store: json['store'],
      imageType: ImageType.fromVal(json['image_type']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category": categoryModel.toJson(),
        "store": store,
        "image": image,
        "image_type": imageType.val,
      };
}
