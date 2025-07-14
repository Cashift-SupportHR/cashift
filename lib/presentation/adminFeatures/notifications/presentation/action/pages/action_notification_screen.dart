import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';

import '../../../../../../common/domain/constants/codes_constants.dart';

class ActionVehicleNotificationScreen extends BaseStatelessWidget {
  final Function(String) onSave;
  final String code;

  ActionVehicleNotificationScreen(
      {Key? key, required this.onSave, required this.code})
      : super(key: key);

  TextEditingController procedureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildRowButtons(context),
      body: SingleChildScrollView(

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildProcedureTextField(),
              buildWaringInfo(),

            ],
          ),
        ),
      ),
    );
  }

  BuildTextFieldItem buildProcedureTextField() {
    return BuildTextFieldItem(
      title: strings.procedure,
      hintText: strings.write_action_to_be_taken,
      minLines: 5,
      keyboardType: TextInputType.multiline,
      controller: procedureController,
    );
  }

  WarningWidget buildWaringInfo() {
    return WarningWidget(
      color: kPrimary,
      margin: EdgeInsets.only(top: 5),

      backgroundColor: kPrimary.withOpacity(.1),
      warningText: code == CodesConstants.waitingApprove
          ? strings.waring_final_action_notification
          : strings.waring_action_notification,
    );
  }

  RowButtons buildRowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.send,
      textCancelButton: strings.cancel_button,
      onSave: () {
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
