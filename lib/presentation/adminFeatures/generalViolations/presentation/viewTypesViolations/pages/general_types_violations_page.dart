import 'package:flutter/material.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/text_field/text_field_search.dart';
import '../../../domain/entities/index.dart';
import '../bloc/general_types_violations_cubit.dart';
import 'general_types_violations_screen.dart';

class GeneralTypesViolationsPage
    extends BaseBlocWidget<Initialized<List<ViolationType>>, GeneralTypesViolationsCubit> {


  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.violations_types;
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
            title: strings.violations_types,
            textButton: strings.add_violation_type,
            onTap: () async {
              final isRefresh =
                  await Navigator.pushNamed(context, Routes.addTypeViolationPage);
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
      BuildContext context, Initialized<List<ViolationType>> state) {
    return GeneralTypesViolationsScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
    );
  }
}
