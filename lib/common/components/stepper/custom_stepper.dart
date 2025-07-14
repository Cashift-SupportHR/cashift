
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'active_stepper_widget.dart';
import 'complete_stepper_widget.dart';
import 'easy_step.dart';
import 'easy_stepper.dart';
import 'inactive_stepper_widget.dart';
import 'stepper_model.dart';

class CustomStepper extends StatelessWidget{
  final List<StepperModel> steps;
  final List<Widget>? widgets;
  final void Function(int)? onStepReached;
  final int? activeStep;
  final ScrollController? controller;
  const CustomStepper({Key? key, required this.steps, this.widgets, this.onStepReached, this.activeStep, this.controller}) : super(key: key);


  @override
  build(BuildContext context) {
    int activeStep = this.activeStep ?? 0;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      child:
      StatefulBuilder(
          builder: (context, setState) {
          return Column(
            children: [
              SizedBox(
                height: 115,
                child: EasyStepper(
                  activeStep: activeStep,
                  stepRadius: 22,
                  lineType: LineType.normal,
                  activeStepBorderType: BorderType.normal,
                  activeStepBorderColor: kOrange_09,
                  activeStepIconColor: kOrange_09,
                  activeStepTextColor: kOrange_09,
                  activeLineColor: kOrange_09,
                  activeStepBackgroundColor: kWhite,
                  unreachedStepBackgroundColor: kBackground,
                  unreachedStepBorderColor: kGrey_D0,
                  unreachedStepIconColor: kGrey_D0,
                  unreachedStepTextColor: kGrey_D0,
                  unreachedLineColor: kGrey_D0,
                  unreachedStepBorderType: BorderType.normal,
                  finishedStepBackgroundColor: kPrimary,
                  finishedStepBorderColor: kPrimary,
                  finishedStepIconColor: kPrimary,
                  finishedStepTextColor: kPrimary,
                  finishedLineColor: kPrimary,
                  finishedStepBorderType: BorderType.normal,
                  borderThickness: 3,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  steps: steps.map((e) => EasyStep(
                    // There four cases for the step, activeStep, active, inactive and completed, each one has a different widget
                    // Note: activeStep is meant to be the current step, active is the step that is being selected, inactive is the step that is not selected and completed is the step that is already completed
                   customLineColor: e.isCompleted ? e.color : activeStep == steps.indexOf(e) ? kYellow_00 : e.color,
                    customStep:
                    e.isCompleted ? CompleteStepperWidget(
                      color: e.color,
                    ) : activeStep == steps.indexOf(e) ? ActiveStepperWidget(
                      color: kYellow_00,
                      activeImage: e.activeImage,
                    ) : e.isActive ?
                    ActiveStepperWidget(
                      color: e.color,
                      activeImage: e.activeImage,
                    ) : InActiveStepperWidget(
                      color: e.color,
                      inActiveImage: e.inActiveImage,
                    ),
                    customTitle: Column(
                      children: [
                        Text(e.title,
                          textAlign: TextAlign.center,
                          style: kTextRegular.copyWith(
                            color:  e.isCompleted ? e.color : activeStep == steps.indexOf(e) ? kYellow_00 : e.color,
                            fontSize: 12,
                          ),
                        ),
                        Text(e.subTitle,
                          textAlign: TextAlign.center,
                          style: kTextRegular.copyWith(
                            color: e.isCompleted ? e.color : activeStep == steps.indexOf(e) ? kYellow_00 : e.color,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    //enabled: _allowTabStepping(0),
                  )).toList(),
                  onStepReached: (index) {
                 //   setState(() {
                      activeStep = index;
                      onStepReached!(index);
                 //   });
                  },
                ),
              ),
              if(widgets != null)
                widgets![activeStep]
            ],
          );
        }
      ),
    );
  }
}
