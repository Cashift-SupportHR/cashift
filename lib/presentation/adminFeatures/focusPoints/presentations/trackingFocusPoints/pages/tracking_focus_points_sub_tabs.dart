import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/index.dart';
import '../widgets/tracking_focus_points_list.dart';

class TrackingFocusPointsSubTabs extends BaseStatelessWidget {
  final Function(int)? onTabChange;
  final ScrollController? scrollController;
  final List<FocusPointsTypes> focusPointsTypes;

  TrackingFocusPointsSubTabs(
      {Key? key,
      this.onTabChange,
      this.scrollController,
      required this.focusPointsTypes})
      : super(key: key);
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    print("TrackingFocusPointsSubTabs build ${focusPointsTypes.length}");
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: focusPointsTypes.length,
        child: Scaffold(
          backgroundColor: kBackground,
          appBar: AppBar(
            backgroundColor: kBackground,
            leading: const SizedBox(),
            elevation: 0,
            flexibleSpace: TabBar(
              isScrollable: true,
              labelColor: kPrimary,
              unselectedLabelColor: kSteal,
              labelStyle: kTextSemiBold.copyWith(fontSize: 18),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              indicatorColor: kYellow_2,
              tabs: focusPointsTypes
                  .map(
                    (e) => CustomTab(
                      item: SubTabModel(
                        title: e.focusPointTypeName ?? '',
                        icon: e.imageFocusPointsType ?? '',
                        count: e.focusPointTypeCount ?? 0,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: focusPointsTypes
                .map((e) => TrackingFocusPointsList(
                      scrollController: scrollController,
                      freelanceApply: e.freelanceApply ?? [],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CustomTab extends BaseStatelessWidget {
  final SubTabModel item;

  CustomTab({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          if (item.icon != null && item.icon!.isNotEmpty)
            kBuildImageFixedSize(
              item.icon!,
              height: 25,
              width: 25,
              border: 0,
            ),
          Text(item.title),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 5),
            padding: const EdgeInsetsDirectional.only(
                start: 5, end: 5, top: 6, bottom: 4),
            decoration: const BoxDecoration(
              color: kSteal,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              item.count.toString() + '  ' + ((item.count ?? 0) <=1 ? strings.point : strings.points),
              style: kTextRegular.copyWith(fontSize: 10, color: kWhite),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
