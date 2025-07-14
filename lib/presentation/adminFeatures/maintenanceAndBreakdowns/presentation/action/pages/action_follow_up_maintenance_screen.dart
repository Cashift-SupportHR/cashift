import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';

  import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/action_follow_up_up_maintenance_prams.dart';

class ActionMaintenanceScreen extends BaseStatelessWidget {
  final List<CommonListItem> priorityLevels;
  final Function(ActionFollowUpUpMaintenancePrams) onSave;

  ActionMaintenanceScreen(
      {Key? key, required this.priorityLevels, required this.onSave})
      : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ActionFollowUpUpMaintenancePrams params =
  ActionFollowUpUpMaintenancePrams();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              buildPriorityLevelDropdown(),
              buildProcedureTextField(),
              buildWaringInfo(),
              buildRowButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  BottomSheetTextFieldRectangle buildPriorityLevelDropdown() {
    return BottomSheetTextFieldRectangle(
      title: strings.priority_level,
      hintText: strings.determine_priority_level,
      items: CommonListItem.toItemsListPicker(priorityLevels),
      onSelectItem: (Item position) {
        params.importantLevel = position.index;
      },
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_action_you_will_take,
      minLines: 4,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        params.actionDescription = value ?? '';
      },
    );
  }

  WarningWidget buildWaringInfo() {
    return WarningWidget(
      backgroundColor: kPrimary.withOpacity(.1),
      color: kPrimary,
      warningText: strings.action_taken_waring_msg,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.send,

      textCancelButton: strings.cancel_button,
      onSave: () {
        if(formKey.currentState!.validate()){
          onSave(ActionFollowUpUpMaintenancePrams(
            importantLevel: params.importantLevel,
            actionDescription: params.actionDescription,
          ));
        }

      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
