import 'package:flutter/material.dart';
import 'package:news/models/categories_model.dart';
import 'package:news/screens/widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  final Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect, {super.key});

  final List<CategoryModel> categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategorySelect(categories[index]);
                  },
                  child: CategoriesItem(categories[index], index)),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
