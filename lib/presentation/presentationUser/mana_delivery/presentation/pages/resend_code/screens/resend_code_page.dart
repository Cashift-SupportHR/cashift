import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/logistics_request/presentation/pages/select_car/screens/vehicle_type_screen.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/presentation/pages/resend_code/screens/resend_code_screen.dart' show ResendCodeScreen;
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

 import '../../../../../../adminFeatures/vehicles/data/models/add_vehicle_params.dart';
import '../../../../../../adminFeatures/vehicles/presentation/add/bloc/basic_vehicle_info_state.dart';
import '../../../../../common/common_state.dart';
import '../../../../domain/entities/index.dart';
import '../cubit/resend_code_cubit.dart';


class ResendCodePage
    extends BaseBlocWidget<UnInitState, ResendCodeCubit> {
  final Function( )onNext;


  ResendCodePage({Key? key,   required this.onNext}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchCarLogistics( );
  // }





  @override
  Widget buildWidget(BuildContext context, UnInitState state) {

    return ResendCodeScreen(

      onNext:onNext ,
    ) ;
  }

}
