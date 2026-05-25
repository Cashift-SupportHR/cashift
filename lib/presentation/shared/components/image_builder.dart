import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../core/services/routes.dart';

Widget kBuildImage(String path,
    {double? size,
    double? height,
    double? width,
    double? borderRadius,
    double? border,
    BoxFit? fit,
    bool showImageError = true,
   bool showFullImage = false,
    double? errorIconSize}) {
  print('kBuildImage $path');
  return InkWell(
    onTap: showFullImage==true ? () {
        Navigator.pushNamed(
          Get.context!,
          Routes.filesPreviewPage,
          arguments: [path],
        );
    } : null,
    child: Container(
      width: width ?? size ?? 40,
      height: height ?? size ?? 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          border: border == 0
              ? Border.all(style: BorderStyle.none)
              : Border.all(color: kSilver, width: border ?? 0.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        child: FadeInImage.assetNetwork(
          fit: fit ?? BoxFit.fill,
          placeholder: 'images/loading.gif',
          image: path,
          height: height ?? size ?? 40,
          width: width ?? size ?? 40,
          imageErrorBuilder: (c, o, s) {
            // print('imageErrorBuilder error  $s ');
            return showImageError
                ? SizedBox(
                    height: size ?? 40,
                    width: size,
                    child: Container(
                        child: Icon(
                      Icons.image,
                      color: kGrey_EB,
                      size: errorIconSize ?? 30,
                    )),
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    ),
  );
}

Widget kBuildImageV2(String path,
    {double? size,
    double? border,
    BoxFit? fit,
    bool showImageError = true,
    double? errorIconSize}) {
  return Image.network(
    path,
    height: size,
    width: size,
    errorBuilder: (c, o, s) {
      return showImageError
          ? imageFrame(
              child: Icon(
              Icons.ac_unit_outlined,
              color: kSilverTwo,
            ))
          : SizedBox.shrink();
    },
    frameBuilder: (c, w, i, b) {
      return imageFrame(child: w, border: border);
    },
  );
}

Widget imageFrame({required Widget child, double? border}) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: border == 0 || border == null
              ? Border.all(style: BorderStyle.none)
              : Border.all(color: kSilver, width: border ?? 0.0)),
      child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: child));
}

Widget kBuildImageFixedSize(String path,
    {double? width, double? height, double? border, double? errorIconSize}) {
  print('kBuildImage $path');
  return Container(
    height: height ?? 200,
    width: width ?? 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: border == 0
            ? Border.all(style: BorderStyle.none)
            : Border.all(color: kSilver, width: border ?? 0.0)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: FadeInImage.assetNetwork(
        placeholder: 'images/loading.gif',
        image: path,
        height: height ?? 300,
        imageErrorBuilder: (c, o, s) {
          //   print('imageErrorBuilder error  $s ');
          return SizedBox(
            child: Container(
                child: Icon(
              Icons.image_not_supported_sharp,
              color: kSilverTwo,
              size: errorIconSize ?? 30,
            )),
          );
        },
      ),
    ),
  );
}

Widget kBuildCircleImage(String path,
    {double? size,
    String? placeHolder,
    double? border,
    Color? borderColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
    bool showFullImage = false,
    BoxFit? fit}) {
  return InkWell(
    onTap: showFullImage==true ?
        () {
        Navigator.pushNamed(
          Get.context!,
          Routes.filesPreviewPage,
          arguments: [path],
        );
    } : null,
    child: Container(
      width: size ?? 40,
      height: size ?? 40,
      padding: padding ?? EdgeInsets.all(2),
      margin: margin ?? EdgeInsets.all(0),
      decoration: decoration ??
          BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: border == 0
                  ? Border.all(style: BorderStyle.none)
                  : Border.all(
                      color: borderColor ?? kSilver, width: border ?? 0.0)),
      child: ClipOval(
        child: Container(
          child: FadeInImage.assetNetwork(
            fit: fit ?? BoxFit.fill,
            placeholder: 'images/loading.gif',
            image: path,
            height: size ?? 40,
            width: size ?? 40,
            imageErrorBuilder: (c, o, s) {
              //  print('imageErrorBuilder error  $s ');
              return SizedBox(
                height: size ?? 40,
                width: size,
                child: Container(
                    child: const Icon(
                  Icons.image,
                  color: kSilverTwo,
                )),
              );
            },
          ),
        ),
      ),
    ),
  );
}

Widget kBuildCircleImagePlaceHolder({double? scale, String? placeHolder}) {
  return ClipOval(
    child: Image.asset(
      placeHolder ?? 'images/user.png',
      scale: scale ?? 2.5,
    ),
  );
}

Widget kBuildCircleImageWithCash(String path,
    {double? size, String? placeHolder}) {
  return FadeInImage.assetNetwork(
    fit: BoxFit.fitWidth,
    image: path,
    placeholderScale: 3,
    placeholderCacheHeight: 10,
    height: size ?? 40,
    width: size ?? 40,
    imageErrorBuilder: (c, o, s) {
      //   print('imageErrorBuilder error ${s.toString()} }');
      return Container(
        width: size ?? 40,
        height: size ?? 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Image.asset(
          placeHolder ?? 'images/user.png',
          scale: 3,
        ),
      );
    },
    placeholder: placeHolder ?? 'images/user.png',
  );
}

Widget kBuildCircleContainer(
    {double? size, double? border, required Widget child}) {
  return Container(
    width: size ?? 40,
    height: size ?? 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ],
    ),
    child: ClipOval(
      child: child,
    ),
  );
}

Widget kBuildCircleImageCard(
    {required String imagePath, double? size, double? padding}) {
  return kBuildCircleContainer(
      size: size ?? 60,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 12.0),
        child: Image.network(
          imagePath,
          scale: 0.9,
        ),
      ));
}

Widget kBuildCircleImageFromFile(File file, {double? size}) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: kGrey_D6.withOpacity(0.5),
        width: 1.0,
      ),
    ),
    child: ClipOval(
      child: Image.file(
        file,
        fit: BoxFit.fitWidth,
        height: size ?? 40,
        width: size ?? 40,
      ),
    ),
  );
}

Widget kBuildCircleImageFromAsset(String path,
    {double? size, Color color = Colors.white}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(
        color: kGrey_D6.withOpacity(0.5),
        width: 1.0,
      ),
    ),
    child: ClipOval(
      child: Image.asset(
        path,
        fit: BoxFit.fitWidth,
        height: size ?? 40,
        width: size != null ? (size - 8) : 40,
      ),
    ),
  );
}

Widget kBuildCircleShape(
    {Widget? child,
    double? size,
    Color? colorBorder,
    Color? color = Colors.white}) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: colorBorder ?? kWhite)),
    child: child,
  );
}

Widget kLoadSvgInCircle(String path, {double? height, double? width}) {
  return SvgPicture.asset(
    'images/$path.svg',
    height: height,
    width: width,
  );
}

Widget kLoadSvgInCirclePath(String path,
    {Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain}) {
  return SvgPicture.asset(
    path,
    height: height,
    width: width,
    color: color,
    fit: fit,
  );
}
