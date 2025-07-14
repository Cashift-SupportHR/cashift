import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../../common/components/buttons/icon_text_button.dart';

///  Created by harbey on 7/27/2023.
class DownloadImageFileProject extends BaseStatelessWidget {
  final String initialValue;
  final Function(File)? onPicker;

  DownloadImageFileProject({required this.initialValue, this.onPicker});

  @override
  Widget build(BuildContext context) {
    File image = File('');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.add_logo,
          style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
        ),
        const SizedBox(height: 10),
        DottedBorder(
          color: kGrey_DF,
          strokeWidth: 1,
          dashPattern: [10, 8],
          padding: const EdgeInsets.all(6),
          radius: const Radius.circular(4),
          borderType: BorderType.RRect,
          child: StatefulBuilder(builder: (context, setState) {
            return IconTextButton(
              isFlexible: true,
              text: (image.path.isEmpty && initialValue.isEmpty)
                  ? strings.download_image_file : '',
              mainAxisAlignment: MainAxisAlignment.center,
              icon: AppIcons.downloadOutline,
              customIcon: image.path.isNotEmpty
                  ? CircleAvatar(
                radius: 20,
                    child: Image.file(
                image,
              ),
                  )
                  : (initialValue.isNotEmpty
                      ? kBuildCircleImage(initialValue ?? '')
                      : null),
              textStyle: kTextSemiBold.copyWith(
                color: kBattleShipGrey2,
                fontSize: 20,
              ),
              onTap: () {
                AppUtils.showImagePicker(context, onPicker: (file) {
                  onPicker!(file);
                  image = file;
                  setState(() {});
                });
              },
            );
          }),
        ),
      ],
    );
  }
}
