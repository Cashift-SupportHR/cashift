import 'package:flutter/material.dart';
import '../../../../../../common/domain/constants/codes_constants.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../domain/entities/vehicle_receive_request.dart';
import '../widgets/vehicle_receive_request_waiting_accept_item.dart';
import '../widgets/vehicle_receive_request_waiting_review_item.dart';

class VehicleReceiveRequestsScreen extends BaseStatelessWidget {
  final String code;
  final List<VehicleReceiveRequest> data;
  final Function(VehicleReceiveRequest) onFinalAction;
  final Function(VehicleReceiveRequest) onAction;

  VehicleReceiveRequestsScreen(
      {Key? key,
      required this.code,
      required this.data,
      required this.onFinalAction,
      required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return code == CodesConstants.waitingReview
            ? VehicleReceiveRequestWaitingReviewItem(
                item: data[index],
                onAction: () => onAction(data[index]),
              )
            : VehicleReceiveRequestWaitingAcceptItem(
                item: data[index],
                onFinalAction: code == 'WA'
                    ? () => onFinalAction(data[index])
                    : null,
              );
      },
    );
  }
}
