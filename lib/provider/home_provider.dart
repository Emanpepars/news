import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class HomeProvider extends ChangeNotifier {
  CategoryModel? categoryModel;

  void onCategorySelected(category) {
    categoryModel = category;
    notifyListeners();
  }

  void onDrawerClicked(number) {
    if (number == 1) {
      categoryModel = null;
    } else if (number == 2) {
      // open settings tab
    }
    notifyListeners();
  }
}
