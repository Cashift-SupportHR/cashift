import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/common/components/index.dart';
import '../../../../../../../common/domain/constants/codes_constants.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/text_field/text_field_search.dart';
import '../../../../../shared/models/common_list_item.dart';

import '../../../data/models/final_action_follow_up_maintenance_prams.dart';
import '../../../domain/entities/maintenance.dart';
import '../../action/pages/action_maintenance_page.dart';
import '../../action/pages/final_follow_up_maintenance_bottom_sheet.dart';
import '../cubit/maintenance_breakdowns_cubit.dart';
import 'maintenance_breakdowns_screen.dart';

class MaintenanceBreakdownsPage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, MaintenanceBreakdownsCubit> {
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  @override
  String? title(BuildContext context) {
    return strings.breakdown_maintenance;
  }

  TextEditingController controller = TextEditingController();

  String code = '';
  int tapId=1;
  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.view_maintenance,
            textButton: strings.add_maintenance,
            onTap: () async {
              final isRefresh = await Navigator.pushNamed(
                  context, Routes.addMaintenanceBreakdownsPage);
              if (isRefresh == true) {
                loadInitialData(context);
              }
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<CommonListItem>> state) {
    return DynamicTabBarView(
      isSeparate: true,
      tabs: CommonListItem.toDynamicItemsList(state.data),
      padding: EdgeInsets.symmetric(vertical: 10),
      marginTabs: EdgeInsets.symmetric(horizontal: 10),
      onTap: (id) {
        tapId=id;
        int index = state.data.indexWhere((element) => element.id == id);
        code = state.data[index].code ?? '';
        bloc.fetchMaintenanceBreakdowns(state.data[index].id ?? 0);
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
            child: StreamDataStateWidget<List<Maintenance>?>(
              stream: bloc.maintenanceBreakdownsStream,
              builder: (context, data) {
                return MaintenanceBreakdownsScreen(
                  code: code,
                  isPlan: false,
                  tapId:tapId,
                  data: data ?? [],
                  onAction: (Maintenance item) {
                    code == CodesConstants.waitingReview || code == ""
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

  showActionBottomSheet({required Maintenance item}) {
    ActionMaintenancePage.show(context, item: item, onRefresh: () {
      bloc.fetchInitialData();
    });
  }

  showFinalActionBottomSheet({required Maintenance item}) {
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().final_action,
      isScrollControlled: false,
      isDivider: false,
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getStrings().final_action,
              style: kTextBold.copyWith(color: kPrimary, fontSize: 13)),
          UnderlineWidget(width: 80),
        ],
      ),
      child: FinalActionMaintenanceBottomSheet(
        onSave: (String procedure) {
          bloc.finalActionFollowUpMaintenance(
            FinalActionFollowUpMaintenancePrams(
              faultsMaintenanceId: item.fautMaintenanceId,
              actionDescription: procedure,
            ),
          );
        },
      ),
    );
  }
}
