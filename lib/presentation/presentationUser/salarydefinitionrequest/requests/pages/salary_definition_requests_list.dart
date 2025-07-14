import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../common/domain/entities/salary-definition-request/salary_definition_request.dart';
import '../widgets/salary_definition_request_item.dart';

class SalaryDefinitionRequestsList extends StatelessWidget {
  final int type;
  final List<SalaryDefinitionRequest> requests;
  final Function(String, String) onDownloadFile;
  const SalaryDefinitionRequestsList({Key? key, required this.requests, required this.type, required this.onDownloadFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: ListView.builder(
        itemCount: requests.length,
        shrinkWrap:   true,
        itemBuilder: (context, index) {
          return  SalaryDefinitionRequestItem(
            type: type,
            request: requests[index],
            onDownloadFile: (){
              onDownloadFile(requests[index].id ?? '', requests[index].fileAttachment ?? '');
            },
          );
        },
      ),
    );
  }
}
