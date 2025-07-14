import 'package:flutter/material.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/follow_up_violation.dart';
import '../widgets/follow_up_violations_item.dart';

class FollowUpViolationsScreen extends BaseStatelessWidget {
  final String code;
  final List<FollowUpViolation> data;
  final Function(FollowUpViolation) onAction;

  FollowUpViolationsScreen(
      {Key? key,
      required this.code,
      required this.data,
      required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return FollowUpViolationItem(
          code: code,
          item: data[index],
          onAction: () => onAction(data[index]),
        );
      },
    );
  }
}
