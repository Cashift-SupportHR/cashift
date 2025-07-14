import 'package:flutter/material.dart';
import 'package:linear_step_indicator/src/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import 'image_builder.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

class MLinearStepIndicator extends StatefulWidget {
  ///Controller for tracking page changes.
  ///
  ///Typically, controller should animate or jump to next page
  ///when a step is completed
  final PageController controller;

  ///Number of nodes to paint on screen
  final int steps;
  final int initSteps;

  ///[completedIcon] size
  final double iconSize;

  ///Size of each node
  final double nodeSize;

  ///Height of separating line
  final double activeLineHeight;

  final double inActiveLineHeight;

  ///Icon showed when a step is completed
  final IconData completedIcon;

  ///Widget showed when a step is completed
  final Widget? completedWidget;

  ///Color of each completed node border
  final Color activeBorderColor;

  ///Color of each uncompleted node border
  final Color inActiveBorderColor;

  ///Color of each separating line after a completed node
  final Color activeLineColor;

  ///Color of each separating line after an uncompleted node
  final Color inActiveLineColor;

  ///Background color of a completed node
  final Color activeNodeColor;

  ///Color of selected node border
  final Color selectedNodeColor;

  ///Background color of a selected node
  final Color selectedBorderColor;

  ///Background color of an uncompleted node
  final Color inActiveNodeColor;

  ///Thickness of node's borders
  final double nodeThickness;

  ///Node's shape
  final BoxShape shape;

  ///[completedIcon] color
  final Color iconColor;

  ///Step indicator's background color
  final Color backgroundColor;

  ///Boolean function that returns [true] when last node should be completed
  final Complete? complete;

  ///Step indicator's vertical padding
  final double verticalPadding;

  ///Labels for individual nodes
  final List<String> labels;

  ///Textstyle for an active label
  final TextStyle? activeLabelStyle;

  ///Textstyle for an inactive label
  final TextStyle? inActiveLabelStyle;

  /// list of icons for each step
  final List<String> icons;

  final Color activeIconColor;

  final Color inActiveIconColor;

  final Color selectedIconColor;

  const MLinearStepIndicator({
    Key? key,
    required this.steps,
    required this.initSteps,
    required this.controller,
    this.activeBorderColor = kPrimary,
    this.inActiveBorderColor = kInActiveColor,
    this.activeLineColor = kPrimary,
    this.inActiveLineColor = kInActiveLineColor,
    this.activeNodeColor = kBackground,
    this.selectedNodeColor = kPrimary,
    this.selectedBorderColor = kPrimary,
    this.inActiveNodeColor = kInActiveNodeColor,
    this.iconSize = kIconSize,
    this.completedIcon = kCompletedIcon,
    this.completedWidget,
    this.nodeThickness = kDefaultThickness,
    this.nodeSize = kDefaultSize,
    this.verticalPadding = kDefaultSize,
    this.activeLineHeight = kDefaultLineHeight,
    this.inActiveLineHeight = kDefaultLineHeight,
    this.shape = BoxShape.circle,
    this.iconColor = kIconColor,
    this.backgroundColor = kIconColor,
    this.complete,
    this.labels = const <String>[],
    this.activeLabelStyle,
    this.inActiveLabelStyle,
    this.icons = const <String>[],
    this.activeIconColor = kPrimary,
    this.inActiveIconColor = kInActiveColor,
    this.selectedIconColor = kPrimary,

  })  : assert(steps > 0, "steps value must be a non-zero positive integer"),
        assert(labels.length == steps || labels.length == 0,
            "Provide exactly $steps strings for labels"),
        super(key: key);

  @override
  _LinearStepIndicatorState createState() => _LinearStepIndicatorState();
}

class _LinearStepIndicatorState extends State<MLinearStepIndicator> {
  late List<Node> nodes;
  late int lastStep;

  @override
  void initState() {
    super.initState();
    nodes = List<Node>.generate(widget.steps, (index) => Node(step: index));
    lastStep = widget.initSteps;
  }

  //returns active or inactive color depending on the completion status of [node]
  Color getColor(Node node) {
    print('getNodeColor ${node.step} => $lastStep');

    if (node.step == lastStep) {
      return widget.selectedBorderColor;
    }
    if (node.step < lastStep) {
      return widget.activeBorderColor;
    }
    return widget.inActiveBorderColor;
  }

  //returns active or inactive color depending on the completion status of [node]
  Color getNodeColor(Node node) {
    print('getNodeColor ${node.step} => $lastStep');

    if (node.step == lastStep) {
      return widget.selectedNodeColor;
    }
    if (node.step < lastStep) {
      return widget.activeNodeColor;
    }
    return widget.inActiveNodeColor;
  }

  Color getIconColor(Node node) {
    print('getNodeColor ${node.step} => $lastStep');

    if (node.step == lastStep) {
      return widget.selectedIconColor;
    }
    if (node.step < lastStep) {
      return widget.activeIconColor;
    }
    return widget.inActiveIconColor;
  }

  Color getBorderColor(Node node) {
    print('getNodeColor ${node.step} => $lastStep');

    if (node.step == lastStep) {
      return widget.selectedBorderColor;
    }
    if (node.step < lastStep) {
      return widget.activeBorderColor;
    }
    return widget.inActiveBorderColor;
  }

  BorderSide side(Node node) => BorderSide(
        color: getColor(node),
        width: widget.nodeThickness,
      );

  TextStyle getTextStyle(String label) {
    var currentIndex = widget.labels.indexOf(label);
    if (nodes[currentIndex].completed || currentIndex == lastStep) {
      //return active text style
      return widget.activeLabelStyle ??
          kTextRegular.copyWith(color: kDark2,fontSize: 11);
    } else {
      //return inactive text style
      return widget.inActiveLabelStyle ??
          kTextRegular.copyWith(color: kDark2, fontSize: 11);
    }
  }

  @override
  Widget build(BuildContext context) {
    lastStep = widget.initSteps;
    print('lastStep $lastStep');
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
        color: widget.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var node in nodes) ...[

                    Container(
                            alignment: Alignment.topCenter,
                            height: widget.nodeSize,
                            width: widget.nodeSize,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: getNodeColor(node),
                              border: Border.all(color: getBorderColor(node)),
                              shape: widget.shape,
                            ),
                            child:  node.step < lastStep && widget.completedWidget != null
                                ? widget.completedWidget!
                                :
                            node.step < lastStep
                                ? Icon(
                                    widget.completedIcon,
                                    size: widget.iconSize,
                                    color: widget.iconColor,
                                  )
                                : Center(
                              child: kLoadSvgInCirclePath(
                                widget.icons.isNotEmpty ? widget.icons[node.step] : AppIcons.circle,
                                width: 20,
                                height: 20,
                                color: getIconColor(node),
                              )
                            ),
                          ),
                    if (node.step != widget.steps - 1)
                      Expanded(
                        child: Container(
                          color: node .step < lastStep
                              ? widget.activeLineColor
                              : widget.inActiveLineColor,
                          height: node .step < lastStep ? widget.activeLineHeight : widget.inActiveLineHeight,
                          width: widget.steps > 3
                              ? context.screenWidth(1 / widget.steps) - 35
                              : context.screenWidth(1 / widget.steps) + 20,
                        ),
                      ),
                  ],
                ],
              ),
            ),
            if (widget.labels.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var label in widget.labels) ...[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, ),
                          child: Text(
                            label,
                            textAlign: label == widget.labels[0]
                                ? TextAlign.start
                                : label == widget.labels[widget.steps - 1]
                                    ? TextAlign.end
                                    : TextAlign.center,
                            style: getTextStyle(label),
                          ),
                        ),
                      ),
                      // if (label != widget.labels[widget.steps - 1]) ...[
                      //   Expanded(
                      //     child: SizedBox(
                      //       width: widget.steps > 3
                      //           ? context.screenWidth(1 / widget.steps) - 60
                      //           : context.screenWidth(1 / widget.steps),
                      //     ),
                      //   ),
                      // ],
                    ],
                  ],
                ),
              ),
              SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class Node {
  bool completed;
  int step;

  Node({
    this.completed = false,
    this.step = 0,
  });
}
