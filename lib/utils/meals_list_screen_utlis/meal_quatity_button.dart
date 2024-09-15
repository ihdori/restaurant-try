import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealQuantityButton extends StatelessWidget {
  const MealQuantityButton({
    super.key,
    required this.ref,
    required this.icon,
    required this.onTap,
  });
  final WidgetRef ref;
  final Icon icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}
