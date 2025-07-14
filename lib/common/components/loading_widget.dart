import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

class LoadingView extends StatelessWidget {
  final double?  height ;
  final Color? color;

  const LoadingView({Key? key,  this.height, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color ?? Colors.transparent,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 30,
                width: 30,
/*
                child: Image.asset('images/loading_gify.gif'),
*/
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: kSteal,
                ),
              ),
            ],
          ),
        ));
  }
}

class SmallLoadingView extends StatelessWidget {
  final double? height;

  const SmallLoadingView({this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
                height: 15.0,
                width: 15.0,
              ),
            ],
          ),
        ));
  }
}
