import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';

class FinalActionMaintenanceBottomSheet extends BaseStatelessWidget {
  final Function(String) onSave;

  FinalActionMaintenanceBottomSheet({Key? key, required this.onSave})
      : super(key: key);

  TextEditingController procedureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
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
      ),
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_final_action_you_will_take,
      minLines: 5,
      keyboardType: TextInputType.multiline,
      controller: procedureController,
    );
  }

  WarningWidget buildWaringInfo() {
    return WarningWidget(
      color: kPrimary,
      margin: EdgeInsets.only(top: 0),
      backgroundColor: kPrimary.withOpacity(.1),
      warningText: strings.waring_final_action_notification,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.send,
      textCancelButton: strings.cancel_button,
      onSave: () {
        Navigator.pop(context);
        if (_formKey.currentState!.validate()) {
          onSave(procedureController.text);
        }
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }
}
