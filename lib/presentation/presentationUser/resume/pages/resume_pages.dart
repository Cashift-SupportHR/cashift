import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/bloc/profile_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';

import 'package:shiftapp/common/components/base/base_widget.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/error_handler_widget.dart';
import 'package:shiftapp/common/components/loading_widget.dart';

import '../../../../core/services/routes.dart';
 import 'resume_screen.dart';

class ResumePages extends BaseWidget {

  ResumePages({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final bloc = GetIt.instance.get<ResumeBloc>();
    final progress = DialogsManager.createProgress(context);
    final _profileBloc = GetIt.instance.get<ProfileCubit>();

    bloc.add(FetchComponentDataEvent());
    bool isHomePage =
    getArguments(context) ?? false;
    print('isHome $isHomePage');
    return Scaffold(
      body: BlocProvider(
        create: (c) {
          return bloc;
        },
        child: BlocBuilder(
          bloc: bloc,
          buildWhen: (c, state) {
            return state is Initialized<ResumeComponentData> ||
                state is LoadingState ||
                state is ErrorState;
          },
          builder: (BuildContext context, state) {
            if (state is LoadingState) {
              return LoadingView();
            }

            if (state is Initialized<ResumeComponentData>) {
              return BlocListener(
                bloc: bloc,
                listener: (BuildContext context, state) {
                  if (state is LoadingStateListener) {
                    progress.show();
                  }
                  if (state is Initialized<String>) {
                    progress.dismiss();

                    DialogsManager.showSuccessDialog(context, onClickOk: () {
                      Navigator.pop(context, true);
                      print('NotifyUpdateEvent');
                      _profileBloc.notifyUpdate();
                      // if the user navigated from home screen then navigate back to home screen to refresh the data
                      isHomePage
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, Routes.home, (route) => false)
                          : Navigator.pop(context);
                    }, message: state.data);
                  }
                  if (state is FailureStateListener) {
                    progress.dismiss();
                    DialogsManager.handleErrorDialogBuilder(
                        context, state.error);
                  }
                },
                child: ResumeScreen(
                  resumeComponentData: state.data,
                  onPerformUpdate: (updateResumeParams) {
                    bloc.add(UpdateResumeEvent(updateResumeParams));
                  },
                ),
              );
            }

            if (state is ErrorState) {
              return ErrorPlaceHolderWidget(
                exception: state.error,
              );
            }
            return Center();
          },
        ),
      ),
    );
  }
  @override
  void onRequestDismissed() {

  }
}
