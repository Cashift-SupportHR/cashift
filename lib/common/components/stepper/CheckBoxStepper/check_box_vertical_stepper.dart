import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../divider/dashed_line_vertical.dart';

///  Created by harbey on 8/15/2023.
class CheckBoxVerticalStepper extends StatelessWidget {
  final int currentStep;
  final List<Widget> steps;

  const CheckBoxVerticalStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('currentStep: $currentStep');
    return ListView.builder(
        itemCount: steps.length,
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(end: 16, top: 16, bottom: 16),
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: AbsorbPointer(
              absorbing: index != currentStep,
              ignoringSemantics: index > currentStep,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                          child: Radio(
                            value: 'value',
                            groupValue: 'value',
                            splashRadius: 100,
                            fillColor: MaterialStateProperty.all(index > currentStep? kGray_CE
                                : kPrimary),
                            onChanged: (value) {},
                          ),
                        ),
                        if((steps.length - 1) != index)
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: (index - currentStep) < 2 ? (index > currentStep? DashedLineVertical()
                                  : VerticalDivider(
                                thickness: 1.2,
                                color: kPrimary,
                              )) : SizedBox.shrink(),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 5, child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: steps[index],
                  )),
                ],
              ),
            ),
          );
        });
  }
}
