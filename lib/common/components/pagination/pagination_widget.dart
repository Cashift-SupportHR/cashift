
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

 import '../../../presentation/presentationUser/attendance/facerecognation/index.dart';
import 'custom_footer_builder.dart';


///  Created by harbey on 5/27/2023.
class PaginationWidget extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;
  final bool isRefresh;
  final ScrollController? scrollController;
  final RefreshController refreshController;

  const PaginationWidget({super.key,
    this.isLoading = false,
    required this.child,
    this.isEmpty = false,
    this.onRefresh,
    this.onLoading,
    this.isRefresh = false,
    required this.refreshController,
    this.scrollController});


  @override
  Widget build(BuildContext context) {
    return
    SmartRefresher(
      enablePullUp: true,
      footer: const CustomFooterBuilder(),
      controller: refreshController,
      onRefresh: () => onSmartRefresh(),
      onLoading: () async {
      await  onLoading!();
      },
      scrollController: scrollController,
      scrollDirection: Axis.vertical,
      child: child,
    );
  }

  void onSmartRefresh() async {
    if (onRefresh != null) {
      onRefresh!();
    }
   // refreshController.resetNoData();
     refreshController.refreshCompleted();
     refreshController.loadComplete();
   //  refreshController.refreshToIdle();
  }

  // void onSmartLoading() async {
  //   print('onSmartLoading ${onLoading!() == false}');
  //   if (onLoading != null) {
  //     await onLoading!();
  //   }
  //   if (await onLoading!() == false) {
  //     refreshController.loadNoData();
  //   } else {
  //     refreshController.loadComplete();
  //   }
  // }
}
