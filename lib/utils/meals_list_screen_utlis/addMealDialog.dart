import 'package:firebase_training/providers/meal_temp_counter_provider.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<dynamic> addMealDialog({
  required BuildContext context,
  required WidgetRef ref,
  required int index,
  required List items,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(0),
              child: Consumer(
                builder: (context, ref, child) {
                  final counter = ref.watch(mealTempCounterProvider);
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          child: Image.network(
                            items[index]['image_url'],
                            fit: BoxFit.cover,
                            scale: 1,
                          ),
                        ),
                      ),
                      Text(
                        items[index]['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: TextDirection.rtl,
                        children: [
                          const Text(
                            textDirection: TextDirection.rtl,
                            ' السعر:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            items[index]['price'].toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton.filled(
                                onPressed: () {
                                  if (counter > 1) {
                                    ref
                                        .read(mealTempCounterProvider.notifier)
                                        .decrement();

                                    print('---: $counter');
                                  }
                                },
                                icon: const Icon(Icons.minimize_outlined)),
                            Text(
                              '$counter',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton.filled(
                                onPressed: () {
                                  ref
                                      .read(mealTempCounterProvider.notifier)
                                      .increment();

                                  print('+++: $counter');
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                      ),
                      // Button
                      MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          ref
                              .read(mealCheckOutListProvider.notifier)
                              .update((state) => [
                                    ...state,
                                    {
                                      'name': items[index]['name'],
                                      'quantity': counter,
                                      'price': items[index]['price'],
                                    }
                                  ]);
                          ref.read(totalPriceProvider.notifier).update(
                                (state) => state +
                                    items[index]['price'] * counter as int,
                              );
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'إضافة الى السلة',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              )),
        );
      });
}
