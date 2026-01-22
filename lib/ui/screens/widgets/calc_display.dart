import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  final String display;

  const CalcDisplay({super.key, required this.display});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Text(
        display,
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
