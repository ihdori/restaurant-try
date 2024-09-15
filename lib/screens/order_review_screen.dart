import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderReviewScreen extends ConsumerWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersList = ref.watch(mealsFinalListProvider);
    final totalPrice = ref.watch(totalPriceProvider);
    final List<Widget> list = List.generate(
      ordersList.length,
      (index) => Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'عدد: ${ordersList[index]['quantity']}',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Text(
                  '${ordersList[index]['name']}',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ),
          index != ordersList.length
              ? Divider()
              : SizedBox(
                  height: 10,
                ),
        ],
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'قائمة طلباتي:',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...list,
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 10, top: 20, right: 10, bottom: 10),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.green),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  'المجموع: ${formatNumber(totalPrice)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
