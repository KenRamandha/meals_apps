import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_apps/models/meal.dart';

class FavoriteMelasNotofier extends StateNotifier<List<Meal>> {
  FavoriteMelasNotofier() : super([]);

  bool toggleMelaFaviriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }

    state = [];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMelasNotofier, List<Meal>>((ref) {
  return FavoriteMelasNotofier();
});
