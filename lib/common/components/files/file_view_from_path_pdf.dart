import 'dart:io';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../index.dart';

class FileViewPdfOrImageFromFile extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    File data = getArguments(context);
    return AppScaffold(
        title: strings.attachments,
        body: data.path.contains("pdf")
            ? PDF().fromPath(
                data.path ?? "",
              )
            : Center(
                child: Image.file(data,
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.width)));
  }
}
