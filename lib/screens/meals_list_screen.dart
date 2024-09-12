import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/utils/meals_list_screen_utlis/addMealDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsListScreen extends ConsumerWidget {
  MealsListScreen({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'name': 'مندي دجاج',
      'price': 12000,
      'image_url': 'https://th.bing.com/th/id/OIP.c6D9BDwTIU5K9oj6deAeOgHaEK',
    },
    {
      'name': 'مندي لحم',
      'price': 17000,
      'image_url': 'https://th.bing.com/th/id/OIP.8hNZBPvZMXh4vOXgN5NXsQHaE8',
    },
    {
      'name': 'مظبي لحم',
      'price': 19000,
      'image_url':
          'https://th.bing.com/th/id/R.2df0274deee8844599267dad23441360?rik=yKf00j%2bJHcTg1A&pid=ImgRaw&r=0'
    },
  ];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'finalScreen');
          },
          backgroundColor: Colors.green,
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: const Row(
            children: [
              Text('Check out'),
              // Icon(Icons.add_shopping_cart_rounded)
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'المندي:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              itemCount: items.length,
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
                        offset: Offset(0, 5), // Increase the vertical offset
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
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
                            formatNumber(items[index]['price']),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          addMealDialog(
                            context: context,
                            ref: ref,
                            index: index,
                            items: items,
                          );
                        },
                        color: Colors.green,
                        child: const Text(
                          'إضافة',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
