import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../domain/entities/index.dart';

class VehicleImageItem extends BaseStatelessWidget {
  final VehicleImageFace data;
  final Function(File)? onUploadImage;

  VehicleImageItem({super.key, this.onUploadImage, required this.data});

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File> streamDataStateInitial =
        StreamStateInitial<File>();
    return DottedBorder(
      radius: Radius.circular(12),
      padding: EdgeInsets.all(10),
      borderType: BorderType.RRect,
      dashPattern: [6, 6],
      color: kPrimary.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<File>(
                stream: streamDataStateInitial.stream,
                builder: (context, snapshot) {
                  // Note: If the image is already picked then next to the next page then back to this page again we will show cached image
                  return snapshot.hasData || !(data.imageFace ?? '').startsWith('http')
                      ? Image.file(
                          snapshot.data ?? File(data.imageFace ?? ''),
                          height: 60,
                          width: 105,
                          fit: BoxFit.scaleDown,
                        )
                      : kBuildImage(
                          data.imageFace ?? '',
                          height: 60,
                          width: 105,
                          border: 0,
                        );
                }),
            SizedBox(height: 5),
            Expanded(
              child: Text(
                data.name ?? '',
                style: kTextRegular.copyWith(color: kPrimary_4F, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            AppCupertinoButton(
              onPressed: () {
                AppUtils.showImagePicker(context, onPicker: (file) {
                  streamDataStateInitial.setData(file);
                  onUploadImage?.call(file);
                });
              },
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    strings.upload_image,
                    style: kTextBold.copyWith(color: kWhite, fontSize: 12),
                  ),
                  SizedBox(width: 5),
                  kLoadSvgInCirclePath(
                    AppIcons.downloadRounded,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
