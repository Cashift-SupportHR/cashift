import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../common/domain/entities/loans_request/loan_request.dart';
import '../widgets/loan_request_item.dart';

class LoanRequestsScreen extends StatelessWidget {
  final int type;
  final List<LoanRequest> requests;
  const LoanRequestsScreen({Key? key, required this.requests, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: ListView.builder(
        itemCount: requests.length,
        shrinkWrap:   true,
        itemBuilder: (context, index) {
          return  LoanRequestItem(
            type: type,
            request: requests[index],
          );
        },
      ),
    );
  }
}
