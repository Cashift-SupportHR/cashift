
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

AppBar kAppBarWhite(BuildContext context,
    {String title ='',  Function? onClickBack ,bool setBack = true , Color ? color = kAppBarColor, List<Widget>? actions, Widget? leading, bool? isDivider = true}) {


  final appbar =  AppBar(
    leading:  leading ?? (Navigator.canPop(context) == true  ?  IconButton(
      onPressed: () {
        if(onClickBack!=null){
          onClickBack();
        }else {
          Navigator.pop(context);
        }
      },
      icon: const Icon(Icons.arrow_back_rounded,color: kFontDark,),
    ):null),
    automaticallyImplyLeading: Navigator.canPop(context) == true ,
    elevation: 0,
    centerTitle: true,
    surfaceTintColor: kBackground,
    title: Text(title, style: kTextMedium.copyWith(color: kFontDark),),
    backgroundColor: color,
    actions: actions,
    bottom:  isDivider! ? PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: 8),
          color: kWhiteE4,
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(4.0)) : null,
  );

  // final appbarWithoutBack =  AppBar(
  //   elevation: 0,
  //   centerTitle: true,
  //   title: Text(title, style: kTextMedium.copyWith(color: kFontDark),),
  //   backgroundColor: kAppBarColor,
  //   leading: null,
  //   bottom:  PreferredSize(
  //       child: Container(
  //         padding: EdgeInsets.only(top: 8),
  //         color: kWhiteE4,
  //         height: 1.0,
  //       ),
  //       preferredSize: Size.fromHeight(4.0)),
  // );


  return appbar;
}