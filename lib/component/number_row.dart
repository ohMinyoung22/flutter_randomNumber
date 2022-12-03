import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map((e) => Image.asset(
                'assets/images/$e.png',
                width: 30,
                height: 50,
              ))
          .toList(),
    );
  }
}
