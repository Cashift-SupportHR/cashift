
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

class UploadImage extends BaseStatelessWidget {
  final String initialValue;
  final Function(File)? onPicker;

  UploadImage({required this.initialValue, this.onPicker});

  @override
  Widget build(BuildContext context) {
    File images =   File(initialValue) ;
    return DottedBorder(
      color: kPrimary.withOpacity(0.5),
      strokeWidth: 1,
      dashPattern: [6, 5],
      radius: const Radius.circular(10),
      borderType: BorderType.RRect,
      child: StatefulBuilder(builder: (context, setState) {
        return InkWell(
          onTap: () {
            AppUtils.showImagePicker(context, onPicker: (files) {
              images = files ;
              onPicker?.call(images);
              setState(() {});
            });
          },
          child: Container(
            width: double.infinity,
            color: kGrey_EF.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kLoadSvgInCirclePath(
                  AppIcons.upload_files,
                ),
                const SizedBox(width:15),
                uploadedFiles(
                  images,
                  onDelete: (file) {
                    images=File("");
                    onPicker?.call(images);
                    setState(() {});
                  },
                ),
                if(images==File('') || images.isNullOrEmpty()) Text(
                  strings.add_image,
                  style: kTextRegular.copyWith(
                    color: kPrimary,
                    fontSize: 12,
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
      child:(images==null|| images.path=="")?SizedBox(): SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  Stack(
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
                    : Image.file(images),
              ),
              if(!images.path.contains('https://'))
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: Decorations.boxDecorationBorderShape(
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: kRed,
                      ),
                      onPressed: () {
                        onDelete?.call(images);
                      },
                    ),
                  ),
                ),
            ],
          )
      ),
    );
  }
}