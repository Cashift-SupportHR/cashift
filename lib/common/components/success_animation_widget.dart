import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

class SuccessAnimationWidget extends StatefulWidget {

 final  Function onFinish ;
 final String ? message ;
  const SuccessAnimationWidget({Key? key,required this.onFinish  , this.message}) : super(key: key);

  @override
  _SuccessAnimationWidgetState createState() => _SuccessAnimationWidgetState();
}

class _SuccessAnimationWidgetState extends State<SuccessAnimationWidget> with TickerProviderStateMixin{


  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print('ON UPDATE ${_controller.status} => ${_controller.status.index}');
      if(_controller.status.index==3){
        widget.onFinish();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Center(child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('images/success_anim3.json',
              onLoaded: (c){
                _controller
                  ..duration = c.duration
                  ..forward();
              },controller: _controller,width: 200, height: 200),
          widget.message !=null  ? Text(widget.message! , style: kTextMedium.copyWith(color: Colors.white),) :Container()
        ],
      ),
    ));
  }
}
