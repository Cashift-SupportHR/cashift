import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/pages/profile_screen.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/bloc/profile_ui_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';

import '../../../../../main_index.dart';
import '../bloc/profile_cubit.dart';
import '../widgets/dropdown_language.dart';

class ProfilePage extends BaseBlocWidget<ProfileInitialize, ProfileCubit> {


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProfileData();
  }
  @override
  bool detectRequiredTasks() {
    return false;
  }


  @override
  String? title(BuildContext context) {
    return strings.profile;
  }

  @override
  Widget buildWidget(BuildContext context, ProfileInitialize state) {
    return ProfileScreen(
      user: state,
      onUpdateState: (state) {
        handleProfileUpdateState(state);
      },
    );
  }

  logout() {
    DialogsManager.showLogoutDialog(context, onClickOk: () {
      bloc.checkLogout();
      // Navigator.pushNamedAndRemoveUntil(
      //     context, MyHomeScreen.routeName, (route) => false);
    });
  }

  @override
  buildListener(BuildContext context, dynamic state) {
    super.buildListener(context, state);
    if (state is UpdateHomeState) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.home, (route) => false);
    }
  }

  deleteAccount() {
    DialogsManager.showConfirmationAnimatedDialog(context,
        message: strings.delete_account_message, onConfirm: () {
      bloc.deleteAccount();
    });
  }

  void handleProfileUpdateState(ProfileUiState state) {
    if (state is UpdateProfilePictureState) {
      bloc.updateProfileImage(state.file);
    }
    if (state is LogoutState) {
      logout();
    }
    if (state is DeleteAccountState) {
      deleteAccount();
    }
  }

  @override
  Widget handleApiErrorPlaceHolder(error,
      {Function()? onReload, String? buttonName, double? height}) {
    return super.handleApiErrorPlaceHolder(error, onReload: () {
      bloc.localLogout();
    }, buttonName: strings.logout, height: height);
  }

  @override
  List<Widget>? appBarActions(BuildContext context) {
    return [
      DropdownLanguage(),
    ];
  }

  @override
  void onSuccessDismissed() {
    super.onSuccessDismissed();
    bloc.fetchProfileData();
  }
}
