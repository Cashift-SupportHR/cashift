import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:shiftapp/data/datasources/remote/remote_constants.dart';
import 'package:shiftapp/data/models/api_response.dart';

import '../../data/models/absence_notation/absencenotice.dart';
import '../../data/models/absence_notation/add_absence_notice_params.dart';
import '../../data/models/account/index.dart';
import '../../data/models/activity_log/index.dart';
import '../../data/models/add-address/add_home_location_params.dart';
import '../../data/models/add-address/index.dart';
import '../../data/models/advancedFilter/index.dart';
import '../../data/models/attendance/index.dart';
import '../../data/models/auth/index.dart';
import '../../data/models/bail_requests/index.dart';
import '../../data/models/bank/index.dart';
import '../../data/models/evulation/index.dart';
import '../../data/models/loans_request/index.dart';
import '../../data/models/logger/logger_params.dart';
import '../../data/models/notification_offers/index.dart';
import '../../data/models/overview/index.dart';
import '../../data/models/projects/index.dart';
import '../../data/models/resuame/index.dart';
import '../../data/models/salary-definition-request/index.dart';
import '../../data/models/service/index.dart';
import '../../data/models/shift/index.dart';
import '../../data/models/wallet/index.dart';
import '../../data/models/workerWorkPlaces/index.dart';
import '../../domain/entities/account/index.dart';
import '../../domain/entities/attendance/index.dart';
import '../../domain/entities/bankaccount/index.dart';
import '../../domain/entities/collect_cash/index.dart';
import '../../domain/entities/evulation/index.dart';
import '../../domain/entities/overview/index.dart';
import '../../domain/entities/resume/index.dart';
import '../../domain/entities/shift/index_shift.dart';
import '../../domain/entities/terms/terms_item.dart';
import '../../domain/entities/wallet/index.dart';
import '../../presentation/adminFeatures/employees/data/models/emp_attandance_prams.dart';
import '../../presentation/adminFeatures/employees/data/models/emp_attendance_dto.dart';
import '../../presentation/adminFeatures/maintenanceAndBreakdowns/data/models/maintenance_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_details_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_violation_data_dto.dart';
import '../../presentation/adminFeatures/vehicles/data/models/vehicle_violation_dto.dart';
import '../../presentation/adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../presentation/presentationUser/AttendanceAndDepartureNotifications/data/models/index.dart';
import '../../presentation/presentationUser/employeesCertificates/data/models/index.dart';
import '../../presentation/presentationUser/pledgesAndGeneralization/data/models/pledge_generalization_dto.dart';
import '../../presentation/presentationUser/profile/requests/data/models/terms_and_conditions_requests_prams.dart';
import '../../presentation/presentationUser/profile/requests/data/models/add_request_prams.dart';
import '../../presentation/presentationUser/profile/requests/data/models/confirm_reques_prams.dart';
import '../../presentation/presentationUser/profile/requests/data/models/requests_user_dto.dart';
import '../../presentation/presentationUser/profile/requests/data/models/shift_rquest_type_dto.dart';
import '../../presentation/presentationUser/profile/requests/data/models/terms_and_conditions_requests_dto.dart';
import '../../presentation/presentationUser/profile/requests/data/models/upload_file_request_prams.dart';
import '../../presentation/presentationUser/transactions/data/models/add_transactions_prams.dart';
import '../../presentation/presentationUser/transactions/data/models/reschedule_transactions_prams.dart';
import '../../presentation/presentationUser/transactions/data/models/transactions_dto.dart';
import '../../presentation/presentationUser/transactions/data/models/transactions_prams.dart';
import '../../presentation/presentationUser/transactions/data/models/update_transactions_prams.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/add_round_trip_fill_station_prams.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/confirm_receive_vehicle_params.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/download_vehicle_violation_picture_params.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/driver_violation_dto.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/gas_station_trip_dto.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/index.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/receive_vehicle_details_dto.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/vehicle_performance_dto.dart';
import '../../presentation/presentationUser/vehiclesOperation/data/models/receive_vehicle_prams.dart';
import '../../presentation/presentationUser/violations/data/models/approve_reject_violation_params.dart';
import '../../presentation/presentationUser/violations/data/models/violations_user_data_dto.dart';
import '../../presentation/presentationUser/workHazards/data/models/index.dart';
import '../../presentation/presentationUser/working_document/data/models/installment_with_cashift_dto.dart';
import '../../presentation/presentationUser/working_document/data/models/term_condition_certificate_payment_dto.dart';
import '../../presentation/presentationUser/working_document/data/models/working_document_dto.dart';
import '../../presentation/shared/loans/data/models/loan_data_dto.dart';
import '../../presentation/shared/loans/data/models/tabs_and_total_loans_dto.dart';
import '../../presentation/shared/models/common_list_item_dto.dart';
part 'user_endpoint.g.dart';

@Injectable()
@RestApi()
abstract class UserEndpoint {
  @factoryMethod
  factory UserEndpoint(Dio dio) = _UserEndpoint;

  /// Auth

  @POST('/v3/FreeLancerInfo/Login')
  Future<ApiResponse<User>> login(@Body() LoginParams loginParams);

  @POST('/v2/VerifyCode/CheckCodeByFreeLance')
  Future<ApiResponse<User>> confirmOtp(@Body() ConfirmOtpParams loginParams);
  //http://85.184.232.38:8003/api/v3/VerifyCode/CheckCodeResetPassword

  @POST('/v3/VerifyCode/CheckCodeResetPassword')
  Future<ApiResponse<String>> confirmRestPasswordOtp(
    @Body() ConfirmOtpParams loginParams,
  );

  @POST('/v3/FreeLancerInfo/RegisterFreeLance')
  Future<ApiResponse<String>> register(@Body() RegisterParams loginParams);

  //http://85.184.232.38:8003/api/v3/FreeLancerInfo/SendSMSResetPassword?phoneNumber=559135678
  @GET('/v3/FreeLancerInfo/SendSMSResetPassword')
  Future<ApiResponse<String>> sendRestPasswordCode(
    @Query('phoneNumber') String phoneNumber,
  );

  //http://85.184.232.38:8003/api/v3/FreeLancerInfo/ResetPassword
  @POST('/v3/FreeLancerInfo/ResetPassword')
  Future<ApiResponse<bool>> restPasswordByCode(
    @Body() RestPasswordParams phoneNumber,
  );

  @POST('/v3/TransactionMobile/AddTransactionMobileLog')
  Future<ApiResponse<bool>> sendLog(@Body() LoggerParams params);

  /// absencenotice
  @GET('/v1/EmployeeRequest/GetEmployeeRequest')
  Future<ApiResponse<List<AbsenceDateParams>>> fetchAbsenceDate();

  @POST('/v1/EmployeeRequest/CreateEmpRequest')
  Future<ApiResponse<String>> addAbsenceNotice(
    @Body() AddAbsenceNoticeParams addAbsenceNoticeParams,
  );

  /// activity log
  @GET('/v1/PushNotificationMessag/GetAllMessagePushedByFreelanceInfo')
  Future<ApiResponse<List<NotificationItem>>> fetchActivityLog(
    @Query('StatusId') int statusId,
  );

  @POST('/v3/PushNotificationMessag/ConfirmForJob')
  Future<ApiResponse<String>> confirmActivity(
    @Body() ConfirmActivityParams confirmActivityParams,
  );

  /// favorite addresses
  @GET('/v6/FreelancerFavoriteAddresses/GetFreelancerFavoriteAddresses')
  Future<ApiResponse<List<AddressDto>>> fetchFavoriteAddresses();

  @POST('/v6/FreelancerFavoriteAddresses/AddFreelancerFavoriteAddresses')
  Future<ApiResponse<bool>> addFavoriteAddresses(@Body() AddressDto address);

  @POST('/v6/FreelancerFavoriteAddresses/EditFreelancerFavoriteAddresses')
  Future<ApiResponse<String>> editFavoriteAddresses(@Body() AddressDto address);

  @POST('/v1/FreeLancerInfo/UpdateFreeLancerLocation')
  Future<ApiResponse> addHomeAddress(
    @Body() AddHomeLocationParams addHomeLocation,
  );

  /// advanced filter
  @GET('/v1/OpportunitiesAvailble/GetJobsCompanyByOpp')
  Future<ApiResponse<OffersFilterDataDto>> fetchJobsCompanyByOpp();

  @GET('/v1/City/GetAllCities')
  Future<ApiResponse<List<CityItem>>> fetchAllCities();

  @GET('/v1/Projects/GetListProjectByCompanyIdAndCityId')
  Future<ApiResponse<List<ProjectFiltterDto>>> fetchAllProjects(
    @Query("companyId") int companyId,
    @Query("cityId") int cityId,
  );

  @POST('/v2/OpportunitiesAvailbleV/GetSearchOpportunitiesAvailble')
  Future<ApiResponse<List<JobOfferDto>>> fetchJobsCompanyByOppWithFilter(
    @Body() SearchOpportunitiesAvailableParams params,
  );

  /// attendance
  @GET('/v5/FreeLancerInfo/GetSupportShiftByProject')
  Future<ApiResponse<AttendanceShiftDto>> fetchAvailableShift();

  @GET('/v1/FreeLanceApplyOpportunities/GetCurrentComplementart')
  Future<ApiResponse<AttendanceShiftDto>> fetchCurrentOvertime();

  @POST('/v6/TransactionLogCashift/TransactionLogCashift')
  Future<ApiResponse<String>> registerAttendance(
    @Body() AttendanceQuery params,
  );

  @POST('/v1/FreeLanceApplyOpportunities/StartShiftComplementary')
  Future<ApiResponse<String>> startOvertime(@Body() AttendanceQuery params);

  @POST('/v1/FreeLanceApplyOpportunities/EndShiftComplementary')
  Future<ApiResponse<String>> endOvertime(@Body() AttendanceQuery params);

  //http://85.184.232.38:8003/api/v5/TransactionLogCashift/EmployeeTransactionLog
  @POST('/v5/TransactionLogCashift/EmployeeTransactionLog')
  Future<ApiResponse<List<AttendanceLog>>> fetchAttendanceLog(
    @Body() AttendanceLogQuery query,
  );
  //v1/FreeLanceApplyOpportunities/GetListComplementart
  @GET('/v1/FreeLanceApplyOpportunities/GetListComplementart')
  Future<ApiResponse<List<AttendanceLog>>> fetchOvertimeLog();

  @GET('/v1/FreeLancerInfo/GetViolations')
  Future<ApiResponse<List<Violation>>> fetchViolation();

  @POST('/v1/Dashboard/FreelanceAttendance')
  Future<ApiResponse<String>> autoAttendanceDto(
    @Body() AutoAttendanceDto params,
  );

  /// bail requests
  @GET('/v1/Guarantor/GetRequestGuarantor')
  Future<ApiResponse<List<BailRequestDto>>> fetchBailRequests(
    @Query('type') int type,
  );

  @POST('/v1/Guarantor/ApproveRejectLoans')
  Future<ApiResponse<String>> approveRejectBailRequest(
    @Body() ApproveRejectBailParams params,
  );

  @GET('/v2/TermsAndCondtion/GetLoanTermandCondition')
  Future<ApiResponse<List<BailTermAndConditionDto>>>
  fetchBailTermsAndConditions();

  /// Bank
  @GET('/v1/Bank/GetAllBank')
  Future<ApiResponse<List<Bank>>> getAllBank();

  @GET('/v1/ProviderPhoneCash/GetListProvider')
  Future<ApiResponse<List<WalletProviderItem>>> getElectronicWalletProviders();

  @GET('/v1/TermsAndCondtionOfBank/GetTermsAndCondtionOfBank')
  Future<ApiResponse<List<String>>> fetchDisclosure();
  //v2/VerifyCode/CheckCodeByFreeLance
  @POST('/v1/FreelanceBankInfo/AddFreeLanceBankInfo')
  Future<ApiResponse<int>> addFreeLanceBankInfo(
    @Body() AddBankInfoParams bankInfoParams,
  );

  @POST('/v1/ProviderPhoneCashDetails/AddFreeLanceProvider')
  Future<ApiResponse<int>> addElectronicWallet(
    @Body() AddElectronicWalletParams params,
  );

  @POST('/v3/FreeLanceCollected/CollectedFreeLancerMoneyByBank')
  Future<ApiResponse<String>> withDrawFreeLanceMoney(
    @Body() WithDrawParams params,
  );

  @GET('/v1/FreelanceBankInfo/GetFreeLanceBankInfo')
  Future<ApiResponse<BankAccountInfo>> getFreeLanceBankInfo();

  @GET('/v1/ProviderPhoneCashDetails/GetFreeLanceProvider')
  Future<ApiResponse<List<ElectronicWallet>>> getElectronicWallets();

  /// Collect Cash
  @GET('/v2/FreeLanceCollected/GetCollectedandNonCollectedFreeLaceForMob')
  Future<ApiResponse<List<DuesItem>>> fetchCollectedAndNonCollectedJobs(
    @Query('StatusId') int statusId,
  );

  @GET('/v3/FreeLanceCollected/GetCollectedFreeLaceByProjectForMob')
  Future<ApiResponse<List<JobCash>>> fetchWallet();

  @GET('/v4/FreeLanceCollected/AssignRandomNumbertoUserForMob')
  Future<ApiResponse<String>> generateReceiveCashCode(
    @Query('Id') int id,
    @Query('Type') int type,
  );

  @GET('/v4/ResponsiblePersonCasher/GetResponsiblePersonCasherByFreeLance')
  Future<ApiResponse<List<Cashier>>> fetchCashierList(
    @Query('ComapnyId') int id,
  );

  /// Evaluation
  @GET('/v1/Evaluations/GetCompanyEvaluations/{transactionId}')
  Future<ApiResponse<List<EvaluationItem>>> fetchEvaluationItems(
    @Path('transactionId') int transactionId,
  );
  //v2/VerifyCode/CheckCodeByFreeLance
  @POST('/v1/Evaluations/SaveCompanyEvaluations/{transactionId}')
  Future<ApiResponse<bool>> saveEvaluations(
    @Body() EvulationParamsDto evaluations,
    @Path('transactionId') int transactionId,
  );

  /// FavoriteProjects
  @GET('/v1/FavourateProjects/GetFavourateProjectsByFreeLance')
  Future<ApiResponse<List<FavoriteProject>>> fetchFavoriteProjects();

  @GET('/v1/Projects/GetProjctByCity')
  Future<ApiResponse<List<ProjectDto>>> fetchProjects();

  @POST('/v1/FavourateProjects/AddEditFavourateProjects')
  Future<ApiResponse<bool>> addFavoriteProjects(@Body() List<int> favorites);

  /// Home
  @GET('/v1/MobileAppVersion/GetMobileAppVeriosn')
  Future<ApiResponse<AppVersion>> fetchAppVersion();

  @POST('/v6/TransactionLogCashift/TransactionLogCashiftOffLine')
  Future<ApiResponse<String>> attendanceCashiftOffLine(
    @Body() List<AttendanceOfflineQuery> attendanceOfflineQuery,
  );

  @GET('/v7/OpportunitiesAvailble/GetAllOpportunitiesAvailble')
  Future<ApiResponse<List<JobOfferDto>>> fetchOpportunities();

  @GET('/v6/OpportunitiesAvailble/GetVIPJob')
  Future<ApiResponse<List<JobOfferDto>>> fetchVIPOpportunities();

  @GET('/v6/OpportunitiesAvailble/GetSpecialOfferJob')
  Future<ApiResponse<List<JobOfferDto>>> fetchSepcialOpportunities();

  @GET(
    '/v6/OpportunitiesAvailble/GetFavourateOpportunitiesAvailbleandLastMinutesWithLogoForMob',
  )
  Future<ApiResponse<List<JobOfferDto>>> fetchFavoritesOpportunities();

  @GET(
    '/v6/OpportunitiesAvailbleV/GetAllOpportunitiesAvailbleWithoutLoginForMob',
  )
  Future<ApiResponse<List<JobOfferDto>>> fetchOpportunitiesUnAuth();

  @GET(
    '/v2/OpportunitiesAvailbleV/CheckFreeLanceApplyOpportunityAvailbleByIdForMob',
  )
  Future<ApiResponse<String>> applyJob(@Query('Id') int id);

  /// JobOffers
  @GET(
    '/v5/FreeLanceApplyOpportunities/GetAllFreeLanceApplyOpportunitiesForStartForMob',
  )
  Future<ApiResponse<List<AppliedOfferDto>>> fetchAppliedOpportunities(
    @Query('statusId') int statusId,
  );

  @POST('/v3/FreeLanceApplyOpportunities/StartFreeLanceWork')
  Future<ApiResponse<String>> startShift(@Body() StartShiftParams shiftParams);

  @POST('/v3/FreeLanceApplyOpportunities/EndFreeLanceWork')
  Future<ApiResponse<String>> finishShift(@Body() EndShiftParams shiftParams);

  @GET(
    '/v4/FreeLanceApplyOpportunities/GetCurrentFreeLanceApplyOpportunitiesForMob',
  )
  Future<ApiResponse<AppliedOfferDto>> fetchCurrentShift();

  @GET('/v6/OpportunitiesAvailble/GetOpportuntyAvalibleDetailsById')
  Future<ApiResponse<JobDetailsDto>> fetchOpportunityDetails(
    @Query('Id') String id,
  );

  @GET('/v5/TermsAndCondtion/GetTermandConditionByOpportunityId')
  Future<ApiResponse<JobTerms>> fetchTermsAndConditionByCompanyId(
    @Query('Id') String id,
  );

  @GET('/v2/CompleteFreeLanceInfoByCompany/AddRequestToCompleteJobByFreeLance')
  Future<ApiResponse<InterviewInfo>> requestToJobInterview(
    @Query('CompanyId') String companyId,
  );

  @GET('/v1/FavourateProjects/CheckFavourateProjectsByFreeLance')
  Future<ApiResponse<bool>> fetchSelectedFavoriteProjectsStatus();

  @GET('/v1/FreelanceBankInfo/CheckFreeLanceHaveBankInfo')
  Future<ApiResponse<bool>> checkFreeLanceHaveBankInfo();

  @GET('/v1/FreeLanceApplyOpportunities/GetOpportuntyStartSoonByFreeLanceId')
  Future<ApiResponse<AppliedOfferDto>> fetchStartSoonShift();

  @POST('/v1/FreeLanceApplyOpportunities/RejectJobWithDescription')
  Future<ApiResponse<bool>> cancelShift(@Body() CancelShiftParams params);

  @GET('/v3/Dashboard/GetDashBoardLog')
  Future<ApiResponse<List<InAppRequiredTask>>> fetchInAppRequiredTasks();

  @GET('/v2/JobOffers/GetJobOffers')
  Future<ApiResponse<List<JobOfferSliderDto>>> fetchJobOffersSliders();

  @GET('/v1/FreeLanceApplyJobOffers/AddFreeLanceOffer')
  Future<ApiResponse<String>> addFreeLanceOffer(@Query('OfferId') int id);

  @GET('/v1/ClearanceCertificate/UpdateFreelanceClearanceCertificate')
  Future<ApiResponse<String>> confirmRequiredTask(@Query('type') int type);

  @GET('/v1/Dashboard/DashBoardAction')
  Future<ApiResponse<String>> confirmDashBoardAction(
    @Query('type') String? type,
    @Query('objectData') String? objectData,
  );

  @GET('/v1/CertificateJobPayments/CheckCertificateJob')
  Future<ApiResponse<CheckWorkingDocumentDto>> checkCertificateJob(
    @Query('Id') int? JobId,
  );

  @GET('/v1/OpportunitiesAvailble/ApologyTerms')
  Future<ApiResponse<CancelOpportunityApologizingDto>>
  fetchCancelOpportunityApologizingData(
    @Query('freeLanceApplyOpportunityId') int? id,
  );

  /// LoansRequest
  @GET('/v1/Loans/GetLoanFreeLaceHousing')
  Future<ApiResponse<List<LoanRequestDto>>> fetchLoansRequests(
    @Query('type') int type,
  );

  @POST('/v1/Loans/AddNewLoans')
  Future<ApiResponse<String>> addNewLoanRequest(
    @Body() AddLoanRequestParams params,
  );

  @GET('/v1/Loans/GetLoans')
  Future<ApiResponse<List<LoanTypeDto>>> fetchLoansTypes();
  @GET('/v1/Loans/GetLoansTypeById')
  Future<ApiResponse<LoanNumMonthConditionDto>> fetchLoanNumMonthsConditions(
    @Query('Id') int id,
  );

  @GET('/v1/FreeLancerInfo/GetNamedByIdNumberForLoans')
  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumberForLoan(
    @Query('IdNumber') String idNumber,
  );

  @GET('/v1/FreeLancerInfo/GetNamedByIdNumber')
  Future<ApiResponse<NameByIdNumber>> fetchNamedByIdNumber(
    @Query('IdNumber') String idNumber,
  );

  /// NotificationOffers
  @POST('/v1/OpportunitiesAvailble/GetOpporuntyByNotification')
  Future<ApiResponse<List<JobOfferDto>>> fetchNotificationOffers(
    @Body() NotificationOfferParams params,
  );

  /// Profile
  @GET('/v3/FreeLancerInfo/DeleteFreeLanceInfoProfile')
  Future<ApiResponse<bool>> deleteAccount();

  @GET('/v1/FeatureInApp/GetFeatureApp')
  Future<ApiResponse<List<FeatureAppDto>>> getAppFeatures();
  /*
  @POST('/UserProfile/ChangePassword')
  Future<ApiResponseNoPayload> changePassword(@Body() ChangePasswordParams changePasswordParams);
*/

  @MultiPart()
  @POST('/v1/FreeLancerInfo/UploadFreelancerProfileImage')
  Future<ApiResponse<String>> uploadProfilePhoto(
    @Part(name: 'ProfileImage') File image,
  );

  @POST('/v1/FreeLancerInfo/UpdatePasswordFreelancer')
  Future<ApiResponse> updatePassword(
    @Body() ChangePasswordParams updatePasswordParams,
  );

  @GET('/v4/FreeLancerInfo/ChecklogOut')
  Future<ApiResponse> checkLogout();

  @GET('/v1/FreeLancerInfo/DownLoadFaceRecognition')
  Future<ApiResponse<RemoteFile>> downloadFaceRecognition();

  @MultiPart()
  @POST('/v1/FreeLancerInfo/UpdateFaceRecognition')
  Future<ApiResponse<String>> uploadFaceRecognition(
    @Part(name: 'files') File files,
  );

  @MultiPart()
  @POST('/v1/FreeLancerInfo/FakeFaceRecognition')
  Future<ApiResponse<String>> uploadFakeFaceRecognition(
    @Part(name: 'files') File files,
  );

  /// Resume

  @POST('/v5/FreeLancerInfo/UpdateFreeLancerCV')
  Future<ApiResponse<bool>> updateResume(
    @Body() UpdateResumeParams updateResumeParams,
  );

  @GET('/v6/FreeLancerInfo/GetFreeLanceLoginCV')
  Future<ApiResponse<Resume>> fetchResume();

  //v1/FreeLancerInfo/GetAllLevels
  @GET('/v1/FreeLancerInfo/GetAllLevels')
  Future<ApiResponse<List<LevelItem>>> fetchLevels();

  @GET('/v1/District/GetDistrictByCityId')
  Future<ApiResponse<List<DistrictItem>>> fetchDistricts(
    @Query('cityId') int cityId,
  );

  @GET('/v2/FreeLancerInfoV/GetAllEducationalQualification')
  Future<ApiResponse<List<LevelItem>>> getAllEducationalQualification();

  ///api/v2/FreeLancerInfoV/GetAllQualificationName
  @GET('/v2/FreeLancerInfoV/GetAllQualificationName')
  Future<ApiResponse<List<String>>> getAllQualificationName();

  @GET('/v2/FreeLancerInfoV/GetAllCurrentSituation')
  Future<ApiResponse<List<LevelItem>>> getAllCurrentSituation();

  ///api/v2/FreeLancerInfoV/GetAllQualificationName
  @GET('/v1/FreeLancerInfoV/GetAllQualificationName')
  Future<ApiResponse<List<String>>> fetchQualificationsName();
  //api/v1/Jobs/GetJobByGender
  @GET('/v1/Jobs/GetJobByGender')
  Future<ApiResponse<List<JobItem>>> fetchJobs(@Query('gender') bool gender);

  @GET('/v1/FavouriteTimeWork/GetFavouriteTimeWork')
  Future<ApiResponse<List<FavoriteTime>>> fetchFavouriteTimeWork();

  @GET('/v1/JobSkills/GetJobSkills')
  Future<ApiResponse<List<JobSkills>>> fetchJobSkills(
    @Query('JobId') int jobId,
  );

  /// SalaryDefinitionRequest
  @GET('/v1/EmployeeRequest/GetEmployeeSalaryDefinition')
  Future<ApiResponse<List<SalaryDefinitionRequestDto>>>
  fetchSalaryDefinitionRequest(@Query('type') int type);

  @POST('/v1/EmployeeRequest/CreateEmployeeSalaryDefinition')
  Future<ApiResponse<String>> addSalaryDefinition(
    @Body() AddSalaryDefinitionRequestPrams query,
  );

  @GET('/v1/EmployeeRequest/GetTypeOfCommerce')
  Future<ApiResponse<List<TypeOfCommerce>>> fetchTypeOFCommerce();

  @GET('/v1/EmployeeRequest/DownLoadSalaryDefinition')
  Future<ApiResponse<DownLoadFileDto>> downLoadSalaryDefinition(
    @Query('id') String id,
    @Query('type') String type,
  );

  @GET('/v1/EmployeeRequest/GetResonSalary')
  Future<ApiResponse<List<ReasonSalaryDefinitionRequestDto>>>
  fetchReasonSalaryDefinitionRequest();

  /// Services
  @GET('/v2/CategoryServices/GetCategoryServices')
  Future<ApiResponse<List<ServiceModel>>> fetchService(
    @Query("isAdmin") bool isAdmin,
  );

  /// PublicTermsAndCondition
  @GET('/v2/TermsAndCondtion/GetPublicTermandCondition')
  Future<ApiResponse<List<TermsItem>>> fetchPublicTermsAndCondition();

  /// Overview

  @GET('/v1/ExchangeMethods/GetExchangeMethod')
  Future<ApiResponse<List<WithdrawMethod>>> getWithdrawMethods();

  @POST('/v3/FreeLanceCollected/CollectedFreeLancerMoneyByProvider')
  Future<ApiResponse<String>> withdrawByPhoneWallet(
    @Body() WithdrawByPhoneWalletParams params,
  );

  @POST('/v2/TranserHead/TransferOneToOne')
  Future<ApiResponse<String>> withdrawToAnotherAccount(
    @Body() WithdrawToAnotherAccountParams params,
  );

  //http://85.184.232.38:8003/api/v1/FreeLanceApplyOpportunities/GetCompanyBalanceByFreeLance?StatusId=2
  @GET('/v1/FreeLanceApplyOpportunities/GetCompanyBalanceByFreeLance')
  Future<ApiResponse<List<WalletBalanceItem>>> fetchWalletBalances(
    @Query('StatusId') int statusId,
  );

  @GET('/v1/ExchangeMethodCompany/GetCompanyByExchange')
  Future<ApiResponse<List<WalletBalanceItem>>>
  fetchAvailableCompaniesForWithdrawMethod(@Query('ExchangeId') int id);

  @GET('/v1/ExchangeMethodCompany/GetExchangeByCompany')
  Future<ApiResponse<List<WithdrawMethod>>>
  fetchAvailableWithdrawMethodsForCompany(@Query('CompanyId') int id);

  @GET('/v1/FreeLanceApplyOpportunities/GetCurrentBalanceByFreeLance')
  Future<ApiResponse<CurrentBalance>> fetchCurrentBalance();

  @POST('/v2/FreeLanceApplyOpportunities/GetApplyDetails')
  Future<ApiResponse<List<ApplyDetails>>> fetchApplyDetails(
    @Body() BalanceDetailsQuery query,
  );

  @POST('/v1/FreeLanceApplyOpportunities/CancelTransactionInderTransfer')
  Future<ApiResponse<String>> cancelTransaction(
    @Body() CancelTransactionParams params,
  );

  @POST('/v1/ExchangeMethodCompany/GetBalacnceByExchange')
  Future<ApiResponse<WithdrawData>> getWithdrawData(
    @Body() BalanceByExchangeParams params,
  );

  @GET('/v1/FreeLanceApplyFocusPoint/GetFocusPointFreeLanceInfo')
  Future<ApiResponse<FocusPointInfoDto>> fetchFocusPointFreeLanceInfo();

  @GET('/v1/FreeLanceApplyFocusPoint/GetFreelanceApplyFocusPoint')
  Future<ApiResponse<List<WorkerWorkPlaceDto>>> fetchFocusPointsGates();

  @POST('/v1/FreeLanceApplyFocusPoint/StartAttendanceFocusPoint')
  Future<ApiResponse<String>> startAttendanceFocusPoint(
    @Body() StartAttendanceFocusPointParams params,
  );

  @POST('/v1/FreeLanceApplyFocusPoint/EndAttendanceFocusPoint')
  Future<ApiResponse<String>> endAttendanceFocusPoint(
    @Body() StartAttendanceFocusPointParams params,
  );

  @GET('/v1/FocusPointsDeviceSetting/GetDeviceByFocusPoint')
  Future<ApiResponse<DeviceByFocusPointDto>> fetchDevicesByFocusPoint(
    @Query('FocusPointId') int focusPointId,
  );

  @GET('/v1/FocusPointsDeviceSetting/GetDeviceSettingFocusPoint')
  Future<ApiResponse<DeviceSettingFocusPointDto>>
  fetchDevicesSettingFocusPoint();

  @MultiPart()
  @POST('/v1/FocusPointsReceivedDevices/AddFocusPointsReceivedDevices')
  Future<ApiResponse<String>> addFocusPointsReceivedDevices(
    @Part(name: 'vM') List<AddFocusPointsReceivedDevicesParams> params,
  );

  /// AttendanceNotification
  @GET('/v1/AttendanceNotifi/GetAllAttendanceNotifications')
  Future<ApiResponse<List<AttendanceNotifiActionDto>>>
  fetchAttendanceNotifications();
  @GET('/v1/AttendanceNotifiType/GetAllAttendanceNotifiTypes')
  Future<ApiResponse<List<AttendanceNotifiTypeDto>>> fetchAttendanceType();

  @POST('/v1/AttendanceNotifi/AddAttendanceNotification')
  Future<ApiResponse> addAttendanceNotifications(
    @Body() AddAttendanceNotificationsPrams addAttendanceNotificationsPrams,
  );

  /// EmployeesCertificates
  @GET('/v1/ClearanceCertificate/GetClearnceByFreelanceId')
  Future<ApiResponse<List<EmployeeCertificateDto>>>
  fetchEmployeesCertificates();

  @GET('/v1/ClearanceCertificate/DownLoadClearanceCertificateForMob')
  Future<ApiResponse<DownLoadFileDto>> downLoadEmployeeCertificate(
    @Query('Id') int id,
  );

  /// PledgeGeneralization
  @GET('/v1/ClearanceCertificate/GetClearanceByType')
  Future<ApiResponse<List<PledgeGeneralizationDto>>>
  fetchPledgesAndGeneralization(@Query('type') int type);

  @GET('/v1/ClearanceCertificate/UpdateClearance')
  Future<ApiResponse<String>> resetPledgesAndGeneralization(
    @Query('Id') int id,
  );

  /// ReceiveVehicle
  @GET('/v2/Vehicles/GetVehicleByCode')
  Future<ApiResponse<VehicleDetailsDto>> fetchVehicleByCode(
    @Query("code") String code,
  );

  @GET('/v1/VehicleComponents/GetAllVehicleComponents')
  Future<ApiResponse<List<VehicleComponentsDto>>> fetchVehicleComponents();

  @GET('/v1/Custodies/GetAllCustodiesByVehicleId')
  Future<ApiResponse<List<VehicleComponentsDto>>> fetchVehicleCustodies(
    @Query("vehicleId") int vehicleId,
  );

  @POST('/v2/VehicleHandovers/GetAllVehiclesHandoversByType')
  Future<ApiResponse<ReceiveVehicleDto>> fetchReceiveVehicle(
    @Body() ReceiveVehiclePrams receiveVehiclePrams,
  );

  @POST('/v1/VehicleHandovers/CreateVehicleHandover')
  Future<ApiResponse<CreateVehicleHandoverDto>> createVehicleHandover(
    @Body() CreateVehicleHandoverPrams createVehicleHandoverPrams,
  );

  @MultiPart()
  @POST('/v1/VehicleComponentsHandovers/AddTrueVehicleComponentsHandover')
  Future<ApiResponse> addImageAndDescriptionsComponents(
    @Queries()
    AddImageAndDescriptionsComponentsPrams
    addImageAndDescriptionsComponentsPrams, {
    @Part(name: 'AttachmentFile') File? file,
  });

  @MultiPart()
  @POST('/v1/VehicleCustodyHandovers/AddTrueVehicleCustodiesHandover')
  Future<ApiResponse> addImageAndDescriptionsCustodies(
    @Queries()
    AddImageAndDescriptionsComponentsPrams
    addImageAndDescriptionsComponentsPrams, {
    @Part(name: 'AttachmentFile') File? file,
  });

  @POST('/v1/VehicleComponentsHandovers/AddFalseVehicleComponentsHandover')
  Future<ApiResponse> addComponents(
    @Body() AddComponentsPrams addComponentsPrams,
  );

  @POST('/v1/VehicleCustodyHandovers/AddFalseVehicleCustodiesHandover')
  Future<ApiResponse> addCustodies(@Body() AddCustodiesPrams addCustodiesPrams);

  /// Violations
  @GET('/v3/ViolationsFreelance/GetViolationByFreelanceApply')
  Future<ApiResponse<ViolationsUserDataDto>> fetchViolationsData(
    @Query('type') int type,
  );

  @POST('/v1/ViolationsFreelance/ApproveRejectViolationApply')
  Future<ApiResponse<String>> approveRejectViolation(
    @Body() ApproveRejectViolationParams params,
  );

  @GET('/v1/HazardOperation/GetAllHazardOperation')
  Future<ApiResponse<List<WorkHazardDto>>> fetchWorkHazards();

  @POST('/v1/HazardOperation/GetHazardOperationById')
  Future<ApiResponse<WorkHazardDto>> fetchWorkHazardDetails(
    @Query('Id') int id,
  );

  @GET('/v1/HazardType/GetAllHazardTypes')
  Future<ApiResponse<List<CommonListItemDto>>> fetchWorkHazardsTypes();

  @GET('/v1/HazardPriorityLevel/GetAllHazardPriorityLevels')
  Future<ApiResponse<List<CommonListItemDto>>> fetchHazardPriorityLevels();

  @GET('/v1/HazardTypeInstructions/GetAllHazardTypeInstructionsByTypeId')
  Future<ApiResponse<List<CommonListItemDto>>>
  fetchHazardTypeInstructionsByTypeId(@Query('typeId') int typeId);

  @POST('/v1/HazardOperation/AddEditHazardOperation')
  Future<ApiResponse<WorkHazardDto>> addWorkHazard(
    @Body() AddWorkHazardParams params,
  );

  @MultiPart()
  @POST('/v1/HazardDocument/AddHazardDocuments')
  Future<ApiResponse> uploadWorkHazardFiles(
    @Query('HazardId') int? id,
    @Part(name: 'AttachmentFiles') List<File> files,
  );

  @GET('/v1/CertificateBenefits/GetCertificateBenefits')
  Future<ApiResponse<WorkingDocumentDto>> fetchWorkingDocumentData(
    @Query('JobId') int JobId,
  );

  @GET('/v1/InstallmentConfig/GetInstallmentDetails')
  Future<ApiResponse<List<InstallmentWithCashiftDto>>>
  fetchInstallmentWithCashiftData(@Query('paymentId') int paymentId);

  @GET('/v1/CertificateJobPayments/AddInstallmentCertificate')
  Future<ApiResponse<String>> addInstallmentWithCashift(
    @Query('InstallmentId') int InstallmentId,
  );

  @GET(
    '/v1/TermandConditionCertificatePayments/GetTermandConditionCertificatePayments',
  )
  Future<ApiResponse<List<TermConditionCertificatePaymentDto>>>
  fetchTermsConditionsCertificatePayment(@Query('paymentId') int paymentId);

  @GET('/v1/CertificateJobPayments/AddPaymentCertificateDescription')
  Future<ApiResponse<String>> saveInstallmentPostponement(
    @Query('paymentId') int? paymentId,
    @Query('Description') String? description,
  );

  @GET('/v1/VehiclesZone/GetAllFreeLancerVehiclesZones')
  Future<ApiResponse<List<CommonListItemDto>>>
  fetchAllFreeLancerVehiclesZones();

  @GET('/v1/RoundType/GetAllRoundTypesForTripDropDown')
  Future<ApiResponse<List<CommonListItemDto>>> fetchAllRoundTypes();

  @GET(
    '/v1/RoundTypeTermsAndCondation/GetRoundTypeTermsAndCondationsByRoundTypeId',
  )
  Future<ApiResponse<List<RoundTypeTermsAndConditionDto>>>
  fetchRoundTypeTermsAndCondition(@Query('RoundTypeId') int roundTypeId);

  @POST('/v1/RoundTrip/AddRoundTrip')
  Future<ApiResponse> addRoundTrip(@Body() AddRoundTripParams params);

  @POST('/v1/RoundTrip/EndRoundTrip')
  Future<ApiResponse> endRoundTrip(@Query('TripId') int tripId);

  @GET('/v2/RoundTrip/GetCurrentTrip')
  Future<ApiResponse<CurrentRoundTripDto>> fetchCurrentTrip();

  @POST('/v1/RoundTripDetails/AddRoundTripDetails')
  Future<ApiResponse> addRoundTripDetails(
    @Body() AddRoundTripDetailsParams params,
  );

  @GET('/v1/RoundTripDetails/GetRoundTRipDetailsByTripId')
  Future<ApiResponse<List<RoundTripDetailsDto>>> fetchRoundTripDetails(
    @Query('RoundTripId') int roundTripId,
  );

  @GET('/v1/ContractViolation/GetAllContractViolationByRoundTrip')
  Future<ApiResponse<ContractViolationDataDto>> fetchRoundViolation(
    @Query('roundTripId') int roundTripId,
  );

  @GET('/v1/FaultsMaintenance/GetAllFaultsMaintenanceByRoundTrip')
  Future<ApiResponse<MaintenanceDataDto>> fetchRoundsMaintenance(
    @Query('roundTripId') int roundTripId,
  );

  //  request
  @GET('/v1/CashifterRequests/GetAllCashifterRequests')
  Future<ApiResponse<List<RequestsUserDto>>> fetchRequestsUser();

  @GET(
    '/v1/CashifterRequestsTermsAndConditions/GetAllCashifterRequestTermsAndConditionsByTypeAndStatus',
  )
  Future<ApiResponse<List<TermsAndConditionsRequestsDto>>>
  fetchTermsAndConditionsRequests(
    @Queries() TermsAndConditionsRequestsPrams termsAndConditionsRequestsPrams,
  );

  @GET('/v1/CashifterRequestTypes/GetAllCashifterRequestTypes')
  Future<ApiResponse<List<ShiftRquestTypeDto>>> fetchRequestsUserType();

  @POST('/v1/CashifterRequests/CreateCashifterRequestToVerify')
  Future<ApiResponse> addRequest(@Body() AddRequestPrams params);

  @POST('/v1/CashifterRequests/VerifyCashifterPhoneNumber')
  Future<ApiResponse> confirmRequest(
    @Queries() ConfirmRequesPrams confirmRequesPrams,
  );

  @MultiPart()
  @POST('/v1/CashifterRequests/CreateOrUpdateCashifterRequest')
  Future<ApiResponse> addFileRequest(
    @Queries() UploadFileRequestPrams uploadFileRequestPrams,
    @Part(name: 'AttachmentDocument') File file,
  );

  // ChashiftLons

  @GET('/v1/CashiftLoanByFreelanceDetails/GetTotalLoans')
  Future<ApiResponse<TabsAndTotalLoansDto>> fetchTabsAndTotalLoans(
    @Query("isAdmin") bool isAdmin,
  );
  @GET('/v1/CashiftLoanByFreelanceDetails/GetAllLoans')
  Future<ApiResponse<List<LoanDataDto>>> fetchLoans(
    @Query("isAdmin") bool isAdmin,
    @Query("status") int status,
  );
  @GET('/v1/VehicleHandovers/GetVehicleHandoverDetailsById')
  Future<ApiResponse<ReceiveVehicleDetailsDto>> fetchReceiveVehicleDetails(
    @Query('id') int id,
  );

  @GET('/v1/RoundTrip/GetFillingStationsByRoundTripId')
  Future<ApiResponse<List<GasStationTripDto>>> fetchGasStationTrip(
    @Query('RoundId') int roundId,
  );

  @POST('/v1/VehicleHandovers/ConfirmVehicleHandover')
  Future<ApiResponse> confirmRejectReceiveVehicle(
    @Body() ConfirmReceiveVehicleParams params,
  );

  @POST('/v1/RoundTripDetails/AddRoundTripFillStationDetails')
  Future<ApiResponse> addRoundTripFillStation(
    @Body() AddRoundTripFillStationPrams params,
  );

  @MultiPart()
  @POST('/v1/VehicleHandoverImages/AddVehicleHandoverImages')
  Future<ApiResponse> addVehicleHandoverImages(@Body() FormData params);

  @POST('/v1/VehicleEventsTypes/GetVehicleGPSDetails')
  Future<ApiResponse<VehiclePerformanceDto>> fetchVehiclePerformance(
    @Query('vehicleHandoverId') int id,
  );

  @GET('/v1/VehicleEventsTypes/GetAllVehicleEvents')
  Future<ApiResponse<DriverViolationDto>> fetchDriverViolations(
    @Query('vehicleHandoverId') int id,
  );

  @GET('/v1/VehicleEventsTypes/DownloadVehicleEventPicture')
  Future<ApiResponse<String>> downloadVehicleViolationPicture(
    @Queries() DownloadVehicleViolationPictureParams params,
  );

  ////  transactions
  @POST('/v1/CashifterTasks/GetAllCashifterTasksByStatus')
  Future<ApiResponse<List<TransactionsDto>>> fetchTransactions(
    @Part(name: 'Status') String? status,
    @Part(name: 'EndDateTime') String? endDateTime,
    @Part(name: 'StartDateTime') String? startDateTime,
    @Part(name: 'SearchString') String? searchString,
  );

  @POST('/v1/CashifterTasks/AddNewCashifterTask')
  Future<ApiResponse> addTransactions(@Body() AddTransactionsPrams prams);

  @POST('/v1/CashifterTasks/FinishCashifterTask')
  Future<ApiResponse> updateTransactions(@Body() UpdateTransactionsPrams prams);

  @POST('/v1/CashifterTasks/RescheduleCashifterTask')
  Future<ApiResponse> rescheduleTransactions(
    @Body() RescheduleTransactionsPrams prams,
  );
}
