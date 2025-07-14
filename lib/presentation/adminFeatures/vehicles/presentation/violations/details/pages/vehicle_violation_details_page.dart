import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';
import '../bloc/vehicle_violation_details_cubit.dart';
import 'vehicle_violation_details_screen.dart';

class VehicleViolationDetailsPage
    extends BaseBlocWidget<Initialized<ContractViolation>, VehicleViolationDetailsCubit> {
  @override
  loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchVehicleViolationsById(id);
  }

  @override
  String? title(BuildContext context) {
    return strings.violation_details;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<ContractViolation> state) {
    return VehicleViolationDetailsScreen(
      data: state.data,
    );
  }
}
