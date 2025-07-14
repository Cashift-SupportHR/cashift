import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../shared/domain/entities/opportunities/opportunity.dart';
import '../../widgets/available_opportunity_itemv2.dart';


class AvailableOpportunitiesList extends BaseStatelessWidget {
  final int type;
  List<Opportunity> opportunity;
  List<NavItem> navItem;
  final ScrollController? scrollController;
  Function() loadInitialData;
  Function() onNavigatorToEdit;
  //
  AvailableOpportunitiesList({Key? key, required this.opportunity, required this.navItem, required this.scrollController, required this.onNavigatorToEdit, required this.loadInitialData, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: opportunity.length,
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return AvailableOpportunityItemV2(
            opportunity: opportunity[index],
            navItem: navItem,
            index: this.type,
            onRefresh: () {
              loadInitialData();
            },
            onNavigatorToEdit: () {
              onNavigatorToEdit();
              loadInitialData();
            });
      },
    );
  }
}
