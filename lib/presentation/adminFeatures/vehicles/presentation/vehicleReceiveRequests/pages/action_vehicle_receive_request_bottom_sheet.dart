import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_vehicle_receive_request_params.dart';

class ActionVehicleReceiveRequestsBottomSheet extends BaseStatelessWidget {
  final InitializeActionUserRequests data;
  final Function(ActionVehicleReceiveRequestParams) onSave;

  ActionVehicleReceiveRequestsBottomSheet(
      {Key? key, required this.data, required this.onSave})
      : super(key: key);

  ActionVehicleReceiveRequestParams params =
      ActionVehicleReceiveRequestParams();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildProblemCauserDropdown(),
              buildStatusDropdown(),
              buildProcedureTextField(),
              buildWaringInfo(),
              buildRowButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  BottomSheetTextFieldRectangle buildProblemCauserDropdown() {
    return BottomSheetTextFieldRectangle(
      title: strings.the_problem_causer,
      items: CommonListItem.toItemsListPicker(data.employees),
      onSelectItem: (Item position) {
        params.scheduleEmployeeId = position.index;
      },
    );
  }

  BottomSheetTextFieldRectangle buildStatusDropdown() {
    return BottomSheetTextFieldRectangle(
      title: strings.status,
      items: CommonListItem.toItemsListPicker(data.statuesList),
      onSelectItem: (Item position) {
        params.issueDescriptionStatus = position.index;
      },
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_action_you_will_take,
      keyboardType: TextInputType.multiline,
      minLines: 5,
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
        Navigator.pop(context);
        if (_formKey.currentState!.validate()) {
          onSave(params);
        }
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
