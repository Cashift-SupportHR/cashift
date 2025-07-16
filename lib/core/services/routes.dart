import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/employees_opportunities/pages/employees_opportunities_page.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import 'package:shiftapp/presentation/adminFeatures/areapolygones/presentation/polygonsmap/pages/draw_polygon_page.dart';
import 'package:shiftapp/presentation/adminFeatures/banEmployees/presentation/banEmployeeDetails/pages/ban_employee_details_page.dart';
import 'package:shiftapp/presentation/adminFeatures/banEmployees/presentation/banEmployees/pages/ban_employees_page.dart';
import 'package:shiftapp/presentation/adminFeatures/classification/presentation/addClassification/pages/add_classification_page.dart';
import 'package:shiftapp/presentation/adminFeatures/classification/presentation/classification/pages/classification_tabs.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentOfficials/presentation/addEmploymentOfficial/pages/add_employment_official_page.dart';
import 'package:shiftapp/presentation/adminFeatures/employmentOfficials/presentation/employmentOfficials/pages/employment_officials_page.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/edit/edit_focus_point_data_page.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/trackingFocusPoints/pages/tracking_focus_points_page.dart';
import 'package:shiftapp/presentation/adminFeatures/jobRequirements/presentation/pages/job_requirements_page.dart';
import 'package:shiftapp/presentation/adminFeatures/maintenanceAndBreakdowns/presentation/add_maintenance_breakdowns/pages/add_maintenance_breakdowns_page.dart';
import 'package:shiftapp/presentation/adminFeatures/opportunity_details/pages/opportunity_details_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/main_add_new_project_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/addAdditionalLocations/add_additional_locations_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/addProject/add_new_project_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/periodPricing/period_pricing_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/projectSuccessfullyPage/pages/project_successfully_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/projectSuccessfullyPage/pages/show_qr_code_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/workingPeriodsProject/working_periods_project_page.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/projectsManagement/pages/projects_management_page.dart';
import 'package:shiftapp/presentation/adminFeatures/punishments/presentation/addPunishment/pages/add_punishment_page.dart';
import 'package:shiftapp/presentation/adminFeatures/punishments/presentation/punishments/pages/punishments_tabs.dart';
import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/termsAndConditions/view/pages/terms_and_conditions_page.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/addNewUser/pages/add_new_user_page.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/changeUserPassword/pages/change_user_password_page.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/usersManagement/pages/users_management_tabs.dart';
import 'package:shiftapp/presentation/presentationUser/absencenotice/page/absence_notice_page.dart';
import 'package:shiftapp/presentation/presentationUser/activity_log/pages/activitylog_tabs_page.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/appliedoffers_pages.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/qrcode_screen.dart';
import 'package:shiftapp/presentation/presentationUser/bail_requests/pages/bail_requests_tabs.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/cashier/cashier_page.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/collect_cash_page.dart';
import 'package:shiftapp/presentation/presentationUser/copyrights/monthly_copy_rights.dart';
import 'package:shiftapp/presentation/presentationUser/currentshift/pages/currentshift_page.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/presentation/employeeCertificateDetails/pages/employee_certificate_details_page.dart';
import 'package:shiftapp/presentation/presentationUser/employeesCertificates/presentation/employeesCertificates/pages/employees_certificates_page.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/job_offer_details/job_offer_details_page.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/jobs_list/jobs_list_page.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/terms_conditions/job_terms_condition_page.dart';
import 'package:shiftapp/presentation/presentationUser/loan_requests/add_new_loan_request/pages/add_loan_request_page.dart';
import 'package:shiftapp/presentation/presentationUser/loan_requests/loan_requests/pages/loan_requests_tabs.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/locationservice.dart';
import 'package:shiftapp/presentation/presentationUser/profile/index.dart';
import 'package:shiftapp/presentation/presentationUser/rate/pages/rate_page.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/resume_pages.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/newrequest/pages/salary_definition_request_page.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/pages/salary_definition_requests_tabs_page.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/view/screen/receive_vehicles_page.dart';

import 'package:shiftapp/presentation/presentationUser/verification/pages/Verification_page.dart';
import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/phone_wallets/pages/phone_wallets_page.dart';
import 'package:shiftapp/presentation/presentationUser/workerWorkPlaces/pages/worker_work_places_page.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/pay_with_salary/pages/pay_with_salary_page.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/terms_conditions_certificate_payment/pages/terms_conditions_certificate_payment_page.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/workingDocument/pages/working_document_page.dart';
import 'package:shiftapp/presentation/shared/splash/landingPage/landing_page.dart';
import 'package:shiftapp/presentation/shared/splash/splash_page.dart';

import '../../presentation/adminFeatures/areapolygones/presentation/filter/pages/filter_vehicles_zone_page.dart';
import '../../presentation/adminFeatures/areapolygones/presentation/add/main_add_vehicle_zone_page.dart';
import '../../presentation/adminFeatures/areapolygones/presentation/add/pages/add_info_vehicle_zone_page.dart';
import '../../presentation/adminFeatures/areapolygones/presentation/add/pages/map_vehicle_zone_page.dart';
import '../../presentation/adminFeatures/areapolygones/presentation/view/pages/vehicles_zone_page.dart';
import '../../presentation/adminFeatures/attendanceNotificationsReports/presentation/pages/screen/page/attendance_notifications_reports_page.dart';
import '../../presentation/adminFeatures/available_opportunities/presentation/opportunities/pages/available_opportunities_page.dart';
import '../../presentation/adminFeatures/cashiftersLoans/presentation/add_cashifter_loan/pages/add_cashifter_loan_page.dart';
import '../../presentation/adminFeatures/cashiftersLoans/presentation/view/pages/cashifters_loans_page.dart';
import '../../presentation/adminFeatures/employeeMap/presentation/pages/search_employee_map_page.dart';
import '../../presentation/adminFeatures/gasStations/presentation/pages/add/screen/add_gas_stations_page.dart';
import '../../presentation/adminFeatures/gasStations/presentation/pages/view/screen/gas_stations_page.dart';
import '../../presentation/adminFeatures/gasStations/presentation/widgets/map_stations_wiget.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/followUpViolations/pages/follow_up_violations_page.dart';
import '../../presentation/adminFeatures/jobUniform/presentation/pages/add_job_uniform_page.dart';
import '../../presentation/adminFeatures/maintenanceAndBreakdowns/presentation/view/pages/maintenance_breakdowns_page.dart';
import '../../presentation/adminFeatures/notifications/presentation/view/pages/notifications_page.dart';
import '../../presentation/adminFeatures/reviewShifts/presentation/pages/review_opportunities_page.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/presentation/details/pages/track_attendance_departure_details_page.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/presentation/add/pages/request_track_attendance_departure_page.dart';
import '../../presentation/adminFeatures/trackAttendanceDeparture/presentation/view/pages/track_attendance_departure_page.dart';
import '../../presentation/adminFeatures/usersRequests/presentation/pages/users_requests_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/vehicleCameras/add/pages/add_vehicle_camera_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/vehicleCameras/cameraSearchResults/pages/camera_search_results_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/vehicleCameras/view/pages/vehicle_cameras_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/vehicleReceiveRequests/pages/vehicle_receive_requests_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/qr_code/vehicle_qr_code_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/violations/add/pages/add_violation_vehicle_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/violations/details/pages/vehicle_violation_details_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/violations/view/pages/vehicle/vehicle_violations_page.dart';
import '../../presentation/presentationUser/profile/addHomeAddress/pages/add_home_address_page.dart';
import '../../presentation/presentationUser/profile/requests/presentation/pages/add/add_file_request/screen/add_file_requests_user_page.dart';
import '../../presentation/presentationUser/profile/requests/presentation/pages/add/add_request/screen/add_requests_user_page.dart';
import '../../presentation/presentationUser/profile/requests/presentation/pages/add/confairm/screen/confirm_requests_user_page.dart';
import '../../presentation/presentationUser/profile/requests/presentation/pages/view/screen/requests_user_page.dart';
import '../../presentation/presentationUser/transactions/presentation/add/pages/add_transactions_page.dart';
import '../../presentation/presentationUser/transactions/presentation/view/pages/transactions_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/currentTourMap/factory_violations/page/factory_violations_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/currentTourMap/maintenance_breakdowns_plane/page/maintenance_breakdowns_plan_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/currentTourMap/view/pages/current_tour_map_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/pages/add/main_receive_vehicle_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/receive_vehicle_details_page.dart';
import '../../presentation/presentationUser/vehiclesOperation/presentation/startTour/pages/start_tour_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/vehicleTracking/pages/vehicles_tracking_page.dart';
 import '../../presentation/shared/check_face_recognation/page/check_face_recognatin_page.dart';
import '../../presentation/shared/components/files/file_view_from_path_pdf.dart';
import '../../presentation/adminFeatures/employees/presentation/addNewEmployees/pages/add/emp_file/widget/file_view_pdf.dart';
import '../../presentation/adminFeatures/employees/presentation/addNewEmployees/pages/add/main_add_emp_page.dart';
import '../../presentation/adminFeatures/employees/presentation/addNewEmployees/pages/view/home_add_employees_page.dart';
import '../../presentation/adminFeatures/employees/presentation/employees/pages/employees_page.dart';
import '../../presentation/adminFeatures/employmentManagement/presentation/employmentManagement/page/employment_management_page.dart';
import '../../presentation/adminFeatures/employmentManagement/presentation/resetMobileNumber/pages/reset_mobile_number_page.dart';
import '../../presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/add_focus_point_page.dart';
import '../../presentation/adminFeatures/focusPoints/presentations/edit/edit_covenant_received_page.dart';
import '../../presentation/adminFeatures/focusPoints/presentations/edit/edit_focus_point_times_page.dart';
import '../../presentation/adminFeatures/focusPoints/presentations/focusPoints/pages/focus_point_page.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/addTypeViolation/pages/add_type_violation_page.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/addViolation/pages/add_general_violation_page.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/details/pages/general_violation_details_page.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/view/pages/general_violations_page.dart';
import '../../presentation/adminFeatures/generalViolations/presentation/viewTypesViolations/pages/general_types_violations_page.dart';
import '../../presentation/adminFeatures/opportunity_details/applied_details/pages/Applicants/applied_page.dart';
import '../../presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/map_project_gates/map_project_gates_page.dart';
 import '../../presentation/adminFeatures/vehicles/presentation/add/main_add_vehicle_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/add/pages/covenantsVehicles/view/covenants_vehicles_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/insurance/add/add_insurance_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/insurance/view/insurance_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/maintenance/add/add_maintenance_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/vehicle/vehicles_page.dart';
import '../../presentation/adminFeatures/vehicles/presentation/view/pages/vehicle_details/vehicles_details_page.dart';
import '../../presentation/adminFeatures/terms_and_conditions/presentation/tasksAndResponsibilities/view/pages/tasks_and_responsibilities_page.dart';
import '../../presentation/presentationUser/AttendanceAndDepartureNotifications/presentation/pages/add/screen/add_attendance_and_departure_notifications_page.dart';
import '../../presentation/presentationUser/AttendanceAndDepartureNotifications/presentation/pages/view/screen/attendance_and_departure_notifications_page.dart';
import '../../presentation/presentationUser/files_preview/pages/files_preview_page.dart';
import '../../presentation/presentationUser/profile/addresess/pages/add_address_page.dart';
import '../../presentation/presentationUser/profile/addresess/pages/addresses_page.dart';
import '../../presentation/presentationUser/appliedoffers/details/applied_offer_details_page.dart';
import '../../presentation/presentationUser/attendance/facerecognation/face_detector_page.dart';
import '../../presentation/presentationUser/attendance/overtimeAttendance/page/overtime_attendance_page.dart';
import '../../presentation/presentationUser/attendance/recordAttendance/pages/cashift_attendance_page.dart';
import '../../presentation/presentationUser/attendance/registerfacerecognition/pages/face_recognition_page.dart';
import '../../presentation/presentationUser/attendance/registerfacerecognition/register_face_recognition_page.dart';
import '../../presentation/presentationUser/attendance/shiftAttendance/pages/attendance_page.dart';
import '../../presentation/presentationUser/chashiftLonsView/presentation/pages/chasift_loans_page.dart';
import '../../presentation/presentationUser/deliveryAndReceipt/pages/delivery_and_receipt_page.dart';
import '../../presentation/presentationUser/favoriteprojects/pages/favorite_projects_page.dart';
import '../../presentation/presentationUser/mainnavigation/wallet/pages/wallet_page.dart';
import '../../presentation/presentationUser/mainnavigation/wallet/user_qrcode/pages/qrcode_page.dart';
import '../../presentation/presentationUser/mainnavigation/wallet/withdraw/pages/withdraw_page.dart';
import '../../presentation/presentationUser/notificationOffers/pages/notification_offers_page.dart';
import '../../presentation/presentationUser/pledgesAndGeneralization/presentation/pages/pledges_and_generalization_tabs.dart';
import '../../presentation/presentationUser/profile/attachment/page/attachment_emp_page.dart';
import '../../presentation/presentationUser/violations/presentation/pages/violations_user_tabs.dart';
import '../../presentation/presentationUser/withdraw_accounts/add_phone_wallet/page/add_phone_wallet_page.dart';
import '../../presentation/presentationUser/withdraw_accounts/bankaccont/pages/bank_account_page.dart';
import '../../presentation/presentationUser/workHazards/presentation/addWorkHazard/pages/add_work_hazard_page.dart';
import '../../presentation/presentationUser/workHazards/presentation/details/pages/work_hazard_details_page.dart';
import '../../presentation/presentationUser/workHazards/presentation/view/pages/work_hazards_page.dart';
import '../../presentation/shared/authorization/forgetpassword/pages/forgetpassword_page.dart';
import '../../presentation/shared/authorization/forgetpassword/pages/resetpassword_page.dart';
import '../../presentation/shared/authorization/login/pages/login_page.dart';
import '../../presentation/shared/authorization/signup/pages/signup_page.dart';
import '../../presentation/shared/home/pages/home_screen.dart';
import '../../presentation/shared/loans/presentation/collectionData/pages/collection_data_page.dart';
import '../../presentation/shared/services/pages/services_page.dart';

class Routes {
  static const splash = '/';
  static const String login = '/login';
  static const String signupPage = '/SignupPage';
  static const String addPhoneWallet = '/AddPhoneWallet';
  static const String phoneWalletsPage = '/PhoneWalletsPage';
  static const String home = '/home';
  static const String profileScreen = '/profileScreen';
  static const String monthlycopyright = "/monthlycopyright";
  static const String noticeAttendance = '/noticeAttendance';
  static const String currentShift = '/cashiftAttendance';
  static const String jobTermsAndConditionPage = '/JobTermsAndConditionPage';
  static const String cashierPage = '/CashierPage';
  static const String jobOfferDetails = '/JobOfferDetailsScreen';
  static const String qrScanner = '/qrscanner';
  static const String activitylog = '/activitylog';
  static const String verificationPage = '/VerificationPage';
  static const String duesPage = '/duesPage';
  static const String walletPage = '/WalletPage';
  static const String favoriteProjectsPage = '/FavoriteProjectsPage';
  static const String jobsListPage = '/JobsListPage';
  static const String appliedOffersPage = '/AppliedOffersPage';
  static const String cv = '/cv';
  static const String permissionSettingScreen = '/PermissionSettingScreen';
  static const String settingsScreen = '/settings_Screen';
  static const String createpassword = '/createpassword';
  static const String forgetpassword = '/forgetpassword';
  static const String restPasswordPage = '/RestPasswordPage';
  static const String restPasswordScreen = '/RestPasswordScreen';
  static const String ratePage = "/RatePage";
  static const String bankAccountPage = '/BankAccountPage';
  static const String attendancePage = '/AttendancePage';
  static const String overtimeAttendancePage = '/overtimeAttendancePage';
  static const String services = '/Services';
  static const String addNewOpportunity = '/AddNewOpportunity';
  static const String availableOpportunity = '/availableOpportunity';
  static const String opportunityDetails = '/OpportunityDetails';
  static const String reviewJobs = '/reviewJobs';
  static const String withdrawPage = '/WithdrawPage';
  static const String qrCodePage = '/QrCodePage';
  static const String appliedOfferDetailsScreenV2 =
      '/AppliedOfferDetailsScreenV2';
  static const String addresses = '/Addresses';
  static const String addAddress = '/AddAddress';
  static const String salaryDefinitionRequestPage =
      '/SalaryDefinitionRequestPage';
  static const String salaryDefinition = '/SalaryDefinition';
  static const String violations = '/violations';
  static const String notificationOffers = '/notificationOffers';
  static const String loanRequests = '/loanRequests';
  static const String addLoanRequest = '/addFinancialRequestCubit';
  static const String landingPage = '/landingPage';
  static const String bailRequestsTabs = '/bailRequestsTabs';
  static const String workerWorkPlacesPage = '/workerWorkPlacesPage';
  static const String deliveryAndReceiptPage = '/deliveryAndReceiptPage';
  static const String addFocusPointPage = '/addFocusPointPage';
  static const String focusPointsAdminPage = '/focusPointsAdminPage';
  static const String editFocusPointDataPage = '/EditFocusPointDataPage';
  static const String editFocusPointTimesPage = '/EditFocusPointTimesPage';
  static const String editCovenantReceivedPage = '/EditCovenantReceivedPage';
  static const String trackingFocusPointsPage = '/trackingFocusPointsPage';
  static const String pledgesAndGeneralization = '/pledgesAndGeneralization';
  static const String usersManagement = '/UsersManagement';
  static const String addNewUserPage = '/AddNewUserPage';
  static const String changeUserPasswordPage = '/ChangeUserPasswordPage';
  static const String employeesCertificates = '/EmployeesCertificates';
  static const String employeeCertificateDetails =
      '/EmployeeCertificateDetails';
  static const String projectsManagement = '/ProjectsManagement';
  static const String mainAddNewProjectPage = '/MainAddNewProjectPage';
  static const String addNewProject = '/addNewProject';
  static const String addAdditionalLocationsPage =
      '/AddAdditionalLocationsPage';
  static const String workingPeriodsProjectPage = '/WorkingPeriodsProjectPage';
  static const String periodPricingPage = '/PeriodPricingPage';
  static const String showQrCodePage = '/ShowQrCodePage';
  static const String projectSuccessfullyPage = '/ProjectSuccessfullyPage';
  static const String employmentManagement = '/EmploymentManagement';
  static const String banEmployees = '/BanEmployees';
  static const String banEmployeeDetailsPage = '/BanEmployeeDetailsPage';
  static const String employmentOfficials = '/EmploymentOfficials';
  static const String addEmploymentOfficialPage = '/addEmploymentOfficialPage';
  static const String termsAndConditions = '/TermsAndConditions';
  static const String jobRequirements = '/JobRequirements';
  static const String registerFaceRecognitionPage = '/faceRecognition';
  static const String cashiftAttendancePage = '/CashiftAttendancePage';
  static const String faceRecognitionPage = '/FaceRecognitionPage';
  static const String faceDetectorPage = '/FaceDetectorPage';
  static const String punishments = '/Punishments';
  static const addPunishmentPage = '/AddPunishmentPage';
  static const String workingDocumentPage = '/WorkingDocumentPage';
  static const String payWithSalaryPage = '/PayWithSalaryPage';
  static const String termsConditionsCertificatePaymentPage =
      '/TermsConditionsCertificatePaymentPage';
  static const String classificationTabs = '/classificationTabs';
  static const String addClassificationPage = '/AddClassificationPage';
  static const String employeesOpportunitiesPage =
      '/employeesOpportunitiesPage';
  static const String resetMobileNumberPage = '/ResetMobileNumberPage';
  static const String collectionDataPage = '/CollectionDataPage';
  static const String adminChashiftLoansPage = '/AdminChashiftLoansPage';
  static const String addCashifterLoanPage = '/AddCashifterLoanPage';
  static const String chashiftLoansUser = '/ChashiftLoansUser';
  static const String appliedPage = '/AppliedPage';
  static const String employeesPage = '/employeesPage';
  static const String homeAddNewEmployeesPage = '/HomeAddNewEmployeesPage';
  static const String mapProjectGatesPage = '/MapProjectGatesPage';
  static const String workHazardsPage = '/WorkHazardsPage';
  static const String addWorkHazardsPage = '/addWorkHazardsPage';
  static const String workHazardDetailsPage = '/WorkHazardDetailsPage';
  static const String filesPreviewPage = '/filesViewListOnline';
  static const String tasksAndResponsibilitiesPage =
      '/TasksAndResponsibilitiesPage';
  static const String attendanceAndDepartureNotificationsPage =
      '/AttendanceAndDepartureNotificationsPage';
  static const String addAttendanceAndDepartureNotificationsPage =
      '/AddAttendanceAndDepartureNotificationsPage';

  static const String vehiclesPage = '/vehiclesPage';
  static const String vehiclesDetailsPage = '/VehiclesDetailsPage';
  static const String addMaintenancePage = '/addMaintenancePage';
  static const String addInsurancePage = '/addInsurancePage';
  static const String insurancePage = '/InsurancePage';
  static const String mainAddVehiclePage = '/MainAddVehiclePage';
  static const String vehiclesCovenantPage = '/VehiclesCovenantPage';
  static const String mainAddEmpPage = '/MainAddEmpPage';
  static const String employeeAttachmentPage = '/EmployeeAttachmentPage';
  static const String employeeInfoPage = '/EmployeeInfoPage';
  static const String fileViewPdfOrImage = '/FileViewPdfOrImage';
  static const String fileViewPdfOrImageFromFile =
      '/fileViewPdfOrImageFromFile';
  static const String drawPolygonWithMarkersPage =
      '/drawPolygonWithMarkersScreen';
  static const String mainAddVehicleZonePage = '/mainAddVehicleZonePage';
  static const String addInfoVehicleZonePage = '/addInfoVehicleZonePage';
  static const String mapVehicleZonePage = '/mapVehicleZonePage';
  static const String vehiclesZonePage = '/vehiclesZonePage';
  static const String attendanceNotificationsReportsPage =
      '/AttendanceNotificationsReportsPage';

  static const String addTypeViolationPage = '/addTypeViolationPage';
  static const String addGeneralViolationPage = '/addGeneralViolationPage';
  static const String generalViolationDetailsPage =
      '/generalViolationDetailsPage';
  static const String generalTypesViolationsPage =
      '/generalTypesViolationsPage';
  static const String generalViolationsPage = '/generalViolationsPage';
  static const String filterVehiclesZonePage = '/filterVehiclesZonePage';
  static const String vehicleViolationsPage = '/VehicleViolationsPage';
  static const String addViolationVehiclePage = '/AddViolationVehiclePage';
  static const String vehicleViolationDetailsPage =
      '/vehicleViolationDetailsPage';
  static const String receiveVehiclesTabs = '/mainReceiveVehiclePage';
  static const String mainReceiveAdd = '/mainReceiveAdd';
  static const String mainReceiveVehiclePage = '/mainReceiveVehiclePage';
  static const String addHomeAddressPage = '/UpdateFreeLancerLocation';
  static const String viewTrackAttendanceDeparturePage =
      '/requestTrackAttendanceDeparturePage';
  static const String requestTrackAttendanceDeparturePage =
      '/addTrackAttendanceDeparturePage';
  static const String trackAttendanceDepartureDetailsPage =
      '/trackAttendanceDepartureDetailsPage';
  static const String searchEmployeeMapPage = '/searchEmployeeMapPage';
  static const String realTimeQRScanner = '/realTimeQRScanner';
   static const String currentTourMapPage = '/currentTourMapPage';
  static const String addJobUniformPage = '/JobUniform';
  static const String usersRequestsPage = '/UsersRequestsPage';
  static const String requestsUserPage = '/requestsUserPage';
  static const String addRequestsUserPage = '/addRequestsUserPage';
  static const String confirmRequestsUserPage = '/confirmRequestsUserPage';
  static const String addFileRequestsUserPage = '/addFileRequestsUserPage';
  static const String addGasStationsPage = '/addGasStationsPage';
  static const String gasStationsPage = '/gasStationsPage';
  static const String mapStationsWidget = '/mapStationsWidget';
  static const String receiveVehicleDetailsPage = '/receiveVehicleDetailsPage';
  static const String vehicleReceiveRequestsPage =
      '/vehicleReceiveRequestsPage';
  static const String followUpViolationsPage = '/followUpViolationsPage';
  static const String vehicleQrCodePage = '/vehicleQrCodePage';
  static const String checkFaceRecogenationPage = '/checkFaceRecogenationPage';
  static const String addMaintenanceBreakdownsPage =
      '/addMaintenanceBreakdownsPage';
  static const String maintenanceBreakdownsPage = '/maintenanceBreakdownsPage';
  static const String vehicleNotificationPage = '/vehicleNotificationPage';
  static const String vehiclesTrackingPage = '/vehiclesTrackingPage';
  static const String vehicleCamerasPage = '/VehicleCamerasPage';
  static const String addVehicleCameraPage = '/addVehicleCameraPage';
  static const String cameraSearchResultsPage = '/cameraSearchResultsPage';
  static const String addTransactionsPage = '/addTransactionsPage';
  static const String transactionsPage = '/transactionsPage';
  static const String maintenanceBreakdownsPlanPage = '/maintenanceBreakdownsPlanPage';
  static const String factoryViolationsPlanePage = '/factoryViolationsPlanePage';

  static final routes = <String, Widget Function(BuildContext)>{
    login: (context) => LoginPage(),
    signupPage: (context) => SignupPage(),
    addPhoneWallet: (context) => AddPhoneWalletPage(),
    phoneWalletsPage: (context) => PhoneWalletsPage(),
    home: (context) => MyHomeScreen(),
    profileScreen: (context) => ProfilePage(),
    monthlycopyright: (context) => CopyRightsPage(),
    noticeAttendance: (context) => AbsenceNoticePage(),
    currentShift: (context) => CurrentShiftPage(),
    jobTermsAndConditionPage: (context) => JobTermsAndConditionPage(),
    cashierPage: (context) => CashierPage(),
    jobOfferDetails: (context) => JobOfferDetailsPage(),
    qrScanner: (context) => QRCodeScreen(),
    activitylog: (context) => const ActivityLogPage(),
    verificationPage: (context) => VerificationPage(),
    duesPage: (context) => const CollectCashPage(),
    walletPage: (context) => WalletPage(),
    favoriteProjectsPage: (context) => FavoriteProjectsPage(),
    jobsListPage: (context) => JobsListPage(),
    appliedOffersPage: (context) => const AppliedOffersPage(hasBar: true),
    workHazardDetailsPage: (context) => WorkHazardDetailsPage(),
    cv: (context) => ResumePages(),
    splash: (context) => SplashScreen(),
    forgetpassword: (context) => ForgetPassword(),
    restPasswordPage: (context) => RestPasswordPage(),
    ratePage: (context) => RatePage(),
    bankAccountPage: (context) => BankAccountPage(),
    attendancePage: (context) => AttendancePage(),
    overtimeAttendancePage: (context) => OvertimeAttendancePage(),
    services: (context) => ServicesPage(),
    addNewOpportunity: (context) => AddNewOpportunityPage(),
    availableOpportunity: (context) => AvailableOpportunitiesListPageV2(),
    opportunityDetails: (context) => OpportunityDetailsPage(),
    reviewJobs: (context) => ReviewOpportunitiesTabsPage(),
    withdrawPage: (context) => WithdrawPage(),
    qrCodePage: (context) => QrCodePage(),
    appliedOfferDetailsScreenV2: (context) => AppliedOfferDetailsPage(),
    addresses: (context) => AddressesPage(),
    addAddress: (context) => AddAddressPage(),
    salaryDefinitionRequestPage: (context) => SalaryDefinitionRequestPage(),
    salaryDefinition: (context) => SalaryDefinitionRequestsTabsPage(),
    violations: (context) => ViolationsUserTabs(),
    notificationOffers: (context) => NotificationOffersPage(),
    loanRequests: (context) => LoanRequestsTabs(),
    addLoanRequest: (context) => AddLoanRequestPage(),
    landingPage: (context) => LandingPage(),
    bailRequestsTabs: (context) => BailRequestsTabs(),
    workerWorkPlacesPage: (context) => WorkerWorkPlacesPage(),
    deliveryAndReceiptPage: (context) => DeliveryAndReceiptPage(),
    addFocusPointPage: (context) => AddFocusPointPage(),
    focusPointsAdminPage: (context) => FocusPointsPage(),
    editFocusPointDataPage: (context) => EditFocusPointDataPage(),
    editFocusPointTimesPage: (context) => EditFocusPointTimesPage(),
    editCovenantReceivedPage: (context) => EditCovenantReceivedPage(),
    trackingFocusPointsPage: (context) => TrackingFocusPointsPage(),
    pledgesAndGeneralization: (context) => PledgesAndGeneralizationTabs(),
    usersManagement: (context) => UsersManagementTabs(),
    addNewUserPage: (context) => AddNewUserPage(),
    changeUserPasswordPage: (context) => ChangeUserPasswordPage(),
    employeesCertificates: (context) => EmployeesCertificatesPage(),
    employeeCertificateDetails: (context) => EmployeeCertificateDetailsPage(),
    projectsManagement: (context) => ProjectsManagementPage(),
    mainAddNewProjectPage: (context) => MainAddNewProjectPage(),
    addNewProject: (context) => AddNewProjectPage(),
    addAdditionalLocationsPage: (context) => AddAdditionalLocationsPage(),
    workingPeriodsProjectPage: (context) => WorkingPeriodsProjectPage(),
    periodPricingPage: (context) => PeriodPricingPage(),
    projectSuccessfullyPage: (context) => ProjectSuccessfullyPage(),
    showQrCodePage: (context) => ShowQrCodePage(),
    employmentManagement: (context) => EmploymentManagementPage(),
    banEmployees: (context) => BanEmployeesPage(),
    banEmployeeDetailsPage: (context) => BanEmployeeDetailsPage(),
    employmentOfficials: (context) => EmploymentOfficialsPage(),
    addEmploymentOfficialPage: (context) => AddEmploymentOfficialPage(),
    termsAndConditions: (context) => TermsAndConditionsPage(),
    jobRequirements: (context) => JobRequirementsPage(),
    registerFaceRecognitionPage: (context) => RegisterFaceRecognitionPage(),
    cashiftAttendancePage: (context) => CashiftAttendancePage(),
    faceRecognitionPage: (context) => FaceRecognitionPage(),
    faceDetectorPage: (context) => FaceDetectorPage(),
    punishments: (context) => PunishmentsTabs(),
    addPunishmentPage: (context) => AddPunishmentPage(),
    workingDocumentPage: (context) => WorkingDocumentPage(),
    payWithSalaryPage: (context) => PayWithSalaryPage(),
    termsConditionsCertificatePaymentPage: (context) =>
        TermsConditionsCertificatePaymentPage(),
    classificationTabs: (context) => ClassificationTabs(),
    addClassificationPage: (context) => AddClassificationPage(),
    employeesOpportunitiesPage: (context) => EmployeesOpportunitiesPage(),
    resetMobileNumberPage: (context) => ResetMobileNumberPage(),
    collectionDataPage: (context) => CollectionDataPage(),
    adminChashiftLoansPage: (context) => AdminChashiftLoansPage(),
    addCashifterLoanPage: (context) => AddCashifterLoanPage(),
    chashiftLoansUser: (context) => ChashiftLoansPage(),
    appliedPage: (context) => AppliedPage(),
    employeesPage: (context) => EmployeesPage(),
    homeAddNewEmployeesPage: (context) => HomeAddNewEmployeesPage(),
    workHazardsPage: (context) => WorkHazardsPage(),
    addWorkHazardsPage: (context) => AddWorkHazardPage(),
    filesPreviewPage: (context) => FilesPreviewPage(),
    mapProjectGatesPage: (context) => MapProjectGatesPage(),
    tasksAndResponsibilitiesPage: (context) => TasksAndResponsibilitiesPage(),
    vehiclesPage: (context) => VehiclesPage(),
    vehiclesDetailsPage: (context) => VehiclesDetailsPage(),
    addMaintenancePage: (context) => AddMaintenancePage(),
    addInsurancePage: (context) => AddInsurancePage(),
    insurancePage: (context) => InsurancePage(),
    mainAddVehiclePage: (context) => MainAddVehiclePage(),
    vehiclesCovenantPage: (context) => VehiclesCovenantPage(),
    mainAddEmpPage: (context) => MainAddEmpPage(),
    employeeAttachmentPage: (context) => EmployeeAttachmentPage(),
    fileViewPdfOrImage: (context) => FileViewPdfOrImage(),
    fileViewPdfOrImageFromFile: (context) => FileViewPdfOrImageFromFile(),
    attendanceAndDepartureNotificationsPage: (context) =>
        AttendanceAndDepartureNotificationsPage(),
    addAttendanceAndDepartureNotificationsPage: (context) =>
        AddAttendanceAndDepartureNotificationsPage(),
    attendanceNotificationsReportsPage: (context) =>
        AttendanceNotificationsReportsPage(),
    addTypeViolationPage: (context) => AddTypeViolationPage(),
    addGeneralViolationPage: (context) => AddGeneralViolationPage(),
    generalViolationDetailsPage: (context) => GeneralViolationDetailsPage(),
    generalTypesViolationsPage: (context) => GeneralTypesViolationsPage(),
    generalViolationsPage: (context) => GeneralViolationsPage(),
    drawPolygonWithMarkersPage: (context) => DrawPolygonWithMarkersPage(),
    mainAddVehicleZonePage: (context) => MainAddVehicleZonePage(),
    addInfoVehicleZonePage: (context) => AddInfoVehicleZonePage(),
    mapVehicleZonePage: (context) => MapVehicleZonePage(),
    vehiclesZonePage: (context) => VehiclesZonePage(),
    receiveVehiclesTabs: (context) => ReceiveVehiclesPage(),
    filterVehiclesZonePage: (context) => FilterVehiclesZonePage(),
    addViolationVehiclePage: (context) => AddVehicleViolationPage(),
    vehicleViolationDetailsPage: (context) => VehicleViolationDetailsPage(),
    vehicleViolationsPage: (context) => VehicleViolationsPage(),
    requestTrackAttendanceDeparturePage: (context) =>
        RequestTrackAttendanceDeparturePage(),
    viewTrackAttendanceDeparturePage: (context) =>
        TrackAttendanceDeparturePage(),
    trackAttendanceDepartureDetailsPage: (context) =>
        TrackAttendanceDepartureDetailsPage(),
    mainReceiveAdd: (context) => MainReceiveVehiclePage(),
    addHomeAddressPage: (context) => AddHomeAddressPage(),
    searchEmployeeMapPage: (context) => SearchEmployeeMapPage(),
     currentTourMapPage: (context) => CurrentTourMapPage(),
    addJobUniformPage: (context) => AddJobUniformPage(),
    usersRequestsPage: (context) => UsersRequestsPage(),
    requestsUserPage: (context) => RequestsUserPage(),
    addRequestsUserPage: (context) => AddRequestsUserPage(),
    confirmRequestsUserPage: (context) => ConfirmRequestsUserPage(),
    addFileRequestsUserPage: (context) => AddFileRequestsUserPage(),
    addGasStationsPage: (context) => AddGasStationsPage(),
    gasStationsPage: (context) => GasStationsPage(),
    mapStationsWidget: (context) => MapStationsWidget(),
    receiveVehicleDetailsPage: (context) => ReceiveVehicleDetailsPage(),
    vehicleReceiveRequestsPage: (context) => VehicleReceiveRequestsPage(),
    followUpViolationsPage: (context) => FollowUpViolationsPage(),
    vehicleQrCodePage: (context) => VehicleQrCodePage(),
    checkFaceRecogenationPage: (context) => CheckFaceRecognitionPage(),
    addMaintenanceBreakdownsPage: (context) => AddMaintenanceBreakdownsPage(),
    maintenanceBreakdownsPage: (context) => MaintenanceBreakdownsPage(),
    vehicleNotificationPage: (context) => VehicleNotificationPage(),
    vehiclesTrackingPage: (context) => VehiclesTrackingPage(),
    vehicleCamerasPage: (context) => VehicleCamerasPage(),
    addVehicleCameraPage: (context) => AddVehicleCameraPage(),
    cameraSearchResultsPage: (context) => CameraSearchResultsPage(), // Add this line
    addTransactionsPage: (context) => AddTransactionsPage(), // Add this line
    transactionsPage: (context) => TransactionsPage(), // Add this line
    maintenanceBreakdownsPlanPage: (context) => MaintenanceBreakdownsPlanPage(), // Add this line
   factoryViolationsPlanePage: (context) => FactoryViolationsPlanePage(), // Add this line
   };
}
