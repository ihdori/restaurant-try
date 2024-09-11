import 'package:firebase_training/providers/getFinalOrder.dart';
import 'package:flutter/material.dart';
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
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
