import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/classification.dart';
import '../bloc/classification_cubit.dart';
import 'classification_screen.dart';

class ClassificationPage extends BaseBlocWidget<Initialized<List<Classification>>, ClassificationCubit> {
  final int type;

  ClassificationPage({Key? key, required this.type}) : super(key: key);

  @override
  void loadInitialData(context) {
    bloc.fetchInitialData(type: type);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return mainFrame(
  //       body: Column(
  //     children: [
  //
  //       Expanded(child: buildConsumer(context))
  //     ],
  //   ));
  // }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<Classification>> state) {
    return ClassificationScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
      type: type,
      onDeleteUser: (id) {
        bloc.deleteClassification(id: id);
        loadInitialData(context);
      },
    );
  }

  @override
  onRequestSuccess(message) {
    bloc.fetchInitialData(type: type);
  }
}
