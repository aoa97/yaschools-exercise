import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double? value;

  const RatingStars({this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: 13.0,
      itemCount: 5,
      rating: value ?? 5,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
