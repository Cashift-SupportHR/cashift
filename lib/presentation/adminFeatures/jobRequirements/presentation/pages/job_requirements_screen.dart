import 'package:flutter/cupertino.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';

import '../../domain/entities/index.dart';
import '../widgets/list_item_widget.dart';

class RequirementsJobScreen extends BaseStatelessWidget {
  List<JobRequirements> jobRequirementsState;
  final Function() onRefresh;
  Function(int id) updateType;

  final Function(int id) onDelete;
  final int type;
  List<JobModel> job;
  RequirementsJobScreen({
    required this.jobRequirementsState,
    required this.onRefresh,
    required this.updateType,
    required this.onDelete,
    required this.job,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListJobReqItemWidget(
      type: type,
      job: job,
      jobRequirements: jobRequirementsState,
      onRefresh: onRefresh,
      updateType: updateType,
      onDelete: onDelete,
    );
  }
}
