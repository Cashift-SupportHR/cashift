import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'إكتب رسالتك هنا ...',
  hintStyle: TextStyle(
    color: kSteal,
    fontSize: 14.0,
    fontFamily: 'Bahij_Regular',
  ),
  border: InputBorder.none,
);

const kTextFieldNoBordersDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintStyle: TextStyle(color: kGrey_C3, fontSize: 16.0, fontFamily: 'Regular'),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
);

const kButtonTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  fontFamily: 'Medium',
);

const kTextLabel = TextStyle(
  color: kGreyishBrown,
  fontFamily: 'Regular',
  height: 1.2, //SETTING THIS CAN SOLVE YOUR PROBLEM
);
const kTextLabelWhite = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontFamily: 'Regular',
);
const kTextLabelNormal = TextStyle(
  color: kFontDarkGreen,
  fontSize: 14.0,
  fontFamily: 'Regular',
);
const kTextLabelSmall = TextStyle(
  color: Colors.black,
  fontSize: 10.0,
  fontFamily: 'Regular',
);

const kTextLabelFontDark = TextStyle(
  color: kFontDarkGreen,
  fontSize: 16.0,
  fontFamily: 'Regular',
);
final kAppBarShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
);

const kTextMedium = TextStyle(
  color: kFontDark,
  fontSize: 16.0,
  height: 1.2, //SETTING THIS CAN SOLVE YOUR PROBLEM
  fontFamily: 'Medium',
);
final kTextMediumPrimary = kTextMedium.copyWith(color: kPrimary);
const kTextSemiBold = TextStyle(
  color: kFontDark,
  fontSize: 20.0,
  height: 1,
  fontFamily: 'SemiBold',
);

final kHelperText = kTextRegular.copyWith(fontSize: 12, color: kPurplishGrey);
const kDrawerItemStyle = TextStyle(
  fontFamily: 'Regular',
  fontSize: 15,
  color: kPrimary,
);

const kTextRegular = TextStyle(
  color: kFontDark,
  fontSize: 16.0,
  fontFamily: 'Regular',
);

const kTextLight = TextStyle(
  color: kFontDark,
  fontSize: 12.0,
  fontFamily: 'Light',
);
final kTextRegularPrimary = kTextRegular.copyWith(
  color: kPrimary,
  fontSize: 12,
);

final kTextRegularGrey = kTextRegular.copyWith(
  color: kGreyishBrown,
  fontSize: 12,
);
final kTextRegularCoolGrey = kTextRegular.copyWith(
  color: kCoolGrey,
  fontSize: 12,
);
final kTextRegularSilver = kTextRegular.copyWith(
  color: kSilverTwo,
  fontSize: 12,
);

const kTextBold = TextStyle(
  color: kFontDark,
  fontSize: 16.0,
  fontFamily: 'Bold',
);

const kTextBoldTitle = TextStyle(
  color: kFontDarkGreen,
  fontSize: 18.0,
  fontFamily: 'Bold',
);
const kTextBoldSmall = TextStyle(
  color: kFontDarkGreen,
  fontSize: 11.0,
  fontFamily: 'Bold',
);

const kTextBodyBold = TextStyle(
  color: kFontDarkGreen,
  fontSize: 14.0,
  fontFamily: 'Bold',
);

const kTextFontIcon = TextStyle(fontFamily: 'fontIcon');
TextStyle get fontIcon => kTextFontIcon;

const kTextExtraBold = TextStyle(
  color: kFontDarkGreen,
  fontSize: 18.0,
  fontFamily: 'Black',
);

const kProfileFieldDecoration = InputDecoration(
  fillColor: kPaleGrey2,
  filled: true,
  errorMaxLines: 1,
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
const kTextFieldProfileItemDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(
    color: kSteal,
    fontSize: 13.0,
    fontFamily: 'Bahij_Regular',
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  ),
);

const kTextDescriptionFieldDecoration = InputDecoration(
  filled: true,
  fillColor: kFillColor,
  hintStyle: TextStyle(
    color: kSteal,
    fontSize: 13.0,
    fontFamily: 'Bahij_Regular',
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kPaleGray,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kPaleGray,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kPaleGray,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
);

const kTextFieldCommentDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(
    color: Colors.black,
    fontSize: 12.0,
    fontFamily: 'Bahij_Regular',
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: kBordColor,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: kWhiteOff,
      width: 1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(color: kSteal, width: 1, style: BorderStyle.solid),
  ),
);

final kTextFieldDecoration = InputDecoration(
  filled: false,
  hintText: "",

  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: kGrey_EB),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: kGrey_EB,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      color: kGrey_EB,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
);

final kRectangleTextFieldDecoration = kTextFieldDecoration.copyWith(
  hintStyle: kTextRegular.copyWith(
    color: kBattleShipGrey2.withOpacity(0.8),
    fontSize: 14,
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: kGrey_EB, width: 1),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: kGrey_EB, width: 1),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: kLipStick, width: 1),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: kLipStick, width: 1),
  ),
  errorMaxLines: 2,
);
final kTextFieldDecorationSearch = InputDecoration(
  fillColor: kWhite,
  filled: true,
  hintText: "",
  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(color: kGrey_56.withOpacity(0.2)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(
      color: kGrey_56.withOpacity(0.2),
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(
      color: kGrey_56.withOpacity(0.2),
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
);

final kSearchDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(27)),
    borderSide: BorderSide.none,
  ),
);

final kSearchOutlinedDecoration = InputDecoration(
  filled: false,
  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: Colors.red),
  ),
  disabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: kSilver),
  ),
);

final kBoxDecoration = BoxDecoration(
  color: kWhiteOff,
  border: Border.all(color: kPaleGray, width: 0, style: BorderStyle.none),
  borderRadius: BorderRadius.circular(12),
);
final kFieldDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(2, 2), // c
    ),
  ],
  borderRadius: BorderRadius.circular(4),
);

const kRequestTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: kBordColor,
      width: 1,
      style: BorderStyle.solid,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kBordColor,
      width: 1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimary, width: 1, style: BorderStyle.solid),
  ),
);

const kInputDecoration = InputDecoration(
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: kFontGreenHint,
    fontSize: 18.0,
    fontFamily: 'Regular',
  ),
  fillColor: Colors.white,
);

const kInputDecorationDisables = InputDecoration(
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: kFontGreenHint,
    fontSize: 18.0,
    fontFamily: 'Regular',
  ),
  fillColor: kWhiteF2,
);

const kCountryCodeList = [
  '+974',
  '+966',
  '+212',
  '+971',
  '+973',
  '+968',
  '+965',
  '+962',
];

kHideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

kunFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.focusedChild?.unfocus();
  }
}

kCommonDecoration({
  String? hint,
  Widget? icon,
  Widget? endIcon,
  String? helperText,
  TextStyle? helperStyle,
  Widget? suffix,
  Widget? prefix,
  TextDirection? textDirection,
}) {
  return kTextFieldDecoration.copyWith(
    prefixIcon: icon,
    hintText: hint,
    hintTextDirection: textDirection,
    suffixIcon: endIcon,
    suffix: suffix,
    prefix: prefix,
    helperText: helperText,
    helperStyle: helperStyle,
    suffixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 40),
    hintStyle: kTextRegular.copyWith(fontSize: 13, color: kBlueGrey),
    prefixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 30),
  );
}

Widget kLoadSvgIcon(String s) {
  return SvgPicture.asset('images/$s.svg', height: 15, color: kGrey_C3);
}

Widget kSvgIcon({required String image, Color? color,double? size}) {
  return SvgPicture.asset(image, height: size, color: color,width: size,);
}

// by Harbey
final kTextFieldDecorationLessRadius = InputDecoration(
  filled: false,
  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: kGrey_EB),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kGrey_EB,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kGrey_EB,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
);

final kTextFieldDecorationLessRadiusForTime = InputDecoration(
  filled: false,
  hintStyle: kTextLabelFontDark.copyWith(fontSize: 14, color: kSilver),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  constraints: const BoxConstraints(minHeight: 20, maxHeight: 35),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: kGrey_DF),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kGrey_DF,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: kGrey_DF,
      width: 1.1,
      style: BorderStyle.solid,
    ),
  ),
);
