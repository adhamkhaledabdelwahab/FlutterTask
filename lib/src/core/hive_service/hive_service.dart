import 'dart:math';

import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/src/core/constants/cache_keys.dart';
import 'package:flutter_task/src/core/constants/enums.dart';
import 'package:flutter_task/src/core/hive_service/category_adapter.dart';
import 'package:flutter_task/src/core/hive_service/product_adapter.dart';
import 'package:flutter_task/src/data/model/category_model.dart';
import 'package:flutter_task/src/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveService {
  static HiveService instance = HiveService._instance();

  HiveService._();

  factory HiveService._instance() => HiveService._();

  static const uuid = Uuid();

  Future initHiveData() async {
    await Hive.initFlutter();
    Hive.registerAdapter<ProductModel>(ProductModelAdapter());
    Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    final isCategories = await Hive.boxExists(CacheKeys.ckCategoryBox);
    final isProducts = await Hive.boxExists(CacheKeys.ckProductsBox);
    await Hive.openBox<CategoryModel>(CacheKeys.ckCategoryBox);
    await Hive.openBox<ProductModel>(CacheKeys.ckProductsBox);
    if (!isCategories) {
      for (int i = 1; i <= 3; i++) {
        final value = CategoryModel(
          id: uuid.v1(),
          name: "تصنيف $i",
          image: switch (i) {
            (1) => Assets.images.imgCategory1.path,
            (2) => Assets.images.imgCategory2.path,
            (3) || (_) => Assets.images.imgCategory3.path,
          },
          imageType: ImageType.assets,
        );
        await addValue<CategoryModel>(CacheKeys.ckCategoryBox, value);
      }
    }
    if (!isProducts) {
      for (int i = 1; i <= 4; i++) {
        final categories = fetchAllData<CategoryModel>(CacheKeys.ckCategoryBox);
        final product = ProductModel(
          id: uuid.v1(),
          name: "اسم المنتج $i",
          price: 120 + (i * (Random().nextInt(500) + 10)),
          categoryModel: categories[Random().nextInt(3)],
          store: "اسم المتجر $i",
          image: switch (i) {
            (1) => Assets.images.imgProduct1.path,
            (2) => Assets.images.imgProduct2.path,
            (3) => Assets.images.imgProduct3.path,
            (4) || (_) => Assets.images.imgProduct4.path,
          },
          imageType: ImageType.assets,
        );
        await addValue<ProductModel>(CacheKeys.ckProductsBox, product);
      }
    }
  }

  Future addValue<T>(String boxName, T value) async {
    final box = Hive.box<T>(boxName);
    await box.add(value);
  }

  List<T> fetchAllData<T>(String boxName) {
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }
}
