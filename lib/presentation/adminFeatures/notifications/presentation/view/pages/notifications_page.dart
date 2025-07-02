import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/notifications/data/models/action_notifications_prams.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../../../domain/constants/codes_constants.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../shared/components/text_field/text_field_search.dart';
import '../../../../../shared/models/common_list_item.dart';

import '../../../domain/entities/vehicle_notifications.dart';
import '../../action/pages/action_notification_screen.dart';
import '../../action/pages/action_notifications_page.dart';
import '../cubit/vehicle_notifications_cubit.dart';
import 'notification_screen.dart';

class VehicleNotificationPage extends BaseBlocWidget<
    Initialized<List<CommonListItem>>, VehicleNotificationsCubit> {
  @override
  loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
    controller.clear();
  }

  TextEditingController controller = TextEditingController();

  String code = '';

  @override
  String? title(BuildContext context) {

    return strings.notifications;
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
        int index = state.data.indexWhere((element) => element.id == id);
        code = state.data[index].code ?? '';
        bloc.fetchVehicleNotification(state.data[index].id ?? 0);
      },
      pageWidget: Column(
        children: [
          TextFieldSearch(
            margin: EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 5),
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
          StreamDataStateWidget<List<VehicleNotification>?>(
            stream: bloc.vehicleNotificationsStream,
            builder: (context, data) {
              return VehicleNotificationScreen(
                code: code,
                data: data ?? [],
                onAction: (VehicleNotification item) {
                  showActionBottomSheet(item: item);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  showActionBottomSheet({required VehicleNotification item}) {
    showAppModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDivider: false,
      titleWidget:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( code == CodesConstants.waitingApprove
              ? context.getStrings().final_action
              : context.getStrings().action_taken, style: kTextBold.copyWith(color: kPrimary,fontSize: 13)),
          UnderlineWidget(width: 80),
        ],
      ),
      // title: code == CodesConstants.waitingApprove
      //     ? context.getStrings().final_action
      //     : context.getStrings().action_taken,
      child: ActionVehicleNotificationPage(
        id: item.id ?? 0,
        onRefrash: () {
          loadInitialData(context);
        },
        code: code,
      ),
    );
  }
}
