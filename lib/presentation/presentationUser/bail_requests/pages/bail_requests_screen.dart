import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/common/data/models/bail_requests/index.dart';
import 'package:shiftapp/common/domain/entities/bail_requests/index.dart';

 import '../widgets/reject_bail_dialog.dart';
import '../widgets/bail_request_item.dart';

class BailRequestsScreen extends StatelessWidget {
  final int type;
  final List<BailRequest> requests;
  final List<BailTermAndCondition> termsAndConditions;
  final Function(ApproveRejectBailParams) onApproveReject;

  const BailRequestsScreen(
      {Key? key,
      required this.requests,
      required this.termsAndConditions,
      required this.type,
      required this.onApproveReject,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BailRequestItem(
          type: type,
          request: requests[index],
          termsAndConditions: termsAndConditions,
          onAccept: (){
            onApproveReject(ApproveRejectBailParams(
              id: requests[index].id,
              description: '',
              isApprove: true,
            ));
          },
          onReject: ()=>showRejectDialog(
              context,
              onReject: onApproveReject,
              request: requests[index],
          ),
        );
      },
    );
  }

  showRejectDialog(BuildContext context,
      {required Function(ApproveRejectBailParams) onReject, BailRequest? request}) {
    return showAppDialog(
      context,
      child: RejectBailDialog(
        onReject: (reason){
          onApproveReject(ApproveRejectBailParams(
            id: request?.id ?? 0,
            description: reason,
            isApprove: false,
          ));
        },
      ),
    );
  }
}
