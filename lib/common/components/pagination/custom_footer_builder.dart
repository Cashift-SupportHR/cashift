import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../l10n/app_localizations.dart';
import '../../../presentation/presentationUser/common/stream_data_state.dart';
import 'loading_widget.dart';

class CustomFooterBuilder extends StatelessWidget {
  const CustomFooterBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        print('mode $mode');
        Widget body;
        if (mode == LoadStatus.noMore) {
          // body =  Text(localization.no_more_data);
          body = const Text('');
        } else if (mode == LoadStatus.loading) {
          body = const LoadingWidget();
        } else if (mode == LoadStatus.failed) {
          body = Text(localization.load_failed_refresh_data);
        } else if (mode == LoadStatus.canLoading) {
          body = Text(localization.load_more);
        } else if (mode == LoadStatus.idle) {
          body = Text(localization.load_more);
        } else {
          body = const Text('');
        }
        return Container(
          height: 55.0,
          alignment: Alignment.center,
          color: context.theme.scaffoldBackgroundColor,
          child: body,
        );
      },
    );
  }
}
