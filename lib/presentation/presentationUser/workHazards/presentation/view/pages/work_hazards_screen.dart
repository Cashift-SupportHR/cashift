import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../domain/entities/work_hazard.dart';
import '../widgets/work_hazard_item.dart';

class WorkHazardsScreen extends BaseStatelessWidget {
  final List<WorkHazard> data;
  final Function() onRefresh;

  WorkHazardsScreen({Key? key, required this.data, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
      itemBuilder: (context, index) {
        return WorkHazardItem(
          item: data[index],
          details: false,
          onRefresh: () {
            onRefresh();
          },
        );
      },
    );
  }
}
