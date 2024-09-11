import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalScreen extends ConsumerWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              text,
              textDirection: TextDirection.rtl,
            ),
            ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: text));

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('تم نسخ الطلب بنجاح'),
                          content: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Column(
                              children: [
                                Text(
                                    textDirection: TextDirection.rtl,
                                    'الرجاء العودة للبوت و لصق النص الذي تم نسخه في البوت ليتم التواصل معك من قبل موظف التوصيل'),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('حسناً'))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text('Press to copy')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
