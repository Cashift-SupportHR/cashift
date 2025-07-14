import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/index.dart';
import '../widgets/general_type_violation_item.dart';

class GeneralTypesViolationsScreen extends BaseStatelessWidget {
  final List<ViolationType> data;
  final Function() onRefresh;

  GeneralTypesViolationsScreen({Key? key, required this.data, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
      itemBuilder: (context, index) {
        return GeneralTypeViolationItem(
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
