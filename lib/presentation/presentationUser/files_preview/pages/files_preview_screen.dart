import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/loading_widget.dart';

import '../../../../common/data/models/salary-definition-request/index.dart';
import '../../../../utils/app_icons.dart';
import '../../resources/colors.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../../common/components/buttons/icon_text_button.dart';
import '../../../shared/components/decorations/decorations.dart';
import '../../../shared/components/files/custom_p_d_f_view.dart';
import '../../../shared/components/files/files_manager.dart';

class FilesPreviewScreen extends BaseStatelessWidget {
  final List<String> data;
  final Function(String)? onDownload;
  final Function(String)? onShare;

  FilesPreviewScreen({
    Key? key,
    required this.data,
    this.onDownload,
    this.onShare,
  }) : super(key: key);

  PDFViewController? _pdfViewController;
  PageController? _pageController = PageController();
  String selectedUrl = "";
  StreamStateInitial<String> state = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    print("FilesPreviewScreen build called with data: $data");
    selectedUrl = data.first;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: data.length,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: data[index].contains(".pdf")
                    ? showPdf(data[index])
                    : showImage(data[index]));
              },
              onPageChanged: (index) {
                selectedUrl = data[index];
                state.setData(selectedUrl);
              },
            ),
          ),
          SizedBox(height: 10),
          sliderImages(),
          SizedBox(height: 10),
          _ShareAndDownloadButtons(onDownload: () {
            onDownload?.call(selectedUrl);
          }, onShare: () {
            onShare?.call(selectedUrl);
          }),
        ],
      ),
    );
  }

  showPdf(String url) {
    return Stack(
      children: [
        PDF(
          onViewCreated: _onPDFViewCreated,
          swipeHorizontal: false,
        ).cachedFromUrl(
          url,
          placeholder: (progress) => Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text('$progress %'),
            ],
          )),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () async {
              int currentPage = await _pdfViewController!.getCurrentPage() ?? 1;
              _pdfViewController?.setPage(currentPage - 1);
            },
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () async {
              int currentPage = await _pdfViewController?.getCurrentPage() ?? 1;
              _pdfViewController?.setPage(currentPage + 1);
            },
          ),
        ),
      ],
    );
  }

  showImage(String url) {
       if(url.startsWith("http")) {
         return  kBuildImage(
           url,
           fit: BoxFit.fill,
         );
       }else{
         Uint8List? imageBytes   = base64Decode(url);
        return Center(
           child:   Image.memory(imageBytes),
         );
       }


  }

  sliderImages() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: StreamBuilder(
          stream: state!.stream,
          initialData: selectedUrl,
          builder: (context, snapshot) {
            selectedUrl = snapshot.data.toString();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: data
                  .map((e) => InkWell(
                        onTap: () {
                          int index = data.indexOf(e);
                          _pageController!.jumpToPage(index);
                          state!.setData(e);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 60,
                          width: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: Decorations.boxDecorationBorder(
                            radius: 2,
                            color: kPrimary,
                            borderColor: selectedUrl == e
                                ? kCornFlower2
                                : Colors.transparent,
                            borderWidth: selectedUrl == e ? 2 : 0,
                          ),
                          child: e.contains(".pdf")
                              ? Icon(
                                  Icons.picture_as_pdf_outlined,
                                  color: kWhite,
                                  size: 40,
                                )
                              : showImage(e),
                        ),
                      ))
                  .toList(),
            );
          }
        ),
      ),
    );
  }

  _onPDFViewCreated(PDFViewController controller) {
    _pdfViewController = controller;
  }
}

class _ShareAndDownloadButtons extends BaseStatelessWidget {
  final Function()? onDownload;
  final Function()? onShare;

  _ShareAndDownloadButtons({Key? key, this.onDownload, this.onShare})
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
            text: strings.download_file,
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
