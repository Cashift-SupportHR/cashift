import 'dart:io';

import 'package:shiftapp/config.dart';

import '../../../../../common/domain/entities/account/registered_face.dart';
import '../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/outlint_button.dart';
import '../../../common/common_state.dart';
import '../../facerecognation/faces_matching.dart';
import '../../facerecognation/index.dart';
import '../../../salarydefinitionrequest/requests/widgets/warning_widget.dart';

class SelectFaceRecognition extends BaseStatelessWidget {
  final RegisteredFace? registeredFace;
  final Color? warningTextColor;
  final Function(File) onImagePicked;

  SelectFaceRecognition({
    Key? key,
    this.registeredFace,
    this.warningTextColor,
    required this.onImagePicked,
  }) : super(key: key);

  StreamStateInitial<File> pickedImageStream = StreamStateInitial<File>();
  File imageFile = File('');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<File>(
        stream: pickedImageStream.stream,
        builder: (context, snapshot) {
          return Column(
            children: [
              snapshot.data == null
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 90,
                    width: 90,
                    child: Image.file(
                        snapshot.data!,
                        width: 600,
                        fit: BoxFit.contain,
                      ),
                  ),
              const SizedBox(height: 24),
              WarningWidget(
                warningText: registeredFace?.notes ?? strings.scan_fac_note,
                margin: EdgeInsets.zero,
                color: warningTextColor,
              ),
              AppCupertinoButton(
                text: snapshot.data != null
                    ? strings.save_button
                    : registeredFace != null
                        ? strings.update_button
                        : strings.scan_now,
                radius: BorderRadius.circular(6),
                margin: const EdgeInsets.symmetric(vertical: 16),
                onPressed: ((registeredFace?.eligibleToUpdate ?? true)||Config.isDebuggable) ? () {
             //     print('imageFile ${imageFile.path}');
                  snapshot.data != null
                      ? onImagePicked(imageFile)
                      : navigateToCamera(context);
                  // onImagePicked(imageFile.path!)
                } : null,
              ),
              if(snapshot.data != null || registeredFace == null)
              AppOutlineButton(
                text: snapshot.data != null ? strings.scan_now : strings.skip,
                radius: 6,
                height: 50,
                width: double.infinity,
                onClick: () {
                  snapshot.data != null
                      ? navigateToCamera(context)
                      : Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  navigateToCamera(BuildContext context) async {
    try {
      imageFile = await FaceMatchingUtils.startLivelyness(context);
      pickedImageStream.setData(imageFile);
    } catch (e) {}
  }
}
