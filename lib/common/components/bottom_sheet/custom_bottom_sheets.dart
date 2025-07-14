import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';

import '../../../utils/app_icons.dart';
import '../../../presentation/presentationUser/attendance/facerecognation/index.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../decorations/decorations.dart';
import '../helper_widgets.dart';
import '../image_builder.dart';
import '../../../presentation/presentationUser/resources/constants.dart';

import '../index.dart';
import '../text_field/build_text_field_item.dart';

showBaseBottomSheet(BuildContext context, {required Widget child, bool isScrollControlled = true}) {
  showAppModalBottomSheet(
    context: context,
    radius: 14,
    isDivider: false,
    padding: EdgeInsets.zero,
    isScrollControlled: isScrollControlled,
    headerWidget: Container(
      height: 6,
      width: 150,
      margin: const EdgeInsets.only(bottom: 16),
      decoration:
      Decorations.decorationOnlyRadius(radius: 20, color: kPrimary),
    ),
    child: child,
  );
}


showRejectBottomSheet(BuildContext context,
    {
      required String title,
      required String subtitle,
      String? warningText,
      required Function(String) onRejectPressed,
      bool isShowWaringText = true,
    }
    ) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  final strings = context.getStrings();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height * 0.8,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Form(
        key: _formKey,
        child: Material(
          color: kWhite,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                kLoadSvgInCirclePath(AppIcons.warning_info, color: kRed),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: kTextBold.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: kTextRegular.copyWith(fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                BuildTextFieldItem(
                  controller: controller,
                  title: strings.what_is_reason,
                  hintText: strings.write_rejection_reason,
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                ),
                if(isShowWaringText)
                WarningWidget(warningText: warningText ?? strings.warning_rejection_desc, color: kPrimary),
                RowButtons(
                  margin: EdgeInsets.symmetric(vertical: 18),
                  textSaveButton: strings.confirm_button,
                  textCancelButton: strings.cancel,
                  onSave: () {
                    if(_formKey.currentState!.validate()){
                      onRejectPressed(controller.text);
                    }
                  },
                  onCancel: ()=> Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}