import 'package:firebase_training/functions/number_formatter.dart';
import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:firebase_training/providers/meals_checkout_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalScreen extends ConsumerWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    final mealDetails = ref.watch(mealsFinalListProvider);
    final meal = ref.watch(mealCheckOutListProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Text('قائمة طلباتي:'),
            Text(mealDetails.toString()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: mealDetails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mealDetails[index]['name']),
                    leading: Text((mealDetails[index]['quantity'].toString())),
                    trailing: Text(
                        'سعر الوجبة الواحدة: ${formatNumber(mealDetails[index]['price'])}'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container();
                        },
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // print(mealDetails[0]['name']);
                  Clipboard.setData(ClipboardData(text: text));

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('تم نسخ الطلب بنجاح'),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Column(
                              children: [
                                Text(
                                  text,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                    textDirection: TextDirection.rtl,
                                    'الرجاء العودة للبوت و لصق النص الذي تم نسخه في البوت ليتم التواصل معك من قبل موظف التوصيل'),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    },
                                    child: Text('حسناً'))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text('Press to copy')),
          ],
        ),
      ),
    );
  }
}
