import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/image_builder.dart';

class UniformSlidesScreen extends BaseStatelessWidget {
  final int initialIndex;
  final List<String> listJobUniForm;
  UniformSlidesScreen({Key? key, required this.initialIndex, required this.listJobUniForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.official_wear,
        body: PageView.builder(
          controller: PageController(initialPage: initialIndex),
          itemCount: listJobUniForm.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: Decorations.decorationContainer,
              child: kBuildImage(listJobUniForm[index],
                  fit: BoxFit.none),
            );
          },
        ),
    );
  }
}
