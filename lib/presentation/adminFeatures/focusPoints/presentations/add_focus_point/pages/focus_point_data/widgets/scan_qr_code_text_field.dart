import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';

import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../presentationUser/appliedoffers/pages/qrcode_screen.dart';
import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../../../shared/components/image_builder.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';

///  Created by harbey on 5/15/2023.
class ScanQrCodeTextField extends BaseStatelessWidget {
  final String? focusPointId;
  final Function(String) fetchFocusPointId;

  ScanQrCodeTextField({Key? key,required this.focusPointId, required this.fetchFocusPointId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController nationalIdController = TextEditingController(text: focusPointId);
    StreamStateInitial<String?>? focusPointIdStream = StreamStateInitial<String?>();
    focusPointId != null ? focusPointIdStream.setData(focusPointId) : null;
    return   Column(
      children: [
        BuildTextFieldItem(
          title: strings.add_qr_code_pivot_point,
          hintText: strings.qr_code_value_appear_when_checked,
          controller: nationalIdController,
        keyboardType: TextInputType.text,
        isSizedBox: false,
          onChanged: (text) {
              FocusScope.of(context).unfocus();
              fetchFocusPointId(text);
          },
          endIconWidget:   Container(
            decoration: Decorations.boxDecorationBorder(radius: 3, color: kBackground),
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsetsDirectional.only(start: 10, bottom: 2),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                    context, Routes.qrScanner);
                if (result is QrCode) {
                  nationalIdController.text = result.code;
                  focusPointIdStream.setData(nationalIdController.text);
                  fetchFocusPointId(nationalIdController.text);
                }
              },
              child: kLoadSvgInCirclePath(AppIcons.qrCode,
                  height: 34, width: 34),
            ),
          ),
        ),
        StreamBuilder<String?>(
            stream: focusPointIdStream.stream,
            initialData: focusPointId,
            builder: (context, snapshot) {
               if(snapshot.data != null && snapshot.data!.isNotEmpty){
                 return IconText(
                   text: strings.qr_code_added_successfully,
                   padding: const EdgeInsets.only(bottom: 15, top: 5),
                   textStyle: kTextRegular.copyWith(fontSize: 14, color: kYellow_00),
                    icon: AppIcons.done,
                   iconColor: kYellow_00,
                 );
              } else if(snapshot.hasError){
                 return Text(strings.invalid_qr_code, style: kTextRegular.copyWith(fontSize: 14, color: kRed),);
               }
               return const SizedBox( height: 24);

            }
        ),

      ],
    );
  }
}
