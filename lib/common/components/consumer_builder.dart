import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

class ConsumerBuilder extends StatelessWidget{
  final Widget Function(CommonState state) builder ;
  final Function(CommonState state) listener ;
  final BlocBase bloc ;

  const ConsumerBuilder({Key? key, required this.builder, required this.listener, required this.bloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return buildConsumer(context);
  }

  BlocConsumer buildConsumer(BuildContext context) {
    return BlocConsumer(
        bloc: bloc,
        listenWhen: (state, current) => current is CommonStateFListener,
        buildWhen: (state, current) => current is CommonStateFBuilder,
        builder: (context, state) {
           return builder(state) ;
        },
        listener: (context, state)  {
          listener(state);
        });
  }
}