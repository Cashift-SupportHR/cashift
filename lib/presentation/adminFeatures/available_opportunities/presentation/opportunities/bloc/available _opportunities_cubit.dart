import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info_params.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/repositories/today_opportunity_repository.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../../../common/data/repositories/advancedFilter/advanced_filter_repository.dart';
import '../../../../../../common/domain/entities/advancedFilter/offers_filter_data.dart';
import '../../../../shared/data/models/pagination_opportunity_params.dart';
import '../../../../shared/domain/entities/opportunities/OpportunityTabs.dart';
import '../../../../shared/domain/entities/opportunities/PercentageOpportunty.dart';
import '../../../../shared/domain/entities/opportunities/ProjectFiterOpportunity.dart';
@injectable
class AvailableOpportunitiesCubit extends BaseCubit {
  final TodayOpportunityRepository repository;

  final AdvancedFilterRepository advancedFilterRepository;
  AvailableOpportunitiesCubit(this.repository, this.advancedFilterRepository);

  final employeeFreeLanceInfoStream = StreamStateInitial<FreeLanceInfo?>();

  Future<void> fetchEmployeeFreeLanceInfo(String phone) async {
    try {
      final result = await repository.fetchEmployeeFreeLanceInfo(phone);
      employeeFreeLanceInfoStream.setData(result.payload);
    } catch (e) {
      employeeFreeLanceInfoStream.setError(e);
      //emit(ErrorDialogState(e));
    }
  }

  Future<void> assignListFreeLanceOpportunity(List<FreeLanceInfoParams> params) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.assignListFreeLanceOpportunity(params);
      emit(SuccessStateListener(data: result.message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> cancelOpportunityAvailableByDescription(int id, String description) async {
    emit(LoadingStateListener());
    try {
      final result = await repository.cancelOpportunityAvailableByDescription(id, description);
      emit(SuccessStateListener(data: result.message));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  // int _page = 0;
  // List<Opportunity> _opportunities = [];
  // StreamStateInitial<List<Opportunity>?> opportunitiesStream = StreamStateInitial();
  //
  // Future<void> fetchOpportunityByTypeWithPage({bool isRefresh = false, required int type}) async {
  //   OpportunityData? data;
  //   PaginationOpportunityParams? params;
  //   try {
  //     if (isRefresh) {
  //       emit(LoadingState());
  //       _opportunities = [];
  //       _page = 0;
  //       params = PaginationOpportunityParams(type: type, page: _page, pageSize: 10, startDate: null, endDate: null, jobId: 0, projectId: 0);
  //     } else {
  //       emit(DismissDialogState());
  //       _page++;
  //       params = PaginationOpportunityParams(type: type, page: _page, pageSize: 10);
  //     }
  //     final result = await repository.fetchOpportunityByTypeWithPage(params);
  //     data = OpportunityData.fromDto(result.payload ?? OpportunityDataDto());
  //     _opportunities.addAll(data.opportunities);
  //     opportunitiesStream.setData(data.opportunities);
  //     data.opportunities = _opportunities;
  //     emit(Initialized<OpportunityData>(data: data));
  //   } catch (e) {
  //     emit(ErrorState(e));
  //   }
  // }

  Future<void> fetchTodayOpportunityWithoutPagination() async {
    OpportunityData? data;
    emit(LoadingState());
    try {
      final result = await repository.fetchTodayOpportunity();
      final list = result.payload?.map((e) => Opportunity.fromDto(e)).toList() ?? [];

      data = OpportunityData(opportunities: list, totalData: list.length,navItem:[] );

      emit(Initialized<OpportunityData>(data: data));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  int _page = -1;
  List<Opportunity> opportunityes = [];
  List<Opportunity> allOpportunity = [];
  PaginationOpportunityParams params = PaginationOpportunityParams(page: 1, type: 1, projectId: 0, jobId: 0, endDate: null, startDate: null, pageSize: 10);

  StreamStateInitial<List<Opportunity>?> opportunityStream = StreamStateInitial();

  Future<void> fetchOpportunityTab({
    String? startDate,
    String? endDate,
    int? jobId,
    int? projectId,
  }) async {
    executeBuilder(() => repository.fetchOpportunityTabs(), onSuccess: (value) async {
      final tabs = value.map((e) => OpportunityTabs.fromDto(e)).toList();
      final dataJobId = await fetchJobFilter();
      final projects = await fetchProjectsFilter();
      await fetchPercentageOpportunty(tabIndex:  tabs.first.id ?? 0);
      await fetchOpportunityDataPagination(
          isRefresh: true, params: PaginationOpportunityParams(page: 0, type: tabs.first.id ?? 0, projectId: 0, jobId: 0, endDate: null, startDate: null, pageSize: 10));
      emit(InitializedOpportunityTabsData(tabs: tabs, job: dataJobId, projects: projects));
    });
  }

  Future<OffersFilterData> fetchJobFilter() async {
    final result = await advancedFilterRepository.fetchJobsCompanyByOpp();
    final data = OffersFilterData.fromDto(result);
    return data;
  }

  Future<List<ProjectFiterOpportunity>> fetchProjectsFilter() async {
    final result = await repository.fetchProjects();
    final data = result.map((e) => ProjectFiterOpportunity.fromDto(e)).toList();
    return data;
  }

  Future<void> fetchOpportunityDataPagination({
    bool isRefresh = false,
    required PaginationOpportunityParams params,
  }) async {
    opportunityes = [];
    try {
      if (isRefresh) {
        opportunityStream.setData(null);
        _page = 0;
        allOpportunity = [];
        params.page = _page;
      } else {
        _page++;
        params.page = _page;
      }

      opportunityes = await fetchOpportunityData(params);
      allOpportunity.addAll(opportunityes);
      opportunityStream.setData(allOpportunity);
    } on Exception catch (e) {
      opportunityStream.setError(e);
    }
  }
 List<NavItem>? navItem;

  Future<List<Opportunity>> fetchOpportunityData(PaginationOpportunityParams params) async {
    final result = await repository.fetchOpportunityByTypeWithPage(params);
    print(result);
    final data = OpportunityData.fromDto(result.payload!);
    navItem=data.navItem;
    return data.opportunities;
  }

  StreamStateInitial<List<PercentageOpportunty>?> percentageOpportuntyStream = StreamStateInitial();
  Future<void> fetchPercentageOpportunty({
    required int tabIndex,
  }) async {
    try {
      final result = await repository.fetchPercentageOpportunty(type: tabIndex);

      final data = result.map((e) => PercentageOpportunty.fromDto(e)).toList();

      percentageOpportuntyStream.setData(data);
    } catch (e) {
      percentageOpportuntyStream.setError(e);
    }
  }

// void searchByText(String value) {
//   emit(LoadingState());
//   final projectsSearched = _opportunities
//       .where((element) =>
//           element.companyName!.contains(value) || element.jobName!.contains(value) || element.workingStartDate!.contains(value) || element.workingEndDate!.contains(value))
//       .toList();
//   emit(Initialized<List<OpportunityV2>>(data: projectsSearched));
// }
}
