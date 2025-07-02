import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../../shared/components/index.dart';
import '../../../../domain/entities/RequestsUser.dart';

class RequestsUserItem extends BaseStatelessWidget {
  final RequestsUser data;

  RequestsUserItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      padding: EdgeInsets.all(5),
      decoration: Decorations.decorationTabs,
      child: ListRowTextsIcons(
        titles: [
          strings.name,
          strings.project_name,
          strings.working_period,
          strings.type_request,
          strings.status_request,
        ],
        icons: [
          AppIcons.person,
          AppIcons.projectName,
          AppIcons.time3,
          AppIcons.type_req,
          AppIcons.status,
        ],
        values: [
          data.cashifterName ?? "",
          data.projectName ?? "",
          data.shiftName ?? "",
          data.cashifterRequestTypeName ?? "",
          data.cashifterRequestStatusName ?? "",
        ],
      ),
    );
  }
}
