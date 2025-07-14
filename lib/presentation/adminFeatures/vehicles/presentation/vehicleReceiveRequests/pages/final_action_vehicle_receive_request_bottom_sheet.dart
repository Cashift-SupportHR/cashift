import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';


class FinalActionVehicleReceiveRequestsBottomSheet extends BaseStatelessWidget {
  final Function(String) onSave;

  FinalActionVehicleReceiveRequestsBottomSheet(
      {Key? key,  required this.onSave})
      : super(key: key);

  TextEditingController procedureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildProcedureTextField(),
            buildWaringInfo(),
            buildRowButtons(context),
          ],
        ),
      ),
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_final_action_you_will_take,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      controller: procedureController,
    );
  }

  WarningWidget buildWaringInfo() {
    return WarningWidget(
      warningText: strings.final_action_taken_waring_msg,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.send,
      textCancelButton: strings.cancel,
      onSave: () {
        Navigator.pop(context);
        if(_formKey.currentState!.validate()){
          onSave(procedureController.text);
        }
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
