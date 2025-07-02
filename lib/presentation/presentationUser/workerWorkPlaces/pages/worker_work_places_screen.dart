import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/domain/entities/workerWorkPlaces/index.dart';
import 'package:shiftapp/core/utils/app_icons.dart';
import 'package:vibration/vibration.dart';

import '../../../../domain/entities/shared/date_formatter.dart';
 import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/icons/icon_text.dart';
import '../../../shared/components/texts/underline_text.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../widgets/focus_points_stepper.dart';
import '../widgets/my_focus_points_list.dart';

class WorkerWorkPlacesScreen extends BaseStatelessWidget {
  final FocusPointInfo focusPointInfo;
  final List<WorkerWorkPlace> gates;
  final Function(bool, int) onActionPerform;

  WorkerWorkPlacesScreen({
    Key? key,
    required this.focusPointInfo,
    required this.gates,
    required this.onActionPerform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<int>? indexStream = StreamStateInitial();
    ScrollController? scrollController = ScrollController();
    SwiperController? controller = SwiperController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: NestedScrollView(
        floatHeaderSlivers: true,
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: _BuildTitle(
                focusPointInfo: focusPointInfo,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 5),
                child: UnderlineText(
                  text: strings.my_focus_points,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 260,
                  child: MyFocusPointsList(
                    controller: controller,
                    myGates: gates,
                    onIndexChanged: (index) {
                      Vibration.vibrate();
                      print('onIndexChanged ${index}');
                      indexStream.setData(index);
                    },
                    indexStream: indexStream,
                    onActionPerform: (isStart, id) {
                      onActionPerform(isStart, id);
                    },
                  )),
            ),
          ];
        },
        body: FocusPointsStepper(
          indexStream: indexStream,
          myGates: gates,
          controller: scrollController,
          onStepReached: (index) {
            Vibration.vibrate(pattern: [50]);
            controller.move(index);
          },
        ),
      ),
    );
  }
}

class _BuildTitle extends BaseStatelessWidget {
  final FocusPointInfo focusPointInfo;

  _BuildTitle({Key? key, required this.focusPointInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              focusPointInfo.freelanceName ?? '',
              style: kTextSemiBold.copyWith(fontSize: 24, color: kPrimary),
            ),
            const SizedBox(height: 10),
            IconText(
              icon: AppIcons.location,
              iconSize: 16,
              text: focusPointInfo.projectName ?? '',
              textStyle: kTextMedium.copyWith(
                  fontSize: 12, color: kBlack.withOpacity(0.46)),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(
              icon: AppIcons.timeOutline,
              iconSize: 15,
              iconColor: kBlack,
              text: '${DateFormatter.repairApiTime(focusPointInfo.startShift ?? '',
                  apiPattern: DateFormatter.HOUR_MINUT
              )}  ${strings.to} ${DateFormatter.repairApiTime(focusPointInfo.endShift ?? '',
                  apiPattern: DateFormatter.HOUR_MINUT)}',
              textStyle: kTextRegular.copyWith(
                  fontSize: 14, color: kBlack.withOpacity(0.70)),
            ),
            const SizedBox(height: 10),
            IconText(
              icon: AppIcons.calendarCircle,
              iconColor: kBlack,
              text: DateFormatter.repairApiDateTime(focusPointInfo.date ??'', apiPattern: DateFormatter.DATE_Api_DD_MM_YYYY, pattern: DateFormatter.DATE_D_MMM_YYYY),
              textStyle: kTextRegular.copyWith(
                  fontSize: 14, color: kBlack.withOpacity(0.70)),
            ),
          ],
        ),
      ],
    );
  }
}
