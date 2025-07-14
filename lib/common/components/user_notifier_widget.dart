import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/bloc/profile_cubit.dart';

class UserNotifierWidget extends StatelessWidget {
  final Widget child;

  final Function onUpdate;

  const UserNotifierWidget(
      {Key? key, required this.child, required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _profileBloc = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder(
        bloc: _profileBloc,
        builder: (con, state) {
          print('ON Update Profile ${state.toString()}');
          if (state is Initialized<bool>) {
            onUpdate();
          }
          return child;
        },
    );
  }
}
