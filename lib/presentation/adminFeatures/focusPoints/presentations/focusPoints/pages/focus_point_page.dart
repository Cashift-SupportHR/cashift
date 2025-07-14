import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/focus_point.dart';
import '../bloc/focus_point_cubit.dart';
import 'focus_point_screen.dart';

class FocusPointsPage
    extends BaseBlocWidget<Initialized<List<FocusPoint>>, FocusPointCubit> {
   FocusPointsPage({Key? key}) : super(key: key);

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.loadInitialData();
    Timer.periodic(const Duration(seconds: 60), (Timer t) =>  bloc.loadInitialData());
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFieldSearchJob(
                title: strings.search,
                readOnly: false,
                onTap: () {},
                onChanged: (value) {
                  if (value.isEmpty) {
                    loadInitialData(context);
                    return;
                  }
                  print('points is ${value}');

                  bloc.searchByText(value);
                },
              ),
            ),
            Expanded(child: buildConsumer(context))
          ],
        ));
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<FocusPoint>> state) {
    print('Initialized FocusPoint ${state.data.length}');
    return RefreshIndicator(
      onRefresh: () async {
        bloc.loadInitialData();
      },
      child: FocusPointUsersScreen(
        onRefresh: () {
          bloc.loadInitialData();
        },
        points: state.data,
        onDeleteFocusPoint: (id) {
          bloc.deleteFocusPoint(id);
        },
      ),
    );
  }

  @override
  String? title(BuildContext context) => strings.list_gates_added;
}
