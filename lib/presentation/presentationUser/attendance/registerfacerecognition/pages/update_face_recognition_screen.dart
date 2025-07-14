import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

import '../../../../../common/domain/entities/account/registered_face.dart';
import '../../../../../common/domain/entities/account/remote_file.dart';
import '../../../../../common/domain/entities/account/user.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../shared/components/app_cupertino_button.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../../shared/components/texts/list_row_texts_icons.dart';
import '../../facerecognation/faces_matching.dart';
import '../../../salarydefinitionrequest/requests/widgets/warning_widget.dart';
import '../widgets/select_face_recognition.dart';

///  Created by harbey on 8/17/2023.
class UpdateFaceRecognitionScreen extends BaseStatelessWidget {
  final User? user;
  final RegisteredFace? registeredFace;
  final ValueChanged<File> onImagePicked;

  UpdateFaceRecognitionScreen(
      {Key? key, this.user, this.registeredFace, required this.onImagePicked})
      : super(key: key);

  StreamStateInitial<File> pickedImageStream = StreamStateInitial<File>();
  File imageFile = File('');
  @override
  Widget build(BuildContext context) {
    final filePath = registeredFace?.path;
    return AppScaffold(
    //  bottomNavigationBar: footer(),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 16, top: 30, left: 16, right: 16),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50, right: 16, left: 16),
                  decoration: Decorations.shapeDecorationBorder(radius: 15),
                  child: ListRowTextsIcons(
                    padding: EdgeInsetsDirectional.only(
                        start: 16, top: 60, bottom: 6, end: 5),
                    icons: [
                      AppIcons.employeeLine,
                      AppIcons.phoneSolid,
                    ],
                    titles: [
                      strings.name,
                      strings.mobile_number,
                    ],
                    values: [
                      user?.name ?? '',
                      user?.phone ?? '',
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.red,
                  backgroundImage: filePath == null || filePath.isEmpty
                      ? null
                      : FileImage(File(filePath)),
                ),
              ],
            ),
            Spacer(),
            SelectFaceRecognition(
             registeredFace: registeredFace,
              onImagePicked: (file) {
                print('SelectFaceRecognition ${file.path}');
                onImagePicked(file);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        WarningWidget(
          warningText: registeredFace?.notes ?? "",
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        AppCupertinoButton(
          text: strings.update_button,
          margin: const EdgeInsets.all(16),
          radius: BorderRadius.circular(6),
          onPressed: registeredFace?.eligibleToUpdate == false
              ? () {
                  onImagePicked(imageFile);
                }
              : null,
        ),
      ],
    );
  }


  Widget showUpdatedImage(){
    return StreamBuilder<File>(
      stream: pickedImageStream.stream,
      builder: (context, snapshot) {
        return snapshot.data != null
            ?
          Column(
            children: [
              Image.file(
              snapshot.data!,
              width: 600,
              fit: BoxFit.contain,
        ),
              // AppCupertinoButton(
              //   text: isSave ? strings.save_button : strings.scan_now,
              //   radius: BorderRadius.circular(6),
              //   margin: const EdgeInsets.symmetric(vertical: 16),
              //   onPressed: () {
              //     print('imageFile ${imageFile.path}');
              //     isSave ? onImagePicked(imageFile) : navigateToCamera(context);
              //     // onImagePicked(imageFile.path!)
              //   },
              // ),
            ],
          ) : SizedBox.shrink();
      }
    );
  }


}
