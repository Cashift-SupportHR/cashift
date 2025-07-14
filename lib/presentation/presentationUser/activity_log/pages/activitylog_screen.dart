import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/data/models/activity_log/index.dart';

import 'package:shiftapp/presentation/presentationUser/activity_log/pages/activity_log_item.dart';

class ActivityLogListScreen extends StatelessWidget {
  final List<NotificationItem> notificationsList;
  final Function(bool isAccept, int id) onConfirmJob;
  final bool isActive;
  const ActivityLogListScreen(
      {Key? key,
      required this.notificationsList,
      required this.onConfirmJob,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: notificationsList.length,
          itemBuilder: (con, pos) {
            final item = notificationsList[pos];
            return ActivityLogItemWidget(
              notificationItem: item,
              isActiv: isActive,
              onConfirmJob: (bool isAccepted) {
                onConfirmJob(isAccepted, item.id!);
              },
            );
          }),
    );
  }
}
