import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealTempCounterProvider = StateProvider.autoDispose<int>((ref) => 1);
