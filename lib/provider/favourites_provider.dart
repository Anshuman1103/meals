import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouritesMealNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealNotifier() : super([]);

  bool toggleMealFavouritesStatus(Meal meal) {
    final mealIsAFavourite = state.contains(meal);

    if (mealIsAFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritesMealNotifier, List<Meal>>((ref) {
  return FavouritesMealNotifier();
});
