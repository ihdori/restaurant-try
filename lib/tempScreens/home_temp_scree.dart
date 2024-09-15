// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class HomepageTemp extends StatefulWidget {
  const HomepageTemp({super.key});

  @override
  State<HomepageTemp> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageTemp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Install'),
          actions: [],
        ),
        body: ListView(
          children: [
            // Text("How Are You", style: )
          ],
        ));
  }
}
