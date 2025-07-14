import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/app_utils.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../image_builder.dart';

///  Created by harbey on 12/3/2023.
class SelectImageGallery extends StatelessWidget {
  final String uploadLabel;
  final String? uploadIcon;
  final String? initialValue;
  final Function(File) onPicker;
  SelectImageGallery({ required this.uploadLabel, this.uploadIcon, this.initialValue, required this.onPicker});
  @override
  Widget build(BuildContext context) {
    File image = File('');
    return DottedBorder(
      color: kPrimary,
      strokeWidth: 1,
      dashPattern: [8, 4],
      radius: Radius.circular(6),
      padding: EdgeInsets.all(25),
      borderType: BorderType.RRect,

      child: SizedBox(
        width: double.infinity,
        child: StatefulBuilder(builder: (context, setState) {
          return InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () {
              AppUtils.showImagePicker(context, onPicker: (file) {
                image = file;
                onPicker(file);
                setState(() {});
              });
            },
            child: image.path.isNotEmpty
                ? Image.file(
              image,
              height: 100,
            ) : initialValue != null ? kBuildImage(initialValue ?? '', size: 100, fit: BoxFit.none,)
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(uploadIcon != null)
                  kBuildImage(uploadIcon ?? '', size: 50, fit: BoxFit.fill, border: 0)
                else
                kLoadSvgInCirclePath(
                  AppIcons.download_proof_file,
                ),
                SizedBox(height: 10),
                StreamBuilder<String>(
                    stream: null,
                    builder: (context, snapshot) {
                      return Text(
                        uploadLabel,
                        style: kTextRegular.copyWith(
                          fontSize: 14,
                          color: kPrimary,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
