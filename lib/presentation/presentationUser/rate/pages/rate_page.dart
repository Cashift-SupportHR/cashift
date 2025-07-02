import 'package:flutter/material.dart';
import 'package:shiftapp/domain/entities/evulation/evaluation_item.dart';
import 'package:shiftapp/domain/entities/evulation/evaluation_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/rate/bloc/evaluation_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/rate/pages/evaluation_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/core/utils/responsive.dart';

import '../../../../core/services/routes.dart';

class RatePageModel{
  final int transactionId;
  RatePageModel({required this.transactionId });

}
class RatePage extends BaseBlocWidget<Initialized<List<EvaluationItem>>, EvaluationCubit>{

  @override
  bool initializeByKoin() {
    return false;
  }
  static Future show(BuildContext context ,int transactionId) async {
    return await Navigator.pushNamed(context, Routes.ratePage,arguments: RatePageModel(transactionId: transactionId));
  }

  RatePageModel model(BuildContext context){
    return getArguments(context);
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<List<EvaluationItem>> state) {
    return EvaluationScreen(evaluationItems : state.data,onSave: ((evaluations) {
      bloc.saveEvaluations(createEvaluationParams(evaluations));
    }),);
  }

  EvaluationParams createEvaluationParams(List<EvaluationItem> evaluations) {
    return EvaluationParams(transactionId: model(context).transactionId, evaluations: evaluations, comment: '');
  }

  @override
  String? title(BuildContext context) {
    return 'قيم تجربتك';
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadEvaluations( model(context).transactionId);
  }
  @override
  void onRequestSuccess(String? message) {
   // onUpdate();
    Navigator.pop(context , true);
  }

  Widget constrainsLayout({double ? highPercent ,double ? widthPercent , required Widget child}) {
    return LayoutBuilder(
        builder: (context, boxConstraints) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: kPercent( percent: 95, max: boxConstraints.maxHeight),
                  maxWidth: kPercent( percent: 95, max: boxConstraints.maxWidth),
              ),
            child: child,
          );
        });
  }
}