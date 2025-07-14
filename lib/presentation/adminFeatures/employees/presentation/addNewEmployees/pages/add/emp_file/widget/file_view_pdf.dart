import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../../../../../shared/components/index.dart';
import '../../../../../../data/models/index.dart';
import '../../../../../../domain/entities/index.dart';

class FileViewPdfOrImage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    AttachmentsEmp data = getArguments(context);
    return AppScaffold(
        title: data.requirementName ?? '',
        body: data.attachmentExtensionType!.contains("pdf")
            ?  PDF().cachedFromUrl(
                data.requirementAttachmentPath ?? "",
                placeholder: (progress) => Center(child: Text('$progress %')),
                errorWidget: (error) => Center(child: Text(error.toString())),
              )
            : Center(child: kBuildImage(data.requirementAttachmentPath ?? "",width: MediaQuery.of(context).size.width-100,height: MediaQuery.of(context).size.width)));
  }
}
