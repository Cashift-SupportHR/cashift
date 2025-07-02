import 'dart:io';

import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/maintenanceAndBreakdowns/presentation/add_maintenance_breakdowns/pages/add_maintenance_breakdowns_screen.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../../../domain/constants/codes_constants.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../../shared/models/common_list_item.dart';

import '../../../data/models/add_maintenance_prams.dart';
import '../../../data/models/final_action_follow_up_maintenance_prams.dart';
import '../../../domain/entities/maintenance.dart';
import '../../action/pages/action_maintenance_page.dart';
import '../../action/pages/final_follow_up_maintenance_bottom_sheet.dart';
import '../cubit/add_maintenance_breakdowns_cubit.dart';

class AddMaintenanceBreakdownsPage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, AddMaintenanceBreakdownsCubit> {
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) {
    return strings.breakdown_maintenance;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {

  int?  roundTripId =getArguments(context);
    return AddMaintenanceBreakdownsScreen(
      data: state.data ?? [],
      roundTripId: roundTripId,
      onSave: (AddMaintenancePrams params, List<File> filesAfter,
          List<File> fileBefore) {
        bloc.addMaintenance(params,
            filesAfter: filesAfter, fileBefore: fileBefore);
      },
    );
  }
  @override
  void onSuccessDismissed() {
    Navigator.pop(context,true);
  }


}
