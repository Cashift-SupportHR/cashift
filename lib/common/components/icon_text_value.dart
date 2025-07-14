// import '../../presentationUser/resources/colors.dart';
// import '../../presentationUser/resources/constants.dart';
// import 'index.dart';
//
// class IconTextValueWidget extends BaseStatelessWidget {
//   final String icon;
//   final Color? iconColor;
//   final String name;
//   final TextStyle? nameStyle;
//   final String? value;
//   final TextStyle? valueStyle;
//   final Widget? valueWidget;
//   final CrossAxisAlignment? crossAxisAlignment;
//   final EdgeInsetsGeometry? padding;
//   final double? iconSize;
//   final int? maxLines;
//   final int flexValue;
//   final bool? isImage;
//
//   const IconTextValueWidget({
//     Key? key,
//     required this.icon,
//     required this.name,
//     this.value,
//     this.maxLines,
//     this.crossAxisAlignment,
//     this.valueWidget,
//     this.iconColor,
//     this.nameStyle,
//     this.valueStyle,
//     this.padding,
//     this.iconSize,
//     this.flexValue = 3,
//     this.isImage,
//   }) ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 2,
//             child: Row(
//               crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
//               children: [
//                 isImage ?? false
//                     ? kBuildImage(
//                   icon,
//                   border: 0,
//                   size: iconSize ?? 20,
//                 )
//                     : Expanded(
//                   child: kLoadSvgInCirclePath(
//                     icon,
//                     color: iconColor,
//                     height: iconSize ?? 20,
//                     width: iconSize ?? 20,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Text(name, maxLines: maxLines , style: nameStyle ?? kTextMedium.copyWith(color: kPrimary, fontSize: 12, overflow: TextOverflow.ellipsis)),
//                 ),
//               ],
//             ),
//           ),
//           valueWidget ??
//               Expanded(
//                 flex: flexValue,
//                 child: Text(
//                   value ?? '',
//                   maxLines: maxLines,
//                   style: valueStyle ?? kTextRegular.copyWith(color: kBlack.withOpacity(0.8), fontSize: 12, overflow: TextOverflow.ellipsis),
//                 ),
//               ),
//         ],
//       ),
//     );
//   }
// }