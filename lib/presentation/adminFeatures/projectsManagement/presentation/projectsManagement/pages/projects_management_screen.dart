import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/project_management.dart';
import '../widgets/project_management_item.dart';

class ProjectsManagementScreen extends BaseStatelessWidget {
  final List<ProjectManagement> data;
  final Function(String) onRefresh;
  ProjectsManagementScreen({Key? key, required this.data, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap:   true,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return  ProjectManagementItem(
          item: data[index],
          onRefresh: () {
            onRefresh('');
          },
        );
      },
    );
  }
}
