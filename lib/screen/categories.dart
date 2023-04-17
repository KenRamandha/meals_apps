import 'package:flutter/material.dart';
import 'package:meals_apps/screen/meals.dart';
import 'package:meals_apps/widgates/category_grid_item.dart';
import '../data/dumy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: 'Some Title',
          meals: [],
        ),
      ),
    ); // Navigator.push(context)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick Your Categories'),
        ),
        body: GridView(
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
                  _selectedCategory(context);
                },
              ),
          ],
        ));
  }
}
