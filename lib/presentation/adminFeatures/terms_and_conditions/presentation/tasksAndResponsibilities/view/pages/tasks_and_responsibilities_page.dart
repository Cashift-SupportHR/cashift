import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/pages/terms_and_conditions_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';

import '../../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/TermandCondition.dart';
import '../../add/pages/add_task_and_responsibility_builder.dart';
import '../bloc/tasks_and_responsibilities_cubit.dart';

class TasksAndResponsibilitiesPage extends BaseBlocWidget<
    Initialized<List<TermandCondition>>, TasksAndResponsibilitiesCubit> {
  int tabIndex = 1;
  String search = '';

  @override
  String? title(BuildContext context) {
    return strings.tasks_and_responsibilities;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData(type: tabIndex);
    controller.clear();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TextFieldSearch(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
          TitleAndAddNewRequest(
            title: strings.tasks_and_responsibilities,
            textButton: strings.add_task_responsibility,
            onTap: () {
              showAddConditionSheet(isEdit: false);
            },
          ),
          Expanded(
            child: TabBarViewWidget(
              isSeparate: true,
              padding: const EdgeInsets.all(0),
              marginTabs: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                strings.active,
                strings.inactive,
              ],
              onTap: (index) {
                tabIndex = index + 1;
                bloc.fetchInitialData(type: tabIndex);
              },
              pageWidget: buildConsumer(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<TermandCondition>> state) {
    return TermsAndConditionsScreen(
      type: tabIndex,
      updateType: (int id) {
        bloc.updateType(id: id, type: tabIndex);
      },
      onDelete: (id) {
        bloc.deleteTermandCondition(id: id, type: tabIndex);
      },
      onEdit: (TermandCondition) {
        showAddConditionSheet(termAndCondition: TermandCondition, isEdit: true);
      },
      termsAndConditionsState: state.data,
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchInitialData(type: tabIndex);
  }

  showAddConditionSheet(
      {TermandCondition? termAndCondition, required bool isEdit}) {
    return showAppModalBottomSheet(
      title: isEdit == true
          ? strings.edit_task_responsibility
          : strings.add_task_responsibility,
      context: context,
      child: AddTaskAndResponsibilityBuilder(
        termandCondition: termAndCondition,
        onRefresh: () {
          bloc.fetchInitialData(type: tabIndex);
        },
      ),
    );
  }
}
