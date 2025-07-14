import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dialogs_manager.dart';
import '../../../domain/entities/focus_point.dart';
import '../widgets/focus_point_item.dart';

class FocusPointUsersScreen extends BaseStatelessWidget {
  final Function()? onRefresh;
  final Function(int) onDeleteFocusPoint;
  final List<FocusPoint> points;

  FocusPointUsersScreen({
    Key? key,
    this.onRefresh,
    required this.onDeleteFocusPoint,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: points.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return FocusPointItem(
          point: points[index],
          onRefresh: onRefresh,
          onDeleteFocusPoint: (isStart) {
            return showDeleteDialog(context, id: points[index].id ?? 0);
          },
        );
      },
    );
  }

  showDeleteDialog(BuildContext context, {required int id}) {
    return DialogsManager.showConfirmationAnimatedDialog(
      context,
      message: strings.are_you_sure_delete_focus_point,
      onConfirm: () {
        onDeleteFocusPoint(id);
      },
    );
  }
}
