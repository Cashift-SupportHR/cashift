import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../utils/app_icons.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../image_builder.dart';
import '../stepper.dart';

///  Created by harbey on 5/15/2023.
class CustomLinearStepIndicator extends StatelessWidget {
  final List<Widget> pages;
  final List<String> icons;
  final Widget? completedWidget;
  final List<String> labels;
  final PageController pageController;
  final StreamStateInitial<int> pageStream;
  final Function(int) onPageChanged;

  const CustomLinearStepIndicator({Key? key, required this.pages, required this.icons, this.completedWidget, required this.labels, required this.pageStream, required this.onPageChanged, required this.pageController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: StreamBuilder<int>(
              stream: pageStream.stream,
              initialData: 1,
              builder: (context, snapshot) {
                return MLinearStepIndicator(
                  steps: pages.length,
                  verticalPadding: 0,
                  backgroundColor: kBackground,
                  controller: pageController,
                  activeBorderColor: kPrimary,
                  selectedBorderColor: kPrimary,
                  inActiveBorderColor: kGrey_6,
                  activeNodeColor: kPrimary,
                  selectedNodeColor: kBackground,
                  inActiveNodeColor: kBackground,
                  activeIconColor: kPrimary,
                  selectedIconColor: kPrimary,
                  inActiveIconColor: kGrey_6,
                  nodeSize: 40,
                  nodeThickness: 4,
                  activeLineHeight: 4,
                  inActiveLineHeight: 1,
                  activeLineColor: kPrimary,
                  inActiveLineColor: kGrey_6,
                  iconSize: 12,
                  icons: icons,
                  completedWidget: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kWhite,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: kLoadSvgInCirclePath(
                      AppIcons.done,
                      width: 15,
                      height: 15,
                    ),
                  ),
                  labels: labels,
                  complete: () {
                    //typically, you'd want to put logic that returns true when all the steps
                    //are completed here
                    return Future.value(true);
                  },
                  initSteps: snapshot.requireData - 1,
                );
              }),
        ),
        Expanded(
          child: PageView(
            children: pages,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              pageStream.setData(index + 1);
              onPageChanged(index);
            },
          ),
        ),
      ],
    );
  }
}
