import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

class Decorations {
  static BoxDecoration boxDecorationShaded({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
    );
  }

  static Decoration createRectangleDecoration(
      {double? radius, double? border, Color? color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 6),
        /*  border:border Border.all(
        color: kBordColor,
        width: 2.0,
      ),*/
        color: color,
        border: border == 0
            ? Border.all(style: BorderStyle.none)
            : Border.all(color: kBordColor, width: border ?? 2.0));
  }

  static Decoration createRectangleWithColorDecoration(
      Color color, Color bag, double radius) {
    return BoxDecoration(
      color: bag,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: color,
        width: 1.0,
      ),
    );
  }

  static Decoration createRectangleDecorationOnlyBottom({
    Color? color,
  }) {
    return BoxDecoration(
      color: color??kPrimary,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
      border: Border.all(
        color:color?? kPrimary,
        width: 2.0,
      ),
    );
  }

  static createRectangleDecorationOnlyTop({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        border: Border.all(color: borderColor ?? kSilver, width: 0.5));
  }

  // by Harbey- decoration for container in job offer details
  static Decoration get decorationContainer => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      );

  static Decoration get decorationIndicator => BoxDecoration(
        color: kPrimary.withOpacity(0.2),
      );
  static Decoration get decorationIndicator2 => BoxDecoration(
        color: kWhite,
      );

  static Decoration decorationTabsOnlyTop(
      {BorderRadiusGeometry? borderRadius}) {
    return BoxDecoration(
      borderRadius: borderRadius ??
          const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kWhite,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        )
      ],
    );
  }

  static Decoration get decorationTabs =>
      decorationTabsOnlyTop(borderRadius: BorderRadius.circular(10));

  static Decoration decorationTabBarView({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 15),
      color: kWhite,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        )
      ],
    );
  }

  static Decoration decorationNetworkImageAndShadow(String image) =>
      BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      );

  static BoxDecoration boxDecorationBorder({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? radius,
    double? borderWidth,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
      border: Border.all(
          color: borderColor ?? kGreen_2.withOpacity(0.3),
          width: borderWidth ?? 0.5),
    );
  }

  static Decoration get decorationConditions => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      );

  static Decoration decorationWithGradientNotSpreadRadius({
    Color? color,
    Color? shadowColor,
    double? radius,
    Offset offset = const Offset(3, 0),
  }) {
    return BoxDecoration(
      color: color ?? kBackgroundColor,
      borderRadius: BorderRadius.circular(radius ?? 8),
      boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.13),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(-3, 0), // changes position of shadow
        ),
        BoxShadow(
          color: shadowColor ?? kPrimary,
          spreadRadius: 0,
          blurRadius: 0,
          offset: offset, // changes position of shadow
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          kGrey_FB,
          kWhite,
        ],
      ),
    );
  }

  static Decoration decorationWithGradientNotSpread(
      {Color? color,
      Color? shadowColor,
      double? radius,
      List<BoxShadow>? boxShadow}) {
    return BoxDecoration(
      color: color ?? kBackgroundColor,
      borderRadius: BorderRadius.circular(radius ?? 10),
      boxShadow: boxShadow ??
          [
            BoxShadow(
              color: shadowColor ?? kPrimary,
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(3, 0), // changes position of shadow
            ),
          ],
      gradient: const LinearGradient(
        begin: AlignmentDirectional.topEnd,
        end: AlignmentDirectional.bottomStart,
        colors: [
          kGrey_F3,
          kGrey_F6,
        ],
      ),
    );
  }

  static BoxDecoration boxDecorationShadowBorder({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 15)),
      border: Border.all(
          color: borderColor ?? kPrimary.withOpacity(0.2), width: 0.8),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? kPrimary.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ],
    );
  }

  static BoxDecoration boxDecorationBorderShape({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? borderWidth,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
          color: borderColor ?? kYellow_00, width: borderWidth ?? 2.5),
    );
  }

  static ShapeDecoration shapeDecoration({Color? color, double? radius}) {
    return ShapeDecoration(
      color: color ?? kWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5)),
      shadows: [
        BoxShadow(
          color: kGray_00,
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration decorationBottomBorder({
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    double? borderWidth,
    double? radius,
  }) {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.0),
        border: Border(bottom: BorderSide(color: color ?? kGray_CD, width: 1)));
  }

  static ShapeDecoration decorationOnlyRadius({Color? color, double? radius}) {
    return ShapeDecoration(
      color: color ?? kGrey_EE,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5)),
    );
  }

  static ShapeDecoration shapeDecorationBorder({Color? color, double? radius}) {
    return ShapeDecoration(
      color: color ?? kWhite,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.2,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: Color(0x331E866F),
        ),
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
      shadows: [
        BoxShadow(
          color: kGray_00,
          blurRadius: 15,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static ShapeDecoration shapeDecorationBorderCircular({double? width}) {
    return ShapeDecoration(
      color: kWhite,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: width ?? 1.5, color: kPrimary),
        borderRadius: BorderRadius.circular(232),
      ),
      shadows: [
        BoxShadow(
          color: kBlack_3F,
          blurRadius: 5,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration decorationStartRadius({
    Color? color,
    double? radiusStart,
  }) {
    return BoxDecoration(
      color: color ?? kRateBarIconColor,
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(radiusStart ?? 25),
        topStart: Radius.circular(radiusStart ?? 25),
      ),
    );
  }

  static ShapeDecoration shapeDecorationShadow({
    Color? color,
    double? radius,
  }) {
    return ShapeDecoration(
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x1E000000),
          blurRadius: 11,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static bottomRadius({
    Color? color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(radius ?? 15),
        bottomLeft: Radius.circular(radius ?? 15),
      ),
    );
  }
}
