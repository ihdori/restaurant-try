List<Map<String, dynamic>> refactorMeals(List<Map<String, dynamic>> meals) {
  Map<String, int> mealMap = {};

  // Iterate through the original list
  for (var meal in meals) {
    // Check if the meal name already exists in the map
    if (mealMap.containsKey(meal['name'])) {
      // Convert the existing quantity to int and add the new quantity
      mealMap[meal['name']] =
          (mealMap[meal['name']]! + meal['quantity']).toInt();
    } else {
      // Otherwise, add it to the map
      mealMap[meal['name']] = meal['quantity'].toInt();
    }
  }

  // Convert the map back to a list of maps
  List<Map<String, dynamic>> mealsRefactored = mealMap.entries
      .map((entry) => {'name': entry.key, 'quantity': entry.value})
      .toList();

  return mealsRefactored;
}
