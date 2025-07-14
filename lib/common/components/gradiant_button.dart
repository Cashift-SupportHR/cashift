import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';


class GradiantButton extends StatelessWidget {
  final String text ;
  final Widget  ? child ;
  final Function onPressed ;
  final double  ? width ;
  final List<Color> ?  colors ;
  final EdgeInsetsGeometry  ? padding  ;
  const GradiantButton({Key? key,this.colors ,this.child ,  required this.text,required this.onPressed ,this.width ,this.padding }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: padding,
      height: 36,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:colors?? [
              kCoolGreen,
              kPrimary,
            ],
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      child: TextButton(
        onPressed: () async {
         onPressed();
        },

        child: child?? Text(
            text,
            style: kTextMedium.copyWith(color: Colors.white)
        ),
        style: ButtonStyle(
          padding:MaterialStateProperty.all(padding??EdgeInsets.all(0)),

        ),
      ),
    ) ;
  }

}