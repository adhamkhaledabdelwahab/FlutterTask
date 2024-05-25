import 'package:flutter_task/src/data/model/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    final json = Map<String, dynamic>.from(reader.readMap());
    return CategoryModel.fromJson(json);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeMap(obj.toJson());
  }
}
