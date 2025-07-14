import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/required_tasks/in_app_required_task.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../../presentationUser/mainnavigation/overview/widgets/app_requirement_notification_widget.dart';

///  Created by harbey on 12/12/2023.
class AdminAppNotificationListWidget extends StatelessWidget {
  final StreamState<List<InAppRequiredTask>> inAppNotificationStream;

  AdminAppNotificationListWidget({required this.inAppNotificationStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InAppRequiredTask>>(
      stream: inAppNotificationStream.stream,
      builder: (context, snapshot) {
        print('AdminAppNotificationListWidget ${snapshot.data}');
        final notification = snapshot.data;
        if (notification != null) {
          return ListView.builder(
            itemCount: notification.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemBuilder: (context, index) {
              return notification[index].isAdmin == true ?
                InAppRequirementNotification(
                buttonName: notification[index].actionName,
                message: notification[index].message ?? '',
                onSubmit: () {
                  Navigator.pushNamed(
                      context, '/${notification[index].routeName}');
                },
              ) : SizedBox.shrink();
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
