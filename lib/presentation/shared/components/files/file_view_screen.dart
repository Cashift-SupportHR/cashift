import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/loading_widget.dart';

import '../../../../common/data/models/salary-definition-request/index.dart';
import '../../../../utils/app_icons.dart';
import '../../../presentationUser/resources/colors.dart';
import '../base_stateless_widget.dart';
import '../buttons/icon_text_button.dart';
import '../decorations/decorations.dart';
import 'custom_p_d_f_view.dart';
import 'files_manager.dart';

class FileViewScreen extends BaseStatelessWidget {
  final DownLoadFileDto data;
  final bool? isShowShareAndDownloadButtons;
  final Function()? onDownload;
  final Function()? onShare;

  FileViewScreen({
    Key? key,
    required this.data,
    this.onDownload,
    this.onShare,
    this.isShowShareAndDownloadButtons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('data.fileAttachment ${data.fileAttachment}');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: data.fileAttachmentType!.contains('pdf')
                ? FutureBuilder(
                  future: FilesManager().createFileFromBase64(data),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting ? SmallLoadingView() :
                      CustomPDFView(
                        filePath: snapshot.data.toString(),
                      );
                  }
                )
                : Image.memory(base64Decode(data.fileAttachment ?? '')),
          ),
          SizedBox(height: 20),
          if (isShowShareAndDownloadButtons!)
            ShareAndDownloadButtons(
              onDownload: onDownload,
              onShare: onShare,
            ),
        ],
      ),
    );
  }
}

class ShareAndDownloadButtons extends BaseStatelessWidget {
  final Function()? onDownload;
  final Function()? onShare;

  ShareAndDownloadButtons({Key? key, this.onDownload, this.onShare})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.shapeDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconTextButton(
            text: strings.share,
            icon: AppIcons.shareOutline,
            onTap: () {
              if (onShare != null) onShare!();
            },
          ),
          SizedBox(
            height: 50,
            width: 1,
            child: VerticalDivider(
              color: kGrey_C9,
              width: 1,
            ),
          ),
          IconTextButton(
            text: strings.download_qr_code,
            icon: AppIcons.downloadSquareOutline,
            onTap: () {
              if (onShare != null) onDownload!();
            },
          ),
        ],
      ),
    );
  }
}
