import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/texts/underline_text.dart';
import 'package:shiftapp/utils/app_icons.dart';
import 'package:shiftapp/utils/app_utils.dart';
import '../../../../presentationUser/resources/colors.dart';
import '../../../../presentationUser/workHazards/presentation/addWorkHazard/widgets/upload_files_list.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/buttons/row_buttons.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import '../../data/models/add_job_uniform_params.dart';
import '../../data/models/uniform_dto.dart';

class AddJobUniformBottomSheet extends BaseStatelessWidget {
  final AddJobUniformParams data;
  JobUniformDetail? uniform;
  final Function(AddJobUniformParams) onAddJobUniform;
  StreamStateInitial<File?> imageStream = StreamStateInitial();
  AddJobUniformBottomSheet({
    Key? key,
    required this.data,
    this.uniform,
    required this.onAddJobUniform,
  }) : super(key: key);

  TextEditingController notesController = TextEditingController();
  File? _image;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _image = File(uniform?.uniFormImage ?? "");
    notesController.text = uniform?.description ?? '';
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 4,
              width: 100,
              margin: EdgeInsets.only(bottom: 25),
              decoration: Decorations.decorationOnlyRadius(
                color: kPrimary,
                radius: 10,
              ),
            ),
          ),
          UnderlineText(
            text: strings.add_photo,
            fontSize: 16,
          ),
          SizedBox(height: 16),
          uploadFilesList(),
          SizedBox(
            height: 20,
          ),
          BuildTextFieldItem(
            title: strings.add_some_notes,
            hintText: strings.add_details_image,
            controller: notesController,
            minLines: 5,
            keyboardType: TextInputType.multiline,
          ),
          Spacer(),
          RowButtons(
            onSave: () {
              if (_image?.path == null || _image?.path == "") {
                showErrorDialog(strings.upload_picture, context);
                //AppUtils.showSnackBarError(strings.upload_picture, context);
              } else if (formkey.currentState!.validate()) {
                onAddJobUniform(AddJobUniformParams(
                  file: _image,
                  description: notesController.text,
                ));
              }
            },
            onCancel: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget jobUniformPickerItem(
      {String? title, String? icon, required String image}) {
    return InkWell(
      onTap: () async {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          imageStream.setData(_image);
        }
      },
      child: Container(
        width: 110,
        height: 110,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: EdgeInsets.only(bottom: 25),
        decoration: Decorations.boxDecorationBorder(),
        child: StreamBuilder<File?>(
            stream: imageStream.stream,
            builder: (context, snapshot) {
              print(image);
              print("kklklklklklkl");
              return snapshot.hasData
                  ? image.contains('http')
                      ? kBuildImage(_image!.path, size: 100, width: 100)
                      : Image.file(snapshot.data!)
                  : Column(
                      children: [
                        kLoadSvgInCirclePath(
                          icon ?? AppIcons.camera_picker_outline,
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          title ?? strings.upload_picture,
                          style: kTextSemiBold.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
            }),
      ),
    );
  }

  UploadFilesOnly uploadFilesList() {
    return UploadFilesOnly(
      title: strings.upload_picture,
      isPdf: false,
      icon: AppIcons.camera_picker_outline,
      initialValue: uniform?.uniFormImage ?? '',
      onPicker: (filesValue) {
        _image = filesValue;
      },
    );
  }
}
