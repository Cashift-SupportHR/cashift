import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../presentation/presentationUser/resources/colors.dart';

///  Created by harbey on 8/5/2023.
class CustomRatingBar extends StatelessWidget {
  final double initialRating;
  final double iconSize;

  const CustomRatingBar({
    Key? key,
    required this.initialRating,
    this.iconSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating,
      ignoreGestures: true,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: iconSize,
      itemPadding: EdgeInsets.symmetric(horizontal: 1),
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: kRateBarIconColor,
        ),
        half: Icon(
          Icons.star_half,
          color: kRateBarIconColor,
        ),
        empty: Icon(
          Icons.star_border,
          color: kRateBarIconColor,
        ),
      ),
      onRatingUpdate: (double value) {
        print(value);
      },
    );
  }
}
