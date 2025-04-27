import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
  });

  final Color selectedColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final containerSize = deviceSize.shortestSide * 0.5;
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(isCircular ? 100 : 10),
        boxShadow: [
          BoxShadow(
            color: selectedColor.withAlpha(150),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
