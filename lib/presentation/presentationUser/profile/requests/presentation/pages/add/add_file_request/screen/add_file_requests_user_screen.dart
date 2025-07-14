import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/workHazards/presentation/addWorkHazard/widgets/upload_files_list.dart';

import '../../../../../../../../../utils/app_utils.dart';
import '../../../../../../../../../common/components/index.dart';
import '../../../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../../../resources/validation.dart';

class AddFileRequestsUserScreen extends BaseStatelessWidget {
  File? file;
final Function ( File file)onSend;

  AddFileRequestsUserScreen({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: AppCupertinoButton(
          onPressed: (){
            if( file==null ||file?.path==""){
              handleErrorDialog(strings.please_upload_pdf_image, context);

            }else{
              onSend(file!);
            }


           },
          text:   strings.send,
          elevation: 0,
          backgroundColor: kPrimary,
          radius: BorderRadius.circular(  5),
          padding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            kLoadSvgInCircle(
              "person",
            ),
            Text(
              strings.add_file_mobile,
              style: kTextRegular.copyWith(fontSize: 14, color: kGray_64),
            ),
            SizedBox(
              height: 20,
            ),
            UploadFilesOnly(
              initialValue: "",
              onPicker: (image) {
                file = image;
              },
            )
          ],
        ),
      ),
    );
  }
}
