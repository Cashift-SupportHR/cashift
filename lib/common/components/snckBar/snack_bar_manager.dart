import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

class SnackBarManager{
  static void showErrorSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: kTextRegular.copyWith(color: kWhite),),
          duration: const Duration(seconds: 3),
          backgroundColor: kRed_2,
          behavior: SnackBarBehavior.floating,
        )
    );
  }
}