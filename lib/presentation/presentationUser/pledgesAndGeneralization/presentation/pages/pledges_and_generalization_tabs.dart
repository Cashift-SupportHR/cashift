import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../domain/entities/pledge_generalization_constants.dart';
import 'pledges_and_generalization_page.dart';

class PledgesAndGeneralizationTabs extends BaseStatelessWidget {
   PledgesAndGeneralizationTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.pledges_and_generalization,
      body: TabBarViewWidget(
        isSeparate: true,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        marginTabs: const EdgeInsets.only(top: 16, left: 16, right: 16),
        tabs: [
          strings.pledges,
          strings.generalizations,
        ],

        children: [
          PledgesAndGeneralizationPage(
            type: PledgeGeneralizationConstants.pledge,
          ),
          PledgesAndGeneralizationPage(
            type: PledgeGeneralizationConstants.generalization,
          ),
        ],
      ),
    );
  }
}
