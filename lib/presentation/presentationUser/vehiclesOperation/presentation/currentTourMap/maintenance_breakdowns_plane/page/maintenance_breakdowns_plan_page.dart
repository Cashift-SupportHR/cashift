import 'package:shiftapp/extensions/extensions.dart';
import '../../../../../../adminFeatures/maintenanceAndBreakdowns/domain/entities/maintenance.dart';
import '../../../../../../adminFeatures/maintenanceAndBreakdowns/presentation/view/pages/maintenance_breakdowns_screen.dart';
import '../../../../../../shared/components/index.dart';
import '../bloc/maintenance_breakdowns_plane_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

class MaintenanceBreakdownsPlanPage
    extends
        BaseBlocWidget<
          Initialized<MaintenanceData>,
          MaintenanceBreakdownsPlaneCubit
        > {
  @override
  String? title(BuildContext context) {
    return strings.breakdown_maintenance;
  }
  @override
  void loadInitialData(BuildContext context) {

    bloc.fetchInitialData(getArguments(context));
  }

  @override
  Widget buildWidget(
    BuildContext context,
    Initialized<MaintenanceData> state,
  ) {
    return MaintenanceBreakdownsScreen(
      code: "",
      tapId: 0,
      isPlan: true,
      data: state.data.data??[],
    );
  }
}
