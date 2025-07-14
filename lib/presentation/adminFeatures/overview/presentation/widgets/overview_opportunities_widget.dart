
import '../../../../../core/services/routes.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../presentationUser/resources/colors.dart';
import '../../../../presentationUser/resources/constants.dart';
import '../../../../../common/components/index.dart';
import '../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../../available_opportunities/presentation/widgets/available_opportunity_item.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import '../../../shared/domain/entities/opportunities/opportunity_constants.dart';
import '../../domain/entities/view_filter.dart';

class OpportunitiesWithFilterWidget extends BaseStatelessWidget {
  final Function() onRefresh;
  final StreamState<CommonState> streamState;
  final Function(FilterViewType filter) onChangeFilter;
  final ScrollController? scrollController;
  StreamStateInitial<FilterViewType> filterViewTypeController =
      StreamStateInitial<FilterViewType>();

  OpportunitiesWithFilterWidget(
      {required this.streamState,
      required this.onChangeFilter,
      this.scrollController, required this.onRefresh});
  FilterViewType filter = FilterViewType.active ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<FilterViewType>(
              initialData: FilterViewType.active,
                stream: filterViewTypeController.stream,
                builder: (context, snapshot) {
                  filter = snapshot.requireData ;
                onChangeFilter(snapshot.requireData);
                  return filterView(getFilterName(snapshot.data!));
                }),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.availableOpportunity, arguments: getTypeByFilter());
              },
              child: Text(
                strings.show_more,
                style: kTextMedium.copyWith(color: kGrey),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        opportunitiesSection(),
      ],
    );
  }

  Widget opportunitiesSection() {
    return StreamBuilder<CommonState>(
        stream: streamState.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            print('SliderWidget snapshot ${snapshot.data}');
            if(snapshot.data is Initialized<List<Opportunity>>) {
              final list =( snapshot.data as Initialized<List<Opportunity>>).data ?? [];
              return ListView.builder(
                  itemCount: list.length,
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return AvailableOpportunityItem(
                      opportunity: item,
                      index: getTypeByFilter(),
                      onRefresh: onRefresh,
                      onNavigatorToEdit: (){
                        AddNewOpportunityPage.push(context, opportunity: item, onSuccess: () {
                          onRefresh();
                        });
                      },
                    );
                  });
            }else{
              return const SizedBox(
                height: 150,
                child: LoadingView(

                ),
              );
            }
          }
          else if(snapshot .hasError){
            return ErrorPlaceHolderWidget(exception: snapshot.error!,

            );
          }
          else {
            return const Center();
          }
        });
  }

  Widget opportunitiesViewOptions(String name) {
    print('OptionsMenuButton $name');
    return OptionsMenuButton(
      optionsString: [
        strings.active_opportunities,
        strings.finished_opportunities,
        strings.canceled_opportunities
      ],
      onSelect: (int index) {
        if (index == 0) {
          filterViewTypeController.setData(FilterViewType.active);
        }
        if (index == 1) {
          filterViewTypeController.setData(FilterViewType.finished);
        }
        if (index == 2) {
          filterViewTypeController.setData(FilterViewType.canceled);
        }
      },
      title: MaterialText(
        name,
        endIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: kPrimaryDark,
        ),
        style: kTextMedium.copyWith(fontSize: 15, color: kBlackGrey),
      ),
    );
  }

  Widget filterView(String name) {
    return opportunitiesViewOptions(name);
  }

  String getFilterName(FilterViewType filterViewType) {
    return filterViewType == FilterViewType.active
        ? strings.active_opportunities
        : filterViewType == FilterViewType.finished
            ? strings.finished_opportunities
            : strings.canceled_opportunities;
  }

  int getTypeByFilter() {
    return filter == FilterViewType.active
        ?OpportunityStatus.activeOpportunity
        : filter == FilterViewType.finished
        ? OpportunityStatus.expiredOpportunity
        : OpportunityStatus.canceledOpportunity ;
  }
}
