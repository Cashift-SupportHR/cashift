import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/core/extensions/extensions.dart';

import '../../../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../../shared/components/index.dart';
import '../../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../../../resources/colors.dart';
import '../../../../../../../resources/constants.dart';
import '../../../../../../../resources/validation.dart';
import '../../../../../data/models/add_request_prams.dart';
import '../../../../../domain/entities/ShiftRquestType.dart';

class AddRequestsUserScreen extends BaseStatelessWidget {
  final List<ShiftRquestType> data;
  Function(AddRequestPrams addRequestPrams, String code) onAdd;
  AddRequestsUserScreen({
    required this.onAdd,
    required this.data,
  });
  final mobileController = TextEditingController();
  int? typeRequest;
  String? code;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: AppCupertinoButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              onAdd(
                  AddRequestPrams(
                      cashifterRequestTypeId: typeRequest,
                      newPhoneNumber: mobileController.text),
                  code ?? "");
            }
          },
          text: strings.send,
          elevation: 0,
          backgroundColor: kPrimary,
          radius: BorderRadius.circular(5),
          padding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              kLoadSvgInCircle(
                "welcom",
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                child: Text(
                  strings.add_mobile_new,
                  textAlign: TextAlign.center,
                  style: kTextRegular.copyWith(
                    fontSize: 14,
                    color: kGray_64,
                  ),
                ),
              ),
              BottomSheetTextFieldRectangle(
                title: strings.type_request,
                hintText: strings.type_request,
                items: data
                    .map((e) => Item(
                        index: e.id ?? 0,
                        value: e.name ?? "",
                        code: e.code ?? ""))
                    .toList(),
                onSelectItem: (item) async {
                  typeRequest = item.index;
                  code = item.code;
                },
              ),
              BuildTextFieldItem(
                title: strings.mobile_number_new,
                controller: mobileController,
                hintText: strings.enter_phone_number,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isNullOrEmpty()) {
                    return strings.please_entry_phone;
                  } else if (!Validation.isValidPhone(
                      AppUtils.replaceArabicNumber(value))) {
                    return strings.invalid_phone;
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
