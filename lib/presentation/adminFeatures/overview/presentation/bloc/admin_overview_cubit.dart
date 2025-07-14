import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/datasources/remote/api_exception.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/adminFeatures/overview/presentation/bloc/admin_overview_state.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/repositories/today_opportunity_repository.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/domain/entities/required_tasks/in_app_required_task.dart';
import '../../../../../common/domain/usecases/tasks_notifications_usecase.dart';
import '../../../shared/data/models/pagination_opportunity_params.dart';
import '../../../shared/domain/entities/opportunities/OpportunityTabs.dart';
import '../../domain/entities/tab_with_opportunities.dart';

@injectable
class AdminOverviewCubit extends BaseCubit {
  final UserRepository _userRepository;
  final TodayOpportunityRepository _todayOpportunityRepository;
  final RequiredTasksUseCase _requiredTasksUseCase;

  AdminOverviewCubit(this._userRepository, this._todayOpportunityRepository,
      this._requiredTasksUseCase);

  StreamState<List<TabWithOpportunities>> tabsWithOpportunitiesStream =
      StreamStateInitial();
  StreamState<List<InAppRequiredTask>> inAppNotificationStream =
      StreamStateInitial();

  loadInitial() async {
    try {
      emit(LoadingState());
      await fetchTabWithOpportunities();
      try {
        final requiredTasksData = await _requiredTasksUseCase.call();
        inAppNotificationStream.setData(requiredTasksData);
      } catch (e) {}
      emit(AdminOverviewState(
          tabsWithOpportunitiesStream: tabsWithOpportunitiesStream,
          inAppNotificationStream: inAppNotificationStream));
    } catch (e) {
      checkErrorType(e);
    }
  }

  Future<List<Opportunity>> fetchOpportunitiesByType(int type) async {
    final opportunity =
        await _todayOpportunityRepository.fetchOpportunityByStatus(type);
    return opportunity.payload?.map((e) => Opportunity.fromDto(e)).toList() ??
        [];
  }

  //,
  List<NavItem>? navItem;
  Future<List<Opportunity>> fetchOpportunityByTypeWithPage(int type) async {
    try {
      final opportunity =
          await _todayOpportunityRepository.fetchOpportunityByTypeWithPage(
        PaginationOpportunityParams(
            type: type, page: 0, pageSize: 10, projectId: 0, jobId: 0),
      );
      navItem = opportunity.payload?.navItem
              ?.map((e) => NavItem.fromDto(e))
              .toList() ??
          [];
      return opportunity.payload?.data
              ?.map((e) => Opportunity.fromDto(e))
              .toList() ??
          [];
    } on Exception catch (e) {
      return [];
    }
  }

  checkErrorType(e) {
    if (e is DioError) {
      print(
          'checkErrorType is time error ${e.type == DioExceptionType.connectionTimeout} ');
      if (e.error is SocketException ||
          e.error is WebSocketException ||
          e.error is HandshakeException ||
          e.type == DioExceptionType.connectionTimeout ||
          e.error is HttpException ||
          (e.error is! ApiException)) {
        throw e;
      }
    }
    print('checkErrorType is DIO ${e is DioError}');
  }

  toggleToUserView() {
    _userRepository.setEnableAdmin(false);
    emit(ToggledUserState());
  }

  fetchTabWithOpportunities() async {
    List<TabWithOpportunities> tabsOpportunities = [];
    try {
      final tabsDto = await _todayOpportunityRepository.fetchOpportunityTabs();
      List<OpportunityTabs> tabs =
          tabsDto.map((e) => OpportunityTabs.fromDto(e)).toList();
      for (int i = 0; i < tabs.length; i++) {
        tabsOpportunities.add(
          TabWithOpportunities(
            tab: tabs[i],
            opportunities:
                await fetchOpportunityByTypeWithPage(tabs[i].id ?? 0),
            navItem: navItem ?? [],
          ),
        );
      }
      tabsWithOpportunitiesStream.setData(tabsOpportunities);
    } on Exception catch (e) {
      print('fetchTabWithOpportunities error ${e.toString()}');
      tabsWithOpportunitiesStream.setError(e);
    }
  }
}
