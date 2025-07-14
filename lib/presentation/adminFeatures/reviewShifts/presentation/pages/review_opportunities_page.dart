import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/facerecognation/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../common/components/pagination/pagination_widget.dart';
import '../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import '../../data/models/complet_opportunity_dto.dart';
import '../../data/models/review_shiftsprams.dart';
import '../bloc/review_opportunities_cubit.dart';
import 'review_opportunities_list_screen.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/text_field/text_field_search.dart';

class ReviewOpportunitiesTabsPage extends BaseBlocWidget<
    Initialized<List<CompletedOpportunityData>>, ReviewOpportunitiesCubit> {
  int status = 0;

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchOpportunityDataPagination(
      params: ReviewShiftsprams(
        statusId: status,
        pageNumber: 1,
        pageSize: 10,
      ),
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.opportunities_review;
  }

  TextEditingController  searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DynamicTabBarView(
          isSeparate: true,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          marginTabs: const EdgeInsets.symmetric(horizontal: 16),
          tabs: [
            DynamicItem(name: strings.waiting_approval, id: 0),
            DynamicItem(name: strings.approved, id: 22),
            DynamicItem(name: strings.rejected, id: 20),
          ],
          onTap: (index) {
            status = index;
            bloc.fetchOpportunityDataPagination(
              params: ReviewShiftsprams(
                statusId: status,
                pageNumber: 1,
                pageSize: 10,
              ),
            );
          },
          pageWidget: Column(
            children: [

              TextFieldSearch(
                title: strings.search,

                controller:searchController ,

              suffix: SizedBox(
                width: 20,
                child: InkWell(
                  onTap: () {
                    searchController.text="";
                    bloc.fetchOpportunityDataPagination(
                      params: ReviewShiftsprams(
                        statusId: status,
                        pageNumber: 1,
                        pageSize: 10,
                      ),
                    );
                  },
                  child: Icon(Icons.clear,color: Colors.grey),
                ),
              ),
                onChanged: (value) {
                  if (value.isEmpty || value.endsWith(' ')){

                  }else{
                    bloc.fetchOpportunityDataPagination(
                      isRefresh: true,
                      params: ReviewShiftsprams(
                        statusId: status,
                        pageNumber: 1,
                        pageSize: 10,
                        searchString: value,
                      ),
                    );
                  }

                },
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              ),
              Expanded(child: buildConsumer(context)),
            ],
          ),
        ),
      ),
    );
  }

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  ScrollController _scrollController = ScrollController();

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CompletedOpportunityData>> state) {
    return PaginationWidget(
      refreshController: bloc.refreshController,
      onLoading: () {
        bloc.fetchOpportunityDataPagination(
          isRefresh: false,
          params: ReviewShiftsprams(statusId: status, pageSize: 10),
        );
      },
      onRefresh: () {
        bloc.fetchOpportunityDataPagination(
          params: ReviewShiftsprams(statusId: status, pageSize: 10),
        );
      },
      child: ReviewOpportunitiesListScreen(
        data: state.data ?? [],
        onUpdate: () => loadInitialData(context),
      ),
    );
  }
}
