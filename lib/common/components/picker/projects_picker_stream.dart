
import 'package:flutter/material.dart';

import '../../../presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/projects_picker.dart';
import '../../../presentation/presentationUser/common/stream_data_state.dart';
import '../../../presentation/shared/models/common_list_item.dart';
import '../index.dart';

class ProjectsPickerStream extends StatelessWidget {
  final String? initialValue;
  final StreamDataState<List<CommonListItem>?> projectsStream;
  final TextEditingController projectController;
  final Function(int id) onSelectItem;
  const ProjectsPickerStream({super.key, required this.projectsStream, required this.projectController, this.initialValue, required this.onSelectItem});

  @override
  Widget build(BuildContext context) {

      return StreamDataStateWidget<List<CommonListItem>?>(
          stream: projectsStream,
          builder: (context, data) {
            return ProjectsPicker(
              items: data ?? [],
              initialValue: initialValue,
              controller: projectController,
              onSelectItem: (item) {
                onSelectItem(item.index);
              },
            );
          });
  }
}
