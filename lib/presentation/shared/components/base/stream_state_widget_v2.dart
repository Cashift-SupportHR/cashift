import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../common/data/exceptions/empty_list_exception.dart';
import '../../../presentationUser/common/common_state.dart';
import '../error_handler_widget.dart';
import '../loading_widget.dart';

///  Created by harbey on 9/19/2023.
class StreamStateWidgetV2<T> extends BaseStatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final StreamState<T> stream;
  final Function()? onReload;
  final T? initialData;
  final bool isBottomSheetData;
  StreamStateWidgetV2({
    super.key,
    required this.builder,
    required this.stream,
    this.onReload,
    this.initialData,
    this.isBottomSheetData = false,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream.stream,
        initialData: initialData,
        builder: (context, snapshot) {
          print('StreamStateWidgetV2: ${snapshot.data}');
          // This condition is added to handle the case when the stream is bottom sheet data
          // if(initialData != null){
          //   return builder(context, initialData as T);
          // }
          // else
          if (isBottomSheetData) {
            if (snapshot.data != null) {
              return builder(context, snapshot.data as T);
            } else if (snapshot.error != null || snapshot.data == null) {
              return SizedBox.shrink();
            }
          }
          // This condition is added to handle the case when the stream is pagination data
          else if ((snapshot.data != null && (snapshot.data == ''))) {
            return ErrorPlaceHolderWidget(
              exception: EmptyListException(),
              onClickReload: onReload,
            );
          } else if (snapshot.data != null) {
            return builder(context, snapshot.data as T);
          } else if (snapshot.error != null) {
            return ErrorPlaceHolderWidget(
              exception: snapshot.error ?? EmptyListException(),
              onClickReload: onReload,
            );
          }
          return LoadingView();
        });
  }
}
