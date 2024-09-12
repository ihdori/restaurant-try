List<Map<String, dynamic>> refactorMeals(List<Map<String, dynamic>> meals) {
  Map<String, Map<String, dynamic>> mealMap = {};

  // Iterate through the original list
  for (var meal in meals) {
    String mealName = meal['name'];
    int quantity = meal['quantity'];
    int price = meal['price']; // Parse price as int

    // Check if the meal name already exists in the map
    if (mealMap.containsKey(mealName)) {
      // Update the existing quantity and price
      mealMap[mealName]!['quantity'] += quantity;
      mealMap[mealName]!['price'] += price; // Aggregate price
    } else {
      // Otherwise, add it to the map with initial quantity and price
      mealMap[mealName] = {
        'name': mealName,
        'quantity': quantity,
        'price': price,
      };
    }
  }

  // Convert the map back to a list of maps
  List<Map<String, dynamic>> mealsRefactored = mealMap.values.toList();

  return mealsRefactored;
}
