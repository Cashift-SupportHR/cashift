import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/resume/favorite_time.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

///  Created by harbey on 1/22/2023.
class FavoriteTimeItem extends StatelessWidget {
  final FavoriteTime favoriteTime;
  final bool isSelected;
  const FavoriteTimeItem({Key? key, required this.favoriteTime, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? kPrimary : kWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? kPrimary : kGrey_DF,
        ),
      ),
      child: Column(
        children: [
          kBuildImage(
            favoriteTime.imagePath ?? '',
            border: 0,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            favoriteTime.name ?? '',
            style: kTextLabelNormal.copyWith(
              color: isSelected ? kWhite : kFontDark,
            ),
          ),
        ],
      ),
    );
  }
}
