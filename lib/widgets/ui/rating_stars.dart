import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double? value;

  const RatingStars({this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('5 / $value', style: const TextStyle(fontSize: 11)),
        const Icon(
          Icons.star,
          color: Colors.orange,
          size: 14,
        ),
      ],
    );
  }
}
