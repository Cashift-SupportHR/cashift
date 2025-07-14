import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/domain/entities/required_tasks/in_app_required_task.dart';
import '../../domain/entities/tab_with_opportunities.dart';

class AdminOverviewState extends CommonStateFBuilder{
  final StreamState<List<TabWithOpportunities>> tabsWithOpportunitiesStream;
  final StreamState<List<InAppRequiredTask>> inAppNotificationStream;
  AdminOverviewState({required this.tabsWithOpportunitiesStream, required this.inAppNotificationStream});
}
