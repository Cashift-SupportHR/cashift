import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/buttons/app_outline_button_icon.dart';
import '../../../../../domain/entities/covenant_vehicle.dart';
import '../../../bloc/covenants_vehicles_cubit.dart';
import '../add/add_covenant_vehicle_builder.dart';
import 'covenants_vehicles_screen.dart';

class VehiclesCovenantPage extends BaseBlocWidget<
    Initialized<List<CovenantVehicle>>, CovenantsVehiclesCubit> {
  final Function()? idCallback;
  final Function()? onNext;
  final Function()? onPrevious;

  VehiclesCovenantPage({Key? key, this.idCallback, this.onNext, this.onPrevious})
      : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllaData(getVehicleId(context));
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(context) {
    int? id = getArguments(context);
    return id == null ? null : strings.covenants;
  }

  int companyId = 0;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          addBackButton(context),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CovenantVehicle>> state) {
    return VehiclesCovenantScreen(
      data: state.data,
      onRefresh: () {
        loadInitialData(context);
      },
      isEditable: idCallback == null,
      onDelete: (int id) {
        bloc.deleteCovenant(id);
      },
      onNext: () {
        onNext!();
      },
      onPrevious: () {
        onPrevious!();
      },
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  int getVehicleId(BuildContext context) {
    int? id = (getArguments(context) ?? idCallback!() ?? 0) as int?;
    return id ?? 0;
  }

  addBackButton(BuildContext context) {
    return AppOutlineButtonIcon(
      icon: AppIcons.add,
      iconColor: kPrimary,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      text: strings.add_covenant,
      textStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      onClick: () {
        AddCovenantVehicleBuilder.show(context,
            vehicleId: getVehicleId(context),
            initialData: null,
            onRefresh: () {
          loadInitialData(context);
        });
      },
    );
  }


}
