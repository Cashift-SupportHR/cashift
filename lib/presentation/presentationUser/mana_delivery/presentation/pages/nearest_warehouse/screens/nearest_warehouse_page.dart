import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../common/common_state.dart';
 import '../cubit/nearest_warehouse_cubit.dart';
import 'nearest_warehouse_screen.dart';

class NearestWarehousePage extends BaseBlocWidget<UnInitState, NearestWarehouseCubit> {

  final Function( ) onNext;
  NearestWarehousePage({Key? key, required this.onNext  }) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return NearestWarehouseScreen(
      onNext: onNext,

    );
  }
}
