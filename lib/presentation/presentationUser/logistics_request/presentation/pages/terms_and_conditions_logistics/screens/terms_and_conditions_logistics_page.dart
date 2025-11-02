import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../common/common_state.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';
import '../cubit/terms_and_conditions_logistics_cubit.dart';
import 'terms_and_conditions_logistics_screen.dart';

class TermsAndConditionsLogisticsPage
    extends
        BaseBlocWidget<
          Initialized<List<CarTermsAndConditionsEntity>>,
          TermsAndConditionsLogisticsCubit
        > {
  final Function() onNext;
  final Function() onPrevious;
  final AddLogisticPrams Function()? callback;

  TermsAndConditionsLogisticsPage({
    Key? key,
    required this.onNext,
    required this.onPrevious,
    required this.callback,
  }) : super(key: key);



  @override
  void loadInitialData(BuildContext context) {
 return   bloc.fetchCarTermsAndConditions();
  }

  @override
  Widget buildWidget(
    BuildContext context,
    Initialized<List<CarTermsAndConditionsEntity>> state,
  ) {
    print(state.data.length);
    print("jhjkklklklkl");
    return TermsAndConditionsLogisticsScreen(


      data: state.data,
      onPrevious: onPrevious,
      onNext: (termsAccepted) {
        AddLogisticPrams data = callback!();
        data.termsAccepted=termsAccepted;
        print(data.preferredDistrictIds);
        print("klkllkl");
        bloc.addLogistic(data);
      },
    );
  }
  @override
  void onSuccessDismissed() {
   Navigator.pop(context,true);
  }
}
