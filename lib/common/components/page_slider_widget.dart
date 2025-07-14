import 'package:flutter/cupertino.dart';

import 'base/base_widget.dart';


class SliderWidget extends BaseWidget{
  final int length ;
  final bool  ? special ;
  final double ?  hight ;
  final  IndexedWidgetBuilder itemBuilder;

  SliderWidget({Key? key, required this.length  , this.special , required this.itemBuilder ,this.hight}) : super(key: key);
  @override
  Widget buildWidget(BuildContext context) {
    return SizedBox(
      height:hight?? 210,
      child: PageView.builder(
          pageSnapping: true,
          controller: PageController(
            viewportFraction: 0.91,
            initialPage: 0,
          ),
          itemCount: length,
          itemBuilder: itemBuilder),
    ) ;
  }

}