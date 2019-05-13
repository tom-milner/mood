import 'dart:async';

import 'package:mood_app/models/Category.dart';

class CategoryBloc {
  // broadcast - multiple listeners
  final _categoryController = StreamController<List<Category>>.broadcast();

  dispose(){
    _categoryController.close();
  }



}