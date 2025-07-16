import 'package:rxdart/subjects.dart';
import 'package:equatable/equatable.dart';
import 'package:shiftapp/core/resources/data_state.dart';
import 'package:shiftapp/domain/entities/shared/AppVersionApdate.dart';
import 'package:shiftapp/domain/entities/account/index.dart';
import 'package:shiftapp/domain/entities/resume/city_item.dart';
import 'package:shiftapp/domain/entities/resume/job_item.dart';
import 'package:shiftapp/domain/entities/resume/level_item.dart';
import 'package:shiftapp/domain/entities/resume/resume.dart';
import 'package:shiftapp/domain/entities/resume/education_info.dart';
import 'package:shiftapp/domain/entities/resume/personal_info.dart';
import 'package:shiftapp/domain/entities/resume/skill_info.dart';
import 'package:shiftapp/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/domain/entities/account/user.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/data/models/index.dart';
import 'package:shiftapp/presentation/presentationUser/common/stream_data_state.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';

import '../../../data/models/account/feature_app_dto.dart';
import '../../../data/models/advancedFilter/search_opportunities_available_params.dart';
import '../../../data/models/overview/time_auto_attendance_dto.dart';
import '../../../data/models/salary-definition-request/type_of_commerce.dart';
import '../../../data/models/service/service_model.dart';
import '../../../data/models/user_overview/disclosure_required_task_dto.dart';
import '../../../domain/entities/advancedFilter/offers_filter_data.dart';
import '../../../domain/entities/bail_requests/bail_request.dart';
import '../../../domain/entities/bail_requests/bail_term_and_condition.dart';
import '../../../domain/entities/job_offers/check_working_document.dart';
import '../../../domain/entities/required_tasks/confirm_attendance.dart';
import '../../../domain/entities/required_tasks/in_app_required_task.dart';
import '../../../domain/entities/salary-definition-request/reason_salary_definition_request.dart';
import '../../../domain/entities/workerWorkPlaces/device_by_focus_point.dart';
import '../../../domain/entities/workerWorkPlaces/device_setting_focus_point.dart';
import '../../../domain/entities/workerWorkPlaces/focus_point_info.dart';
import '../../../domain/entities/workerWorkPlaces/worker_work_place.dart';
import '../../adminFeatures/addOpportunity/data/models/arrival_departure_type_dto.dart';
import '../../adminFeatures/addOpportunity/data/models/employee_opportunity_type_dto.dart';
import '../../adminFeatures/addOpportunity/data/models/schedule_price_opportunity.dart';
import '../../adminFeatures/addOpportunity/domain/entities/arrival_departure_type.dart';
import '../../adminFeatures/addOpportunity/domain/entities/calc_opportunity.dart';
import '../../adminFeatures/addOpportunity/domain/entities/contract_conditions.dart';
import '../../adminFeatures/addOpportunity/domain/entities/employee_opportunity_type.dart';
import '../../adminFeatures/addOpportunity/domain/entities/shift.dart';
import '../../adminFeatures/addOpportunity/domain/entities/type_approve_model.dart';
import '../../adminFeatures/admin_wallet/domain/entities/admin_wallet.dart';
import '../../adminFeatures/admin_wallet/domain/entities/filterAndTaps.dart';
import '../../adminFeatures/banEmployees/domain/entities/ban_employee.dart';
import '../../adminFeatures/banEmployees/domain/entities/ban_employee_details.dart';
import '../../adminFeatures/banEmployees/domain/entities/job_evaluations_employee.dart';
import '../../adminFeatures/banEmployees/domain/entities/ban_employee_tab.dart';
import '../../adminFeatures/employees/domain/entities/DayRelax.dart';
import '../../adminFeatures/employees/domain/entities/project_employee.dart';
import '../../adminFeatures/employmentManagement/domain/entities/employee_data.dart';
import '../../adminFeatures/employmentManagement/domain/entities/employee_order_status.dart';
import '../../adminFeatures/employmentManagement/domain/entities/employment_management_tab.dart';
import '../../adminFeatures/employmentManagement/domain/entities/order_status.dart';
import '../../adminFeatures/employmentManagement/domain/entities/popup_employment_management.dart';
import '../../adminFeatures/focusPoints/data/models/add_focus_attendance_time_params.dart';
import '../../adminFeatures/focusPoints/domain/entities/coverage_break_focus_point.dart';
import '../../adminFeatures/focusPoints/domain/entities/employee_type.dart';
import '../../adminFeatures/focusPoints/domain/entities/focus_point_by_id.dart';
import '../../adminFeatures/focusPoints/domain/entities/focus_point_project.dart';
import '../../adminFeatures/focusPoints/domain/entities/focus_point_transaction_type.dart';
import '../../adminFeatures/focusPoints/domain/entities/focus_point_type.dart';
import '../../adminFeatures/focusPoints/domain/entities/point_attendance_type.dart';
import '../../adminFeatures/focusPoints/domain/entities/point_priority_number.dart';
import '../../adminFeatures/focusPoints/domain/entities/shifts_by_project.dart';
import '../../adminFeatures/jobUniform/domain/entities/job_uniform_type.dart';
import '../../adminFeatures/projectsManagement/data/models/add_project_params.dart';
import '../../adminFeatures/projectsManagement/data/models/add_working_period_params.dart';
import '../../adminFeatures/projectsManagement/domain/entities/city.dart';
import '../../adminFeatures/projectsManagement/domain/entities/job.dart';
import '../../adminFeatures/projectsManagement/domain/entities/period_order.dart';
import '../../adminFeatures/projectsManagement/domain/entities/period_pricing_label.dart';
import '../../adminFeatures/projectsManagement/domain/entities/pricing_details.dart';
import '../../adminFeatures/projectsManagement/domain/entities/project_labels.dart';
import '../../adminFeatures/projectsManagement/domain/entities/working_period.dart';
import '../../adminFeatures/projectsManagement/domain/entities/working_period_labels.dart';
import '../../adminFeatures/projectsManagement/domain/entities/shift_time.dart';
import '../../adminFeatures/projectsManagement/domain/entities/time.dart';
import '../../adminFeatures/punishments/data/models/add_edit_punishment_params.dart';
import '../../adminFeatures/punishments/domain/entities/punishment_name.dart';
import '../../adminFeatures/punishments/domain/entities/punishment_type.dart';
import '../../adminFeatures/shared/domain/entities/opportunities/OpportunityTabs.dart';
import '../../adminFeatures/shared/domain/entities/opportunities/ProjectFiterOpportunity.dart';
import '../../adminFeatures/usersManagement/domain/entities/brand.dart';
import '../../adminFeatures/usersManagement/domain/entities/company.dart';
import '../../adminFeatures/usersManagement/domain/entities/info_user_manager.dart';
import '../../adminFeatures/vehicles/domain/entities/vehicle_image_face.dart';
import '../../shared/loans/domain/entities/loan_data.dart';
import '../../shared/loans/domain/entities/tabs_and_total_loans.dart';
import '../geofence/geo_task.dart';
import '../../adminFeatures/usersManagement/domain/entities/user_area.dart';
import '../vehiclesOperation/domain/entities/CreateVehicleHandover.dart';
 import '../vehiclesOperation/domain/entities/receive_vehicle_details.dart';
import '../vehiclesOperation/domain/entities/vehicleComponents.dart';

abstract class CommonState extends DataState {
  @override
  List<Object?> get props => [];
}

/// UnInitialized
class UnInitState extends CommonStateFBuilder {}

class LoadingState extends CommonStateFBuilder {}

class NewUpdateAvailable extends CommonStateFListener {
  final AppVersionAppUpdate checkOfAppUpdate;

  NewUpdateAvailable(this.checkOfAppUpdate);
}

/// Initialized
class InitializeResumeState extends CommonState {
  final List<LevelItem> levels;

  final List<CityItem> cities;

  final Resume resume;

  final List<LevelItem> qualifications;

  final List<LevelItem> situations;

  final List<String> qualificationNames;

  final List<JobItem> jobs;

  final StreamState<EducationInfo> educationInfoStream;

  final StreamState<PersonalInfo> personalInfoStream;

  final StreamState<SkillsInfo> skillInfoStream;

  InitializeResumeState({
    required this.levels,
    required this.cities,
    required this.resume,
    required this.qualifications,
    required this.situations,
    required this.qualificationNames,
    required this.jobs,
    required this.educationInfoStream,
    required this.personalInfoStream,
    required this.skillInfoStream,
  });
}

abstract class StreamState<T> {
  dynamic error;

  bool get hasError;

  bool get hasData;

  T? data;

  final _streamController = BehaviorSubject<T>();

  Stream<T> get stream => _streamController.stream;

  setError(dynamic initError) {
    error = initError;
    _streamController.addError(initError);
    data = null;
  }

  setData(T initData) {
    data = initData;
    _streamController.add(initData);
    error = null;
  }

  setFutureData(Future<T> Function() invoke) async {
    try {
      T response = await invoke();
      setData(response);
    } catch (e) {
      setError(e);
    }
  }

  close() {
    _streamController.close();
  }
}

class StreamStateInitial<T> extends StreamState<T> {
  @override
  bool get hasData => data != null;

  @override
  bool get hasError => error != null;
}

class SuccessState extends CommonState {
  final dynamic successResponse;

  SuccessState(this.successResponse);
}

//////////////

abstract class CommonStateFListener extends CommonState {}

abstract class CommonStateFBuilder extends CommonState {}

// update home screen if user logout successfully - by Harbey
class UpdateHomeState extends CommonStateFListener {
  final dynamic msg;

  UpdateHomeState(this.msg);
}

/// Initialized
///
class CheckWorkingDocumentState<T> extends CommonStateFBuilder {
  CheckWorkingDocument checkWorkingDocument;

  CheckWorkingDocumentState({
    required this.checkWorkingDocument,
  });
}

class InitializedAddPunishment<T> extends CommonStateFBuilder {
  List<PunishmentName> punishmentsNames;
  List<PunishmentType> punishmentsTypes;
  AddEditPunishmentParams? addEditPunishmentParams;

  InitializedAddPunishment({
    required this.punishmentsNames,
    required this.punishmentsTypes,
    required this.addEditPunishmentParams,
  });
}

class Initialized<T> extends CommonStateFBuilder {
  T data;

  Initialized({
    required this.data,
  });
}

class InitializedEmploymentTabsData<T> extends CommonStateFBuilder {
  List<EmployeeData> employees;
  List<EmploymentManagementTab> tabs;
  PopupEmploymentManagement popups;

  InitializedEmploymentTabsData({
    required this.employees,
    required this.tabs,
    required this.popups,
  });
}



class InitializedServiceData<T> extends CommonStateFBuilder {
  bool isAdmin;
  String token;
  List<ServiceModel> service;

  InitializedServiceData({
    required this.service,
    required this.token,
    required this.isAdmin,
  });
}

class InitializedToggleData<T> extends CommonStateFBuilder {
  String image;
  bool isAdmin;
  bool adminEnable;
  bool isAllowFaceRecognition;
  final User user;
  FaceRecognitionConfig? faceRecognitionConfig;

  InitializedToggleData({
    required this.image,
    required this.isAdmin,
    required this.user,
    required this.adminEnable,
    required this.isAllowFaceRecognition,
    this.faceRecognitionConfig,
  });
}

class InitializedFaceRecognitionData<T> extends CommonStateFBuilder {
  String image;

  final User user;
  FaceRecognitionConfig? faceRecognitionConfig;

  InitializedFaceRecognitionData({
    required this.image,
    required this.user,
    this.faceRecognitionConfig,
  });
}

class InitializeActionUserRequests extends CommonStateFBuilder {
  List<CommonListItem> employees;
  List<CommonListItem> statuesList;

  InitializeActionUserRequests({
    required this.employees,
    required this.statuesList,
  });
}

class InitializedReceivedVehiclesImages<T> extends CommonStateFBuilder {
  List<VehicleImageFace> vehicleImageFaces;
  CreateVehicleHandover createVehicleHandover;

  InitializedReceivedVehiclesImages({
    required this.vehicleImageFaces,
    required this.createVehicleHandover,
  });
}

class InitializedVehiclesComponents<T> extends CommonStateFBuilder {
  List<VehicleComponents> vehicleComponents;
  ReceiveVehicleDetails? receiveVehicleDetails;

  InitializedVehiclesComponents({
    required this.vehicleComponents,
    this.receiveVehicleDetails,
  });
}

class InitializedLoansTabsData<T> extends CommonStateFBuilder {
  List<LoanData> loanData;
  TabsAndTotalLoans dataTab;

  InitializedLoansTabsData({
    required this.loanData,
    required this.dataTab,
  });
}

class InitializedAddEmployee<T> extends CommonStateFBuilder {
  List<ProjectEmployee> project;
  List<DayRelax> days;
  List<Company> companies;
  InitializedAddEmployee({
    required this.project,
    required this.days,
    required this.companies,
  });
}

class InitializedEmployeesBanTabsData<T> extends CommonStateFBuilder {
  List<BanEmployeeTab> tabs;
  List<BanEmployee> employees;

  InitializedEmployeesBanTabsData({
    required this.tabs,
    required this.employees,
  });
}

class InitializedAdminWallet<T> extends CommonStateFBuilder {
  FilterAndTaps tabsAndFilter;
  AdminWallet dataWallet;
  InitializedAdminWallet({
    required this.tabsAndFilter,
    required this.dataWallet,
  });
}

class InitializedOpportunityTabsData<T> extends CommonStateFBuilder {
  List<OpportunityTabs> tabs;
  OffersFilterData job;
  List<ProjectFiterOpportunity> projects;
  InitializedOpportunityTabsData({
    required this.tabs,
    required this.job,
    required this.projects,
  });
}

class InitializedCvEmployee<T> extends CommonStateFBuilder {
  BanEmployeeDetails employeeCVDetails;
  List<JobEvaluationsEmployee> jobEvaluationsEmployee;

  InitializedCvEmployee({
    required this.employeeCVDetails,
    required this.jobEvaluationsEmployee,
  });
}

class InitializedSaveEmployeeData<T> extends CommonStateFBuilder {
  List<OrderStatus> orderStatus;
  List<OrderStatus> orderStatusIfAccept;
  List<CommonListItem> projects;
  List<WorkingPeriod> workingPeriods;
  EmployeeOrderStatus employeeOrderStatus;

  InitializedSaveEmployeeData({
    required this.orderStatus,
    required this.orderStatusIfAccept,
    required this.projects,
    required this.workingPeriods,
    required this.employeeOrderStatus,
  });
}

class InitializedFocusPointData<T> extends CommonStateFBuilder {
  FocusPointById focusPointById;
  List<CommonListItem> projects;
  List<FocusPointType> focusPointsType;
  List<EmployeeType> employeesTypes;
  List<PointPriorityNumber> priorityLevel;
  List<FocusPointTransactionType> focusPointTransactionTypes;
  List<CoverageBreakFocusPoint> coverageBreak;

  InitializedFocusPointData({
    required this.focusPointById,
    required this.projects,
    required this.focusPointsType,
    required this.employeesTypes,
    required this.priorityLevel,
    required this.focusPointTransactionTypes,
    required this.coverageBreak,
  });
}

class InitializedAddNewUser<T> extends CommonStateFBuilder {
  InfoUserManager infoUserManager;
  List<CommonListItem> projects;
  List<Brand> brands;
  List<Company> companies;
  List<UserArea> areas;

  InitializedAddNewUser({
    required this.infoUserManager,
    required this.projects,
    required this.brands,
    required this.companies,
    required this.areas,
  });
}

class InitializedGasStations<T> extends CommonStateFBuilder {
  List<Company> companies;

  InitializedGasStations({
    required this.companies,

  });
}

class InitializedAddNewProject<T> extends CommonStateFBuilder {
  AddProjectParams projectInfoManager;
  ProjectLabels labels;
  List<City> cities;
  List<Brand> brands;
  List<Company> company;
  List<ArrivalDepartureType> arrivalDepartureTypes;

  InitializedAddNewProject({
    required this.projectInfoManager,
    required this.labels,
    required this.cities,
    required this.brands,
    required this.company,
    required this.arrivalDepartureTypes,
  });
}

class InitializedAddWorkingPeriod<T> extends CommonStateFBuilder {
  AddWorkingPeriodParams workingPeriodInfo;
  WorkingPeriodLabels labels;
  List<PeriodOrder> periodOrder;
  List<Job> occupations;

  InitializedAddWorkingPeriod({
    required this.workingPeriodInfo,
    required this.labels,
    required this.periodOrder,
    required this.occupations,
  });
}

class InitializedAddPeriodPricing<T> extends CommonStateFBuilder {
  List<ShiftTime> shiftTime;
  List<TimePrice> timePrice;
  List<Job> job;
  PeriodPricingLabel periodPricingLabel;
  PricingDetails pricingDetails;
  InitializedAddPeriodPricing({
    required this.shiftTime,
    required this.job,
    required this.timePrice,
    required this.pricingDetails,
    required this.periodPricingLabel,
  });
}

class InitializedFocusPointTimes<T> extends CommonStateFBuilder {
  List<AddFocusAttendanceTimeParams> focusPointTimes;
  List<ShiftsByProject> shifts;
  List<PointAttendanceType> focusPointsAttendanceTypes;
  bool isEdit;

  InitializedFocusPointTimes({
    required this.focusPointTimes,
    required this.shifts,
    required this.focusPointsAttendanceTypes,
    required this.isEdit,
  });
}

/// Initialized
class InitializedBailRequests<T> extends CommonStateFBuilder {
  List<BailRequest> requests;
  List<BailTermAndCondition> termsAndConditions;

  InitializedBailRequests({
    required this.requests,
    required this.termsAndConditions,
  });
}

class InitializedDeliveryAndReceipt<T> extends CommonStateFBuilder {
  DeviceByFocusPoint deviceByFocusPoint;
  DeviceSettingFocusPoint deviceSettingFocusPoint;

  InitializedDeliveryAndReceipt({
    required this.deviceByFocusPoint,
    required this.deviceSettingFocusPoint,
  });
}

/// Initialized
class InitializedFocusPoints<T> extends CommonStateFBuilder {
  FocusPointInfo focusPointInfo;
  List<WorkerWorkPlace> workerWorkPlace;

  InitializedFocusPoints({
    required this.focusPointInfo,
    required this.workerWorkPlace,
  });
}

class InitializedAddSalaryDefinitionRequest<T> extends CommonStateFBuilder {
  List<TypeOfCommerce> typeOfCommerce;
  List<ReasonSalaryDefinitionRequest> reasons;

  InitializedAddSalaryDefinitionRequest({
    required this.typeOfCommerce,
    required this.reasons,
  });
}

class InitializedAdmin extends Initialized {
  InitializedAdmin() : super(data: '');
}

class InitializedUser extends Initialized {
  InitializedUser() : super(data: '');
}

class ToggledUserState extends CommonStateFListener {}

class InitializedOpportunity<T> extends CommonStateFBuilder {
  List<Company> companies;
  StreamStateInitial<List<CommonListItem>?> projectsStream;
  final StreamStateInitial<List<Job>?> jobsStream;
  StreamDataStateInitial<ContractConditions?> contractConditionsStream;
  final StreamStateInitial<Shift?> shiftDataStream;
  CalcOpportunity calcOpportunity;
  TypeApproveModel typeApprove;
  final StreamStateInitial<SchedulePriceOpportunity?> priceOpportunityStream;
  List<EmployeeOpportunityType> employeesTypes;
  List<ArrivalDepartureType> arrivalDepartureTypes;

  InitializedOpportunity({
    required this.companies,
    required this.projectsStream,
    required this.jobsStream,
    required this.contractConditionsStream,
    required this.shiftDataStream,
    required this.calcOpportunity,
    required this.typeApprove,
    required this.priceOpportunityStream,
    required this.employeesTypes,
    required this.arrivalDepartureTypes,
  });
}

class InitializedAdvancedFilter extends CommonStateFBuilder {
  OffersFilterData jobsCompanyByOp;
  List<CityItem> cities;

  SearchOpportunitiesAvailableParams advancedFilterData;

  InitializedAdvancedFilter({
    required this.jobsCompanyByOp,
    required this.cities,
    required this.advancedFilterData,
  });
}

class InitializedAbsenceNotice<T> extends CommonStateFBuilder {
  T dataUser;
  T listAbsenceDate;

  InitializedAbsenceNotice({
    required this.dataUser,
    required this.listAbsenceDate,
  });
}

class InitializedStateStream<T> extends CommonStateFBuilder {
  final StreamState<T> data;

  InitializedStateStream({required this.data});
}

class ProfileInitialize extends CommonStateFBuilder {
  final User user;

  final AppFeature accountServices;

  ProfileInitialize({required this.user, required this.accountServices});
}

class ErrorState extends CommonStateFBuilder {
  final dynamic error;

  ErrorState(this.error);
}

class OfflineState extends CommonStateFBuilder {
  final dynamic error;

  OfflineState(this.error);
}

class FailureStateListener extends CommonStateFListener {
  final dynamic error;

  FailureStateListener(this.error);
}

class EmptyFaceImageListener extends CommonStateFListener {

  EmptyFaceImageListener();
}

class BiometricNotEnabledState extends CommonStateFListener {}

class SuccessStateListener<T> extends CommonStateFListener {
  T? data;

  SuccessStateListener({
    this.data,
  });
}

class VerificationCodeSentListener extends CommonStateFListener {
  String? phoneNumber;

  VerificationCodeSentListener({
    this.phoneNumber,
  });
}

class StartSoonShiftListener extends CommonStateFListener {
  final AppliedOffer appliedOffer;

  StartSoonShiftListener({required this.appliedOffer});
}

class ShareDialogState extends CommonStateFListener {
  String url;

  ShareDialogState({
    required this.url,
  });
}

class LoadingStateListener extends CommonStateFListener {}

// class LoadingDialogState extends CommonStateFListener {}
class CloseDialogState extends CommonStateFListener {}

class DismissDialogState extends CommonStateFListener {}

class RequiredRegisterAttendanceState extends CommonStateFListener {}

class RequiredStartShiftState extends CommonStateFListener {}

class RequiredConfirmShiftState extends CommonStateFListener {}

class RequiredAutoAttendanceState extends CommonStateFListener {
  GeoTask geo;

  // this is for first time to show dialog to user to start auto attendance
  bool isFirst;

  RequiredAutoAttendanceState(this.geo, this.isFirst);
}

class EmployeeAttendanceTimeState extends CommonStateFListener {
  TimeAutoAttendanceDto geoTimeTask;

  // this is for first time to show dialog to user to start auto attendance
  bool isFirst;

  EmployeeAttendanceTimeState(this.geoTimeTask, this.isFirst);
}

class DisclosureRequiredTaskState extends CommonStateFListener {
  final DisclosureRequiredTaskDto disclosureTaskDto;

  DisclosureRequiredTaskState({required this.disclosureTaskDto});
}

class DynamicFormState extends CommonStateFListener {
  final InAppRequiredTask inAppRequiredTask;

  DynamicFormState({required this.inAppRequiredTask});
}

class ConfirmAttendanceState extends CommonStateFListener {
  final ConfirmAttendance confirmAttendance;

  ConfirmAttendanceState({required this.confirmAttendance});
}
