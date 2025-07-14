import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_terms.dart';
import 'package:shiftapp/presentation/presentationUser/copyrights/monthly_copy_rights.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

class JobTermsAndConditionScreen extends BaseStatelessWidget {
  final JobTerms jobTerms;

  final Function() onRequestInterview;

  JobTermsAndConditionScreen(this.jobTerms,
      {Key? key, required this.onRequestInterview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            strings.terms_conditions_job,
            style: kTextMedium,
            textAlign: TextAlign.start,
          ),
          Expanded(child: CopyRightListWidget(jobTerms.toTermsObject() ?? [])),
          jobTerms.requiredInterview() == false
              ? CopyRightsCheck()
              : AppCupertinoButton(
                  onPressed: onRequestInterview,
                  text: strings.send_personal_interview_request,
                )
        ],
      ),
    );
  }
}
