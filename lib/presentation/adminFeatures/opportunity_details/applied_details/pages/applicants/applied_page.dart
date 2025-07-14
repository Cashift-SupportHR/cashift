
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/index.dart';
import '../../../../addOpportunity/domain/entities/opportunity_applicant.dart';
import '../../../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';
import '../../bloc/applied_details_cubit.dart';
import 'applied_Screen.dart';

class AppliedPage
    extends BaseBlocWidget<Initialized<OpportunityApplicant>, AppliedDetailsCubit> {
  AppliedPage({
    Key? key,
  }) : super(key: key);

  int tabIndex = 1;

  TextEditingController controller = TextEditingController();

  @override
  loadInitialData(BuildContext context) {
    final opportunityDetails = getArguments<OpportunityDetailsData>(context);
    bloc.fetchInitialData(id: opportunityDetails?.id ?? 0, tab: tabIndex);
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.applicants;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final opportunityDetails = getArguments<OpportunityDetailsData>(context);

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
          Expanded(
            child: TabBarViewWidget(
              isSeparate: true,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              marginTabs: const EdgeInsets.symmetric(horizontal: 10),
              tabs: [
                strings.active,
                strings.waiting_for_approval,
                strings.paid_off,
                strings.canceled_withdrawn,
              ],
              onTap: (index) async {
                tabIndex = index + 1;
                bloc.fetchInitialData(
                    tab: tabIndex, id: opportunityDetails?.id ?? 0);
                controller.clear();
              },
              pageWidget: buildConsumer(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<OpportunityApplicant> state) {
    OpportunityDetailsData opportunityDetails = getArguments(context);

    return AppliedScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
      onBlockEmployee: (value) {
        bloc.addBlockEmployee(value);
      },
      opportunityDetails: opportunityDetails,
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }
}
