// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
//
// import 'package:shiftapp/common/domain/user.dart';
// import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
// import 'package:shiftapp/presentation/presentationUser/profile/bloc/profile_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/profile/pages/profile_screen.dart';
// import 'package:shiftapp/presentation/shared/components/base_widget.dart';
// import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';
// import 'package:shiftapp/presentation/shared/components/loading_widget.dart';
//
// class PersonalPictureWidget extends BaseWidget {
//
//
//  late ProfileBloc _profileBloc ;
//   @override
//   Widget buildWidget(BuildContext context) {
//
//      _profileBloc =  GetIt.instance.get<ProfileBloc>();
//
//      _profileBloc.add(FetchProfile());
//     return BlocBuilder<ProfileBloc, CommonState>(
//         bloc: _profileBloc,
//         buildWhen: (c, state) {
//           return state is Initialized<User> ||
//               state is LoadingState ||
//               state is ErrorState;
//         },
//         builder: (
//             BuildContext context,
//             CommonState currentState,
//             ) {
//           if (currentState is LoadingState) {
//             return LoadingView();
//           }
//           if (currentState is ErrorState) {
//             return buildProfilePictureUI();
//
//           }
//           if (currentState is Initialized<User>) {
//             return buildProfilePictureUI(imagePath: currentState.data.getImagePath());
//           }
//
//           return const Center();
//         }) ;
//
//
//
//   }
//
//   Widget buildProfilePictureUI({String  ? imagePath}) {
//     return BlocListener<ProfileBloc, CommonState>(
//       bloc: _profileBloc,
//       listener: (context, state) {
//         if (state is LoadingDialogState) {
//           progress.show();
//         }
//         if (state is FinishedDialogState) {
//           progress.dismiss();
//         }
//         if (state is ErrorDialogState) {
//           print('ON GET ERROR DIALOG ');
//           progress.dismiss();
//           DialogsManager.showErrorDialog(context, (state).toString());
//         }
//       },
//       child:  ProfileImagePicker(
//         onPickImage: (file) {
//           _profileBloc.add(UpdateProfileImage(file));
//         },
//         imagePath: imagePath??'',
//       ),
//     ) ;
//   }
//
//
// }