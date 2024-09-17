import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/utils/custom_add_button.dart';
import 'package:firebase_training/utils/meals_list_screen_utlis/addMealDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsListScreen extends ConsumerWidget {
  final Map<String, dynamic> item;
  final List<Map<String, dynamic>> nestedItems;
  MealsListScreen({
    super.key,
    required this.item,
    required this.nestedItems,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'oderReviewScreen');
            },
            backgroundColor: Colors.green,
            isExtended: true,
            label: const Row(
              children: [
                Text(
                  'الذهاب لاكمال الطلب  ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.white,
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${item['name']}:',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: nestedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.1), // Shadow color with lower opacity
                          spreadRadius: 10, // Increase the spread radius
                          blurRadius: 20, // Increase the blur radius
                          offset: const Offset(
                              0, 5), // Increase the vertical offset
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.network(
                              nestedItems[index]['image_url'],
                              fit: BoxFit.cover,
                              scale: 1,
                            ),
                          ),
                        ),
                        Text(
                          nestedItems[index]['name'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          textDirection: TextDirection.rtl,
                          children: [
                            const Text(
                              textDirection: TextDirection.rtl,
                              ' السعر:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              // textDirection: TextDirection.rtl,
                              formatNumber(nestedItems[index]['price']),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        CustomAddButton(
                          items: nestedItems,
                          index: index,
                          ref: ref,
                          text: 'إضافة',
                          color: Colors.amber,
                          textColor: Colors.black,
                          onTap: () {
                            addMealDialog(
                              context: context,
                              ref: ref,
                              index: index,
                              items: nestedItems,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
