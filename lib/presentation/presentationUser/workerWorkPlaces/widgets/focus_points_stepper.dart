import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';

import '../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../common/domain/entities/workerWorkPlaces/index.dart';
import '../../../../utils/app_icons.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/stepper/custom_stepper.dart';
import '../../../shared/components/stepper/stepper_model.dart';
import '../../../shared/components/texts/underline_text.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import 'my_focus_point_status.dart';

class FocusPointsStepper extends BaseStatelessWidget {
  final StreamStateInitial<int>? indexStream;
  final List<WorkerWorkPlace> myGates;
  final void Function(int)? onStepReached;
  final ScrollController? controller;

  FocusPointsStepper(
      {Key? key,
      required this.myGates,
      this.indexStream,
      this.onStepReached,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyFocusPointsList build ${myGates.length}");
    return StreamBuilder<int>(
        stream: indexStream?.stream,
        builder: (context, snapshot) {
          return CustomStepper(
            activeStep:
                snapshot.data ?? (MyFocusPointStatus.getActiveStepper(myGates)),
            controller: controller,
            steps: myGates
                .map(
                  (e) => StepperModel(
                    activeImage: e.images ?? '',
                    inActiveImage: e.images ?? '',
                    title: (e.isBreak ?? false)
                        ? strings.rest_time
                        : e.focusPointName ?? '',
                    subTitle:
                        " ${strings.from}${DateFormatter.repairApiTimeUI(e.startShift ?? '')}\n${strings.too} ${DateFormatter.repairApiTimeUI(e.endShift ?? '')}",
                    isCompleted: MyFocusPointStatus.checkedIn == e.status,
                    isActive: MyFocusPointStatus.active == e.status,
                    isWaiting: MyFocusPointStatus.notCheckedIn == e.status,
                    color: kColorFromHex(e.statusColor ?? '#000000'),
                  ),
                )
                .toList(),
            widgets: myGates
                .map(
                  (e) => GatesStepperWidgetsItem(
                    title: strings.tasks_duties,
                    controller: controller,
                    texts: [
                      ...e.focusPointTermAndCondition ?? [],
                      ...e.focusPointTypeTermAndCondition ?? [],
                    ],
                  ),
                )
                .toList(),
            onStepReached: onStepReached,
          );
        });
  }
}

class GatesStepperWidgetsItem extends StatelessWidget {
  final String title;
  final List<String> texts;
  final ScrollController? controller;

  const GatesStepperWidgetsItem(
      {Key? key, required this.title, required this.texts, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('texts $texts');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 14,
        ),
        UnderlineText(
          text: title,
          textStyle: kTextSemiBold.copyWith(color: kPrimary, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: texts.length,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) {
            return IconText(
              icon: AppIcons.taskDone,
              isExpanded: true,
              text: texts[index],
              padding: const EdgeInsets.symmetric(vertical: 5),
              textStyle: kTextMedium.copyWith(
                  fontSize: 12, color: kBlack.withOpacity(0.53)),
            );
          },
        ),
      ],
    );
  }
}
