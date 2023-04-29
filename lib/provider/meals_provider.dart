import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_apps/data/dumy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
