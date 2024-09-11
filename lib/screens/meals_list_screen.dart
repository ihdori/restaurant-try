import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:firebase_training/providers/total_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsListScreen extends ConsumerWidget {
  MealsListScreen({super.key});

  final List<Map> items = [
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
      appBar: AppBar(
        title: Text('مطعم شيف المندي'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'finalScreen');
          },
          backgroundColor: Colors.green,
          icon: Icon(Icons.add_shopping_cart_rounded),
          label: Row(
            children: [
              Text('Check out'),
              // Icon(Icons.add_shopping_cart_rounded)
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'المندي:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            ' السعر:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            items[index]['price'].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
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
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Text(
                                              textDirection: TextDirection.rtl,
                                              ' السعر:',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              textDirection: TextDirection.rtl,
                                              items[index]['price'].toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              08,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              IconButton.filled(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.minimize_outlined)),
                                              Text(
                                                '${1}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              IconButton.filled(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add)),
                                            ],
                                          ),
                                        ),
                                        // Button
                                        MaterialButton(
                                          color: Colors.green,
                                          onPressed: () {
                                            ref
                                                .read(mealCheckOutListProvider
                                                    .notifier)
                                                .update((state) => [
                                                      ...state,
                                                      {
                                                        'name': items[index]
                                                            ['name'],
                                                        'quantity': 1
                                                      }
                                                    ]);
                                            ref
                                                .read(
                                                    totalPriceProvider.notifier)
                                                .update((state) =>
                                                    state +
                                                    items[index]['price']);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'إضافة الى السلة',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        color: Colors.green,
                        child: Text(
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
