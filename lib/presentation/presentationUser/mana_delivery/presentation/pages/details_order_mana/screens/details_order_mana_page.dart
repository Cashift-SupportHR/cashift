import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../../domain/entities/resume/city_item.dart';
import '../../../../../../adminFeatures/projectsManagement/domain/entities/city.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/index.dart';
import '../cubit/details_order_mana_cubit.dart';
import 'details_order_mana_screen.dart';

class DetailsOrderManaPage
    extends BaseBlocWidget<UnInitState, DetailsOrderManaCubit> {
  final Function( ) onNext;


  DetailsOrderManaPage({Key? key, required this.onNext,  })
    : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchCities();
  // }


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return DetailsOrderManaScreen(

      onNext: onNext,

    );
  }
}
