import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealTempCounterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(1);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
