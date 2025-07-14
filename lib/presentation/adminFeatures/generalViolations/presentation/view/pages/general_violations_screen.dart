import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/general_violation.dart';
import '../widgets/general_violations_item.dart';

class GeneralViolationsScreen extends BaseStatelessWidget {
  final List<GeneralViolation> data;
  final Function() onRefresh;

  GeneralViolationsScreen({Key? key, required this.data, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
      itemBuilder: (context, index) {
        return GeneralViolationItem(
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
