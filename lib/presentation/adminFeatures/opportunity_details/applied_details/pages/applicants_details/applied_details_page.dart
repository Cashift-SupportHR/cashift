import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../shared/domain/entities/opportunities/ApplicantsDetails.dart';
import '../../bloc/applied_details_cubit.dart';
import 'applied_details_screen.dart';

class ApplicantsDetailsPage extends BaseBlocWidget<Initialized<ApplicantsDetails>, AppliedDetailsCubit> {
   int id;
  ApplicantsDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  loadInitialData(BuildContext context) {
    bloc.fetchApplicantsDetails(id: id);
  }

   @override
   bool detectRequiredTasks() {
     return false;
   }

  @override
  String? title(BuildContext context) {
    // TODO: implement title
    return "${strings.details}${strings.applicants}";
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<ApplicantsDetails> state) {
    return AppliedDetailsScreen(data: state.data);
  }
}
