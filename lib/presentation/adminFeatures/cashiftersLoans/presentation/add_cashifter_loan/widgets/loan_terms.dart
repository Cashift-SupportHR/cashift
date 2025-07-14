import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../shared/models/common_list_item_dto.dart';

class LoanTermsList extends StatelessWidget {
  final List<CommonListItemDto> items;
  const LoanTermsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: Decorations.decorationConditions,
        padding: const EdgeInsets.all(16),
        child:  Column(
          children: items.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: kBuildImageFixedSize(
                    e.icon ?? '',
                    width: 15,
                    height: 20,
                    border: 0,
                    errorIconSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 10,
                  child: Text(e.name ?? '',
                      style: kTextMedium.copyWith(
                        color: kGreen_2,
                        fontSize: 12,
                      )),
                ),
              ],
            ),
          )).toList() ?? [],
        )
    );
  }
}
