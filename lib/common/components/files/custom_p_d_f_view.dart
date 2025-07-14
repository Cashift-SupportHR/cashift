import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../base/base_stateless_widget.dart';
import '../dialogs_manager.dart';

///  Created by harbey on 7/30/2023.
class CustomPDFView extends BaseStatelessWidget {
  final String filePath;
  CustomPDFView({Key? key, required this.filePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: filePath,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onRender: (_pages) {},
      pageSnap: true,
      onError: (error) {
        DialogsManager.showErrorDialog(
            context, strings.something_went_wrong);
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {},
      onPageChanged: (int? page, int? total) {},
    );
  }
}
