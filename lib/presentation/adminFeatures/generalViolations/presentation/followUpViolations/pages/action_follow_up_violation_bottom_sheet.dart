import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../../vehicles/data/models/action_vehicle_receive_request_params.dart';
import '../../../data/models/action_follow_up_violation_params.dart';

class ActionVehicleReceiveRequestsBottomSheet extends BaseStatelessWidget {
  final List<CommonListItem> priorityLevels;
  final Function(ActionFollowUpViolationParams) onSave;

  ActionVehicleReceiveRequestsBottomSheet(
      {Key? key, required this.priorityLevels, required this.onSave})
      : super(key: key);

  ActionVehicleReceiveRequestParams params =
      ActionVehicleReceiveRequestParams();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildPriorityLevelDropdown(),
          buildProcedureTextField(),
          buildWaringInfo(),
          buildRowButtons(context),
        ],
      ),
    );
  }

  BottomSheetTextFieldRectangle buildPriorityLevelDropdown() {
    return BottomSheetTextFieldRectangle(
      title: strings.priority_level,
      items: CommonListItem.toItemsListPicker(priorityLevels),
      onSelectItem: (Item position) {
        params.scheduleEmployeeId = position.index;
      },
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_action_you_will_take,
      onChanged: (value) {
        params.action = value ?? '';
      },
    );
  }

  WarningWidget buildWaringInfo() {
    return WarningWidget(
      warningText: strings.action_taken_waring_msg,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.send,
      textCancelButton: strings.cancel,
      onSave: () {
        onSave(ActionFollowUpViolationParams(
          importantLevel: params.scheduleEmployeeId,
          actionDescription: params.action,
        ));
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
