import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shiftapp/data/datasources/remote/remote_constants.dart';
import 'package:shiftapp/data/models/api_response.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/data/models/index.dart';
import 'package:shiftapp/presentation/adminFeatures/admin_wallet/data/models/index.dart';
import 'package:shiftapp/presentation/adminFeatures/areapolygones/data/models/vehicle_zone_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/cashiftersLoans/data/models/add_cashifter_loan_params.dart';
import 'package:shiftapp/presentation/adminFeatures/employees/data/models/index.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentManagement/data/models/index.dart';
import 'package:shiftapp/presentation/adminFeatures/trackAttendanceDeparture/data/models/track_attendance_departure_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/insurance_types_dto.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicle_details_dto.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item_dto.dart';

import '../../data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../presentation/adminFeatures/addOpportunity/data/models/opportunity_applicant_dto.dart';
import '../../presentation/adminFeatures/areapolygones/data/models/add_vehicle_zone_params.dart';
import '../../presentation/adminFeatures/areapolygones/data/models/edit_vehicle_zone_lat_lng_params.dart';
import '../../presentation/adminFeatures/areapolygones/data/models/filter_vehicle_zone_params.dart';
import '../../presentation/adminFeatures/attendanceNotificationsReports/data/models/emp_attendance_rports_dto.dart';
import '../../presentation/adminFeatures/attendanceNotificationsReports/data/models/emp_attendance_rports_prams.dart';
import '../../presentation/adminFeatures/banEmployees/data/models/index.dart';
import '../../presentation/adminFeatures/classification/data/models/classification_dto.dart';
import '../../presentation/adminFeatures/employeeMap/data/models/emp_map_dto.dart';
import '../../presentation/adminFeatures/employeeMap/data/models/fetch_emp_map_prams.dart';
import '../../presentation/adminFeatures/employeeMap/domain/entities/EmpMap.dart';
import '../../presentation/adminFeatures/employees/data/models/accept_or_reject_attachment_emp_prams.dart';
import '../../presentation/adminFeatures/employees/data/models/emp_attandance_prams.dart';
import '../../presentation/adminFeatures/employees/data/models/emp_attendance_dto.dart';
import '../../presentation/adminFeatures/employees/data/models/employee_chasfiter_details_dto.dart';
import '../../presentation/adminFeatures/employees/data/models/requirement_attachment_prams.dart';
import '../../presentation/adminFeatures/employmentOfficials/data/models/index.dart';
import '../../presentation/adminFeatures/focusPoints/data/models/index.dart';
import '../../presentation/adminFeatures/gasStations/data/models/add_edit_gas_station_prams.dart';
import '../../presentation/adminFeatures/gasStations/data/models/gas_station_dto.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/action_follow_up_violation_params.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/add_type_violation_params.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/final_action_follow_up_violation_params.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/follow_up_violation_dto.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/index.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/violation_by_project_id_dto.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/violation_employee_dto.dart';
import '../../presentation/adminFeatures/generalViolations/data/models/violation_type_dto.dart';
import '../../presentation/adminFeatures/jobRequirements/data/models/index.dart';
import '../../presentation/adminFeatures/jobUniform/data/models/uniform_dto.dart';
import '../../presentation/adminFeatures/projectsManagement/data/models/employe_point_dto.dart';
import '../../presentation/adminFeatures/projectsManagement/data/models/index.dart';
import '../../presentation/adminFeatures/punishments/data/models/index.dart';
import '../../presentation/adminFeatures/reviewShifts/data/models/complet_opportunity_dto.dart';
import '../../presentation/adminFeatures/reviewShifts/data/models/index.dart';
import '../../presentation/adminFeatures/reviewShifts/data/models/review_shiftsprams.dart';
import '../../presentation/adminFeatures/shared/data/models/index.dart';
import '../../presentation/adminFeatures/terms_and_conditions/data/models/index.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/data/models/request_attendance_departure_details_dto.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/data/models/request_track_attendance_departure_params.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/data/models/track_attendance_departure_image_dto.dart';
import '../../presentation/adminFeatures/usersManagement/data/models/index.dart';
import '../../presentation/adminFeatures/usersManagement/data/models/user_by_phone_dto.dart';
import '../../presentation/adminFeatures/usersRequests/data/models/reject_user_request_params.dart';
import '../../presentation/adminFeatures/usersRequests/data/models/user_request_dto.dart';
import '../../presentation/adminFeatures/usersRequests/data/models/user_request_terms_params.dart';
import '../../presentation/adminFeatures/vehicles/data/models/action_vehicle_receive_request_params.dart';
import '../../presentation/adminFeatures/vehicles/data/models/add_vehicle_violation_params.dart';
import '../../presentation/adminFeatures/vehicles/data/models/covenant_vehicle_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/final_action_vehicle_receive_request_params.dart';
import '../../presentation/adminFeatures/vehicles/data/models/insurances_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_image_face_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_receive_request_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_violation_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicles_dto.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/receive_vehicle_details_dto.dart';
part 'admin_endpoint.g.dart';

@Injectable()
@RestApi()
abstract class AdminEndpoint {
  @factoryMethod
  factory AdminEndpoint(Dio dio) = _AdminEndpoint;

  //  start addOpportunity

  @POST('/v4/OpportunitiesAvailble/AddOpportunitiesAvailble')
  Future<ApiResponse<String>> addOpportunity(
      @Body() AddOpportunityParams params);

  @POST('/v4/OpportunitiesAvailble/EditOpportunitiesAvailble')
  Future<ApiResponse<String>> editOpportunity(
      @Body() AddOpportunityParams params);

  @GET('/v2/CalcOpportunities/GetCalcOpp')
  Future<ApiResponse<CalcOpportunityDto>> fetchCalcOpportunity();

  @GET('/v1/Shift/GetListShift')
  Future<ApiResponse<ShiftDto>> fetchListShift(
      @Queries() FilterShiftParams params);

  @GET('/v1/ContractConditions/GetAllContractsConditionsByProjectIdAndJobId')
  Future<ApiResponse<ContractConditionsDto>> fetchContractsConditions(
      @Queries() ContractConditionParams params);

  @POST('/v1/SchedulePrice/GetSchedulePriceDetailForOpp')
  Future<ApiResponse<SchedulePriceOpportunity>>
      fetchSchedulePriceDetailForOpportunity(
          @Body() SchedulePriceOpportunityParams params);

  @GET('/v1/OpportunitiesAvailble/GetTypeApprove')
  Future<ApiResponse<TypeApproveModelDto>> fetchTypeApprove();

  @GET(
      '/v1/CompleteFreeLanceInfoByCompanyAprovelLevel/GetAllCompleteFreeLanceInfoByCompanyAprovelLevelForDrop')
  Future<ApiResponse<List<EmployeeOpportunityTypeDto>>>
      fetchEmployeesTypesOpportunity();

  @GET('/v2/CompleteFreeLanceInfoByCompany/GetAllFreeLanceByAprovelLevel')
  Future<ApiResponse<List<EmployeeOpportunityDto>>> fetchEmployeesOpportunities(
      @Queries() EmployeesOpportunityParams params);

  @GET('/v1/AttendanceType/GetAllAttendanceTypeForDrop')
  Future<ApiResponse<List<ArrivalDepartureTypeDto>>>
      fetchTypesArrivalDeparture();

  @GET('/v1/Jobs/GetAllJobByProjectId')
  Future<ApiResponse<List<JobDto>>> fetchJobsByProjectId(
      @Query('projectId') int projectId);

// start admin Wallet
  @GET('/v4/CompanyBalance/GetCompanyBalanceDetails')
  Future<ApiResponse<WalletBalanceDto>> fetchWalletBalance();

  @GET('/v4/CompanyBalance/GetTypeSearch')
  Future<ApiResponse<FilterAndTapDto>> fetchTabAndFilter();

  @POST('/v4/CompanyBalance/SearchCompanyDetails')
  Future<ApiResponse<AdminWalletDto>> fetchAdminWalletData(
      @Body() AdminWalletPrams params);

  // start  Vehicles Zone

  @GET('/v1/VehiclesZone/GetAllVehiclesZone')
  Future<ApiResponse<List<VehicleZoneDto>>> fetchVehiclesZone();

  @POST('/v1/VehiclesZone/AddVehiclesZone')
  Future<ApiResponse> addVehicleZone(@Body() AddVehicleZoneParams params);

  @POST('/v1/VehiclesZone/EditVehiclesZone')
  Future<ApiResponse> editVehicleZone(@Body() AddVehicleZoneParams params);

  @POST('/v1/VehiclesZone/EditVehiclesCoordinates')
  Future<ApiResponse> editVehiclesCoordinates(
      @Body() EditVehicleZoneLatLngParams params);

  @GET('/v1/Vehicles/GetAllVehiclesByProjectId')
  Future<ApiResponse<List<VehiclesDto>>> fetchVehiclesByProjectId(
      @Query('ProjectId') int projectId);

  @POST('/v1/VehiclesZone/DeleteVehiclesZone')
  Future<ApiResponse> deleteVehiclesZone(@Query('Id') int id);

  @GET('/v1/VehiclesZone/GetAllVehiclesZoneByProjectId')
  Future<ApiResponse<List<VehicleZoneDto>>> fetchFilterVehiclesZoneAreas(
      @Queries() FilterVehicleZoneParams params);

// start  Attendance Notifications Reports
  @POST('/v1/AdminReports/GetAllScheduleEmployeeAttendanceReport')
  Future<ApiResponse<EmpAttendanceRportsDto>>
      fetchAttendanceNotificationsReports(
          @Body() EmpAttendanceRportsPrams empAttendanceRportsPrams);

// start ban employees

  @GET('/v1/BlockPerProject/GetBlockFreelanceCounter')
  Future<ApiResponse<List<BanEmployeeTabDto>>> fetchBanEmployeesTabData();

  @POST('/v1/BlockPerProject/GetFreelanceBlockByType')
  Future<ApiResponse<List<BanEmployeeDto>>> fetchBanEmployeesData(
      @Body() BanEmployeeParams params);

  @POST('/v1/BlockPerProject/UpdateBlockFreelance')
  Future<ApiResponse<String>> updateBanEmployeesStatus(
      @Body() BanEmployeeStatusParams params);

  @GET('/v1/FreeLancerInfo/GetFreelanceInfoById')
  Future<ApiResponse<BanEmployeeDetailsDto>> fetchEmployeeCVDetails(
      @Query('Id') int id);

  @GET('/v1/BlockPerProject/GetEvalFreelance')
  Future<ApiResponse<List<JobEvaluationsEmployeeDto>>>
      fetchJobEvaluationsEmployee(@Query('freelanceId') int freelanceId);

//  start  Cashifters Loans
  @POST('/v1/CashiftLoanByFreelanceDetails/AddLoan')
  Future<ApiResponse<bool>> addCashifterLoan(
      @Body() AddCashifterLoanParams params);

  @GET('/v1/CompleteFreeLanceInfoByCompany/GetAllFreeLancerInfoForLoan')
  Future<ApiResponse<List<CommonListItemDto>>> fetchCashifters(
      @Query('companyId') int companyId);

  @GET('/v1/CashiftLoanType/GetAllCashiftLoanTypes')
  Future<ApiResponse<List<CommonListItemDto>>> fetchCashifterLoanTypes();

  @GET('/v1/CashiftLoanType/GetDiscountPercentages')
  Future<ApiResponse<List<CommonListItemDto>>> fetchDiscountPercentages();

  @GET('/v1/CashiftLoanTermsAndConditions/GetAllCashiftLoanTermsAndConditions')
  Future<ApiResponse<List<CommonListItemDto>>>
      fetchCashiftLoanTermsAndConditions();

  //start   Classification
  @GET(
      '/v1/CompleteFreeLanceInfoByCompanyAprovelLevel/GetAllCompleteFreeLanceInfoByCompanyAprovelLevel')
  Future<ApiResponse<List<ClassificationDto>>> fetchClassification(
      @Query('tapType') int tapType);

  @POST(
      'v1/CompleteFreeLanceInfoByCompanyAprovelLevel/DeleteCompleteFreeLanceInfoByCompanyAprovelLevel')
  Future<ApiResponse> deleteClassification(@Query('id') int id);

  @POST(
      'v1/CompleteFreeLanceInfoByCompanyAprovelLevel/AddEditCompleteFreeLanceInfoByCompanyAprovelLevel')
  Future<ApiResponse> addEditClassification(
    @Part(name: 'Id') int? id,
    @Part(name: 'CompanyId') int? companyId,
    @Part(name: 'NameAr') String? nameAr,
    @Part(name: 'NameEn') String? nameEn,
    @Part(name: 'Description') String? description,
  );

  // employees

  @GET('/v1/FreeLancerInfo/GetCashifterByIdNumberOrPhone')
  Future<ApiResponse<List<EmployeeDataDto>>> fetchEmployee(
      @Query('searchString') String? searchString);

  @GET('/v1/Projects/GetProjects')
  Future<ApiResponse<List<ProjectEmployeDto>>> fetchProject();

  @GET('/v2/ScheduleEmployeeWork/GetWeekDays')
  Future<ApiResponse<List<DayRelaxDto>>> fetchDayRelax();

  @GET('/v1/Shift/GetAllShiftsByProjects')
  Future<ApiResponse<List<ShiftEmployeeDto>>> fetchShiftsByProjects(
      @Query('projectId') int? projectId);

  @GET('/v1/PaymentPeriodType/GetAllPaymentPeriodTypesByProject')
  Future<ApiResponse<List<PaymentPeriodTypesDto>>>
      fetchPaymentPeriodTypesByProject(@Query('projectId') int? projectId);

  @GET('/v1/EmployeeStatus/GetAllEmployeeStatusesByProject')
  Future<ApiResponse<List<EmployeeStatusesDto>>> fetchEmployeeStatusesByProject(
      @Query('projectId') int? projectId);

  @GET('/v2/ScheduleEmployeeWork/GetAllScheduleEmployeeWorks')
  Future<ApiResponse<List<EmpChasifterDto>>> fetchEmployeeChashifter(
      @Query('employeeStatusId') int? employeeStatusId);

  @GET('/v1/ScheduleEmployeeWork/GetScheduleEmployeeWorkTabs')
  Future<ApiResponse<List<TabCashifterDto>>> fetchTab();

  @GET(
      '/v2/RecruitmentRequirementsAttachments/GetAllRecruitmentRequirementsAttachmentsByFreelancerIdAndStatus')
  Future<ApiResponse<List<AttachmentsEmpDto>>> fetchAttachments(
    @Query("freelancerId") int? freelancerId,
    @Query("statuscode") int? statusCode,
  );

  @GET('/v2/FreeLancerInfoV/GetFreelancerInfoById')
  Future<ApiResponse<EmployeeChasfiterDetailsDto>> fetchEmpById(
      @Query("freelancerId") int freelancerId);

  @POST('/v2/ScheduleEmployeeWork/AddEditScheduleEmployeeWork')
  Future<ApiResponse> AddEditEmployee(
      @Body() AddEmployeePrameter addEmployeePrameter);

  @POST('/v5/TransactionLogCashift/AdminFollowTransactionLog')
  Future<ApiResponse<EmpAttendanceDto>> fetchEmployeeAttendance(
      @Body() EmpAttandancePrams empAttandancePrams);

  @MultiPart()
  @POST(
      '/v1/RecruitmentRequirementsAttachments/AddEditFreelancerRecruitmentRequirementsAttachmentForAdmin')
  Future<ApiResponse> AddEditFreelancerAttachmentAdmin(
      @Queries() RequirementAttachmentPrams requirementAttachmentPrams,
      @Part(name: 'RequirementAttachment') File requirementAttachment);

  @MultiPart()
  @POST(
      '/v1/RecruitmentRequirementsAttachments/AddEditFreelancerRecruitmentRequirementsAttachment')
  Future<ApiResponse> AddEditFreelancerAttachmentUser(
      @Query("RequirementAttachmentId") int requirementAttachmentId,
      @Part(name: 'RequirementAttachment') File requirementAttachment);

  // employee Management
  @GET('/v2/CompleteFreeLanceInfoByCompany/GetFreeLancerCardsDetails')
  Future<ApiResponse<List<EmploymentManagementTabDto>>>
      fetchEmploymentManagementTabsData();

  @POST('/v3/CompleteFreeLanceInfoByCompany/GetFreelanceInfoByType')
  Future<ApiResponse<List<EmployeeChashifterDataDto>>> fetchEmployeesData(
      @Body() EmployeeDataParams params);

  @GET('/v2/CompleteFreeLanceInfoByCompany/CompleteFreelanceAction')
  Future<ApiResponse<List<OrderStatusDto>>> fetchEmployeesOrderStatus();

  @GET(
      '/v1/CompleteFreeLanceInfoByCompanyAprovelLevel/CompleteFreeLanceAcceptedType')
  Future<ApiResponse<List<OrderStatusDto>>> fetchEmployeesOrderStatusIfAccept();

  @GET('/v1/ShiftHead/GetShiftHead')
  Future<ApiResponse<List<WorkingPeriodDto>>> fetchWorkingPeriods();

  @POST('/v2/CompleteFreeLanceInfoByCompany/UpdateFreeLacneCompleteJobForMob')
  Future<ApiResponse<String>> saveEmployeesOrderStatus(
      @Body() SaveOrderStatusParams params);

  @GET('/v2/AssignFreeLanceProject/AssignProjectShiftFreelance')
  Future<ApiResponse<EmployeeOrderStatusDto>> fetchEmployeesOrderStatusForEdit(
      @Query('FreelanceId') int freelanceId);

  @POST('/v1/ChangePhoneNumberLog/AddChangePhoneNumberLog')
  Future<ApiResponse<int>> changePhoneNumber(
    @Part(name: 'FreeLanceInfoId') int freeLanceInfoId,
    @Part(name: 'NewPhoneNumber') String newPhoneNumber,
    @Part(name: 'AttachmentFile') File attachmentFile,
    @Part(name: 'NotificationType') int notificationType,
  );

  @POST('/v1/ChangePhoneNumberLog/ResendChangePhoneNumberCode')
  Future<ApiResponse<bool>> resendChangePhoneNumberCode(@Query('id') int id);

  @GET('/v1/ChangePhoneNumberLog/GetNotificationTypes')
  Future<ApiResponse<List<NotificationTypeCodeDto>>> fetchNotificationTypes();

  @POST('/v1/ChangePhoneNumberLog/CheckChangePhoneNumberCode')
  Future<ApiResponse<String>> checkChangePhoneNumberCode(
      @Body() CheckPhoneCodeParams params);

  @GET('/v1/ChangePhoneNumberLog/PopupUpdateFreelanceLabels')
  Future<ApiResponse<ResetPhoneDataDto>> fetchPhoneNumberData();

  @GET('/v1/ChangePhoneNumberLog/PopupsFreelancer')
  Future<ApiResponse<PopupEmploymentManagementDto>> fetchPopupsData();

  @POST('/v1/BlockFreeLancerBerCompany/AddBlockFreeLancerBerCompany')
  Future<ApiResponse<bool>> addBlockEmployee(
      @Body() AddBlockEmployeeParams params);

  @GET('/v1/FreeLancerInfo/AllowEditFaceRecognition')
  Future<ApiResponse<bool>> allowEditFaceRecognition(@Query('id') int id);


 @GET('/v1/RecruitmentRequirementsAttachments/GetAllAttachmentStatues')
 Future<ApiResponse<List<TabCashifterDto>>> fetchTabAttachment();

  @PUT('/v1/RecruitmentRequirementsAttachments/updateFreeLancerInfoRecruitmentRequirementAttachmentStatus')
  Future<ApiResponse> acceptOrRejectAttachmentEmp(
      @Body() AcceptOrRejectAttachmentEmpPrams acceptOrRejectAttachmentEmpPrams);


  // Employment Officials

  @POST('/v1/RecruitmentOfficer/AddRecruitmentOfficerForMob')
  Future<ApiResponse<bool>> addEmploymentOfficial(
      @Body() AddEmploymentOfficialParams params);

  @POST('/v1/RecruitmentOfficer/EditRecruitmentOfficerForMob')
  Future<ApiResponse<bool>> editEmploymentOfficial(
      @Body() AddEmploymentOfficialParams params);

  @GET('/v1/RecruitmentOfficer/GetAllRecruitmentOfficersForMob')
  Future<ApiResponse<List<EmploymentOfficialDto>>> fetchEmploymentOfficials(
      @Query('type') int type);

  @GET('/v1/RecruitmentOfficer/DeleteRecruitmentOfficerForMob')
  Future<ApiResponse<bool>> deleteEmploymentOfficial(@Query('Id') int id);

  // Focus Points

  @POST('/v2/FocusPoints/AddFocusPoint')
  Future<ApiResponse<int>> addFocusPoint(@Body() AddFocusPointParams params);

  @POST('/v2/FocusPoints/EditFocusPoint')
  Future<ApiResponse<int>> editFocusPoint(@Body() AddFocusPointParams params);

  @GET('/v1/FocusPoints/GetFocusPointById')
  Future<ApiResponse<FocusPointByIdDto>> fetchFocusPointById(
      @Query('Id') int id);

  @GET('/v1/Projects/GetProjects')
  Future<ApiResponse<List<CommonListItemDto>>> fetchProjects();

  @GET('/v1/FocusPointsType/GetFocusPointsType')
  Future<ApiResponse<List<FocusPointTypeDto>>> fetchFocusPointsType();

  @GET('/v1/FocusPoints/GetFreeLanceFocusPoint')
  Future<ApiResponse<List<EmployeeTypeDto>>> fetchEmployeesTypes();

  @GET('/v1/FocusPointsPriority/GetPriorityNumber')
  Future<ApiResponse<List<PointPriorityNumberDto>>> fetchPriorityLevel();

  @GET('/v1/FocusPointsTransaction/GetFocusPointsTransaction')
  Future<ApiResponse<List<FocusPointTransactionTypeDto>>>
      fetchFocusPointTransactionTypes();

  @GET('/v1/Shift/GetAllShiftsByProjects')
  Future<ApiResponse<List<ShiftFocusPointDto>>> fetchShifts(
      @Query('projectId') int projectId);

  @GET('/v1/FocusPointShifts/DeleteFocusPointShift')
  Future<ApiResponse<String>> deleteFocusPointShift(@Query('Id') int id);

  @GET('/v1/FocusPoints/GetCoverageBreak')
  Future<ApiResponse<List<CoverageBreakFocusPointDto>>>
      fetchCoverageBreakFocusPoint();

  @POST('/v1/FocusPointsAttendance/AddFocusAttendanceForMobile')
  Future<ApiResponse<String>> addFocusPointAttendanceTime(
      @Body() List<AddFocusAttendanceTimeParams> params);

  @GET('/v1/Shift/GetShiftsByProjectId')
  Future<ApiResponse<List<ShiftsByProjectDto>>> fetchShiftsByProjectId(
      @Query('ProjectId') int projectId);

  @GET('/v1/FocusPointsAttendanceType/GetFocusPointsAttendanceType')
  Future<ApiResponse<List<PointAttendanceTypeDto>>>
      fetchFocusPointsAttendanceType();

  @POST('/v1/FocusPointsDeviceSetting/AddDevicesFocusPoint')
  Future<ApiResponse<String>> addFocusPointCovenant(
      @Body() List<AddCovenantFocusPointParams> params);

  @GET('/v1/FocusPointsDeviceName/GetFocusPointsDeviceName')
  Future<ApiResponse<List<CovenantDto>>> fetchCovenantTypes();

  @GET('/v1/FocusPoints/GetFocusPoints')
  Future<ApiResponse<List<FocusPointDto>>> fetchFocusPoints();

  @GET('/v1/FocusPoints/DeleteFocusPoint')
  Future<ApiResponse<String>> deleteFocusPoint(@Query('Id') int id);

  @GET('/v1/FocusPointsAttendance/DeleteFocusPointsAttendance')
  Future<ApiResponse<String>> deleteFocusPointCovenant(@Query('Id') int id);

  @GET('/v1/FocusPointsAttendance/DeleteFocusPointsAttendance')
  Future<ApiResponse<bool>> deleteFocusPointAttendance(@Query('Id') int id);

  @POST('/v1/FocusPointsAttendance/EditFocusAttendanceForMobile')
  Future<ApiResponse<String>> editFocusPointAttendance(
      @Body() AddFocusAttendanceTimeParams params);

  @GET('/v1/FocusPointsAttendance/GetFocusPointsAttendanceByFocusPointId')
  Future<ApiResponse<List<PointAttendanceTime>>>
      fetchFocusPointsAttendanceByFocusPointId(
          @Query("FocusPointId") int focusPointId);

  @GET('/v1/FocusPointsDeviceSetting/DeleteDevicesFocusPoint')
  Future<ApiResponse> deleteCovenantFocusPoint(@Query('Id') int id);

  @POST('/v1/FocusPointsDeviceSetting/EditDevicesFocusPoint')
  Future<ApiResponse<String>> editCovenantFocusPoint(
      @Body() AddCovenantFocusPointParams params);

  @GET('/v1/FocusPointsAttendance/GetGroupAttendanceByFocusPointId')
  Future<ApiResponse<List<FocusPointTimeDto>>> fetchFocusPointTimes(
      @Query('FocusPointId') int focusPointId);

  @GET('/v1/FocusPointsArea/GetFocusPointArea')
  Future<ApiResponse<List<FocusPointAreaDto>>> fetchFocusPointAreas(
      @Query('projectId') int projectId);

  @GET('/v1/Shift/GetShiftsByProjects')
  Future<ApiResponse<List<ShiftByProjectIdDto>>>
      fetchShiftsByProjectsFocusPoints(@Query('ProjectId') int projectId);

  @GET('/v1/Projects/GetProjectInfoFocusPoint')
  Future<ApiResponse<ProjectInfoFocusPointDto>> fetchInfoTrackingFocusPoint(
      @Query('ProjectId') int projectId);

  @GET('/v1/FreeLanceApplyFocusPoint/GetFocusPointsInfoByProjectId')
  Future<ApiResponse<List<FocusPointsTypesDto>>> fetchFocusPointsTypes(
      @Query('ProjectId') int projectId, @Query('shiftId') int shiftId);

  // start General Violations
  @GET('/v1/ScheduleViolationTransaction/GetAllScheduleViolationTransactions')
  Future<ApiResponse<List<GeneralViolationDto>>> fetchGeneralViolations();

  @GET('/v1/ScheduleViolationTransaction/GetScheduleViolationTransactionById')
  Future<ApiResponse<GeneralViolationDto>> fetchGeneralViolationDetails(
      @Query('ScheduleViolTranId') int id);

  @GET('/v1/ScheduleViolation/GetAllScheduleViolations')
  Future<ApiResponse<List<ViolationTypeDto>>> fetchAllViolationsTypes();

  @GET('/v1/ScheduleViolationsType/GetAllScheduleViolationsTypes')
  Future<ApiResponse<List<CommonListItemDto>>> fetchViolationsTypes();

  @GET('/v1/ScheduleViolation/GetScheduleViolationsByProjectId')
  Future<ApiResponse<List<ViolationByProjectIdDto>>>
      fetchViolationsTypesByProjectId(@Query('ProjectId') int id);

  @POST('/v1/ScheduleViolation/AddEditScheduleViolation')
  Future<ApiResponse> addTypeViolation(@Body() AddTypeViolationParams params);

  @POST('/v1/ScheduleViolationTransaction/AddEditScheduleViolationTransaction')
  Future<ApiResponse<GeneralViolationDto>> addGeneralViolation(
      @Body() AddGeneralViolationParams params);

  @MultiPart()
  @POST('/v1/ScheduleViolTranAttach/AddScheduleViolationTransactionAttach')
  Future<ApiResponse> uploadFiles(
      @Query('ScheduleViolationTransactionId') int? id,
      @Part(name: 'AttachmentFiles') List<File> files);

  @GET('/v1/ScheduleEmployeeWork/GetScheduleEmployeeWorksByShiftId')
  Future<ApiResponse<List<ViolationEmployeeDto>>> fetchEmployeeWorksByShiftId(
      @Query('shiftId') int? id);

  //  start Job Requirements
  @GET('/v1/Jobs/GetAllJobWithIconForMob')
  Future<ApiResponse<List<JobModelDto>>> fetchListJob();

  @GET('/v1/CompleteJobsInfoDetails/GetJobDetailsForMob')
  Future<ApiResponse<List<JobRequirementsDto>>> fetchJobRequirements(
      @Query("type") int type);

  @GET('/v1/CompleteJobsInfoDetails/DeleteJobDetailsForMob')
  Future<ApiResponse> deleteJobRequirements(@Query("Id") int id);

  @POST('/v1/CompleteJobsInfoDetails/AddEditJobDetailsForMob')
  Future<ApiResponse> addEditJobRequirements(
      @Body() AddEditJobContaionPrams addEditJobContaionPrams);

  // start  todo  api

  @GET('/v1/OpportunitiesAvailble/GetAllTodayOppByProject')
  Future<ApiResponse<List<OpportunityDto>>> getAllTodayOpportunity();
//v1/OpportunitiesAvailble/GetAllOpportunitiesAvailbleByType?type=1
  @GET('/v1/OpportunitiesAvailble/GetAllOpportunitiesAvailbleByType')
  Future<ApiResponse<List<OpportunityDto>>> fetchOpportunityByStatus(
      @Query('type') int type);

  @GET('/v1/FreeLancerInfo/GetFreeLanceInfo')
  Future<ApiResponse<FreeLanceInfo>> fetchFreeLanceInfo(
      @Query('phone') String type);

  @POST(
      '/v3/OpportunitiesAvailble/AssignListFreeLanceApplyOpportunityAvailbleById')
  Future<ApiResponse<String>> assignListFreeLanceOpportunity(
      @Body() List<FreeLanceInfoParams> params);

  @GET('/v1/OpportunitiesAvailble/GetOpporuntyDetailsById')
  Future<ApiResponse<OpportunityDetailsDto>> fetchOpportunityDetailsById(
      @Query('Id') int id);

  @GET('/v1/OpportunitiesAvailble/CancelOpportunityAvailableByDescription')
  Future<ApiResponse<String>> cancelOpportunityAvailableByDescription(
      @Query('Id') int id, @Query('CancelDescription') String description);

  @POST('/v1/FreeLanceApplyOpportunities/ApproveJobRequest')
  Future<ApiResponse<bool>> approveJobRequest(
      @Body() ApproveJobRequestParams params);

  @POST('/v2/FreeLanceApplyOpportunities/UpdateAttendance')
  Future<ApiResponse<bool>> updateAttendance(
      @Body() UpdateAttendanceParams params);

  @POST('/v5/OpportunitiesAvailble/GetAllOpportunityByType')
  Future<ApiResponse<OpportunityDataDto>> fetchOpportunityByTypeWithPage(
      @Body() PaginationOpportunityParams params);

  @GET('/v3/OpportunitiesAvailble/GetTypeOpportunity')
  Future<ApiResponse<List<OpportunityTabsDto>>> fetchOpportunityTabs();

  @GET('/v3/OpportunitiesAvailble/GetPercentageOfOpportunty')
  Future<ApiResponse<List<PercentageOpportuntyDto>>> fetchPercentageOpportunty(
      @Query("type") int Type);

  @GET('/v1/Projects/GetListProjects')
  Future<ApiResponse<List<ProjectFiterOpportunityDto>>> fetchProjectsToDo();

  @GET('/v2/OpportunitiesAvailbleV/GetFreeLanceApplicants')
  Future<ApiResponse<OpportunityApplicantDto>> fetchApplicants(
      @Query("id") int id, @Query("tab") int tab);

  @GET('/v1/OpportunitiesAvailble/GetOpporuntyDetailsByIdWithApplicantsCount')
  Future<ApiResponse<OpportunityDetailsDataDto>> fetchOpportunityDetails(
    @Query("id") int id,
  );

  @GET('/v1/OpportunitiesAvailble/GetFreeLanceApplicantWithDeductions')
  Future<ApiResponse<ApplicantsDetailsDto>> fetchApplicantsDetails(
    @Query("id") int id,
  );

  @GET('/v1/OpportunitiesAvailble/GetFreeLanceApplicantEditListRoles')
  Future<ApiResponse<List<ApplicantRoleDto>>> fetchApplicantEditListRoles();

  // start  project  management

  @GET('/v3/Projects/GetListOfProjectByCompnay')
  Future<ApiResponse<List<ProjectManagementDto>>> fetchProjectsV3();

  @GET('/v2/Projects/GenerateReportForMob/{projectId}/{projectName}')
  Future<ApiResponse<DownLoadSalaryDefinition>> downLoadQrCodeImage(
      @Path('projectId') String projectCode,
      @Path('projectName') String projectName);

  @MultiPart()
  @POST('/v3/Projects/AddEditNewProject')
  Future<ApiResponse<int>> addEditNewProject(
      @Part(name: 'Id') int? id,
      @Part(name: 'CompanyId') int? companyId,
      @Part(name: 'BrandId') int? brandId,
      @Part(name: 'CityId') int? cityId,
      @Part(name: 'BrandName') String? brandName,
      @Part(name: 'CityName') String? cityName,
      @Part(name: 'NameEn') String? nameEn,
      @Part(name: 'NameAr') String? nameAr,
      @Part(name: 'AddressEn') String? addressEn,
      @Part(name: 'AddressAr') String? addressAr,
      @Part(name: 'Latitude') String? latitude,
      @Part(name: 'Longtude') String? longtude,
      @Part(name: 'AttendanceTypeId') int? attendanceTypeId,
      @Part(name: 'OtherProject') List<LocationProjectParams>? otherProject,
      @Part(name: 'ImageURL') String? imageURL,
      {@Part(name: 'Image') File? image = null});

  @GET('/v3/Projects/GetProjectInfoById')
  Future<ApiResponse<AddProjectParams>> fetchProjectInfoById(
      @Query('Id') int? id);

  @GET('/v1/Brand/GetListBrand')
  Future<ApiResponse<List<BrandDto>>> fetchListBrand();

  @GET('/v1/company/GetAllCompaniesByUserType')
  Future<ApiResponse<List<CompanyDto>>> fetchCompanies();

  @GET('/v1/City/GetCityForDrop')
  Future<ApiResponse<List<CityDto>>> fetchCities();

  @GET('/v2/Projects/GetFormProjectModel')
  Future<ApiResponse<ProjectLabelsDto>> fetchProjectLabels();

  @GET('/v1/Projects/DeleteProject')
  Future<ApiResponse<String>> deleteProject(@Query('Id') int? id);

  @GET('/v1/SchedulePrice/DeleteSchedulePriceForMob')
  Future<ApiResponse<String>> deletePeriodPricing(@Query('Id') int? id);

  @GET('/v1/LocationsProject/GetLocationInfoByProject')
  Future<ApiResponse<List<LocationProjectParams>>> fetchLocationInfoByProject(
      @Query('projectId') int? projectId);

  @POST('/v1/LocationsProject/AddNewLocation')
  Future<ApiResponse<String>> addLocationProject(
      @Body() LocationProjectParams params);

  @GET('/v1/LocationsProject/DeleteLocationProject/{Id}')
  Future<ApiResponse<bool>> deleteLocationProject(@Path("Id") int? id);

  @POST('/v1/LocationsProject/EditLocation')
  Future<ApiResponse<String>> editLocationProject(
      @Body() LocationProjectParams params);

  @POST('/v2/SchedulePrice/AddEditNewSchudlePrice')
  Future<ApiResponse<String>> addPeriodPricing(
      @Body() AddPeriodPricingParams params);

  @POST('/v2/SchedulePrice/AddEditNewSchudlePrice')
  Future<ApiResponse<String>> editPeriodPricing(
      @Body() AddPeriodPricingParams params);

  @GET('/v1/ShiftHead/GetShiftHead')
  Future<ApiResponse<List<PeriodOrderDto>>> fetchPeriodOrder();

  @GET('/v1/SchedulePrice/GetSchdulePriceInfo')
  Future<ApiResponse<PricingDetailsDto>> fetchPeriodPricingDetails(
      @Query("Id") int id);

  @GET('/v1/SchedulePrice/GetFormSchedulePriceViewModels')
  Future<ApiResponse<PeriodPricingLabelDto>> fetchLabelAddPeriodOrder();

  @GET('/v1/Jobs/GetAllJobForDrops')
  Future<ApiResponse<List<JobDto>>> fetchAllJobForDrops();

  @GET('/v1/SchedulePrice/GetLastSchedulerPrice')
  Future<ApiResponse<List<LastPriceDto>>> fetchInfoLastPricing(
      @Query("ProjectId") int ProjectId, @Query("ShiftId") int ShiftId);

  @GET('/v1/Shift/GetFormShiftModel')
  Future<ApiResponse<WorkingPeriodLabelsDto>> fetchWorkingPeriodLabels();

  @GET('/v1/Shift/GetListShiftByProjectId')
  Future<ApiResponse<List<WorkingPeriodDto>>> fetchWorkingPeriodsByProjectId(
      @Query('projectId') int? projectId);

  @GET('/v2/Shift/GetShiftInfo')
  Future<ApiResponse<AddWorkingPeriodParams>> fetchWorkingPeriodDetails(
      @Query('Id') int? id);

  @GET('/v2/SchedulePrice/GetSeasone')
  Future<ApiResponse<List<TimePriceDto>>> fetchTimePrice(
      @Query('companyId') int companyId);

  @POST('/v3/Shifts/AddEditNewShift')
  Future<ApiResponse> addEditWorkingPeriod(
      @Body() AddWorkingPeriodParams params);

  @GET('/v1/Shift/DeleteShift')
  Future<ApiResponse<String>> deleteWorkingPeriod(@Query('id') int? id);

  @GET('/v1/Shift/GetListShiftByProjectId')
  Future<ApiResponse<List<ShiftTimeDto>>> fetchShift(
      @Query("projectId") int projectId);

  @GET('/v1/SchedulePrice/GetListSchedulePrice')
  Future<ApiResponse<List<PeriodPricingDto>>> fetchPeriodPricing(
      @Query("ProjectId") int projectId);

  @GET('/v1/Projects/GetProjectsById')
  Future<ApiResponse<ProjectManagementDto>> fetchProjectSuccessfully(
      @Query("Id") int projectId);

  @GET('/v1/Projects/GetProjectWithLocationsById')
  Future<ApiResponse<LocationGateProjectDto>> fetchLocationGateProject(
      @Query("id") int projectId);

  @GET('/v1/FreeLanceApplyOpportunities/GetAllFreelancersByPointId')
  Future<ApiResponse<List<EmployePointDto>>> fetchEmpLocationGate(
      @Query("pointId") String pointId);

  // start   Punishments

  @GET('/v2/Violation/GetViolationList')
  Future<ApiResponse<List<PunishmentDto>>> fetchPunishments(
      @Query('type') int type);

  @GET('/v1/Violation/ActiveandNoneActiveViolation')
  Future<ApiResponse<String>> activePunishment(@Query('Id') int id);

  @GET('/v1/Violation/DeleteViolationForMob')
  Future<ApiResponse<String>> deletePunishment(@Query('Id') int id);

  @POST('/v2/Violation/AddEditNewViolation')
  Future<ApiResponse<String>> addEditPunishment(
      @Body() AddEditPunishmentParams params);

  @GET('/v1/Violation/GetViolationById')
  Future<ApiResponse<AddEditPunishmentParams>> fetchPunishmentById(
      @Query('Id') int id);

  @GET('/v1/Violation/GetViolationName')
  Future<ApiResponse<List<PunishmentNameDto>>> fetchPunishmentsNames();

  @GET('/v1/ViolationsTypes/GetViolationTypes')
  Future<ApiResponse<List<PunishmentTypeDto>>> fetchPunishmentsTypes();

  //  start Review Opportunities
  @GET('/v1/FreeLanceApplyOpportunities/GetFreeLanceApplay')
  Future<ApiResponse<List<CompletedOpportunityDto>>>
      fetchPendingConfirmationOpportunities();

  @GET('/v1/FreeLanceApplyOpportunities/GetFreeLanceApplayByType')
  Future<ApiResponse<List<CompletedOpportunityDto>>>
      fetchCompletedOpportunitiesByType(@Query('statusId') int statusId);

  @GET('/v1/Evaluations/GetJobEvaluations/{freeLanceApplyOpportunityId}')
  Future<ApiResponse<List<JobEvaluationsDto>>> fetchGetJobEvaluations(
      @Path('freeLanceApplyOpportunityId') int freeLanceApplyOpportunityId);

  @GET('/v1/OpportunitiesAvailble/GetBlockTypeList')
  Future<ApiResponse<BanTypes>> fetchBlockTypes();

  @POST('/v1/FreeLanceApplyOpportunities/ApproveOfRejectShift')
  Future<ApiResponse<int>> confirmShiftPaymentRequest(
      @Body() ConfirmShiftPaymentRequest params);

  @GET('/v3/FreeLanceApplyOpportunities/GetFreeLanceApplayByType')
  Future<ApiResponse<CompletOpportunityDto>> fetchReviewOpportunitiesByType(
      @Queries() ReviewShiftsprams reviewShiftsprams);

  //  start Term and Condition
  @GET('/v1/TermsAndCondtion/GetTermandConditionByCompanyIdForMob')
  Future<ApiResponse<List<TermandConditionDto>>> fetchTermandCondition(
      @Query("type") int type);

  @GET('/v5/TermsAndCondtion/DeleteTermCondition')
  Future<ApiResponse> deleteTermandCondition(@Query("Id") int id);

  @GET('/v5/TermsAndCondtion/ActiveandUnActive')
  Future<ApiResponse> updateType(@Query("Id") int id);

  @GET('/v1/TermsAndCondtion/GetTermsAndCondtionById')
  Future<ApiResponse<TermandConditionDto>> fetchTermandConditionById(
      @Query("Id") int id);

  @POST('/v1/TermsAndCondtion/AddEditTermsAndCondtion')
  Future<ApiResponse> addEditTermandCondition(
      @Body() TermsAndConditionsPrams termsAndConditionsPrams);

  @GET('/v1/TermsAndCondtion/GetTermandConditionTasks')
  Future<ApiResponse<List<TermandConditionDto>>> fetchTasks(
      @Query("type") int type);

  @GET('/v1/TermsAndCondtion/GetTermsAndCondtionTasksById')
  Future<ApiResponse<TermandConditionDto>> fetchTasksById(@Query("Id") int id);

  @POST('/v1/TermsAndCondtion/AddEditTermsAndCondtionTasks')
  Future<ApiResponse> addEditTask(
      @Body() TermsAndConditionsPrams termsAndConditionsPrams);

  //  start Track Attendance Departure Requests

  @GET('/v1/TrackFaceRecognitionRequests/GetAllTrackFaceRecognitionRequests')
  Future<ApiResponse<List<TrackAttendanceDepartureDto>>>
      fetchTrackAttendanceDepartureRequests();

  @GET('/v1/TrackFaceRecognitionDetails/GetTrackFaceRecognitionDetails')
  Future<ApiResponse<List<TrackAttendanceDepartureImageDto>>>
      fetchTrackAttendanceDepartureRequestsImages(
          @Query('requestId') int requestId);

  @GET('/v1/TrackFaceRecognitionDetails/GetTrackFaceRecognitionDetailsList')
  Future<ApiResponse< RequestAttendanceDepartureDetailsDto>> fetchTrackAttendanceDepartureRequestsDetails(@Query('requestId') int requestId);


  @POST('/v1/TrackFaceRecognitionRequests/CreateTrackFaceRecognitionRequest')
  Future<ApiResponse> createRequestTrackAttendanceDeparture(
      @Body() RequestTrackAttendanceDepartureParams params);

  @POST('/v1/TrackFaceRecognitionRequests/UpdateTrackFaceRecognitionRequest')
  Future<ApiResponse> updateTrackAttendanceDeparture(
      @Body() RequestTrackAttendanceDepartureParams params);

  //  start user management

  @GET('/v2/Account/GetUsersByType')
  Future<ApiResponse<List<UserManagementDto>>> fetchUsers(
      @Query('type') int type);

  @GET('/v1/Account/UpdateActiveUsers')
  Future<ApiResponse<String>> changeUserStatus(@Query('Id') String id);

  @POST('/v3/Account/AddNewUser')
  Future<ApiResponse<String>> addNewUser(@Body() AddNewUserParams params);

  @POST('/v3/Account/UpdateUserData')
  Future<ApiResponse<String>> updateUserData(@Body() AddNewUserParams params);

  @POST('/v1/Account/ChangeUserPassword')
  Future<ApiResponse<String>> changePassword(
      @Body() ChangeUserPasswordParams params);

  @GET('/v2/Account/GetInfoUserManager')
  Future<ApiResponse<InfoUserManagerDto>> fetchInfoUserManager();

  @GET('/v1/Brand/GetBrand')
  Future<ApiResponse<List<BrandDto>>> fetchBrands(
      @Query('CompanyId') int CompanyId);

  @POST('/v1/Shift/GetShiftByListProjectId')
  Future<ApiResponse<List<ShiftByListProjectIdDto>>> fetchShiftByListProjectId(
      @Body() List<int> projectIds);

  @GET('/v3/Projects/GetListProjectsByCompanyId')
  Future<ApiResponse<List<CommonListItemDto>>> fetchListProjectsByCompanyId(
      @Query('companyId') int companyId);

  @GET('/v1/Area/GetAllAreaForMobDrop')
  Future<ApiResponse<List<UserAreaDto>>> fetchAllUserAreas();

  @GET('/v3/Account/GetUserByPhoneNumber')
  Future<ApiResponse<UserByPhoneDto>> fetchUserByPhone(
      @Query('phoneOrIdNumber') String phoneOrIdNumber);

  // Vehicle

  @GET('/v1/VehicleBrands/GetAllVehicleBrands')
  Future<ApiResponse<List<CommonListItemDto>>> fetchVehiclesTypes();

  @GET('/v1/VehicleColors/GetAllVehiclesColors')
  Future<ApiResponse<List<CommonListItemDto>>> fetchVehiclesColors();

  @GET('/v2/Vehicles/GetVehicleById')
  Future<ApiResponse<VehicleDetailsDto>> fetchVehicleById(@Query('id') int id);

  @MultiPart()
  @POST('/v1/Vehicles/AddNewVehicle')
  Future<ApiResponse<VehiclesDto>> addVehicle(
    @Part(name: 'VehicleCode') int? vehicleCode,
    @Part(name: 'Model') String? model,
    @Part(name: 'YearOfManufacture') String? yearOfManufacture,
    @Part(name: 'PlateNumber') String? plateNumber,
    @Part(name: 'LicenseNumber') String? licenseNumber,
    @Part(name: 'LicenseExpiryDate') String? licenseExpiryDate,
    @Part(name: 'Specifications') String? specifications,
    @Part(name: 'VehicleImageFile') File VehicleImageFile,
    @Part(name: 'VehicleBrandId') String? vehicleBrandId,
    @Part(name: 'CompanyId') String? companyId,
    @Part(name: 'ProjectId') String? projectId,
    @Part(name: 'VehicleColorId') int? vehicleColorId,
  );

  @MultiPart()
  @POST('v1/VehicleInsurances/AddNewVehicleInsurance')
  Future<ApiResponse> addInsurance(
    @Part(name: 'InsuranceNumber') String? insuranceNumber,
    @Part(name: 'InsuranceProvider') String? insuranceProvider,
    @Part(name: 'InsuranceExpiryDate') String? insuranceExpiryDate,
    @Part(name: 'VehicleId') int? vehicleId,
    @Part(name: 'VehicleInsuranceTypeId') String? vehicleInsuranceTypeId,
    @Part(name: 'InsuranceImage') File insuranceImage,
  );

  @MultiPart()
  @POST('/v1/VehicleInsurances/EditVehicleInsurance')
  Future<ApiResponse> editInsurance(
      @Part(name: 'Id') int? id,
      @Part(name: 'InsuranceNumber') String? insuranceNumber,
      @Part(name: 'InsuranceProvider') String? insuranceProvider,
      @Part(name: 'InsuranceExpiryDate') String? insuranceExpiryDate,
      @Part(name: 'VehicleId') int? vehicleId,
      @Part(name: 'VehicleInsuranceTypeId') String? vehicleInsuranceTypeId,
      {@Part(name: 'InsuranceImage') File? insuranceImage = null});

  @MultiPart()
  @POST('/v1/Vehicles/EditVehicle')
  Future<ApiResponse<VehiclesDto>> editVehicle(
      @Part(name: 'id') int? id,
      @Part(name: 'VehicleCode') int? vehicleCode,
      @Part(name: 'Model') String? model,
      @Part(name: 'YearOfManufacture') String? yearOfManufacture,
      @Part(name: 'PlateNumber') String? plateNumber,
      @Part(name: 'LicenseNumber') String? licenseNumber,
      @Part(name: 'LicenseExpiryDate') String? licenseExpiryDate,
      @Part(name: 'Specifications') String? specifications,
      @Part(name: 'VehicleImage') String? vehicleImage,
      @Part(name: 'VehicleBrandId') String? vehicleBrandId,
      @Part(name: 'CompanyId') String? companyId,
      @Part(name: 'ProjectId') String? projectId,
      @Part(name: 'VehicleColorId') int? vehicleColorId,
      {@Part(name: 'VehicleImageFile') File? vehicleImageFile = null});

  @GET('/v1/Vehicles/GetAllVehicles')
  Future<ApiResponse<List<VehiclesDto>>> fetchVehicles();

  //نوع  التامينات
  @GET('/v1/VehicleInsuranceTypes/GetAllVehicleInsuranceTypes')
  Future<ApiResponse<List<InsuranceTypesDto>>> fetchInsuranceTypes();

  @POST('/v1/Vehicles/DeleteVehicle/id')
  Future<ApiResponse> deleteVehicle(@Query("id") int id);

  @POST('/v1/VehicleInsurances/DeleteVehicleInsurance')
  Future<ApiResponse> deleteInsurance(@Query("id") int id);

  @GET('/v1/VehicleInsurances/GetAllVehicleInsurancesByVehicleId')
  Future<ApiResponse<List<InsurancesDto>>> fetchInsurancesByVehicleId(
      @Query("vehicleId") int vehicleId);

  @MultiPart()
  @POST('/v1/VehicleImages/AddVehicleImages')
  Future<ApiResponse> addVehicleImages(
    @Part(name: 'Images') List<MultipartFile> images,
    @Part(name: 'VehicleId') int vehicleId,
  );

  @GET('/v1/VehicleImageFaces/GetAllVehiclesImagesFaces')
  Future<ApiResponse<List<VehicleImageFaceDto>>> fetchVehiclesImagesFaces();

  @GET('/v1/Custodies/GetAllCustodiesByVehicleId')
  Future<ApiResponse<List<CovenantVehicleDto>>> fetchCovenants(
      @Query("vehicleId") int vehicleId);

  @MultiPart()
  @POST('/v1/Custodies/AddNewCustody')
  Future<ApiResponse> addCovenant(
    @Part(name: 'VehicleId') int? vehicleId,
    @Part(name: 'Name') String? Name,
    @Part(name: 'Description') String? Description,
    @Part(name: 'CustodyImagePath') String? custodyImagePath,
    @Part(name: 'CustodyImage') File custodyImage,
  );

  @MultiPart()
  @PUT('/v1/Custodies/EditCustody')
  Future<ApiResponse> editCovenant(
      @Part(name: 'Id') int? id,
      @Part(name: 'VehicleId') int? vehicleId,
      @Part(name: 'Name') String? Name,
      @Part(name: 'Description') String? Description,
      @Part(name: 'CustodyImagePath') String? custodyImagePath,
      {@Part(name: 'CustodyImage') File? custodyImage = null});

  @DELETE('/v1/Custodies/DeleteCustody')
  Future<ApiResponse> deleteCovenant(@Query("id") int id);

  @GET('/v1/ContractViolation/GetAllContractViolations')
  Future<ApiResponse<List<ContractViolationDto>>> fetchVehicleViolations();

  @GET('/v1/ContractViolation/GetContractViolationById')
  Future<ApiResponse<ContractViolationDto>> fetchVehicleViolationsById(
      @Query("ContractViolationId") int id);

  @POST('/v1/ContractViolation/AddEditContractViolation')
  Future<ApiResponse<ContractViolationDto>> addContractViolation(
      @Body() AddVehicleViolationParams params);

  @GET('/v1/ContractViolationType/GetAllContractViolationTypes')
  Future<ApiResponse<List<CommonListItemDto>>> fetchVehicleViolationTypes();

  @MultiPart()
  @POST('/v1/ContractViolationAttachments/AddContractViolationAttachments')
  Future<ApiResponse> addContractViolationAttachments(
    @Part(name: 'AttachmentFiles') List<File> attachments,
    @Part(name: 'ContractViolationId') int contractViolationId,
  );



  @GET('/v1/Vehicles/GenerateVehicleReport/{VehicleId}')
  Future<ApiResponse<DownLoadSalaryDefinition>> qrCodeVehicle(@Path('VehicleId') int vehicleId );

  //   emp  map

  @POST('/v1/FreeLancerInfo/GetFreelancerInfoLoc')
  Future<ApiResponse<EmpMapDto>> fetchEmpInfoLoc(
      @Body() FetchEmpMapPrams fetchEmpMapPrams);

  //  job juniform

  @GET('/v1/JobUniformCategory/GetAllJobUniformCategoriesForMob')
  Future<ApiResponse<List<UniformDto>>> fetchJobUniform(
      @Query('jobId') int jobId, @Query('companyId') int companyId);

  @MultiPart()
  @POST('/v1/JobUniform/AddEditJobUniformForMob')
  Future<ApiResponse<bool>> addEditJobUniform(
      @Part(name: 'Id') int? Id,
      @Part(name: 'JobId') int? JobId,
      @Part(name: 'CompanyId') int? companyId,
      @Part(name: 'JobUniformCategoryId') int? JobUniformCategoryId,
      @Part(name: 'description') String? description,
      {@Part(name: 'File') File? file = null});

  @GET('/v1/JobUniform/DeleteJobUniformForMob')
  Future<ApiResponse<bool>> deleteJobUniform(@Query('id') int id);

  // Gas Station
  @GET('/v1/FillingStations/GetALlFillingStations')
  Future<ApiResponse<List<GasStationDto>>> fetchGasStation();

  @POST('/v1/FillingStations/AddEditFillingStation')
  Future<ApiResponse> addEditGasStation(
      @Body() AddEditGasStationPrams addEditGasStationPrams);

  @GET('/v1/FillingStations/DeleteFillingStation')
  Future<ApiResponse> deleteGasStation(@Query('id') int id);
  @GET('/v1/CashifterRequestStatuses/GetAllCashifterRequestStatusesTabs')
  Future<ApiResponse<List<CommonListItemDto>>> fetchUsersRequestTabs();

  @GET('/v1/CashifterRequests/GetAllCashifterRequestsByStatus')
  Future<ApiResponse<List<UserRequestDto>>> fetchUsersRequests(@Query('statusId') int statusId);

  @GET('/v1/CashifterRequestsTermsAndConditions/GetAllCashifterRequestTermsAndConditionsByTypeAndStatus')
  Future<ApiResponse<List<String>>> fetchUserRequestTerms(@Queries() UserRequestTermsParams params);

  @PUT('/v1/CashifterRequests/UpdateRequestStatus')
  Future<ApiResponse> acceptRejectUserRequest(@Body() RejectUserRequestParams params);

  @GET('/v1/VehicleHandovers/GetAllIssueDescriptionStatues')
  Future<ApiResponse<List<CommonListItemDto>>> fetchActionVehicleReceiveRequestStatues();

  @GET('/v1/VehicleHandovers/GetTypesTabsOfVehicleHandoverReview')
  Future<ApiResponse<List<CommonListItemDto>>> fetchVehicleReceiveRequestTypesTabs();

  @GET('/v1/VehicleHandovers/GetAllVehicleHandoverReviewsByType')
  Future<ApiResponse<List<VehicleReceiveRequestDto>>> fetchVehicleReceiveRequestsByType(@Query('type') int type);

  @POST('/v1/VehicleHandovers/TakeActionOnVehicleComponentHandoverReview')
  Future<ApiResponse> actionVehicleReceiveRequest(@Body() ActionVehicleReceiveRequestParams  params);

  @POST('/v1/VehicleHandovers/TakeFinalActionOnVehicleComponentHandoverReview')
  Future<ApiResponse> finalActionVehicleReceiveRequest(@Body() FinalActionVehicleReceiveRequestParams  params);

  @GET('/v1/VehicleHandovers/GetAllVehicleHandoverEmployeeByProject')
  Future<ApiResponse<List<CommonListItemDto>>> fetchVehicleEmployeeByProject(@Query('ProjectId') int projectId);

  @GET('/v1/ContractViolation/GetTypesTabsOfContractViolation')
  Future<ApiResponse<List<CommonListItemDto>>> fetchTypesTabsOfContractViolation();

  @GET('/v1/ContractViolation/GetAllContractViolationByType')
  Future<ApiResponse<List<FollowUpViolationDto>>> fetchFollowUpViolationsByType(@Query('type') int type);

  @GET('/v1/ContractViolation/GetAllContractViolationImportantLevel')
  Future<ApiResponse<List<CommonListItemDto>>> fetchViolationImportantLevels();

  @POST('/v1/ContractViolation/TakeActionOnContractViolationReview')
  Future<ApiResponse> actionFollowUpViolation(@Body() ActionFollowUpViolationParams  params);

  @POST('/v1/ContractViolation/TakeFinaActionOnContractViolationReview')
  Future<ApiResponse> finalActionFollowUpViolation(@Body() FinalActionFollowUpViolationParams  params);
}
