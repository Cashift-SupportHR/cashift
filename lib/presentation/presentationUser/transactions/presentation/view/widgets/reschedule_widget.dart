import 'package:shiftapp/common/components/index.dart';
import '../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../../common/components/text_field/date_time_text_field_picker.dart';
import '../../../data/models/reschedule_transactions_prams.dart';
import '../../../data/models/update_transactions_prams.dart';
import '../../../domain/entities/transaction_data.dart';

class RescheduleWidget extends BaseStatelessWidget {
  final bool isReschedule;
  Transactions data;
  Function(UpdateTransactionsPrams update) onUpdate;
  Function(RescheduleTransactionsPrams update) onReschedule;
  RescheduleWidget({
    required this.isReschedule,
    required this.data,
    required this.onUpdate,
    required this.onReschedule,
  });

  TextEditingController descrtiptionController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  String? from;
  String? to;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            isReschedule == true
                ? Row(
                  children: [
                    Expanded(
                      child: DateTimeTextFieldPicker(
                        hintText: strings.select,
                        title: strings.from,
                        onTap: (date) {
                          from = date;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DateTimeTextFieldPicker(
                        hintText: strings.select,
                        title: strings.to,
                        onTap: (date) {
                          to = date;
                        },
                      ),
                    ),
                  ],
                )
                : SizedBox(),
            if (isReschedule == true) SizedBox(height: 16),
            BuildTextFieldItem(
              title: strings.description,
              hintText: strings.description,
              controller: descrtiptionController,
              keyboardType: TextInputType.text,
              minLines: 3,
            ),
            SizedBox(height: 16),
            RowButtons(
              textCancelButton: strings.cancel,
              onCancel: () => Navigator.pop(context),
              onSave: () {
                if (keyForm.currentState!.validate()) {
                  if (isReschedule == true) {
                    if (from == null || to == null) {
                      showErrorDialog(strings.select_date_from_to, context);
                    } else {
                      Navigator.pop(context);
                      onReschedule(
                        RescheduleTransactionsPrams(
                          startDateTime: from,
                          endDateTime: to,
                          id: data.id,
                          description: descrtiptionController.text,
                        ),
                      );
                    }
                  } else {
                    Navigator.pop(context);
                    onUpdate(
                      UpdateTransactionsPrams(
                        id: data.id,
                        finalSummary: descrtiptionController.text,
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
