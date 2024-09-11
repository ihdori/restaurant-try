import 'package:firebase_training/getFinalOrder.dart';
import 'package:firebase_training/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage1 extends ConsumerWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
