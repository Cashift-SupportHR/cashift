import '../../../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../data/models/index.dart';

class LicenseDataScreen extends BaseStatelessWidget {
  final Function(License  license) onNext;
  final Function() onPrevious;
  LicenseDataScreen( {required this.onNext, required this.onPrevious,});
  final _formKey = GlobalKey<FormState>();
  final licenseNumberController = TextEditingController();
  final licenseExpiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: RowButtons(
        textSaveButton:
        getArguments(context) != null ? strings.save_button : strings.next,
        textCancelButton: strings.previous,
        onSave: () {
          if (_formKey.currentState!.validate()) {
            onNext(License(expiryDate:licenseExpiryDateController.text,licenseNumber: licenseNumberController.text ));
          }
        },
        onCancel: () {
          onPrevious();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.license_data,
                style: kTextBold.copyWith(fontSize: 14, color: kGreen_144),
              ),
              SizedBox(height: 20),

              licenseNumberTextField(),
              licenseExpiryDateTextField(),
            ],
          ),
        ),
      ),
    );
  }

  BuildTextFieldItem licenseNumberTextField() {
    return BuildTextFieldItem(
      title: strings.license_number,
      hintText: strings.type_license_number,
      controller: licenseNumberController,
      keyboardType: TextInputType.name,
    );
  }

  DateTextFieldPicker licenseExpiryDateTextField() {
    return DateTextFieldPicker(
      title: strings.license_expiry_date,
      hintText: strings.select_license_expiry_date,
      controller: licenseExpiryDateController,
      pattern: DateFormatter.DATE_Api_DD_MM_YYYY,
    );
  }
}
