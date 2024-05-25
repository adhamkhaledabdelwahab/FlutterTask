import 'package:flutter_task/src/data/model/product_model.dart';
import 'package:hive_flutter/adapters.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  ProductModel read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.readMap());
    return ProductModel.fromJson(json);
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.writeMap(obj.toJson());
  }
}
