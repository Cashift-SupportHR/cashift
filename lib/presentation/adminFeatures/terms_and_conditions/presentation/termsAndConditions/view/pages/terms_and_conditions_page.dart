import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/pages/terms_and_conditions_screen.dart';
import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/termsAndConditions/add/pages/add_condition_builder.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';

import '../../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/TermandCondition.dart';
import '../bloc/terms_and_conditions_cubit.dart';

class TermsAndConditionsPage extends BaseBlocWidget<Initialized<List<TermandCondition>>, TermsAndConditionsCubit> {
   int tabIndex = 1;
  String search = '';

  @override
  String? title(BuildContext context) {
    return strings.copy_rights_title;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldSearchJob(
              title: strings.search,
              controller: controller,
              readOnly: false,
              onTap: () {},
              onChanged: (value) {
                bloc.searchByText(value);
              },
            ),
          ),
          TitleAndAddNewRequest(
            title: strings.copy_rights_title,
            textButton: strings.add_copy_rights_title,
            onTap: () {
              showAddConditionSheet(isEdit: false);
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<TermandCondition>> state) {
    return TabBarViewWidget(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      marginTabs: const EdgeInsets.symmetric(horizontal: 16),
      tabs: [
        strings.active,
        strings.inactive,
      ],
      onTap: (index) {
        tabIndex = index + 1;
        bloc.fetchTermsAndConditions(type: tabIndex);
      },
      pageWidget: StreamStateWidgetV2<List<TermandCondition>?>(
          stream: bloc.termandCondition,
          initialData: state.data,
          builder: (context, snapshot) {
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
                        termsAndConditionsState: snapshot ?? [],
                      );
          }),
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchTermsAndConditions(type: tabIndex);
  }

  showAddConditionSheet({TermandCondition? termAndCondition, required bool isEdit}) {
    return showAppModalBottomSheet(
      title: isEdit == true ? strings.edit_condition : strings.add_condition,
      context: context,
      child: AddConditionBuilder(
          termAndCondition: termAndCondition,
          onRefresh: () {
            bloc.fetchTermsAndConditions(type: tabIndex);
          }),
    );
  }
}
