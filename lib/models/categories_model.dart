import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(this.id, this.name, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        "business",
        "Business",
        "assets/images/business.png",
        const Color(0xFFCF7E48),
      ),
      CategoryModel(
        "entertainment",
        "Entertainment",
        "assets/images/environment.png",
        const Color(0xFF4882CF),
      ),
      CategoryModel(
        "general",
        "General",
        "assets/images/politics.png",
        const Color(0xFF9BA3CB),
      ),
      CategoryModel(
        "sports",
        "Sports",
        "assets/images/sports.png",
        const Color(0xFFC91C22),
      ),
      CategoryModel(
        "science",
        "Science",
        "assets/images/science.png",
        const Color(0xFFF2D352),
      ),
      CategoryModel(
        "health",
        "Health",
        "assets/images/health.png",
        const Color(0xFFED1E79),
      ),
      // CategoryModel("technology", "Technology", "assets/images/business.png", const Color(0xFF003E90),),
    ];
  }
}
