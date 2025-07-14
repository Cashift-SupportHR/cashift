import 'package:flutter/material.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../data/models/index.dart';
import '../../../domain/entities/index.dart';
import '../bloc/work_hazards_cubit.dart';
import 'work_hazards_screen.dart';

class WorkHazardsPage
    extends BaseBlocWidget<Initialized<List<WorkHazard>>, WorkHazardsCubit> {
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.work_hazards;
  }

  TextEditingController controller = TextEditingController();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.view_work_hazards,
            textButton: strings.add_hazards,
            onTap: () async {
              final isRefresh =
                  await Navigator.pushNamed(context, Routes.addWorkHazardsPage);
              print('isRefresh $isRefresh');
              if (isRefresh == true) {
                loadInitialData(context);
              }
            },
          ),
          TextFieldSearch(
            margin: EdgeInsets.only(right: 12, left: 12, bottom: 12),
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
          Expanded(
            child: buildConsumer(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<WorkHazard>> state) {
    return WorkHazardsScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
    );
  }
}
