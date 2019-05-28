import 'dart:async';

import 'package:mood_app/models/Category.dart';
import 'package:mood_app/services/ScenarioService/CategoryService.dart';

class CategoryBloc {
  // broadcast - multiple listeners
  final _categoryController = StreamController<List<Category>>.broadcast();
  final _categoryService = CategoryService();
  get categories => _categoryController.stream;

  CategoryBloc() {
    getAllCategories();
  }

  // get all categories
  getAllCategories() async {
    _categoryController.sink.add(await _categoryService.getAllCategories());
  }

  dispose() {
    _categoryController.close();
  }
}
