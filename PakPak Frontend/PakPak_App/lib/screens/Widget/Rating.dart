// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double size;

  StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
    required this.onRatingChanged,
    required this.color,
    required this.size,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        size: size,
        color: Colors.transparent,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: size,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: size,
        color: color,
      );
    }
    return InkResponse(
      // ignore: unnecessary_null_comparison
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
