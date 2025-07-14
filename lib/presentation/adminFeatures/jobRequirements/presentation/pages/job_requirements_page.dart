import 'package:shiftapp/presentation/adminFeatures/jobRequirements/presentation/pages/add_job_requirements_builder.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../presentationUser/advancedFilter/widgets/select_item_widget.dart';
import '../../../../presentationUser/advancedFilter/widgets/select_widget.dart';
import '../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../common/components/index.dart';
import '../../domain/entities/index.dart';
import '../bloc/job_requirements_cubit.dart';
import 'job_requirements_screen.dart';

class JobRequirementsPage extends BaseBlocWidget<Initialized<List<JobModel>>, JobRequirementsCubit> {

  int tabIndex = 1;
  int jobId = 0;
  String search = '';

  @override
  String? title(BuildContext context) {
    return strings.terms_conditions_opportunities;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchJob(type: tabIndex);
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
                search = value;
                bloc.searchByText(value);
              },
            ),
          ),
          TitleAndAddNewRequest(
            title: strings.terms_conditions_opportunities,
            textButton: strings.add_new,
            onTap: () {
              showAppModalBottomSheet(
                title: strings.add_terms_conditions_opportunities,
                context: context,
                child: AddRequirementsBuilder(
                  type: tabIndex,
                  onRefresh: () {
                    bloc.fetchJobRequirements(type: tabIndex, search: jobId.toString());
                    controller.clear();
                  },
                  jobRequirements: null,
                ),
              );
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<JobModel>> state) {
    return Column(
      children: [
        SelectItemWidget(
          title: strings.select_occupation,
          items: state.data.map((e) => Item(index: e.id!, value: e.icon ?? "", description: e.jobName.toString())).toList(),
          initialValue: jobId,
          onSelected: (value) {
            print('value: $value');
            jobId = value;
            bloc.searchByText(value.toString());
            print(jobId);
          },
        ),
        Expanded(
          child: TabBarViewWidget(
            isSeparate: true,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            marginTabs: const EdgeInsets.symmetric(horizontal: 16),
            tabs: [
              strings.active,
              strings.inactive,
            ],
            onTap: (index) async {
              tabIndex = index + 1;
              bloc.fetchJobRequirements(type: tabIndex, search: jobId.toString());
              controller.clear();
            },
            pageWidget: StreamStateWidgetV2<List<JobRequirements>?>(
                stream: bloc.jobRequirementsStream,
                builder: (context, data) {
                  return RequirementsJobScreen(
                    type: tabIndex,
                    job: state.data ?? [],
                    updateType: (int id) {
                      //bloc.updateType(id: id, type: tabIndex);
                    },
                    onDelete: (id) {
                      bloc.deleteJobRequirements(id: id, type: tabIndex);
                    },
                    onRefresh: () {
                      bloc.fetchJobRequirements(type: tabIndex, search: jobId.toString());
                    },
                    jobRequirementsState: data ?? [],
                  );
                }),
          ),
        ),
      ],
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchJobRequirements(type: tabIndex, search: jobId.toString());
    controller.clear();
  }
}
