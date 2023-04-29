import 'package:flutter/material.dart';
import 'package:meals_apps/models/meal.dart';
import 'package:meals_apps/screen/meals.dart';
import 'package:meals_apps/widgates/category_grid_item.dart';
import '../data/dumy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMelas,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMelas;

  void _selectedCategory(BuildContext context, Categories category) {
    final filteredMeals = availableMelas
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final categories in availableCategories)
          CategoryGridItem(
            category: categories,
            onSelectedCategory: () {
              _selectedCategory(context, categories);
            },
          ),
      ],
    );
  }
}
