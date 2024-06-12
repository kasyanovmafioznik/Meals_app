import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.ontoggleFavourite, required this.availableMeals});
  
  final void Function(Meal meal) ontoggleFavourite;
  final List<Meal> availableMeals;
  void _selectedCategory(BuildContext context, Category category) {
    final filteredList = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(title: category.title, meals: filteredList, ontoggleFavourite: ontoggleFavourite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final index in availableCategories)
            CategoryGridItem(category: index, onSelectCategory: () {
              _selectedCategory(context, index); 
            },)
        ],
      );
  }
}
