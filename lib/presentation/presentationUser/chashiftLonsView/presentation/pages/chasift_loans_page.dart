import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/stream_state_widget_v2.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/stepper/easy_step.dart';
import 'package:shiftapp/presentation/shared/loans/presentation/view/pages/loans_screen.dart';
import 'package:shiftapp/presentation/shared/loans/presentation/view/widgets/total_loan_widget.dart';

import '../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import '../../../../shared/loans/domain/entities/loan_data.dart';
import '../../../../shared/loans/presentation/view/bloc/chashift_loans_cubit.dart';

class ChashiftLoansPage extends BaseBlocWidget<InitializedLoansTabsData, ChashiftLoansCubit> {
   int? tabIndex;

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
    bloc.fetchTabAndTotalLoans(isAdmin: false);
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
        ];
      },
      body: DynamicTabBarView(
        isSeparate: true,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(0),
        marginTabs: const EdgeInsets.symmetric(horizontal: 0),
        onTap: (index) {
          tabIndex = index;
          bloc.fetchLoansStream(status: tabIndex ?? 45, isAdmin: false);
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
}
