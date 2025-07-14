import 'package:shiftapp/common/domain/constants/codes_constants.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/final_action_vehicle_receive_request_params.dart';
import '../../../domain/entities/vehicle_receive_request.dart';
import '../bloc/vehicle_receive_requests_cubit.dart';
import 'action_vehicle_receive_request_builder.dart';
import 'final_action_vehicle_receive_request_bottom_sheet.dart';
import 'vehicle_receive_requests_screen.dart';

class VehicleReceiveRequestsPage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, VehicleReceiveRequestsCubit> {
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.vehicle_receive_review;
  }

  TextEditingController controller = TextEditingController();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  String code = CodesConstants.waitingReview;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {
    return DynamicTabBarView(
      isSeparate: true,
      tabs: CommonListItem.toDynamicItemsList(state.data),
      padding: EdgeInsets.symmetric(vertical: 10),
      marginTabs: EdgeInsets.symmetric(horizontal: 10),
      onTap: (id) {
        code = state.data.firstWhere((element) => element.id == id).code ?? '';
        bloc.fetchUsersRequests(id);
      },
      pageWidget: Column(
        children: [
          TextFieldSearch(
            margin: EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 5),
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
          Expanded(
            child: StreamDataStateWidget<List<VehicleReceiveRequest>?>(
                stream: bloc.vehicleReceiveRequestsStream,
                builder: (context, data) {
                  return VehicleReceiveRequestsScreen(
                    code: code,
                    data: data ?? [],
                    onAction: (VehicleReceiveRequest item) {
                      showActionBottomSheet(item: item);
                    },
                    onFinalAction: (VehicleReceiveRequest item) {
                      showFinalActionBottomSheet(item: item);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  showActionBottomSheet({required VehicleReceiveRequest item}) {
    ActionVehicleReceiveRequestBuilder.show(context, item: item, onRefresh: () {
      bloc.fetchInitialData();
    });
  }

  showFinalActionBottomSheet({required VehicleReceiveRequest item}) {
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().final_action,
      child: FinalActionVehicleReceiveRequestsBottomSheet(
        onSave: (String procedure) {
          bloc.finalActionVehicleReceiveRequest(
            FinalActionVehicleReceiveRequestParams(
              handOverType: item.codeType,
              vehicleComponentHandOverId: item.vehicleComponentHandoverId,
              actionTakenDescription: procedure,
            ),
          );
        },
      ),
    );
  }

}
