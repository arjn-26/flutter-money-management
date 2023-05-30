import 'package:flutter_money_management/models/category/category_model.dart';
import 'package:hive_flutter/adapters.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategoryDbFunctions {
  //List<CategoryModel> getCategories();

  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDbFunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.add(value);
  }
}
