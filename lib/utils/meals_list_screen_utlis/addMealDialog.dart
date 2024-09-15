import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/providers/meal_temp_counter_provider.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:firebase_training/utils/custom_add_button.dart';
import 'package:firebase_training/utils/meals_list_screen_utlis/meal_quatity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<dynamic> addMealDialog({
  required BuildContext context,
  required WidgetRef ref,
  required int index,
  required List<Map<String, dynamic>> items,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(0),
              child: Consumer(
                builder: (context, ref, child) {
                  final counter = ref.watch(mealTempCounterProvider);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Text(
                              textDirection: TextDirection.rtl,
                              ' السعر:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              formatNumber(items[index]['price']),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MealQuantityButton(
                              ref: ref,
                              icon: const Icon(
                                Icons.remove,
                              ),
                              onTap: () {
                                ref
                                    .read(mealTempCounterProvider.notifier)
                                    .decrement();
                              },
                            ),
                            Text(
                              '$counter',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            MealQuantityButton(
                              ref: ref,
                              icon: const Icon(Icons.add),
                              onTap: () {
                                ref
                                    .read(mealTempCounterProvider.notifier)
                                    .increment();
                              },
                            ),
                          ],
                        ),
                      ),
                      // Button
                      CustomAddButton(
                        items: items,
                        ref: ref,
                        index: index,
                        color: Colors.green,
                        textColor: Colors.white,
                        text: 'إضافة الى السلة',
                        onTap: () {
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
                      ),
                    ],
                  );
                },
              )),
        );
      });
}
