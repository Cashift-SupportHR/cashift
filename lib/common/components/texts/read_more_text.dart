import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../base/base_stateless_widget.dart';

///  Created by harbey on 8/2/2023.
class ReadMoreText extends BaseStatelessWidget {
  final String text;
  final int? maxLines;
  final TextStyle? style;
  final TextAlign? textAlign;

  ReadMoreText({
    Key? key,
    required this.text,
    this.maxLines,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: StatefulBuilder(builder: (BuildContext context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              maxLines: isExpanded ? 200 : maxLines ?? 3,
              overflow: TextOverflow.ellipsis,
              style: style ?? kTextRegular.copyWith(fontSize: 14, color: kBlack_0B),
              textAlign: textAlign,
            ),
            SizedBox(
              width: 4,
            ),
            isMoreThan3Lines(text, context)
                ?
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? strings.show_less : strings.show_more,
                  style: kTextMedium.copyWith(fontSize: 12, color: kCornFlower2),
                ),
              ),
            )
                : SizedBox.shrink(),
          ],
        );
      }),
    );
  }

  // check if the text is more than 3 lines
  bool isMoreThan3Lines(String text, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style ?? kTextRegular.copyWith(fontSize: 14, color: kBlack_0B),
      ),
      maxLines: 1000,
      textDirection: TextDirection.rtl,
    )..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width);
    print(textPainter.didExceedMaxLines);
    print('textPainter.size ${textPainter.computeLineMetrics().length}');;
    print('textPainter.bool ${textPainter.computeLineMetrics().length > 3}');
    return textPainter.computeLineMetrics().length > 3;
  }


}
