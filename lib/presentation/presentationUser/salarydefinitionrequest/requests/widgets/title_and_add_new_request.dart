import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/underline_widget.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class TitleAndAddNewRequest extends BaseStatelessWidget {
  final String title;
  final String textButton;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onTap;
   TitleAndAddNewRequest({Key? key, required this.title, required this.textButton, this.padding, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kTextBoldTitle.copyWith(
                    color: kGreen_2,
                    fontSize: 14,
                  ),
                ),
                const UnderlineWidget(),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: kGreen_2,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: kGreen_2.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: kWhite,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    textButton,
                    style: kTextSemiBold.copyWith(
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
