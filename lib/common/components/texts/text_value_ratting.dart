import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

///  Created by harbey on 8/5/2023.
class TextValueRatting extends StatelessWidget {
  final String text;
  final int value;
  final double initialRating;
  final TextStyle? textStyle;
  final TextStyle? valueStyle;
  final bool isMark;
  final double iconSize;
  final bool isExpandedText;

  const TextValueRatting({
    Key? key,
    required this.text,
    required this.value,
    required this.initialRating,
    this.textStyle,
    this.valueStyle,
    this.isMark = true,
    this.iconSize = 20,
    this.isExpandedText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isExpandedText)
          Expanded(
            child: buildTitle(text),
          )
        else ...[
          buildTitle(text),
          SizedBox(width: 10),
        ],
        FittedBox(
          child: RatingBar(
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
                size: 10,
                color: kRateBarIconColor,
              ),
              half: Icon(
                Icons.star_half,
                size: 10,
                color: kRateBarIconColor,
              ),
              empty: Icon(
                Icons.star_border,
                size: 10,
                color: kRateBarIconColor,
              ),
            ),
            onRatingUpdate: (double value) {
              print(value);
            },
          ),
        ),
        SizedBox(width: 10),
        Text(value.toString(),
            style: valueStyle ??
                kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 14)),
      ],
    );
  }

  Widget buildTitle(String title) {
    return Text(
      isMark ? '$text :' : text,
      style: textStyle ?? kTextSemiBold.copyWith(color: kGreen_52),
    );
  }
}
