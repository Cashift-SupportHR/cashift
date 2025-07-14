import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';
import 'package:shiftapp/common/components/texts/underline_text.dart';

import '../../../../common/data/models/workerWorkPlaces/index.dart';
import '../../../../utils/app_icons.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/buttons/row_buttons.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/image_builder.dart';
import '../../../../common/components/material_text_field.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../salarydefinitionrequest/requests/widgets/warning_widget.dart';


class AddNotesForDeviceSheet extends BaseStatelessWidget {
  final Function(AddFocusPointsReceivedDevicesParams) onAddNotes;
  final String warningText;

  AddNotesForDeviceSheet(
      {Key? key, required this.onAddNotes, required this.warningText})
      : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    XFile? xFile = XFile('');
    TextEditingController _notesController = TextEditingController();
    TextEditingController _detailsImageController = TextEditingController();
    return Container(
      color: kWhite,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UnderlineText(
                text: strings.add_notes,
              ),
              IconText(
                text: strings.your_notes,
                iconSize: 24,
                icon: AppIcons.writeNotesOutline,
                padding: const EdgeInsetsDirectional.only(top: 20, bottom: 10),
              ),
              MaterialTextField(
                keyboardType: TextInputType.multiline,
                inputDecoration: kTextFieldDecorationLessRadius.copyWith(
                  hintText: strings.write_your_notes_here,
                  hintStyle: kTextSemiBold.copyWith(
                    color: kBlack.withOpacity(0.6),
                    fontSize: 18,
                  ),
                ),
                maxLines: 4,
                controller: _notesController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return strings.please_enter_your_notes;
                  }
                  return null;
                },
              ),
              IconText(
                text: strings.take_picture_showing_the_problem,
                icon: AppIcons.pickerImageOutline,
                iconSize: 24,
                padding: const EdgeInsetsDirectional.only(top: 20, bottom: 10),
              ),
              MaterialTextField(
                inputDecoration: kTextFieldDecorationLessRadius.copyWith(
                  hintText: strings.write_your_notes_here,
                  hintStyle: kTextSemiBold.copyWith(
                    color: kBlack.withOpacity(0.6),
                    fontSize: 18,
                  ),
                ),
                controller: _detailsImageController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return strings.please_enter_your_notes;
                  }
                  return null;
                },
                endIcon:
                Container(
                  decoration: Decorations.boxDecorationBorder(radius: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                  margin: const EdgeInsetsDirectional.only(start: 10, bottom: 2),
                  child: InkWell(
                    onTap: () async {
                     xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    },
                    child: kLoadSvgInCirclePath(AppIcons.cameraOutline),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              WarningWidget(
                warningText: warningText,
                color: kGreen_2,
                  margin: const EdgeInsets.only(top: 20),
              ),
              const SizedBox(height: 40),
              RowButtons(
                onSave: () {
                  if (formKey.currentState!.validate()) {
                    onAddNotes(AddFocusPointsReceivedDevicesParams(
                      description: _notesController.text,
                      attachmentFile: xFile?.path ?? '',
                      descriptionAttachment: _detailsImageController.text,
                    ));
                    Navigator.pop(context);
                  }
                },
                onCancel: () {
                  Navigator.pop(context);
                },
                margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
