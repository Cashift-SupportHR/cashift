import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/periodPricing/widget/period_pricing_item.dart';

import '../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';

///  Created by harbey on 5/15/2023.
class PeriodPricingScreen extends BaseStatelessWidget {
  final int projectId;
  final int companyId;
  final List<PeriodPricing> state;
  final Function(int id) deletePeriodPrice;
  final Function() onRefresh;
  PeriodPricingScreen({
    Key? key,
    required this.state,
    required this.projectId,
    required this.companyId,
    required this.deletePeriodPrice,
    required this.onRefresh,
  }) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        return PeriodPricingItem(
          item: state[index],
          companyId: companyId,
          deletePeriodPrice: deletePeriodPrice,
          projectId: projectId,
          onRefresh: onRefresh,
        );
      },
    );
  }
}
