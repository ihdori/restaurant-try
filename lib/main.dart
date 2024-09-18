import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:firebase_training/screens/final_screen.dart';
import 'package:firebase_training/screens/home_screen.dart';
import 'package:firebase_training/screens/order_review_screen.dart';

import 'package:firebase_training/tempScreens/auth/login.dart';
import 'package:firebase_training/tempScreens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAc-DMew6WctRVcC8OwttwlRrxOF_2aYpg",
          authDomain: "trainig-d83a4.firebaseapp.com",
          projectId: "trainig-d83a4",
          storageBucket: "trainig-d83a4.appspot.com",
          messagingSenderId: "827598893175",
          appId: "1:827598893175:web:03e52f090e1fd959b25672",
          measurementId: "G-9B3PJ0Z7FG"));
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // 'mealsListScreen': (context) => MealsListScreen(),
        'finalScreen': (context) => const FinalScreen(),
        'oderReviewScreen': (context) => const OrderReviewScreen(),
        //Temp
        "signup": (context) => const SignUp(),
        "login": (context) => const Login(),
      },
      home: const HomePage(),
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
                          title: const Text('تم نسخ الطلب بنجاح'),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Column(
                              children: [
                                const Text(
                                    textDirection: TextDirection.rtl,
                                    'الرجاء العودة للبوت و لصق النص الذي تم نسخه في البوت ليتم التواصل معك من قبل موظف التوصيل'),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('حسناً'))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text('Press to copy')),
          ],
        ),
      ),
    );
  }
}
