import 'package:shiftapp/presentation/presentationUser/common/stream_data_state.dart';

import '../../../core/resources/data_state.dart';
import '../base/base_stateless_widget.dart';
import '../error_handler_widget.dart';
import '../loading_widget.dart';

class StreamDataStateWidget<T> extends BaseStatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context, Widget child)? frameBuilder;
  final StreamDataState<T> stream;
  final Function()? onReload;

  StreamDataStateWidget({
    super.key,
    required this.builder,
    this.frameBuilder,
    required this.stream,
    this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<T>>(
        stream: stream.stream,
        builder: (context, snapshot) {
          return frameBuilder!=null ? frameBuilder!(context , _build(context,snapshot)) : _build(context,snapshot);
        });
  }

  Widget handleDataState(DataState state, BuildContext context) {
    if (state is DataLoading) {
      return const LoadingView();
    }
    if (state is DataSuccess<T>) {
      return builder(context, state.data!);
    }
    if (state is DataFailed) {
      return handleApiErrorPlaceHolder(state.error, onClickReload: onReload);

    }
    return const Center();
  }

  @override
  Widget handleApiErrorPlaceHolder(error, {Function()? onClickReload}) {
    return ErrorPlaceHolderWidget(
      exception: error,
      color: Colors.transparent,
      onClickReload: onReload,
      height: 250,
    );
  }

  Widget _build(BuildContext context, AsyncSnapshot<DataState<T>> snapshot) {
    if (snapshot.connectionState != ConnectionState.active) {
      return const SizedBox.shrink();
    }
    if (snapshot.data is DataState) {
      return handleDataState(snapshot.data as DataState, context);
    }
    if (snapshot.error != null) {
      return handleApiErrorPlaceHolder(snapshot.error,
          onClickReload: onReload);
    }
    return const SizedBox.shrink();
  }
}