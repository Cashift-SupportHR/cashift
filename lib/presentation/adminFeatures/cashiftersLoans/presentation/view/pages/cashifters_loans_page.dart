import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/termsAndConditions/add/pages/add_condition_builder.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/stream_state_widget_v2.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/stepper/easy_step.dart';
import 'package:shiftapp/presentation/shared/loans/presentation/view/pages/loans_screen.dart';
import 'package:shiftapp/presentation/shared/loans/presentation/view/widgets/total_loan_widget.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/material_text_field.dart';
import '../../../../../shared/loans/domain/entities/loan_data.dart';
import '../../../../../shared/loans/domain/entities/tabs_and_total_loans.dart';
import '../../../../../shared/loans/presentation/view/bloc/chashift_loans_cubit.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../add_cashifter_loan/pages/add_cashifter_loan_page.dart';
import '../bloc/cashifters_loans_cubit.dart';

class AdminChashiftLoansPage extends BaseBlocWidget<InitializedLoansTabsData, ChashiftLoansCubit> {
   int tabIndex = 1;
  String search = '';

  @override
  String? title(BuildContext context) {
    return strings.loans;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchTabAndTotalLoans(
      isAdmin: true,
    );
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
            child: MaterialTextField(
              inputDecoration: kTextFieldDecorationSearch.copyWith(
                hintText: strings.search_by_phone,
                hintStyle: kTextRegular.copyWith(color: kBlack.withOpacity(0.2), fontSize: 14),
              ),
              controller: controller,
              readOnly: false,
              keyboardType: TextInputType.number,
              onTap: () {},
              onChanged: (value) {
                bloc.searchByText(value);
              },
            ),
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  final scrollController = ScrollController();
  @override
  Widget buildWidget(BuildContext context, InitializedLoansTabsData state) {
    return NestedScrollView(
      controller: scrollController,
      floatHeaderSlivers: true,
      scrollBehavior: ScrollBehavior(),
      physics: AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: TotalLoansWidget(totalLoans: state.dataTab.totalLoans),
          ),
          SliverToBoxAdapter(
            child: TitleAndAddNewRequest(
              title: strings.loans,
              textButton: strings.add_loans,
              onTap: () async {
                final isRefresh = await Navigator.pushNamed(context, Routes.addCashifterLoanPage);
                if (isRefresh != null && isRefresh is bool && isRefresh) {
                  bloc.fetchTabAndTotalLoans(
                    isAdmin: true,
                  );
                }
              },
            ),
          )
        ];
      },
      body: DynamicTabBarView(
        isSeparate: true,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(0),
        marginTabs: const EdgeInsets.symmetric(horizontal: 0),
        onTap: (index) {
          tabIndex = index;
          bloc.fetchLoansStream(status: tabIndex ?? 45, isAdmin: true);
        },
        tabs: state.dataTab.tabLoans?.map((e) => DynamicItem(name: e.name!, id: e.value!)).toList() ?? [],
        pageWidget: StreamStateWidgetV2<List<LoanData>?>(
          stream: bloc.loansStream,
          initialData: state.loanData,
          builder: (context, data) {
            return ChashiftLoansScreen(type: tabIndex ?? 45, data: data ?? []);
          },
        ),
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchTabAndTotalLoans(isAdmin: true);
  }
}
