import 'package:firebase_training/utils/meals_list_screen_utlis/addMealDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.items,
    required this.ref,
    required this.index,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
  });
  final WidgetRef ref;
  final int index;
  final String text;
  final Function onTap;
  final Color color;
  final Color textColor;

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin:
              const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.1), // Shadow color with lower opacity
                spreadRadius: 5, // Increase the spread radius
                blurRadius: 10, // Increase the blur radius
                offset: const Offset(0, 5), // Increase the vertical offset
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ));
  }
}
