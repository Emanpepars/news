import 'package:flutter/material.dart';
import 'package:news/models/categories_model.dart';

class CategoriesItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const CategoriesItem(this.categoryModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topRight: const Radius.circular(30),
            topLeft: const Radius.circular(30),
            bottomRight: index.isOdd ? const Radius.circular(30) : Radius.zero,
            bottomLeft: index.isEven ? const Radius.circular(30) : Radius.zero),
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Image.asset(
            categoryModel.image,
            height: 100,
          ),
          Expanded(
            child: Center(
              child: Text(
                categoryModel.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
