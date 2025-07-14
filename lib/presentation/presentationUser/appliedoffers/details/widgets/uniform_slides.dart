import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/uniform_slides_screen.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import 'decoration_container.dart';

class UniformSlides extends BaseStatelessWidget {
  final List<String> listJobUniForm ;
  UniformSlides({Key? key, required this.listJobUniForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BackgroundContainer(
      title: strings.official_wear,
      child: SingleChildScrollView(
        scrollDirection:  Axis.horizontal,
        child: Row(
          children: listJobUniForm.map((e) =>
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    UniformSlidesScreen(
                        initialIndex: listJobUniForm.indexOf(e),
                        listJobUniForm: listJobUniForm))),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: Decorations.decorationContainer,
                    child: kBuildImage(e, size: 100)),
              )
          ).toList(),
        ),
      )
    );
  }
}
