import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/stream_state_widget_v2.dart';
import 'package:shiftapp/common/components/error_handler_widget.dart';

import '../../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../presentationUser/resources/constants.dart';
import '../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../../available_opportunities/presentation/widgets/available_opportunity_itemv2.dart';
import '../../domain/entities/tab_with_opportunities.dart';

///  Created by harbey on 9/28/2023.
class SliderOpportunitiesList extends StatelessWidget {
  final StreamState<List<TabWithOpportunities>> tabsWithOpportunitiesStream;
  Function() onRefresh;

  SliderOpportunitiesList({
    Key? key,
    required this.tabsWithOpportunitiesStream,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamStateWidgetV2<List<TabWithOpportunities>>(
      stream: tabsWithOpportunitiesStream,
      builder: (context, snapshot) {
        print('snapshot.length ${snapshot}');
        return snapshot == null || snapshot.isEmpty
            ? ErrorPlaceHolderWidget(
                exception: EmptyListException(),
              )
            : ListView.builder(
                itemCount: snapshot.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsetsDirectional.only(top: 10),
                itemBuilder: (context, indexTab) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    snapshot[indexTab].opportunities.isEmpty
                        ? []
                        : [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(snapshot[indexTab].tab.name ?? '',
                            style: kTextSemiBold.copyWith(fontSize: 24)),
                      ), SizedBox(
                              height: 368,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    snapshot[indexTab].opportunities.length,
                                padding: EdgeInsetsDirectional.only(
                                    bottom: 16, top: 5, start: 10),
                                itemBuilder: (context, indexOpp) {
                                  return SizedBox(
                                    width: 325,
                                    child: AvailableOpportunityItemV2(
                                      opportunity: snapshot[indexTab]
                                          .opportunities[indexOpp],
                                      onRefresh: onRefresh,
                                      index: indexTab + 1,
                                      onNavigatorToEdit: () {
                                        AddNewOpportunityPage.push(context,
                                            opportunity: snapshot[indexTab]
                                                .opportunities[indexOpp],
                                            onSuccess: () {
                                          onRefresh();
                                        });
                                      }, navItem:snapshot[indexTab].navItem  ,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  );
                },
              );
      },
    );
  }
}
