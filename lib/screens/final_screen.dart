import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalScreen extends ConsumerWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Optionally show a success message
              Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'تم الطلب بنجاح',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.amber,
                ),
              );
            },
            backgroundColor: Colors.green,
            isExtended: true,
            label: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                ),
                const Text(
                  'نسخ الطلب',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                ),
              ],
            )),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                'كل شيء جاهز',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                textAlign: TextAlign.center,
                'الرجاء الضغط على "نسخ الطلب" ثم الذهاب الى البوت ولصق معلومات الطلب ليتم التواصل معك على الواتساب من قبل موظف التوصيل',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Text(
              //   '$text',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
