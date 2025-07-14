import 'package:flutter/material.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/text_field/text_field_search.dart';
import '../../../domain/entities/general_violation.dart';
import '../bloc/general_violations_cubit.dart';
import 'general_violations_screen.dart';

class GeneralViolationsPage
    extends BaseBlocWidget<Initialized<List<GeneralViolation>>, GeneralViolationsCubit> {

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.violations;
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
            title: strings.violations,
            textButton: strings.add_violation,
            onTap: () async {
              final isRefresh =
                  await Navigator.pushNamed(context, Routes.addGeneralViolationPage);
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
      BuildContext context, Initialized<List<GeneralViolation>> state) {
    return GeneralViolationsScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
    );
  }
}
