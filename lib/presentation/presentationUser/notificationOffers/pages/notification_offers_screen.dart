import 'package:flutter/material.dart';

import '../../../../common/domain/entities/notificationOffers/index.dart';
import '../../../../common/components/base/base_stateless_widget.dart';

class NotificationOffersScreen extends BaseStatelessWidget {
  final List<NotificationOffer> notificationOffers;
  NotificationOffersScreen({Key? key, required this.notificationOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationOffers.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        return Text(notificationOffers[index].id.toString());
      },
    );
  }
}


