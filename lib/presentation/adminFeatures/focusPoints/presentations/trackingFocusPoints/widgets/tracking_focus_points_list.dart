import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/widgets/tracking_focus_point_item.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../data/models/focus_points_types_dto.dart';

class TrackingFocusPointsList extends BaseStatelessWidget {
  final List<FreelanceApply> freelanceApply;
  final ScrollController? scrollController;

  TrackingFocusPointsList(
      {Key? key, required this.freelanceApply, this.scrollController})
      : super(key: key);

  int getItemCountPerRow(BuildContext context) {
    double minTileWidth = 200; //in your case
    double availableWidth = MediaQuery.of(context).size.width;

    int i = availableWidth ~/ minTileWidth;
    return i;
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (isTablet && isPortrait)
            ? 4
            : (isTablet && !isPortrait)
                ? 6
                : 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: isTablet ? 10 : 0,
      ),
      itemCount: freelanceApply.length,
      shrinkWrap: true,
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context, index) {
        return Container(
          child: TrackingFocusPointItem(
            freelanceApply: freelanceApply[index],
          ),
        );
      },
    );
  }
}
