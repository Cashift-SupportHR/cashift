// import 'package:koin/koin.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/activity_log_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/attendance_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/auth_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/bank_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/collect_cash_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/evaluation_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/favorite_projects_api.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/home_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/job_offers_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/logger_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/profile_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/resume_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/terms_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/api/wallet_api_provider.dart';
// import 'package:shiftapp/common/data/datasources/remote/base_client.dart';
// import 'package:shiftapp/common/data/repositories/activitylog/activity_log_repository.dart';
// import 'package:shiftapp/common/data/repositories/attendance/attendance_repository.dart';
// import 'package:shiftapp/common/data/repositories/bank/wallet_repository.dart';
// import 'package:shiftapp/common/data/repositories/collect_cash/collect_cash_repository.dart';
// import 'package:shiftapp/common/data/repositories/evaluation/evaluation_repository.dart';
// import 'package:shiftapp/common/data/repositories/home/home_repository.dart';
// import 'package:shiftapp/common/data/repositories/joboffers/resume_repository.dart';
// import 'package:shiftapp/common/data/repositories/local/local_repository.dart';
// import 'package:shiftapp/common/data/repositories/logger/logger_repository.dart';
// import 'package:shiftapp/common/data/repositories/login/auth_repository.dart';
// import 'package:shiftapp/common/data/repositories/profile/profile_repository.dart';
// import 'package:shiftapp/common/data/repositories/projects/projects_repository.dart';
// import 'package:shiftapp/common/data/repositories/resume/resume_repository.dart';
// import 'package:shiftapp/common/data/repositories/terms/terms_repository.dart';
// import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
// import 'package:shiftapp/common/data/repositories/wallet/bank_repository.dart';
// import 'package:shiftapp/presentation/adminFeatures/addOpportunity/presentations/bloc/add_opportunity_cubit.dart';
// import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/bloc/available%20_opportunities_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/activity_log/bloc/activity_log_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/appliedoffers/bloc/applied_offers_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/attendance/overtimeAttendance/bloc/overtime_attendance_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/bloc/attendance_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/collect_cash/bloc/collect_cash_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/copyrights/bloc/copy_rights_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/favoriteprojects/bloc/favorite_projects_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/wallet/withdraw/bloc/withdraw_cubit.dart';
// import 'package:shiftapp/presentation/shared/forgetpassword/bloc/forgetpassword_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/joboffers/bloc/job_offers_bloc.dart';
// import 'package:shiftapp/presentation/shared/login/bloc/login_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/overview/bloc/overview_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/profile/bloc/profile_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/rate/bloc/evaluation_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_bloc.dart';
// import 'package:shiftapp/presentation/shared/home/bloc/home_bloc.dart';
// import 'package:shiftapp/presentation/shared/services/bloc/offline_place_holder_cubit.dart';
// import 'package:shiftapp/presentation/shared/splash/bloc/splash_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/verification/bloc/verification_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/wallet/bloc/wallet_bloc.dart';
// import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/add_phone_wallet/bloc/phone_wallet_cubit.dart';
// import 'package:shiftapp/presentation/presentationUser/withdraw_accounts/bankaccont/bloc/bank_account_cubit.dart';
//
// import '../data/datasources/remote/api/absencenotice_api.dart';
// import '../data/repositories/absencenotice/absencenotice.dart';
// import '../presentation/adminFeatures/addOpportunity/data/datasource/add_opp_api_provider.dart';
// import '../presentation/adminFeatures/addOpportunity/data/repositories/add_opportunity_repository.dart';
// import '../presentation/presentationUser/absencenotice/bloc/absencenotice_cubit.dart';
// import '../presentation/presentationUser/wallet/apply_details/bloc/apply_details_cubit.dart';
// import '../presentation/presentationUser/wallet/balances/bloc/balances_cubit.dart';
// import '../presentation/presentationUser/wallet/user_qrcode/bloc/qrcode_bloc.dart';
// import 'di_constants.dart';
//
// const LoginInterceptorQualifier = "LoginInterceptor";
//
// // final remoteModule = Module()
//   // ..factory((scope) {
//   //   return HeaderInterceptor(
//   //       scope.get<UserRepository>(), scope.get<LocalRepository>(),
//   //       isRequiredAuth: true,
//   //       device: scope.get(StringQualifier(DIConstants.DEVICE_INFO_KEY)),
//   //       loggerRepository: scope.get());
//   // })
//   //
//   // ..factory((scope) {
//   //   return HeaderInterceptor(
//   //       scope.get<UserRepository>(), scope.get<LocalRepository>(),
//   //       isRequiredAuth: false,
//   //       device: scope.get(StringQualifier(DIConstants.DEVICE_INFO_KEY)),
//   //       loggerRepository: scope.get());
//   // }, qualifier: StringQualifier(LoginInterceptorQualifier))
//   //
//   // ..factory((scope) {
//   //   return ClientCreator(interceptor: scope.get<HeaderInterceptor>());
//   // })
//   // ..factory((scope) => LoggerRepository(scope.get()));
//
// final blocsModule = Module()
//   ..factory((scope) => SplashCubit(scope.get(), scope.get(), scope.get()));
//
// final appModule = Module()
//   ..single((scope) => UserRepository(scope.get<SharedPreferences>()))
//   ..single((scope) => scope.get<UserRepository>().getUser()?.token,
//       qualifier: StringQualifier(DIConstants.TOKEN_KEY))
//   ..single(
//           (scope) => LocalRepository(preferences: scope.get<SharedPreferences>()));
