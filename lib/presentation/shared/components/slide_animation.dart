import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';

class SlideAnimationWidget extends StatelessWidget{
  final Widget child;

  const SlideAnimationWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  FadedSlideAnimation(child : child,
      beginOffset: Offset(0,1),
      endOffset: Offset(0, 0),
      fadeDuration: Duration(milliseconds: 500),
      slideDuration: Duration(milliseconds: 800),
      slideCurve: Curves.linearToEaseOut,);
  }

}