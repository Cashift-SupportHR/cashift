// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../data/datasources/remote/api/absencenotice/absencenotice_api.dart'
    as _i420;
import '../../../data/datasources/remote/api/activity_log/activity_log_api_provider.dart'
    as _i882;
import '../../../data/datasources/remote/api/add-address/add_address_api_provider.dart'
    as _i600;
import '../../../data/datasources/remote/api/advancedFilter/advanced_filter_api_provider.dart'
    as _i20;
import '../../../data/datasources/remote/api/attendance/attendance_api_provider.dart'
    as _i823;
import '../../../data/datasources/remote/api/auth/auth_api_provider.dart'
    as _i235;
import '../../../data/datasources/remote/api/bail_requests/bail_requests_api.dart'
    as _i536;
import '../../../data/datasources/remote/api/bank/bank_api_provider.dart'
    as _i65;
import '../../../data/datasources/remote/api/collect_cash/collect_cash_api_provider.dart'
    as _i9;
import '../../../data/datasources/remote/api/evaluation/evaluation_api_provider.dart'
    as _i215;
import '../../../data/datasources/remote/api/favorite_projects/favorite_projects_api.dart'
    as _i70;
import '../../../data/datasources/remote/api/home/home_api_provider.dart'
    as _i581;
import '../../../data/datasources/remote/api/job_offers/job_offers_api_provider.dart'
    as _i767;
import '../../../data/datasources/remote/api/loans_request/loans_request_api.dart'
    as _i674;
import '../../../data/datasources/remote/api/logger/logger_api_provider.dart'
    as _i903;
import '../../../data/datasources/remote/api/notificationOffers/notification_offers_api_provider.dart'
    as _i342;
import '../../../data/datasources/remote/api/profile/profile_api_provider.dart'
    as _i444;
import '../../../data/datasources/remote/api/resume/resume_api_provider.dart'
    as _i40;
import '../../../data/datasources/remote/api/salary-definition-request/salary_definition_api.dart'
    as _i713;
import '../../../data/datasources/remote/api/service/service_api.dart' as _i825;
import '../../../data/datasources/remote/api/terms/terms_api_provider.dart'
    as _i660;
import '../../../data/datasources/remote/api/wallet/wallet_api_provider.dart'
    as _i341;
import '../../../data/datasources/remote/api/workerWorkPlaces/worker_work_places_api.dart'
    as _i159;
import '../../../data/repositories/absencenotice/absencenotice.dart' as _i52;
import '../../../data/repositories/activitylog/activity_log_repository.dart'
    as _i825;
import '../../../data/repositories/add-address/add_address_repository.dart'
    as _i431;
import '../../../data/repositories/advancedFilter/advanced_filter_repository.dart'
    as _i146;
import '../../../data/repositories/attendance/attendance_repository.dart'
    as _i339;
import '../../../data/repositories/bail_requests/bail_requests_repository.dart'
    as _i454;
import '../../../data/repositories/bank/wallet_repository.dart' as _i536;
import '../../../data/repositories/collect_cash/collect_cash_repository.dart'
    as _i304;
import '../../../data/repositories/device/deviceinfo_repository.dart' as _i560;
import '../../../data/repositories/evaluation/evaluation_repository.dart'
    as _i209;
import '../../../data/repositories/financial_requests/loans_request_repository.dart'
    as _i597;
import '../../../data/repositories/home/home_repository.dart' as _i13;
import '../../../data/repositories/joboffers/job_offers_repository.dart'
    as _i883;
import '../../../data/repositories/local/local_repository.dart' as _i1033;
import '../../../data/repositories/logger/logger_repository.dart' as _i783;
import '../../../data/repositories/login/auth_repository.dart' as _i633;
import '../../../data/repositories/notificationOffers/notification_offers_repository.dart'
    as _i874;
import '../../../data/repositories/profile/profile_repository.dart' as _i922;
import '../../../data/repositories/projects/projects_repository.dart' as _i507;
import '../../../data/repositories/resume/resume_repository.dart' as _i563;
import '../../../data/repositories/salary-definition-request/salary_definition_repository.dart'
    as _i445;
import '../../../data/repositories/service/service_repository.dart' as _i204;
import '../../../data/repositories/terms/terms_repository.dart' as _i883;
import '../../../data/repositories/user/user_repository.dart' as _i1028;
import '../../../data/repositories/wallet/bank_repository.dart' as _i565;
import '../../../data/repositories/workerWorkPlaces/worker_work_places_repository.dart'
    as _i1007;
import '../../../domain/entities/shared/device.dart' as _i644;
import '../../../domain/usecases/respond_dashboard_required_action_usecase.dart'
    as _i250;
import '../../../domain/usecases/respond_required_task_usecase.dart' as _i604;
import '../../../domain/usecases/tasks_notifications_usecase.dart' as _i919;
import '../../../network/source/admin_endpoint.dart' as _i281;
import '../../../network/source/configuration_endpoint.dart' as _i307;
import '../../../network/source/user_endpoint.dart' as _i1029;
import '../../presentationUser/absencenotice/bloc/absencenotice_cubit.dart'
    as _i844;
import '../../presentationUser/activity_log/bloc/activity_log_cubit.dart'
    as _i145;
import '../../presentationUser/advancedFilter/bloc/advanced_filter_cubit.dart'
    as _i658;
import '../../presentationUser/appliedoffers/bloc/applied_offers_cubit.dart'
    as _i845;
import '../../presentationUser/appliedoffers/cancelOpprtunity/bloc/cancel_opportunity_apologizing_bloc.dart'
    as _i778;
import '../../presentationUser/attendance/overtimeAttendance/bloc/overtime_attendance_cubit.dart'
    as _i867;
import '../../presentationUser/attendance/recordAttendance/bloc/cashift_attendance_cubit.dart'
    as _i124;
import '../../presentationUser/attendance/registerfacerecognition/bloc/face_recognition_cubit.dart'
    as _i606;
import '../../presentationUser/attendance/shiftAttendance/bloc/attendance_cubit.dart'
    as _i897;
import '../../presentationUser/AttendanceAndDepartureNotifications/data/datasource/attendance_and_departure_notifications_provider.dart'
    as _i425;
import '../../presentationUser/AttendanceAndDepartureNotifications/data/repositories/attendance_and_departure_notifications_repository.dart'
    as _i835;
import '../../presentationUser/AttendanceAndDepartureNotifications/presentation/pages/add/cubit/add_attendance_and_departure_notifications_cubit.dart'
    as _i390;
import '../../presentationUser/AttendanceAndDepartureNotifications/presentation/pages/view/cubit/attendance_and_departure_notifications_cubit.dart'
    as _i609;
import '../../presentationUser/bail_requests/bloc/bail_requests_cubit.dart'
    as _i523;
import '../../presentationUser/collect_cash/bloc/collect_cash_cubit.dart'
    as _i981;
import '../../presentationUser/copyrights/bloc/copy_rights_bloc.dart' as _i754;
import '../../presentationUser/deliveryAndReceipt/bloc/delivery_and_receipt_cubit.dart'
    as _i641;
import '../../presentationUser/employeesCertificates/data/datasource/employees_certificates_provider.dart'
    as _i1021;
import '../../presentationUser/employeesCertificates/data/repositories/employees_certificates_repository.dart'
    as _i1070;
import '../../presentationUser/employeesCertificates/presentation/employeeCertificateDetails/bloc/employee_certificate_details_cubit.dart'
    as _i277;
import '../../presentationUser/employeesCertificates/presentation/employeesCertificates/bloc/employees_certificates_cubit.dart'
    as _i518;
import '../../presentationUser/favoriteprojects/bloc/favorite_projects_cubit.dart'
    as _i415;
import '../../presentationUser/files_preview/bloc/files_preview_cubit.dart'
    as _i810;
import '../../presentationUser/joboffers/bloc/job_offers_cubit.dart' as _i55;
import '../../presentationUser/loan_requests/add_new_loan_request/bloc/add_loan_request_bloc.dart'
    as _i196;
import '../../presentationUser/loan_requests/loan_requests/bloc/loan_requests_cubit.dart'
    as _i556;
import '../../presentationUser/mainnavigation/overview/bloc/overview_bloc.dart'
    as _i279;
import '../../presentationUser/mainnavigation/overview/bloc/overview_cubit.dart'
    as _i1061;
import '../../presentationUser/mainnavigation/wallet/apply_details/bloc/apply_details_cubit.dart'
    as _i300;
import '../../presentationUser/mainnavigation/wallet/balances/bloc/balances_cubit.dart'
    as _i168;
import '../../presentationUser/mainnavigation/wallet/bloc/wallet_bloc.dart'
    as _i22;
import '../../presentationUser/mainnavigation/wallet/user_qrcode/bloc/qrcode_bloc.dart'
    as _i14;
import '../../presentationUser/mainnavigation/wallet/withdraw/bloc/withdraw_cubit.dart'
    as _i68;
import '../../presentationUser/map_picker/bloc/map_picker_cubit.dart' as _i66;
import '../../presentationUser/map_picker/data/datasource/map_picker_provider.dart'
    as _i249;
import '../../presentationUser/map_picker/data/repositories/map_picker_repository.dart'
    as _i735;
import '../../presentationUser/notificationOffers/bloc/notification_offers_cubit.dart'
    as _i745;
import '../../presentationUser/pledgesAndGeneralization/data/datasource/pledges_and_generalization_provider.dart'
    as _i809;
import '../../presentationUser/pledgesAndGeneralization/data/repositories/pledges_and_generalization_repository.dart'
    as _i291;
import '../../presentationUser/pledgesAndGeneralization/presentation/bloc/pledges_and_generalization_cubit.dart'
    as _i424;
import '../../presentationUser/profile/addHomeAddress/bloc/add_home_address_cubit.dart'
    as _i352;
import '../../presentationUser/profile/addresess/bloc/add_address_cubit.dart'
    as _i453;
import '../../presentationUser/profile/attachment/cubit/attachment_employees_bloc.dart'
    as _i179;
import '../../presentationUser/profile/change_password/bloc/change_password_cubit.dart'
    as _i1047;
import '../../presentationUser/profile/requests/data/data_sources/requests_user_api_provider.dart'
    as _i565;
import '../../presentationUser/profile/requests/data/repositories/requests_user_repository.dart'
    as _i694;
import '../../presentationUser/profile/requests/presentation/pages/add/add_file_request/bloc/add_file_requests_cubit.dart'
    as _i927;
import '../../presentationUser/profile/requests/presentation/pages/add/add_request/bloc/add_requests_user_cubit.dart'
    as _i310;
import '../../presentationUser/profile/requests/presentation/pages/add/confairm/bloc/confirm_user_cubit.dart'
    as _i384;
import '../../presentationUser/profile/requests/presentation/pages/add/term_and_condation_request/bloc/term_and_condation_request_cubit.dart'
    as _i108;
import '../../presentationUser/profile/requests/presentation/pages/view/bloc/requests_user_cubit.dart'
    as _i691;
import '../../presentationUser/profile/view/bloc/profile_cubit.dart' as _i872;
import '../../presentationUser/rate/bloc/evaluation_cubit.dart' as _i688;
import '../../presentationUser/required_tasks/bloc/required_tasks_cubit.dart'
    as _i699;
import '../../presentationUser/required_tasks/confirm_attendance/bloc/confirm_attendance_cubit.dart'
    as _i465;
import '../../presentationUser/resume/bloc/resume_bloc.dart' as _i116;
import '../../presentationUser/resume/pages/favoritejobs/bloc/favorite_job_cubit.dart'
    as _i611;
import '../../presentationUser/salarydefinitionrequest/newrequest/bloc/salary_definition_request_bloc.dart'
    as _i476;
import '../../presentationUser/salarydefinitionrequest/requests/bloc/salary_definition_request_cubit.dart'
    as _i907;
import '../../presentationUser/transactions/data/data_sources/transactions_provider.dart'
    as _i408;
import '../../presentationUser/transactions/data/repositories/transactions_repository.dart'
    as _i297;
import '../../presentationUser/transactions/presentation/add/cubit/add_transactions_cubit.dart'
    as _i1072;
import '../../presentationUser/transactions/presentation/view/cubit/transactions_cubit.dart'
    as _i319;
import '../../presentationUser/vehiclesOperation/data/datasource/vehicles_operation_provider.dart'
    as _i199;
import '../../presentationUser/vehiclesOperation/data/repositories/vehicles_operation_repository.dart'
    as _i61;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/chnage_operating_plane/bloc/change_operating_plane_cubit.dart'
    as _i841;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/chnage_operating_plane/bloc/tour_history_cubit.dart'
    as _i414;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/factory_violations/bloc/factory_violations_plane_cubit.dart'
    as _i285;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/gasStationsPlan/cubit/gas_stations_plane_cubit.dart'
    as _i206;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/maintenance_breakdowns_plane/bloc/maintenance_breakdowns_plane_cubit.dart'
    as _i190;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/tour_history/bloc/tour_history_cubit.dart'
    as _i418;
import '../../presentationUser/vehiclesOperation/presentation/currentTourMap/view/bloc/current_tour_map_cubit.dart'
    as _i649;
import '../../presentationUser/vehiclesOperation/presentation/pages/add/vehicle_components/bloc/vehicles_components_cubit.dart'
    as _i708;
import '../../presentationUser/vehiclesOperation/presentation/pages/add/vehicle_covenant/bloc/vehicles_custodies_cubit.dart'
    as _i13;
import '../../presentationUser/vehiclesOperation/presentation/pages/add/vehicle_info/bloc/info_vehicles_cubit.dart'
    as _i290;
import '../../presentationUser/vehiclesOperation/presentation/pages/add/vehicleReceivedImages/bloc/vehicle_received_images_cubit.dart'
    as _i48;
import '../../presentationUser/vehiclesOperation/presentation/pages/view/bloc/filter_receive_vehicles_cubit.dart'
    as _i499;
import '../../presentationUser/vehiclesOperation/presentation/pages/view/bloc/receive_vehicles_cubit.dart'
    as _i158;
import '../../presentationUser/vehiclesOperation/presentation/receiveVehicle/details/bloc/receive_vehicle_details_cubit.dart'
    as _i88;
import '../../presentationUser/vehiclesOperation/presentation/startTour/bloc/start_tour_bloc.dart'
    as _i712;
import '../../presentationUser/verification/bloc/verification_bloc.dart' as _i7;
import '../../presentationUser/violations/data/data_sources/violations_user_api.dart'
    as _i771;
import '../../presentationUser/violations/data/repositories/violations_user_repository.dart'
    as _i35;
import '../../presentationUser/violations/presentation/bloc/violations_user_cubit.dart'
    as _i364;
import '../../presentationUser/withdraw_accounts/add_phone_wallet/bloc/phone_wallet_cubit.dart'
    as _i161;
import '../../presentationUser/withdraw_accounts/bankaccont/bloc/bank_account_cubit.dart'
    as _i770;
import '../../presentationUser/workerWorkPlaces/bloc/worker_work_places_cubit.dart'
    as _i111;
import '../../presentationUser/workHazards/data/datasource/work_hazards_provider.dart'
    as _i193;
import '../../presentationUser/workHazards/data/models/index.dart' as _i42;
import '../../presentationUser/workHazards/data/repositories/work_hazards_repository.dart'
    as _i734;
import '../../presentationUser/workHazards/presentation/addWorkHazard/bloc/add_work_hazard_bloc.dart'
    as _i845;
import '../../presentationUser/workHazards/presentation/details/bloc/work_hazard_details_cubit.dart'
    as _i558;
import '../../presentationUser/workHazards/presentation/view/bloc/work_hazards_cubit.dart'
    as _i834;
import '../../presentationUser/working_document/data/datasource/working_document_provider.dart'
    as _i350;
import '../../presentationUser/working_document/data/repositories/working_document_repository.dart'
    as _i366;
import '../../presentationUser/working_document/presentation/Installment_postponement/bloc/Installment_postponement_cubit.dart'
    as _i235;
import '../../presentationUser/working_document/presentation/installment_with_cashift/bloc/installment_with_cashift_cubit.dart'
    as _i752;
import '../../presentationUser/working_document/presentation/pay_with_salary/bloc/pay_with_salary_cubit.dart'
    as _i87;
import '../../presentationUser/working_document/presentation/terms_conditions_certificate_payment/bloc/terms_conditions_certificate_payment_cubit.dart'
    as _i478;
import '../../presentationUser/working_document/presentation/workingDocument/bloc/working_document_cubit.dart'
    as _i641;
import '../../shared/authorization/forgetpassword/bloc/forgetpassword_bloc.dart'
    as _i645;
import '../../shared/authorization/login/bloc/login_bloc.dart' as _i385;
import '../../shared/home/bloc/home_bloc.dart' as _i645;
import '../../shared/loans/data/data_sources/chashift_lons_provider.dart'
    as _i418;
import '../../shared/loans/data/repositories/chashift_loans_repository.dart'
    as _i518;
import '../../shared/loans/presentation/collectionData/cubit/CollectionDataCubit.dart'
    as _i616;
import '../../shared/loans/presentation/view/bloc/chashift_loans_cubit.dart'
    as _i521;
import '../../shared/services/bloc/services_cubit.dart' as _i580;
import '../../shared/splash/bloc/splash_cubit.dart' as _i39;
import '../addOpportunity/data/datasource/add_opp_api_provider.dart' as _i430;
import '../addOpportunity/data/models/index.dart' as _i622;
import '../addOpportunity/data/repositories/add_opportunity_repository.dart'
    as _i1005;
import '../addOpportunity/presentations/bloc/add_opportunity_cubit.dart'
    as _i165;
import '../addOpportunity/presentations/employees_opportunities/bloc/employees_opportunities_cubit.dart'
    as _i655;
import '../admin_wallet/data/data_sources/admin_wallet_provider.dart' as _i320;
import '../admin_wallet/data/models/index.dart' as _i159;
import '../admin_wallet/data/repositories/admin_wallet_repository.dart'
    as _i194;
import '../admin_wallet/presentation/cubit/admin_wallet_bloc.dart' as _i325;
import '../areapolygones/data/datasource/vehicles_zone_provider.dart' as _i650;
import '../areapolygones/data/repositories/vehicles_zone_repository.dart'
    as _i1040;
import '../areapolygones/presentation/add/bloc/add_vehicles_zone_bloc.dart'
    as _i902;
import '../areapolygones/presentation/filter/bloc/filter_vehicles_zone_cubit.dart'
    as _i633;
import '../areapolygones/presentation/polygonsmap/bloc/draw_polygon_cubit.dart'
    as _i222;
import '../areapolygones/presentation/view/bloc/vehicles_zone_cubit.dart'
    as _i94;
import '../attendanceNotificationsReports/data/datasource/attendance_notifications_reports_provider.dart'
    as _i615;
import '../attendanceNotificationsReports/data/repositories/attendance_notifications_reports_repository.dart'
    as _i1066;
import '../attendanceNotificationsReports/presentation/pages/cubit/attendance_notifications_reports_cubit.dart'
    as _i67;
import '../attendanceNotificationsReports/presentation/pages/cubit/fillter_attendance_notifications_reports_cubit.dart'
    as _i329;
import '../available_opportunities/presentation/opportunities/bloc/available%20_opportunities_cubit.dart'
    as _i949;
import '../banEmployees/data/datasource/ban_employees_provider.dart' as _i586;
import '../banEmployees/data/models/index.dart' as _i425;
import '../banEmployees/data/repositories/ban_employees_repository.dart'
    as _i639;
import '../banEmployees/presentation/banEmployeeDetails/bloc/ban_employee_details_cubit.dart'
    as _i927;
import '../banEmployees/presentation/banEmployees/bloc/ban_employees_cubit.dart'
    as _i483;
import '../cashiftersLoans/data/datasource/cashifters_loans_provider.dart'
    as _i395;
import '../cashiftersLoans/data/repositories/cashifters_loans_repository.dart'
    as _i133;
import '../cashiftersLoans/presentation/add_cashifter_loan/bloc/add_cashifter_loan_bloc.dart'
    as _i622;
import '../classification/data/datasource/classification_provider.dart'
    as _i680;
import '../classification/data/repositories/classification_repository.dart'
    as _i968;
import '../classification/presentation/addClassification/bloc/classification_cubit.dart'
    as _i844;
import '../classification/presentation/classification/bloc/classification_cubit.dart'
    as _i507;
import '../employeeMap/data/datasource/employee_map_provider.dart' as _i685;
import '../employeeMap/data/repositories/emp_map_repository.dart' as _i740;
import '../employeeMap/presentation/bloc/filter_employee_map_cubit.dart'
    as _i334;
import '../employeeMap/presentation/bloc/search_employee_map_cubit.dart'
    as _i571;
import '../employees/data/datasource/employees_provider.dart' as _i717;
import '../employees/data/models/index.dart' as _i56;
import '../employees/data/repositories/employees_repository.dart' as _i760;
import '../employees/presentation/addNewEmployees/bloc/add_new_employees_bloc.dart'
    as _i257;
import '../employees/presentation/employees/bloc/employees_cubit.dart' as _i549;
import '../employees/presentation/employees/pages/attendance/cubit/employees_attendance_cubit.dart'
    as _i1059;
import '../employmentManagement/data/datasource/employment_management_provider.dart'
    as _i1029;
import '../employmentManagement/data/models/index.dart' as _i716;
import '../employmentManagement/data/repositories/employment_management_repository.dart'
    as _i805;
import '../employmentManagement/presentation/employmentManagement/bloc/employment_management_cubit.dart'
    as _i423;
import '../employmentManagement/presentation/resetMobileNumber/bloc/reset_mobile_number_cubit.dart'
    as _i501;
import '../employmentOfficials/data/datasource/employment_officials_provider.dart'
    as _i949;
import '../employmentOfficials/data/models/index.dart' as _i469;
import '../employmentOfficials/data/repositories/employment_officials_repository.dart'
    as _i930;
import '../employmentOfficials/presentation/addEmploymentOfficial/bloc/add_employment_official_bloc.dart'
    as _i744;
import '../employmentOfficials/presentation/employmentOfficials/bloc/employment_officials_cubit.dart'
    as _i890;
import '../focusPoints/data/datasource/focus_point_api_provider.dart' as _i393;
import '../focusPoints/data/models/index.dart' as _i250;
import '../focusPoints/data/repositories/focus_points_repository.dart'
    as _i1061;
import '../focusPoints/presentations/add_focus_point/bloc/add_covenant_received_cubit.dart'
    as _i155;
import '../focusPoints/presentations/add_focus_point/bloc/add_focus_point_data_cubit.dart'
    as _i827;
import '../focusPoints/presentations/add_focus_point/bloc/add_focus_point_times_cubit.dart'
    as _i62;
import '../focusPoints/presentations/focusPoints/bloc/focus_point_cubit.dart'
    as _i451;
import '../focusPoints/presentations/trackingFocusPoints/bloc/tracking_focus_points_cubit.dart'
    as _i634;
import '../gasStations/data/data_sources/gas_stations_provider.dart' as _i432;
import '../gasStations/data/repositories/gas_stations_repository.dart' as _i415;
import '../gasStations/presentation/pages/add/bloc/add_gas_stations_bloc.dart'
    as _i553;
import '../gasStations/presentation/pages/view/bloc/gas_stations_bloc.dart'
    as _i982;
import '../generalViolations/data/datasource/general_violations_provider.dart'
    as _i740;
import '../generalViolations/data/models/index.dart' as _i1014;
import '../generalViolations/data/repositories/general_violations_repository.dart'
    as _i568;
import '../generalViolations/presentation/addTypeViolation/bloc/add_type_violation_bloc.dart'
    as _i501;
import '../generalViolations/presentation/addViolation/bloc/add_general_violation_bloc.dart'
    as _i467;
import '../generalViolations/presentation/details/bloc/general_violation_details_cubit.dart'
    as _i710;
import '../generalViolations/presentation/followUpViolations/bloc/action_follow_up_violation_cubit.dart'
    as _i398;
import '../generalViolations/presentation/followUpViolations/bloc/follow_up_violations_cubit.dart'
    as _i403;
import '../generalViolations/presentation/view/bloc/general_violations_cubit.dart'
    as _i452;
import '../generalViolations/presentation/viewTypesViolations/bloc/general_types_violations_cubit.dart'
    as _i741;
import '../jobRequirements/data/data_sources/job_requirements_api.dart'
    as _i129;
import '../jobRequirements/data/models/index.dart' as _i366;
import '../jobRequirements/data/repositories/job_requirement_repo.dart'
    as _i497;
import '../jobRequirements/presentation/bloc/job_requirements_cubit.dart'
    as _i997;
import '../jobUniform/data/datasource/job_uniform_provider.dart' as _i474;
import '../jobUniform/data/repositories/job_uniform_repository.dart' as _i579;
import '../jobUniform/presentation/bloc/add_job_uniform_bloc.dart' as _i910;
import '../maintenanceAndBreakdowns/data/data_sources/maintenance_breakdowns_provider.dart'
    as _i618;
import '../maintenanceAndBreakdowns/data/repositories/maintenance_breakdowns_repository.dart'
    as _i774;
import '../maintenanceAndBreakdowns/presentation/action/cubit/action_maintenance_cubit.dart'
    as _i547;
import '../maintenanceAndBreakdowns/presentation/add_maintenance_breakdowns/cubit/add_maintenance_breakdowns_cubit.dart'
    as _i576;
import '../maintenanceAndBreakdowns/presentation/view/cubit/maintenance_breakdowns_cubit.dart'
    as _i899;
import '../notifications/data/data_sources/notifications_provider.dart'
    as _i816;
import '../notifications/data/repositories/notifications_repository.dart'
    as _i584;
import '../notifications/presentation/action/cubit/acction_vehicle_notifications_cubit.dart'
    as _i90;
import '../notifications/presentation/view/cubit/vehicle_notifications_cubit.dart'
    as _i64;
import '../opportunity_details/applied_details/bloc/applied_details_cubit.dart'
    as _i179;
import '../opportunity_details/bloc/opportunity_details_cubit.dart' as _i201;
import '../overview/presentation/bloc/admin_overview_cubit.dart' as _i50;
import '../projectsManagement/data/datasource/projects_management_provider.dart'
    as _i533;
import '../projectsManagement/data/models/index.dart' as _i686;
import '../projectsManagement/data/repositories/projects_management_repository.dart'
    as _i605;
import '../projectsManagement/presentation/addNewProject/bloc/add_additional_locations_bloc.dart'
    as _i1006;
import '../projectsManagement/presentation/addNewProject/bloc/add_new_project_bloc.dart'
    as _i805;
import '../projectsManagement/presentation/addNewProject/bloc/add_period_pricing_cubit.dart'
    as _i123;
import '../projectsManagement/presentation/addNewProject/bloc/add_working_period_bloc.dart'
    as _i377;
import '../projectsManagement/presentation/addNewProject/bloc/map_project_gates_bloc.dart'
    as _i78;
import '../projectsManagement/presentation/addNewProject/bloc/project_successfully_bloc.dart'
    as _i318;
import '../projectsManagement/presentation/projectsManagement/bloc/projects_management_cubit.dart'
    as _i95;
import '../punishments/data/datasource/punishments_provider.dart' as _i1070;
import '../punishments/data/models/index.dart' as _i530;
import '../punishments/data/repositories/punishments_repository.dart' as _i690;
import '../punishments/presentation/addPunishment/bloc/add_punishment_bloc.dart'
    as _i121;
import '../punishments/presentation/punishments/bloc/punishments_cubit.dart'
    as _i1020;
import '../reviewShifts/data/data_sources/review_opportunities_api.dart'
    as _i886;
import '../reviewShifts/data/models/index.dart' as _i566;
import '../reviewShifts/data/repositories/review_opportunities_repository.dart'
    as _i137;
import '../reviewShifts/presentation/bloc/review_opportunities_cubit.dart'
    as _i560;
import '../reviewShifts/presentation/shiftPaymentRequest/bloc/shift_payment_request%20_cubit.dart'
    as _i702;
import '../shared/data/data_sources/today_opportunity_api_provider.dart'
    as _i870;
import '../shared/data/repositories/today_opportunity_repository.dart'
    as _i1035;
import '../shared/domain/usecases/citys_usecase.dart' as _i413;
import '../shared/domain/usecases/companies_usecase.dart' as _i870;
import '../shared/domain/usecases/jobs_usecase.dart' as _i250;
import '../shared/domain/usecases/projects_usecase.dart' as _i219;
import '../terms_and_conditions/data/data_sources/terms_and_conditions_api.dart'
    as _i805;
import '../terms_and_conditions/data/models/index.dart' as _i101;
import '../terms_and_conditions/data/repositories/terms_and_conditions_repo.dart'
    as _i367;
import '../terms_and_conditions/presentation/tasksAndResponsibilities/add/bloc/add_task_and_responsibility_cubit.dart'
    as _i438;
import '../terms_and_conditions/presentation/tasksAndResponsibilities/view/bloc/tasks_and_responsibilities_cubit.dart'
    as _i1041;
import '../terms_and_conditions/presentation/termsAndConditions/add/bloc/add_term_and_condition_cubit.dart'
    as _i998;
import '../terms_and_conditions/presentation/termsAndConditions/view/bloc/terms_and_conditions_cubit.dart'
    as _i837;
import '../trackAttendanceDeparture/data/datasource/track_attendance_departure_provider.dart'
    as _i9;
import '../trackAttendanceDeparture/data/repositories/track_attendance_departure_repository.dart'
    as _i227;
import '../trackAttendanceDeparture/presentation/add/bloc/request_track_attendance_departure_bloc.dart'
    as _i324;
import '../trackAttendanceDeparture/presentation/details/bloc/track_attendance_departure_details_cubit.dart'
    as _i84;
import '../trackAttendanceDeparture/presentation/view/bloc/track_attendance_departure_cubit.dart'
    as _i681;
import '../usersManagement/data/datasource/users_management_provider.dart'
    as _i93;
import '../usersManagement/data/models/index.dart' as _i137;
import '../usersManagement/data/repositories/users_management_repository.dart'
    as _i471;
import '../usersManagement/presentation/addNewUser/bloc/add_new_user_bloc.dart'
    as _i1068;
import '../usersManagement/presentation/changeUserPassword/bloc/change_user_password_bloc.dart'
    as _i188;
import '../usersManagement/presentation/usersManagement/bloc/users_management_cubit.dart'
    as _i602;
import '../usersRequests/data/datasource/users_requests_provider.dart' as _i164;
import '../usersRequests/data/repositories/users_requests_repository.dart'
    as _i443;
import '../usersRequests/presentation/bloc/user_request_terms_cubit.dart'
    as _i227;
import '../usersRequests/presentation/bloc/users_requests_cubit.dart' as _i933;
import '../vehicles/data/datasource/vehicles_provider.dart' as _i474;
import '../vehicles/data/models/index.dart' as _i380;
import '../vehicles/data/repositories/vehicles_repository.dart' as _i815;
import '../vehicles/presentation/add/bloc/additional_vehicle_specifications_cubit.dart'
    as _i210;
import '../vehicles/presentation/add/bloc/basic_vehicle_info_cubit.dart'
    as _i915;
import '../vehicles/presentation/add/bloc/covenants_vehicles_cubit.dart'
    as _i163;
import '../vehicles/presentation/add/bloc/vehicle_plate_license_info_cubit.dart'
    as _i538;
import '../vehicles/presentation/vehicleCameras/add/bloc/add_vehicle_camera_bloc.dart'
    as _i551;
import '../vehicles/presentation/vehicleCameras/cameraSearchResults/bloc/camera_search_results_cubit.dart'
    as _i268;
import '../vehicles/presentation/vehicleCameras/view/bloc/vehicle_cameras_cubit.dart'
    as _i474;
import '../vehicles/presentation/vehicleReceiveRequests/bloc/action_vehicle_receive_request_cubit.dart'
    as _i633;
import '../vehicles/presentation/vehicleReceiveRequests/bloc/vehicle_receive_requests_cubit.dart'
    as _i535;
import '../vehicles/presentation/vehicleTracking/bloc/vehicles_tracking_cubit.dart'
    as _i295;
import '../vehicles/presentation/view/bloc/vehicles_cubit.dart' as _i905;
import '../vehicles/presentation/violations/add/bloc/add_vehicle_violation_bloc.dart'
    as _i866;
import '../vehicles/presentation/violations/details/bloc/vehicle_violation_details_cubit.dart'
    as _i703;
import '../vehicles/presentation/violations/view/bloc/vehicle_violations_cubit.dart'
    as _i151;
import 'injection_module.dart' as _i212;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i560.DeviceInfoRepository>(() => _i560.DeviceInfoRepository());
  gh.factory<_i222.DrawPolygonWithMarkersCubit>(
      () => _i222.DrawPolygonWithMarkersCubit());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  await gh.factoryAsync<_i644.Device>(
    () => injectionModule.deviceInfo,
    preResolve: true,
  );
  gh.factory<_i810.FilesPreviewCubit>(() => _i810.FilesPreviewCubit());
  gh.factory<_i249.MapPickerAPI>(() => _i249.MapPickerAPI());
  gh.factory<_i616.CollectionDataCubit>(() => _i616.CollectionDataCubit());
  gh.factory<_i735.MapPickerRepository>(
      () => _i735.MapPickerRepository(gh<_i249.MapPickerAPI>()));
  gh.factory<_i1033.LocalRepository>(
      () => _i1033.LocalRepository(preferences: gh<_i460.SharedPreferences>()));
  gh.factory<_i903.LoggerAPI>(() => _i903.LoggerAPI(gh<_i361.Dio>()));
  gh.factory<_i281.AdminEndpoint>(() => _i281.AdminEndpoint(gh<_i361.Dio>()));
  gh.factory<_i307.ConfigurationEndpoint>(
      () => _i307.ConfigurationEndpoint(gh<_i361.Dio>()));
  gh.factory<_i1029.UserEndpoint>(() => _i1029.UserEndpoint(gh<_i361.Dio>()));
  gh.factory<_i66.MapPickerCubit>(
      () => _i66.MapPickerCubit(gh<_i735.MapPickerRepository>()));
  gh.factory<_i870.TodayOpportunityApiProvider>(
      () => _i870.TodayOpportunityApiProvider(gh<_i281.AdminEndpoint>()));
  gh.factory<_i1035.TodayOpportunityRepository>(() =>
      _i1035.TodayOpportunityRepository(
          gh<_i870.TodayOpportunityApiProvider>()));
  gh.factory<_i1028.UserRepository>(
      () => _i1028.UserRepository(gh<_i460.SharedPreferences>()));
  gh.factory<_i235.AuthAPI>(
      () => _i235.AuthAPI(api: gh<_i1029.UserEndpoint>()));
  gh.factory<_i565.RequestsUserAPI>(
      () => _i565.RequestsUserAPI(api: gh<_i1029.UserEndpoint>()));
  gh.factory<_i420.AbsenceNoticeAPI>(
      () => _i420.AbsenceNoticeAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i882.ActivityLogAPI>(
      () => _i882.ActivityLogAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i600.AddAddressAPI>(
      () => _i600.AddAddressAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i20.AdvancedFilterAPI>(
      () => _i20.AdvancedFilterAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i823.AttendanceApi>(
      () => _i823.AttendanceApi(gh<_i1029.UserEndpoint>()));
  gh.factory<_i536.BailRequestsAPI>(
      () => _i536.BailRequestsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i65.BankAPI>(() => _i65.BankAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i9.CollectCashAPI>(
      () => _i9.CollectCashAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i215.EvaluationApi>(
      () => _i215.EvaluationApi(gh<_i1029.UserEndpoint>()));
  gh.factory<_i70.FavoriteProjectsApi>(
      () => _i70.FavoriteProjectsApi(gh<_i1029.UserEndpoint>()));
  gh.factory<_i581.HomeAPI>(() => _i581.HomeAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i767.JobOffersAPI>(
      () => _i767.JobOffersAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i674.LoansRequestAPI>(
      () => _i674.LoansRequestAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i342.NotificationOffersAPI>(
      () => _i342.NotificationOffersAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i444.ProfileAPI>(
      () => _i444.ProfileAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i40.ResumeAPI>(() => _i40.ResumeAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i713.SalaryDefinitionAPI>(
      () => _i713.SalaryDefinitionAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i825.ServiceAPI>(
      () => _i825.ServiceAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i660.TermsAPI>(() => _i660.TermsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i341.WalletAPI>(() => _i341.WalletAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i159.WorkerWorkPlacesAPI>(
      () => _i159.WorkerWorkPlacesAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i425.AttendanceAndDepartureNotificationsAPI>(() =>
      _i425.AttendanceAndDepartureNotificationsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i1021.EmployeesCertificatesAPI>(
      () => _i1021.EmployeesCertificatesAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i809.PledgesAndGeneralizationAPI>(
      () => _i809.PledgesAndGeneralizationAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i408.TransactionsAPI>(
      () => _i408.TransactionsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i199.ReceiveVehiclesAPI>(
      () => _i199.ReceiveVehiclesAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i771.ViolationsUserAPI>(
      () => _i771.ViolationsUserAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i193.WorkHazardsAPI>(
      () => _i193.WorkHazardsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i350.WorkingDocumentAPI>(
      () => _i350.WorkingDocumentAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i418.ChashiftLonsAPI>(
      () => _i418.ChashiftLonsAPI(gh<_i1029.UserEndpoint>()));
  gh.factory<_i694.RequestsUserRepository>(
      () => _i694.RequestsUserRepository(gh<_i565.RequestsUserAPI>()));
  gh.factory<_i783.LoggerRepository>(
      () => _i783.LoggerRepository(gh<_i1028.UserRepository>()));
  gh.factory<_i35.ViolationsUserRepository>(
      () => _i35.ViolationsUserRepository(gh<_i771.ViolationsUserAPI>()));
  gh.factory<_i146.AdvancedFilterRepository>(
      () => _i146.AdvancedFilterRepository(gh<_i20.AdvancedFilterAPI>()));
  gh.factory<_i825.ActivityLogRepository>(
      () => _i825.ActivityLogRepository(gh<_i882.ActivityLogAPI>()));
  gh.factory<_i304.CollectCashRepository>(
      () => _i304.CollectCashRepository(gh<_i9.CollectCashAPI>()));
  gh.factory<_i52.AbsenceNoticeRepository>(
      () => _i52.AbsenceNoticeRepository(gh<_i420.AbsenceNoticeAPI>()));
  gh.factory<_i430.AddOpportunityAPI>(
      () => _i430.AddOpportunityAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i320.AdminWalletAPI>(
      () => _i320.AdminWalletAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i650.VehiclesZoneAPI>(
      () => _i650.VehiclesZoneAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i615.AttendanceNotificationsReportsAPI>(() =>
      _i615.AttendanceNotificationsReportsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i586.BanEmployeesAPI>(
      () => _i586.BanEmployeesAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i395.CashiftersLoansAPI>(
      () => _i395.CashiftersLoansAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i680.ClassificationAPI>(
      () => _i680.ClassificationAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i685.EmployeeMapAPI>(
      () => _i685.EmployeeMapAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i717.EmployeesAPI>(
      () => _i717.EmployeesAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i1029.EmploymentManagementAPI>(
      () => _i1029.EmploymentManagementAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i949.EmploymentOfficialsAPI>(
      () => _i949.EmploymentOfficialsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i393.FocusPointsAPI>(
      () => _i393.FocusPointsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i432.GasStationsAPI>(
      () => _i432.GasStationsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i740.GeneralViolationsAPI>(
      () => _i740.GeneralViolationsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i129.JobRequirementsAPI>(
      () => _i129.JobRequirementsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i474.JobUniformAPI>(
      () => _i474.JobUniformAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i618.MaintenanceBreakdownsAPI>(
      () => _i618.MaintenanceBreakdownsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i816.NotificationsAPI>(
      () => _i816.NotificationsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i533.ProjectsManagementAPI>(
      () => _i533.ProjectsManagementAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i1070.PunishmentsAPI>(
      () => _i1070.PunishmentsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i886.ReviewOpportunitiesApi>(
      () => _i886.ReviewOpportunitiesApi(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i805.TermandConditionAPI>(
      () => _i805.TermandConditionAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i9.TrackAttendanceDepartureAPI>(
      () => _i9.TrackAttendanceDepartureAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i93.UsersManagementAPI>(
      () => _i93.UsersManagementAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i164.UsersRequestsAPI>(
      () => _i164.UsersRequestsAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i474.VehiclesAPI>(
      () => _i474.VehiclesAPI(api: gh<_i281.AdminEndpoint>()));
  gh.factory<_i774.MaintenanceBreakdownsRepository>(() =>
      _i774.MaintenanceBreakdownsRepository(
          gh<_i618.MaintenanceBreakdownsAPI>()));
  gh.factory<_i137.ReviewOpportunitiesRepository>(() =>
      _i137.ReviewOpportunitiesRepository(gh<_i886.ReviewOpportunitiesApi>()));
  gh.factory<_i981.CollectCashCubit>(
      () => _i981.CollectCashCubit(gh<_i304.CollectCashRepository>()));
  gh.factory<_i734.WorkHazardsRepository>(
      () => _i734.WorkHazardsRepository(gh<_i42.WorkHazardsAPI>()));
  gh.factory<_i415.GasStationsRepository>(
      () => _i415.GasStationsRepository(gh<_i432.GasStationsAPI>()));
  gh.factory<_i639.BanEmployeesRepository>(
      () => _i639.BanEmployeesRepository(gh<_i586.BanEmployeesAPI>()));
  gh.factory<_i690.PunishmentsRepository>(
      () => _i690.PunishmentsRepository(gh<_i1070.PunishmentsAPI>()));
  gh.factory<_i297.TransactionsRepository>(
      () => _i297.TransactionsRepository(gh<_i408.TransactionsAPI>()));
  gh.factory<_i815.VehiclesRepository>(
      () => _i815.VehiclesRepository(gh<_i474.VehiclesAPI>()));
  gh.factory<_i454.BailRequestsRepository>(
      () => _i454.BailRequestsRepository(gh<_i536.BailRequestsAPI>()));
  gh.factory<_i982.GasStationsCubit>(
      () => _i982.GasStationsCubit(gh<_i415.GasStationsRepository>()));
  gh.factory<_i633.AuthRepository>(() => _i633.AuthRepository(
        gh<_i235.AuthAPI>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i1007.WorkerWorkPlacesRepository>(
      () => _i1007.WorkerWorkPlacesRepository(gh<_i159.WorkerWorkPlacesAPI>()));
  gh.factory<_i1061.FocusPointsRepository>(
      () => _i1061.FocusPointsRepository(gh<_i393.FocusPointsAPI>()));
  gh.factory<_i7.VerificationBloc>(
      () => _i7.VerificationBloc(gh<_i633.AuthRepository>()));
  gh.factory<_i431.AddAddressRepository>(
      () => _i431.AddAddressRepository(gh<_i600.AddAddressAPI>()));
  gh.factory<_i518.ChashiftLonsRepository>(
      () => _i518.ChashiftLonsRepository(gh<_i418.ChashiftLonsAPI>()));
  gh.factory<_i568.GeneralViolationsRepository>(() =>
      _i568.GeneralViolationsRepository(gh<_i1014.GeneralViolationsAPI>()));
  gh.factory<_i547.ActionMaintenanceBreakdownsCubit>(() =>
      _i547.ActionMaintenanceBreakdownsCubit(
          gh<_i774.MaintenanceBreakdownsRepository>()));
  gh.factory<_i576.AddMaintenanceBreakdownsCubit>(() =>
      _i576.AddMaintenanceBreakdownsCubit(
          gh<_i774.MaintenanceBreakdownsRepository>()));
  gh.factory<_i899.MaintenanceBreakdownsCubit>(() =>
      _i899.MaintenanceBreakdownsCubit(
          gh<_i774.MaintenanceBreakdownsRepository>()));
  gh.factory<_i740.EmployeeMapRepository>(
      () => _i740.EmployeeMapRepository(gh<_i685.EmployeeMapAPI>()));
  gh.factory<_i291.PledgesAndGeneralizationRepository>(() =>
      _i291.PledgesAndGeneralizationRepository(
          gh<_i809.PledgesAndGeneralizationAPI>()));
  gh.factory<_i133.CashiftersLoansRepository>(
      () => _i133.CashiftersLoansRepository(gh<_i395.CashiftersLoansAPI>()));
  gh.factory<_i521.ChashiftLoansCubit>(
      () => _i521.ChashiftLoansCubit(gh<_i518.ChashiftLonsRepository>()));
  gh.factory<_i445.SalaryDefinitionRepository>(
      () => _i445.SalaryDefinitionRepository(gh<_i713.SalaryDefinitionAPI>()));
  gh.factory<_i204.ServiceRepository>(
      () => _i204.ServiceRepository(gh<_i825.ServiceAPI>()));
  gh.factory<_i497.JobRequirementsRepository>(
      () => _i497.JobRequirementsRepository(gh<_i129.JobRequirementsAPI>()));
  gh.factory<_i560.ReviewOpportunitiesCubit>(() =>
      _i560.ReviewOpportunitiesCubit(
          gh<_i566.ReviewOpportunitiesRepository>()));
  gh.factory<_i702.ShiftPaymentCubitCubit>(() =>
      _i702.ShiftPaymentCubitCubit(gh<_i137.ReviewOpportunitiesRepository>()));
  gh.factory<_i194.AdminWalletRepository>(
      () => _i194.AdminWalletRepository(gh<_i320.AdminWalletAPI>()));
  gh.factory<_i145.ActivityLogCubit>(
      () => _i145.ActivityLogCubit(gh<_i825.ActivityLogRepository>()));
  gh.factory<_i507.ProjectsRepository>(
      () => _i507.ProjectsRepository(gh<_i70.FavoriteProjectsApi>()));
  gh.factory<_i201.OpportunityDetailsCubit>(() =>
      _i201.OpportunityDetailsCubit(gh<_i1035.TodayOpportunityRepository>()));
  gh.factory<_i424.PledgesAndGeneralizationCubit>(() =>
      _i424.PledgesAndGeneralizationCubit(
          gh<_i291.PledgesAndGeneralizationRepository>()));
  gh.factory<_i927.AddFileRequestsUserCubit>(
      () => _i927.AddFileRequestsUserCubit(gh<_i694.RequestsUserRepository>()));
  gh.factory<_i310.AddRequestsUserCubit>(
      () => _i310.AddRequestsUserCubit(gh<_i694.RequestsUserRepository>()));
  gh.factory<_i384.ConfirmRequestsUserCubit>(
      () => _i384.ConfirmRequestsUserCubit(gh<_i694.RequestsUserRepository>()));
  gh.factory<_i108.TermCondationRequestsUserCubit>(() =>
      _i108.TermCondationRequestsUserCubit(gh<_i694.RequestsUserRepository>()));
  gh.factory<_i691.RequestsUserCubit>(
      () => _i691.RequestsUserCubit(gh<_i694.RequestsUserRepository>()));
  gh.factory<_i558.WorkHazardDetailsCubit>(
      () => _i558.WorkHazardDetailsCubit(gh<_i734.WorkHazardsRepository>()));
  gh.factory<_i834.WorkHazardsCubit>(
      () => _i834.WorkHazardsCubit(gh<_i734.WorkHazardsRepository>()));
  gh.factory<_i597.LoansRequestRepository>(
      () => _i597.LoansRequestRepository(gh<_i674.LoansRequestAPI>()));
  gh.factory<_i536.WalletRepository>(
      () => _i536.WalletRepository(gh<_i341.WalletAPI>()));
  gh.factory<_i443.UsersRequestsRepository>(
      () => _i443.UsersRequestsRepository(gh<_i164.UsersRequestsAPI>()));
  gh.factory<_i1072.AddTransactionsCubit>(
      () => _i1072.AddTransactionsCubit(gh<_i297.TransactionsRepository>()));
  gh.factory<_i319.TransactionsCubit>(
      () => _i319.TransactionsCubit(gh<_i297.TransactionsRepository>()));
  gh.factory<_i1005.AddOpportunityRepository>(
      () => _i1005.AddOpportunityRepository(gh<_i430.AddOpportunityAPI>()));
  gh.factory<_i367.TermandConditionRepository>(
      () => _i367.TermandConditionRepository(gh<_i805.TermandConditionAPI>()));
  gh.factory<_i366.WorkingDocumentRepository>(
      () => _i366.WorkingDocumentRepository(gh<_i350.WorkingDocumentAPI>()));
  gh.factory<_i209.EvaluationRepository>(
      () => _i209.EvaluationRepository(gh<_i215.EvaluationApi>()));
  gh.factory<_i760.EmployeesRepository>(
      () => _i760.EmployeesRepository(gh<_i717.EmployeesAPI>()));
  gh.factory<_i523.BailRequestsCubit>(
      () => _i523.BailRequestsCubit(gh<_i454.BailRequestsRepository>()));
  gh.factory<_i633.ActionVehicleReceiveRequestCubit>(() =>
      _i633.ActionVehicleReceiveRequestCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i535.VehicleReceiveRequestsCubit>(
      () => _i535.VehicleReceiveRequestsCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i703.VehicleViolationDetailsCubit>(
      () => _i703.VehicleViolationDetailsCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i883.TermsRepository>(
      () => _i883.TermsRepository(gh<_i660.TermsAPI>()));
  gh.factory<_i710.GeneralViolationCubit>(() =>
      _i710.GeneralViolationCubit(gh<_i1014.GeneralViolationsRepository>()));
  gh.factory<_i949.AvailableOpportunitiesCubit>(
      () => _i949.AvailableOpportunitiesCubit(
            gh<_i1035.TodayOpportunityRepository>(),
            gh<_i146.AdvancedFilterRepository>(),
          ));
  gh.factory<_i155.CovenantReceivedCubit>(() => _i155.CovenantReceivedCubit(
        gh<_i1061.FocusPointsRepository>(),
        gh<_i1007.WorkerWorkPlacesRepository>(),
      ));
  gh.factory<_i61.ReceiveVehiclesRepository>(
      () => _i61.ReceiveVehiclesRepository(gh<_i199.ReceiveVehiclesAPI>()));
  gh.factory<_i922.ProfileRepository>(() => _i922.ProfileRepository(
        gh<_i444.ProfileAPI>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i415.FavoriteProjectsCubit>(
      () => _i415.FavoriteProjectsCubit(gh<_i507.ProjectsRepository>()));
  gh.factory<_i835.AttendanceAndDepartureNotificationsRepository>(() =>
      _i835.AttendanceAndDepartureNotificationsRepository(
          gh<_i425.AttendanceAndDepartureNotificationsAPI>()));
  gh.factory<_i883.JobOffersRepository>(
      () => _i883.JobOffersRepository(gh<_i767.JobOffersAPI>()));
  gh.factory<_i841.ChangeOperatingPlaneCubit>(() =>
      _i841.ChangeOperatingPlaneCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i414.TourHistoryCubit>(
      () => _i414.TourHistoryCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i285.FactoryViolationsPlaneCubit>(() =>
      _i285.FactoryViolationsPlaneCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i206.GasStationsPlaneCubit>(
      () => _i206.GasStationsPlaneCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i190.MaintenanceBreakdownsPlaneCubit>(() =>
      _i190.MaintenanceBreakdownsPlaneCubit(
          gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i418.TourHistoryCubit>(
      () => _i418.TourHistoryCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i649.CurrentTourMapCubit>(
      () => _i649.CurrentTourMapCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i708.VehiclesComponentsCubit>(() =>
      _i708.VehiclesComponentsCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i13.VehiclesCustodiesCubit>(
      () => _i13.VehiclesCustodiesCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i158.ReceiveVehiclesCubit>(
      () => _i158.ReceiveVehiclesCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i712.StartTourCubit>(
      () => _i712.StartTourCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i1020.PunishmentsCubit>(
      () => _i1020.PunishmentsCubit(gh<_i690.PunishmentsRepository>()));
  gh.factory<_i688.EvaluationCubit>(
      () => _i688.EvaluationCubit(gh<_i209.EvaluationRepository>()));
  gh.factory<_i88.ReceiveVehicleDetailsCubit>(() =>
      _i88.ReceiveVehicleDetailsCubit(gh<_i61.ReceiveVehiclesRepository>()));
  gh.factory<_i48.VehicleReceivedImagesCubit>(
      () => _i48.VehicleReceivedImagesCubit(
            gh<_i61.ReceiveVehiclesRepository>(),
            gh<_i815.VehiclesRepository>(),
          ));
  gh.factory<_i641.DeliveryAndReceiptCubit>(() =>
      _i641.DeliveryAndReceiptCubit(gh<_i1007.WorkerWorkPlacesRepository>()));
  gh.factory<_i111.WorkerWorkPlacesCubit>(() =>
      _i111.WorkerWorkPlacesCubit(gh<_i1007.WorkerWorkPlacesRepository>()));
  gh.factory<_i805.EmploymentManagementRepository>(() =>
      _i805.EmploymentManagementRepository(
          gh<_i1029.EmploymentManagementAPI>()));
  gh.factory<_i874.NotificationOffersRepository>(() =>
      _i874.NotificationOffersRepository(gh<_i342.NotificationOffersAPI>()));
  gh.factory<_i579.JobUniformRepository>(
      () => _i579.JobUniformRepository(gh<_i474.JobUniformAPI>()));
  gh.factory<_i565.BankRepository>(
      () => _i565.BankRepository(gh<_i65.BankAPI>()));
  gh.factory<_i563.ResumeRepository>(() => _i563.ResumeRepository(
        gh<_i40.ResumeAPI>(),
        gh<_i460.SharedPreferences>(),
      ));
  gh.factory<_i845.AppliedOffersCubit>(() => _i845.AppliedOffersCubit(
        gh<_i883.JobOffersRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i783.LoggerRepository>(),
      ));
  gh.factory<_i605.ProjectsManagementRepository>(() =>
      _i605.ProjectsManagementRepository(gh<_i533.ProjectsManagementAPI>()));
  gh.factory<_i250.RespondDashboardRequiredActionUseCase>(() =>
      _i250.RespondDashboardRequiredActionUseCase(
          gh<_i883.JobOffersRepository>()));
  gh.factory<_i604.RespondRequiredTaskUseCase>(
      () => _i604.RespondRequiredTaskUseCase(gh<_i883.JobOffersRepository>()));
  gh.factory<_i919.RequiredTasksUseCase>(
      () => _i919.RequiredTasksUseCase(gh<_i883.JobOffersRepository>()));
  gh.factory<_i1041.TasksAndResponsibilitiesCubit>(
      () => _i1041.TasksAndResponsibilitiesCubit(
            gh<_i101.TermandConditionRepository>(),
            gh<_i686.ProjectsManagementRepository>(),
          ));
  gh.factory<_i998.AddTermAndConditionCubit>(
      () => _i998.AddTermAndConditionCubit(
            gh<_i101.TermandConditionRepository>(),
            gh<_i605.ProjectsManagementRepository>(),
          ));
  gh.factory<_i837.TermsAndConditionsCubit>(() => _i837.TermsAndConditionsCubit(
        gh<_i101.TermandConditionRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
      ));
  gh.factory<_i927.BanEmployeeDetailsCubit>(
      () => _i927.BanEmployeeDetailsCubit(gh<_i425.BanEmployeesRepository>()));
  gh.factory<_i483.BanEmployeesCubit>(
      () => _i483.BanEmployeesCubit(gh<_i425.BanEmployeesRepository>()));
  gh.factory<_i1070.EmployeesCertificatesItemRepository>(() =>
      _i1070.EmployeesCertificatesItemRepository(
          gh<_i1021.EmployeesCertificatesAPI>()));
  gh.factory<_i279.OverviewBloc>(() => _i279.OverviewBloc(
        gh<_i883.JobOffersRepository>(),
        gh<_i1028.UserRepository>(),
        gh<_i825.ActivityLogRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i919.RequiredTasksUseCase>(),
        gh<_i922.ProfileRepository>(),
      ));
  gh.factory<_i1061.OverviewCubit>(() => _i1061.OverviewCubit(
        gh<_i883.JobOffersRepository>(),
        gh<_i1028.UserRepository>(),
        gh<_i825.ActivityLogRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i919.RequiredTasksUseCase>(),
        gh<_i922.ProfileRepository>(),
      ));
  gh.factory<_i968.ClassificationRepository>(
      () => _i968.ClassificationRepository(gh<_i680.ClassificationAPI>()));
  gh.factory<_i121.AddPunishmentCubit>(
      () => _i121.AddPunishmentCubit(gh<_i530.PunishmentsRepository>()));
  gh.factory<_i339.AttendanceRepository>(
      () => _i339.AttendanceRepository(gh<_i823.AttendanceApi>()));
  gh.factory<_i471.UsersManagementRepository>(
      () => _i471.UsersManagementRepository(gh<_i93.UsersManagementAPI>()));
  gh.factory<_i997.JobRequirementsCubit>(
      () => _i997.JobRequirementsCubit(gh<_i366.JobRequirementsRepository>()));
  gh.factory<_i300.ApplyDetailsCubit>(
      () => _i300.ApplyDetailsCubit(gh<_i536.WalletRepository>()));
  gh.factory<_i168.BalancesCubit>(
      () => _i168.BalancesCubit(gh<_i536.WalletRepository>()));
  gh.factory<_i13.HomeRepository>(
      () => _i13.HomeRepository(gh<_i581.HomeAPI>()));
  gh.factory<_i507.ClassificationCubit>(
      () => _i507.ClassificationCubit(gh<_i968.ClassificationRepository>()));
  gh.factory<_i364.ViolationsUserCubit>(
      () => _i364.ViolationsUserCubit(gh<_i35.ViolationsUserRepository>()));
  gh.factory<_i1066.AttendanceNotificationsReportsRepository>(() =>
      _i1066.AttendanceNotificationsReportsRepository(
          gh<_i615.AttendanceNotificationsReportsAPI>()));
  gh.factory<_i390.AddAttendanceAndDepartureNotificationsCubit>(() =>
      _i390.AddAttendanceAndDepartureNotificationsCubit(
          gh<_i835.AttendanceAndDepartureNotificationsRepository>()));
  gh.factory<_i609.AttendanceAndDepartureNotificationsCubit>(() =>
      _i609.AttendanceAndDepartureNotificationsCubit(
          gh<_i835.AttendanceAndDepartureNotificationsRepository>()));
  gh.factory<_i1040.VehiclesZoneRepository>(
      () => _i1040.VehiclesZoneRepository(gh<_i650.VehiclesZoneAPI>()));
  gh.factory<_i658.AdvancedFilterCubit>(() => _i658.AdvancedFilterCubit(
        gh<_i146.AdvancedFilterRepository>(),
        gh<_i460.SharedPreferences>(),
      ));
  gh.factory<_i549.EmployeesCubit>(
      () => _i549.EmployeesCubit(gh<_i760.EmployeesRepository>()));
  gh.factory<_i1059.EmployeesAttendanceCubit>(
      () => _i1059.EmployeesAttendanceCubit(gh<_i760.EmployeesRepository>()));
  gh.factory<_i476.AddSalaryDefinitionRequestCubit>(() =>
      _i476.AddSalaryDefinitionRequestCubit(
          gh<_i445.SalaryDefinitionRepository>()));
  gh.factory<_i907.SalaryDefinitionRequestCubit>(() =>
      _i907.SalaryDefinitionRequestCubit(
          gh<_i445.SalaryDefinitionRepository>()));
  gh.factory<_i22.WalletCubit>(() => _i22.WalletCubit(
        gh<_i536.WalletRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i227.TrackAttendanceDepartureRepository>(() =>
      _i227.TrackAttendanceDepartureRepository(
          gh<_i9.TrackAttendanceDepartureAPI>()));
  gh.factory<_i235.InstallmentPostponementCubit>(() =>
      _i235.InstallmentPostponementCubit(
          gh<_i366.WorkingDocumentRepository>()));
  gh.factory<_i752.InstallmentWithCashiftCubit>(() =>
      _i752.InstallmentWithCashiftCubit(gh<_i366.WorkingDocumentRepository>()));
  gh.factory<_i87.PayWithSalaryCubit>(
      () => _i87.PayWithSalaryCubit(gh<_i366.WorkingDocumentRepository>()));
  gh.factory<_i478.TermsConditionsCertificatePaymentCubit>(() =>
      _i478.TermsConditionsCertificatePaymentCubit(
          gh<_i366.WorkingDocumentRepository>()));
  gh.factory<_i641.WorkingDocumentCubit>(
      () => _i641.WorkingDocumentCubit(gh<_i366.WorkingDocumentRepository>()));
  gh.factory<_i580.ServicesCubit>(() => _i580.ServicesCubit(
        gh<_i204.ServiceRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i930.EmploymentOfficialsRepository>(() =>
      _i930.EmploymentOfficialsRepository(gh<_i949.EmploymentOfficialsAPI>()));
  gh.factory<_i584.NotificationsRepository>(
      () => _i584.NotificationsRepository(gh<_i816.NotificationsAPI>()));
  gh.factory<_i398.ActionFollowUpViolationsCubit>(() =>
      _i398.ActionFollowUpViolationsCubit(
          gh<_i1014.GeneralViolationsRepository>()));
  gh.factory<_i403.FollowUpViolationsCubit>(() =>
      _i403.FollowUpViolationsCubit(gh<_i1014.GeneralViolationsRepository>()));
  gh.factory<_i452.GeneralViolationsCubit>(() =>
      _i452.GeneralViolationsCubit(gh<_i568.GeneralViolationsRepository>()));
  gh.factory<_i741.GeneralTypesViolationsCubit>(() =>
      _i741.GeneralTypesViolationsCubit(
          gh<_i568.GeneralViolationsRepository>()));
  gh.factory<_i116.ResumeBloc>(() => _i116.ResumeBloc(
        gh<_i563.ResumeRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i1006.AdditionalLocationsCubit>(() =>
      _i1006.AdditionalLocationsCubit(
          gh<_i686.ProjectsManagementRepository>()));
  gh.factory<_i123.PeriodPricingCubit>(
      () => _i123.PeriodPricingCubit(gh<_i686.ProjectsManagementRepository>()));
  gh.factory<_i377.AddWorkingPeriodCubit>(() =>
      _i377.AddWorkingPeriodCubit(gh<_i686.ProjectsManagementRepository>()));
  gh.factory<_i78.MapProjectGatesCubit>(() =>
      _i78.MapProjectGatesCubit(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i318.ProjectSuccessfullyCubit>(() =>
      _i318.ProjectSuccessfullyCubit(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i699.RequiredTasksCubit>(
      () => _i699.RequiredTasksCubit(gh<_i604.RespondRequiredTaskUseCase>()));
  gh.factory<_i465.ConfirmAttendanceCubit>(() =>
      _i465.ConfirmAttendanceCubit(gh<_i604.RespondRequiredTaskUseCase>()));
  gh.factory<_i329.FilterAttendanceNotificationsReportsCubit>(() =>
      _i329.FilterAttendanceNotificationsReportsCubit(
          gh<_i760.EmployeesRepository>()));
  gh.factory<_i606.FaceRecognitionCubit>(
      () => _i606.FaceRecognitionCubit(gh<_i922.ProfileRepository>()));
  gh.factory<_i890.EmploymentOfficialsCubit>(() =>
      _i890.EmploymentOfficialsCubit(
          gh<_i930.EmploymentOfficialsRepository>()));
  gh.factory<_i645.ForgetPasswordCubit>(
      () => _i645.ForgetPasswordCubit(gh<_i633.AuthRepository>()));
  gh.factory<_i622.AddCashifterLoanCubit>(() => _i622.AddCashifterLoanCubit(
        gh<_i133.CashiftersLoansRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
      ));
  gh.factory<_i827.AddFocusPointDataCubit>(
      () => _i827.AddFocusPointDataCubit(gh<_i250.FocusPointsRepository>()));
  gh.factory<_i62.AddFocusPointTimesCubit>(
      () => _i62.AddFocusPointTimesCubit(gh<_i250.FocusPointsRepository>()));
  gh.factory<_i451.FocusPointCubit>(
      () => _i451.FocusPointCubit(gh<_i1061.FocusPointsRepository>()));
  gh.factory<_i634.TrackingFocusPointsCubit>(
      () => _i634.TrackingFocusPointsCubit(gh<_i1061.FocusPointsRepository>()));
  gh.factory<_i210.AdditionalVehicleSpecificationsCubit>(() =>
      _i210.AdditionalVehicleSpecificationsCubit(
          gh<_i815.VehiclesRepository>()));
  gh.factory<_i163.CovenantsVehiclesCubit>(
      () => _i163.CovenantsVehiclesCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i538.VehiclePlateLicenseInfoCubit>(
      () => _i538.VehiclePlateLicenseInfoCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i551.AddVehicleCameraCubit>(
      () => _i551.AddVehicleCameraCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i268.CameraSearchResultsCubit>(
      () => _i268.CameraSearchResultsCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i474.VehicleCamerasCubit>(
      () => _i474.VehicleCamerasCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i295.VehiclesTrackingCubit>(
      () => _i295.VehiclesTrackingCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i905.VehiclesCubit>(
      () => _i905.VehiclesCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i866.AddVehicleViolationCubit>(
      () => _i866.AddVehicleViolationCubit(gh<_i380.VehiclesRepository>()));
  gh.factory<_i151.VehiclesCubit>(
      () => _i151.VehiclesCubit(gh<_i815.VehiclesRepository>()));
  gh.factory<_i334.FilterEmployeeMapCubit>(() => _i334.FilterEmployeeMapCubit(
        gh<_i605.ProjectsManagementRepository>(),
        gh<_i563.ResumeRepository>(),
      ));
  gh.factory<_i385.LoginBloc>(() => _i385.LoginBloc(
        gh<_i633.AuthRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i910.AddJobUniformCubit>(() => _i910.AddJobUniformCubit(
        gh<_i579.JobUniformRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
      ));
  gh.factory<_i844.AbsenceNoticeCubit>(() => _i844.AbsenceNoticeCubit(
        gh<_i52.AbsenceNoticeRepository>(),
        gh<_i339.AttendanceRepository>(),
      ));
  gh.factory<_i68.WithdrawCubit>(() => _i68.WithdrawCubit(
        gh<_i536.WalletRepository>(),
        gh<_i565.BankRepository>(),
      ));
  gh.factory<_i501.AddTypeViolationCubit>(() => _i501.AddTypeViolationCubit(
        gh<_i1014.GeneralViolationsRepository>(),
        gh<_i686.ProjectsManagementRepository>(),
        gh<_i137.UsersManagementRepository>(),
        gh<_i250.FocusPointsRepository>(),
      ));
  gh.factory<_i467.AddGeneralViolationCubit>(
      () => _i467.AddGeneralViolationCubit(
            gh<_i1014.GeneralViolationsRepository>(),
            gh<_i686.ProjectsManagementRepository>(),
            gh<_i137.UsersManagementRepository>(),
            gh<_i250.FocusPointsRepository>(),
          ));
  gh.factory<_i179.AppliedDetailsCubit>(() => _i179.AppliedDetailsCubit(
        gh<_i1035.TodayOpportunityRepository>(),
        gh<_i805.EmploymentManagementRepository>(),
      ));
  gh.factory<_i933.UsersRequestsCubit>(
      () => _i933.UsersRequestsCubit(gh<_i443.UsersRequestsRepository>()));
  gh.factory<_i227.UserRequestTermsCubit>(
      () => _i227.UserRequestTermsCubit(gh<_i443.UsersRequestsRepository>()));
  gh.factory<_i867.OvertimeAttendanceCubit>(
      () => _i867.OvertimeAttendanceCubit(gh<_i339.AttendanceRepository>()));
  gh.factory<_i453.AddAddressCubit>(() => _i453.AddAddressCubit(
        gh<_i431.AddAddressRepository>(),
        gh<_i735.MapPickerRepository>(),
      ));
  gh.factory<_i277.EmployeeCertificateDetailsCubit>(() =>
      _i277.EmployeeCertificateDetailsCubit(
          gh<_i1070.EmployeesCertificatesItemRepository>()));
  gh.factory<_i518.EmployeesCertificatesCubit>(() =>
      _i518.EmployeesCertificatesCubit(
          gh<_i1070.EmployeesCertificatesItemRepository>()));
  gh.factory<_i50.AdminOverviewCubit>(() => _i50.AdminOverviewCubit(
        gh<_i1028.UserRepository>(),
        gh<_i1035.TodayOpportunityRepository>(),
        gh<_i919.RequiredTasksUseCase>(),
      ));
  gh.factory<_i655.EmployeesOpportunitiesCubit>(() =>
      _i655.EmployeesOpportunitiesCubit(gh<_i622.AddOpportunityRepository>()));
  gh.factory<_i413.CityUseCase>(
      () => _i413.CityUseCase(gh<_i563.ResumeRepository>()));
  gh.factory<_i14.QrCodeCubit>(
      () => _i14.QrCodeCubit(gh<_i563.ResumeRepository>()));
  gh.factory<_i844.AddClassificationCubit>(() => _i844.AddClassificationCubit(
        gh<_i968.ClassificationRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
      ));
  gh.factory<_i290.InfoVehiclesCubit>(() => _i290.InfoVehiclesCubit(
        gh<_i61.ReceiveVehiclesRepository>(),
        gh<_i1061.FocusPointsRepository>(),
      ));
  gh.factory<_i352.AddHomeAddressCubit>(() => _i352.AddHomeAddressCubit(
        gh<_i431.AddAddressRepository>(),
        gh<_i563.ResumeRepository>(),
      ));
  gh.factory<_i196.AddLoanRequestCubit>(
      () => _i196.AddLoanRequestCubit(gh<_i597.LoansRequestRepository>()));
  gh.factory<_i94.VehiclesZoneCubit>(
      () => _i94.VehiclesZoneCubit(gh<_i1040.VehiclesZoneRepository>()));
  gh.factory<_i179.AttachmentEmployeesCubit>(
      () => _i179.AttachmentEmployeesCubit(gh<_i760.EmployeesRepository>()));
  gh.factory<_i556.LoanRequestsCubit>(
      () => _i556.LoanRequestsCubit(gh<_i597.LoansRequestRepository>()));
  gh.factory<_i325.AdminWalletCubit>(() => _i325.AdminWalletCubit(
        gh<_i159.AdminWalletRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i571.SearchEmployeeMapCubit>(() => _i571.SearchEmployeeMapCubit(
        gh<_i740.EmployeeMapRepository>(),
        gh<_i563.ResumeRepository>(),
      ));
  gh.factory<_i161.PhoneWalletCubit>(
      () => _i161.PhoneWalletCubit(gh<_i565.BankRepository>()));
  gh.factory<_i770.BankAccountCubit>(
      () => _i770.BankAccountCubit(gh<_i565.BankRepository>()));
  gh.factory<_i778.CancelOpportunityApologizingCubit>(() =>
      _i778.CancelOpportunityApologizingCubit(gh<_i883.JobOffersRepository>()));
  gh.factory<_i67.AttendanceNotificationsReportsCubit>(
      () => _i67.AttendanceNotificationsReportsCubit(
            gh<_i1066.AttendanceNotificationsReportsRepository>(),
            gh<_i760.EmployeesRepository>(),
          ));
  gh.factory<_i165.AddOpportunityCubit>(() => _i165.AddOpportunityCubit(
        gh<_i622.AddOpportunityRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
        gh<_i471.UsersManagementRepository>(),
      ));
  gh.factory<_i897.AttendanceCubit>(() => _i897.AttendanceCubit(
      attendanceRepository: gh<_i339.AttendanceRepository>()));
  gh.factory<_i39.SplashCubit>(() => _i39.SplashCubit(
        gh<_i563.ResumeRepository>(),
        gh<_i1028.UserRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i1033.LocalRepository>(),
      ));
  gh.factory<_i645.HomeBloc>(() => _i645.HomeBloc(
        gh<_i13.HomeRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i1028.UserRepository>(),
        gh<_i61.ReceiveVehiclesRepository>(),
      ));
  gh.factory<_i872.ProfileCubit>(() => _i872.ProfileCubit(
        gh<_i1028.UserRepository>(),
        gh<_i922.ProfileRepository>(),
        gh<_i563.ResumeRepository>(),
      ));
  gh.factory<_i754.CopyRightsBloc>(
      () => _i754.CopyRightsBloc(gh<_i883.TermsRepository>()));
  gh.factory<_i602.UsersManagementCubit>(
      () => _i602.UsersManagementCubit(gh<_i471.UsersManagementRepository>()));
  gh.factory<_i124.CashiftAttendanceCubit>(() => _i124.CashiftAttendanceCubit(
        gh<_i922.ProfileRepository>(),
        gh<_i883.JobOffersRepository>(),
        gh<_i339.AttendanceRepository>(),
      ));
  gh.factory<_i805.AddNewProjectCubit>(() => _i805.AddNewProjectCubit(
        gh<_i686.ProjectsManagementRepository>(),
        gh<_i1005.AddOpportunityRepository>(),
      ));
  gh.factory<_i1047.ChangePasswordCubit>(() => _i1047.ChangePasswordCubit(
        gh<_i1028.UserRepository>(),
        gh<_i922.ProfileRepository>(),
      ));
  gh.factory<_i902.AddVehiclesZoneCubit>(() => _i902.AddVehiclesZoneCubit(
        gh<_i1040.VehiclesZoneRepository>(),
        gh<_i686.ProjectsManagementRepository>(),
        gh<_i137.UsersManagementRepository>(),
        gh<_i250.FocusPointsRepository>(),
        gh<_i380.VehiclesRepository>(),
      ));
  gh.factory<_i745.NotificationOffersCubit>(() =>
      _i745.NotificationOffersCubit(gh<_i874.NotificationOffersRepository>()));
  gh.factory<_i611.FavoriteJobsCubit>(
      () => _i611.FavoriteJobsCubit(gh<_i563.ResumeRepository>()));
  gh.factory<_i84.TrackAttendanceDepartureDetailsCubit>(() =>
      _i84.TrackAttendanceDepartureDetailsCubit(
          gh<_i227.TrackAttendanceDepartureRepository>()));
  gh.factory<_i681.TrackAttendanceDepartureCubit>(() =>
      _i681.TrackAttendanceDepartureCubit(
          gh<_i227.TrackAttendanceDepartureRepository>()));
  gh.factory<_i423.EmploymentManagementCubit>(
      () => _i423.EmploymentManagementCubit(
            gh<_i716.EmploymentManagementRepository>(),
            gh<_i1061.FocusPointsRepository>(),
          ));
  gh.factory<_i744.AddEmploymentOfficialCubit>(
      () => _i744.AddEmploymentOfficialCubit(
            gh<_i469.EmploymentOfficialsRepository>(),
            gh<_i563.ResumeRepository>(),
          ));
  gh.factory<_i324.RequestTrackAttendanceDepartureCubit>(
      () => _i324.RequestTrackAttendanceDepartureCubit(
            gh<_i227.TrackAttendanceDepartureRepository>(),
            gh<_i137.UsersManagementRepository>(),
          ));
  gh.factory<_i257.AddNewEmployeesCubit>(() => _i257.AddNewEmployeesCubit(
        gh<_i56.EmployeesRepository>(),
        gh<_i533.ProjectsManagementAPI>(),
        gh<_i471.UsersManagementRepository>(),
      ));
  gh.factory<_i55.JobOffersCubit>(() => _i55.JobOffersCubit(
        gh<_i883.JobOffersRepository>(),
        gh<_i1028.UserRepository>(),
      ));
  gh.factory<_i870.CompaniesUseCase>(
      () => _i870.CompaniesUseCase(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i250.JobsUseCase>(
      () => _i250.JobsUseCase(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i219.ProjectsUseCase>(
      () => _i219.ProjectsUseCase(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i188.ChangeUserPasswordCubit>(() =>
      _i188.ChangeUserPasswordCubit(gh<_i471.UsersManagementRepository>()));
  gh.factory<_i90.ActionVehicleNotificationsCubit>(() =>
      _i90.ActionVehicleNotificationsCubit(
          gh<_i584.NotificationsRepository>()));
  gh.factory<_i64.VehicleNotificationsCubit>(() =>
      _i64.VehicleNotificationsCubit(gh<_i584.NotificationsRepository>()));
  gh.factory<_i915.BasicVehicleInformationCubit>(
      () => _i915.BasicVehicleInformationCubit(
            gh<_i815.VehiclesRepository>(),
            gh<_i686.ProjectsManagementRepository>(),
            gh<_i137.UsersManagementRepository>(),
          ));
  gh.factory<_i501.ResetMobileNumberCubit>(() =>
      _i501.ResetMobileNumberCubit(gh<_i716.EmploymentManagementRepository>()));
  gh.factory<_i1068.AddNewUserCubit>(() => _i1068.AddNewUserCubit(
        gh<_i137.UsersManagementRepository>(),
        gh<_i605.ProjectsManagementRepository>(),
        gh<_i1061.FocusPointsRepository>(),
      ));
  gh.factory<_i438.AddTaskAndResponsibilityCubit>(
      () => _i438.AddTaskAndResponsibilityCubit(
            gh<_i101.TermandConditionRepository>(),
            gh<_i686.ProjectsManagementRepository>(),
            gh<_i137.UsersManagementRepository>(),
          ));
  gh.factory<_i95.ProjectsManagementCubit>(() =>
      _i95.ProjectsManagementCubit(gh<_i605.ProjectsManagementRepository>()));
  gh.factory<_i499.FilterReceiveVehiclesCubit>(
      () => _i499.FilterReceiveVehiclesCubit(
            gh<_i760.EmployeesRepository>(),
            gh<_i605.ProjectsManagementRepository>(),
            gh<_i471.UsersManagementRepository>(),
          ));
  gh.factory<_i845.AddWorkHazardCubit>(() => _i845.AddWorkHazardCubit(
        gh<_i42.WorkHazardsRepository>(),
        gh<_i686.ProjectsManagementRepository>(),
        gh<_i137.UsersManagementRepository>(),
        gh<_i250.FocusPointsRepository>(),
      ));
  gh.factory<_i633.FilterVehiclesZoneCubit>(() => _i633.FilterVehiclesZoneCubit(
        gh<_i1040.VehiclesZoneRepository>(),
        gh<_i250.FocusPointsRepository>(),
        gh<_i137.UsersManagementRepository>(),
        gh<_i686.ProjectsManagementRepository>(),
      ));
  gh.factory<_i553.AddGasStationsCubit>(() => _i553.AddGasStationsCubit(
        gh<_i415.GasStationsRepository>(),
        gh<_i219.ProjectsUseCase>(),
        gh<_i870.CompaniesUseCase>(),
        gh<_i471.UsersManagementRepository>(),
      ));
  return getIt;
}

class _$InjectionModule extends _i212.InjectionModule {}
