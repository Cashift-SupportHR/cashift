import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../../domain/constants/codes_constants.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../data/models/final_action_follow_up_violation_params.dart';
import '../../../domain/entities/follow_up_violation.dart';
import '../bloc/follow_up_violations_cubit.dart';
import 'action_follow_up_violation_builder.dart';
import 'final_follow_up_violation_bottom_sheet.dart';
import 'follow_up_violations_screen.dart';

class FollowUpViolationsPage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, FollowUpViolationsCubit> {
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

  String code = '';

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {

    code = state.data[0].code ?? '';
      return DynamicTabBarView(
      isSeparate: true,
      tabs: CommonListItem.toDynamicItemsList(state.data),
      padding: EdgeInsets.symmetric(vertical: 10),
      marginTabs: EdgeInsets.symmetric(horizontal: 10),
      onTap: (id) {
        int index = state.data.indexWhere((element) => element.id == id);
        code = state.data[index].code ?? '';
        print(code);
        print("lllll");
        bloc.fetchUsersRequests(state.data[index].id ?? 0);
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
            child: StreamDataStateWidget<List<FollowUpViolation>?>(
              stream: bloc.followUpViolationsStream,
              builder: (context, data) {
                return FollowUpViolationsScreen(
                  code: code,
                  data: data ?? [],
                  onAction: (FollowUpViolation item) {
                    code == CodesConstants.waitingReview
                        ? showActionBottomSheet(item: item)
                        : showFinalActionBottomSheet(item: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  showActionBottomSheet({required FollowUpViolation item}) {
    ActionVehicleReceiveRequestBuilder.show(context, item: item, onRefresh: () {
      bloc.fetchInitialData();
    });
  }

  showFinalActionBottomSheet({required FollowUpViolation item}) {
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().final_action,
      child: FinalActionVehicleReceiveRequestsBottomSheet(
        onSave: (String procedure) {
          bloc.finalActionFollowUpViolation(
            FinalActionFollowUpViolationParams(
              contractViolationId: item.violationId,
              actionDescription: procedure,
            ),
          );
        },
      ),
    );
  }
}
