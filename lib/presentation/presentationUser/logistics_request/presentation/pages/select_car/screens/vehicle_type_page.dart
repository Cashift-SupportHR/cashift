import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/logistics_request/presentation/pages/select_car/screens/vehicle_type_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

 import '../../../../../../adminFeatures/vehicles/data/models/add_vehicle_params.dart';
import '../../../../../../adminFeatures/vehicles/presentation/add/bloc/basic_vehicle_info_state.dart';
import '../../../../../common/common_state.dart';
import '../../../../domain/entities/index.dart';
import '../cubit/vehicle_type_cubit.dart';


class VehicleTypePage
    extends BaseBlocWidget<Initialized<List<CarLogisticsEntity>>, VehicleTypeCubit> {
  final Function(int id)? onNext;


  VehicleTypePage({Key? key,   this.onNext}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCarLogistics( );
  }



  @override
  bool detectRequiredTasks() {
    return false;
  }


  @override
  Widget buildWidget(BuildContext context, Initialized<List<CarLogisticsEntity>> state) {

    return VehicleTypeScreen(
      cars: state.data,
      onNext:onNext ,
    ) ;
  }

}
