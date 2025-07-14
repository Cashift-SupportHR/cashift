import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../resources/constants.dart';

///  Created by harby on 9/8/2023.
class UploadFilesList extends BaseStatelessWidget {
  final List<String> initialValueList;
  final Function(List<File>)? onPicker;

  UploadFilesList({required this.initialValueList, this.onPicker});

  @override
  Widget build(BuildContext context) {
    List<File> images = initialValueList.map((e) => File(e)).toList();
    return DottedBorder(
      color: kPrimary.withOpacity(0.5),
      strokeWidth: 1,
      dashPattern: [6, 5],
      radius: const Radius.circular(10),
      borderType: BorderType.RRect,
      child: StatefulBuilder(builder: (context, setState) {
        return InkWell(
          onTap: () {
            AppUtils.showMultiMediaPicker(context, onPicker: (files) {
              images.addAll(files);
              onPicker?.call(images);
              setState(() {});
            });
          },
          child: Container(
            width: double.infinity,
            color: kGrey_EF.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kLoadSvgInCirclePath(
                  AppIcons.upload_files,
                ),
                const SizedBox(height: 5),
                uploadedFiles(
                  images,

                  onDelete: (file) {
                    images.remove(file);
                    onPicker?.call(images);
                    setState(() {});
                  },
                ),
                Text(
                  strings.upload_pdf_image,
                  style: kTextSemiBold.copyWith(
                    color: kBlack_67,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Center uploadedFiles(List<File> images, {Function(File)? onDelete}) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: images
              .map((e) => Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: Decorations.decorationOnlyRadius(),
                        margin: const EdgeInsets.all(5),
                        child: e.path.contains('https://')
                            ? kBuildCircleImage(e.path ?? '')
                            : e.path.split('.').last == "pdf"
                                ? Icon(
                                    Icons.picture_as_pdf,
                                    color: kPrimary,
                                  )
                                : Image.file(e),
                      ),
                      PositionedDirectional(
                        start: 0,
                        top: 0,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: Decorations.boxDecorationBorderShape(),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.close,
                              size: 20,
                              color: kRed,
                            ),
                            onPressed: () {
                              onDelete?.call(e);
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

///  Created by khattab   on 9/10/2024.
class UploadFilesOnly extends BaseStatelessWidget {
  final String initialValue;
  final String? title;
  final String? icon;
  final Function(File)? onPicker;
  final bool isPdf;
  final bool isImage;
  final bool isCamera;

  UploadFilesOnly(
      {required this.initialValue,
      this.title,
      this.onPicker,
      this.icon,
      this.isPdf = true,
      this.isImage = true,
      this.isCamera = true});

  @override
  Widget build(BuildContext context) {
    File file = File(initialValue);
    return DottedBorder(
      color: kPrimary.withOpacity(0.5),
      strokeWidth: 1,
      dashPattern: [6, 5],
      radius: const Radius.circular(10),
      borderType: BorderType.RRect,
      child: StatefulBuilder(builder: (context, setState) {
        return InkWell(
          onTap: () {
            AppUtils.showMediaPicker(context,
                isCamera: isCamera,
                isImage: isImage,
                isPdf: isPdf, onPicker: (fileValue) {
              file = fileValue;
              onPicker?.call(file);
              setState(() {});
            });
          },
          child: Container(
            width: double.infinity,
            color: kGrey_EF.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                file.path != ""
                    ? SizedBox()
                    : kLoadSvgInCirclePath(
                        icon ?? AppIcons.upload_files,
                      ),
                const SizedBox(height: 5),
                uploadedFiles(
                  file,
                  onDelete: (file) {
                    // file = File("");
                    // file?.path="";
                    onPicker?.call(File(""));
                    setState(() {});
                  },
                ),
                file.path != ""
                    ? SizedBox()
                    : Text(
                        title ?? strings.upload_pdf_image,
                        style: kTextSemiBold.copyWith(
                          color: kBlack_67,
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Center uploadedFiles(File images, {Function(File)? onDelete}) {
    return Center(
      child: (images == null || images.path == "")
          ? SizedBox()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: Decorations.decorationOnlyRadius(),
                    margin: const EdgeInsets.all(5),
                    child: images.path.contains('https://')
                        ? kBuildCircleImage(images.path ?? '')
                        : images.path.split('.').last == "pdf"
                            ? Icon(
                                Icons.picture_as_pdf,
                                color: kPrimary,
                              )
                            : Image.file(images),
                  ),
                  // if (!images.path.contains('https://'))
                  //   PositionedDirectional(
                  //     start: 0,
                  //     top: 0,
                  //     child: Container(
                  //       height: 25,
                  //       width: 25,
                  //       decoration: Decorations.boxDecorationBorderShape(),
                  //       child: IconButton(
                  //         padding: EdgeInsets.zero,
                  //         icon: Icon(
                  //           Icons.close,
                  //           size: 20,
                  //           color: kRed,
                  //         ),
                  //         onPressed: () {
                  //           onDelete?.call(images);
                  //         },
                  //       ),
                  //     ),
                  //   ),
                ],
              )),
    );
  }
}
