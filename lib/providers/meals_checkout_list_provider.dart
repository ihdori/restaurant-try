import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealCheckOutListProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) {
  return [];
});
