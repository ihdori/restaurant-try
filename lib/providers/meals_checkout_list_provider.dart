import 'package:firebase_training/functions/meal_list_refactored.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealCheckOutListProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) {
  return [];
});

final mealsFinalListProvider = StateProvider((ref) {
  final list = ref.watch(mealCheckOutListProvider);

  return refactorMeals(list);
});
