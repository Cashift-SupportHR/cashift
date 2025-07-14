import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';
import 'package:shiftapp/presentation/presentationUser/favoriteprojects/widgets/selectable_list_projects_widget.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

class FavoriteProjectsScreen extends BaseStatelessWidget {
  final Function(List<int> projects) onSubmit;
  final Function(String text) onSubmitSearch;
  final List<Project> projects;

  FavoriteProjectsScreen({required this.onSubmit, required this.onSubmitSearch, required this.projects});

  @override
  Widget build(BuildContext context) {
    print('FavoriteProjectsScreen $projects ${projects.where((element) => element.favorite).map((e) => e.id).toList()}');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectableListProjectsWidget(
        onSelect: (List<int> items) {
          onSubmit(items);
        },
        items: projects,
        initIndexes: projects.where((element) => element.favorite).map((e) => e.id).toList(),
      ),
    );
  }

  void search(String text) {
    onSubmitSearch(text);
  }
}
