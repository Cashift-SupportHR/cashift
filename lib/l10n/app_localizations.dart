import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @select_language_title.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get select_language_title;

  /// No description provided for @change_language_label.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get change_language_label;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @working_hours.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get working_hours;

  /// No description provided for @active.
  ///
  /// In ar, this message translates to:
  /// **'نشط'**
  String get active;

  /// No description provided for @finished.
  ///
  /// In ar, this message translates to:
  /// **'منتهية'**
  String get finished;

  /// No description provided for @applied_jobs.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get applied_jobs;

  /// No description provided for @resume.
  ///
  /// In ar, this message translates to:
  /// **'السيرة الذاتية'**
  String get resume;

  /// No description provided for @overview.
  ///
  /// In ar, this message translates to:
  /// **'نظره عامه'**
  String get overview;

  /// No description provided for @jobs.
  ///
  /// In ar, this message translates to:
  /// **'الوظائف'**
  String get jobs;

  /// No description provided for @profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile;

  /// No description provided for @tall.
  ///
  /// In ar, this message translates to:
  /// **'Tall'**
  String get tall;

  /// No description provided for @weight.
  ///
  /// In ar, this message translates to:
  /// **'الوزن'**
  String get weight;

  /// No description provided for @hours.
  ///
  /// In ar, this message translates to:
  /// **'ساعات '**
  String get hours;

  /// No description provided for @to.
  ///
  /// In ar, this message translates to:
  /// **'لـ'**
  String get to;

  /// No description provided for @join.
  ///
  /// In ar, this message translates to:
  /// **'التحاق'**
  String get join;

  /// No description provided for @age.
  ///
  /// In ar, this message translates to:
  /// **'العمر'**
  String get age;

  /// No description provided for @login_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login_title;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @invalid_email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صحيح'**
  String get invalid_email;

  /// No description provided for @invalid_password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب الا تقل عن ستة حروف او ارقام'**
  String get invalid_password;

  /// No description provided for @please_entry_password.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال كلمة المرور'**
  String get please_entry_password;

  /// No description provided for @please_entry_email.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال البريد الالكتروني'**
  String get please_entry_email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @login_button.
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get login_button;

  /// No description provided for @dont_have_acount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب ؟ سجل الان'**
  String get dont_have_acount;

  /// No description provided for @current_shift.
  ///
  /// In ar, this message translates to:
  /// **'العمل الحالي'**
  String get current_shift;

  /// No description provided for @new_jobs.
  ///
  /// In ar, this message translates to:
  /// **'عروض جديدة'**
  String get new_jobs;

  /// No description provided for @applied_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'ساعات عملي'**
  String get applied_opportunities;

  /// No description provided for @change_password.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get change_password;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @id_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية'**
  String get id_number;

  /// No description provided for @invalid_id_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية غير صحيح'**
  String get invalid_id_number;

  /// No description provided for @phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phone;

  /// No description provided for @invalid_phone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف الذي ادخلته غير صحيح . قم بأدخال رقم الهاتف صحيح '**
  String get invalid_phone;

  /// No description provided for @whats_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الواتساب'**
  String get whats_number;

  /// No description provided for @bank_iban.
  ///
  /// In ar, this message translates to:
  /// **'رقم الايبان '**
  String get bank_iban;

  /// No description provided for @invalid_bank_id.
  ///
  /// In ar, this message translates to:
  /// **'رقم غير صحيح'**
  String get invalid_bank_id;

  /// No description provided for @birthdate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الميلاد'**
  String get birthdate;

  /// No description provided for @invalid_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ غير صحيح'**
  String get invalid_date;

  /// No description provided for @height.
  ///
  /// In ar, this message translates to:
  /// **'الطول'**
  String get height;

  /// No description provided for @invalid_height.
  ///
  /// In ar, this message translates to:
  /// **'طول غير صحيح'**
  String get invalid_height;

  /// No description provided for @invalid_weight.
  ///
  /// In ar, this message translates to:
  /// **'وزن غير صحيح'**
  String get invalid_weight;

  /// No description provided for @select_city.
  ///
  /// In ar, this message translates to:
  /// **'اختر المدينة'**
  String get select_city;

  /// No description provided for @select_qualification.
  ///
  /// In ar, this message translates to:
  /// **'اختر المؤهل '**
  String get select_qualification;

  /// No description provided for @select_english_level.
  ///
  /// In ar, this message translates to:
  /// **'اختر مستوى اللغة الانجليزية'**
  String get select_english_level;

  /// No description provided for @select_computer_level.
  ///
  /// In ar, this message translates to:
  /// **'اختر مستوى الحاسب الالي'**
  String get select_computer_level;

  /// No description provided for @save_button.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save_button;

  /// No description provided for @register_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حساب كاشفت'**
  String get register_title;

  /// No description provided for @name_ar.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالعربي'**
  String get name_ar;

  /// No description provided for @name_en.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالانجليزية'**
  String get name_en;

  /// No description provided for @name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get name;

  /// No description provided for @invalid_ar_name.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم بالعربي'**
  String get invalid_ar_name;

  /// No description provided for @invalid_en_name.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم بالانجليزية'**
  String get invalid_en_name;

  /// No description provided for @invalid_name.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم'**
  String get invalid_name;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل'**
  String get register;

  /// No description provided for @have_account.
  ///
  /// In ar, this message translates to:
  /// **'امتلك حساب ؟ تسجيل الدخول'**
  String get have_account;

  /// No description provided for @gender.
  ///
  /// In ar, this message translates to:
  /// **'الجنس'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In ar, this message translates to:
  /// **'ذكر'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ar, this message translates to:
  /// **'انثي'**
  String get female;

  /// No description provided for @start.
  ///
  /// In ar, this message translates to:
  /// **'ابدء الدوام'**
  String get start;

  /// No description provided for @finish.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء الدوام'**
  String get finish;

  /// No description provided for @error_internet_connection.
  ///
  /// In ar, this message translates to:
  /// **'خطأ في الاتصال بالشبكة'**
  String get error_internet_connection;

  /// No description provided for @complete_cv.
  ///
  /// In ar, this message translates to:
  /// **'برجاء استكمال بيانات السيرة الذاتية'**
  String get complete_cv;

  /// No description provided for @ok_button.
  ///
  /// In ar, this message translates to:
  /// **'موافق'**
  String get ok_button;

  /// No description provided for @complete_profile.
  ///
  /// In ar, this message translates to:
  /// **'إستكمال السيرة الذاتية'**
  String get complete_profile;

  /// No description provided for @open_location.
  ///
  /// In ar, this message translates to:
  /// **'يجب تشغيل خدمة الموقع للتأكد من وجودك في موقع العمل'**
  String get open_location;

  /// No description provided for @finish_shift_label.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء الدوام لفترة عمل '**
  String get finish_shift_label;

  /// No description provided for @start_shift_label.
  ///
  /// In ar, this message translates to:
  /// **'بدء الدوام لفترة عمل '**
  String get start_shift_label;

  /// No description provided for @add_your_notes.
  ///
  /// In ar, this message translates to:
  /// **'اضف ملاحظاتك'**
  String get add_your_notes;

  /// No description provided for @cancel_button.
  ///
  /// In ar, this message translates to:
  /// **'الغاء'**
  String get cancel_button;

  /// No description provided for @logout_message.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من انك تريد تسجيل الخروج ؟'**
  String get logout_message;

  /// No description provided for @undefine_error.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ ما'**
  String get undefine_error;

  /// No description provided for @check_network_connection.
  ///
  /// In ar, this message translates to:
  /// **'تحقق من اتصال الشبكة لديك وحاول مرة أخرى'**
  String get check_network_connection;

  /// No description provided for @activity_log_title.
  ///
  /// In ar, this message translates to:
  /// **'سجل الانشطة'**
  String get activity_log_title;

  /// No description provided for @qr_code_scanned.
  ///
  /// In ar, this message translates to:
  /// **'تم فحص QrCode هل تريد المتابعة؟'**
  String get qr_code_scanned;

  /// No description provided for @invalid_city.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار المدينة'**
  String get invalid_city;

  /// No description provided for @work_finish_at.
  ///
  /// In ar, this message translates to:
  /// **'ينتهي في '**
  String get work_finish_at;

  /// No description provided for @invalid_comp_level.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار مستوى الحاسب الالي'**
  String get invalid_comp_level;

  /// No description provided for @invalid_lang_level.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار مستوى اللغة الانجليزية'**
  String get invalid_lang_level;

  /// No description provided for @invalid_qualifi.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار المؤهل العلمي'**
  String get invalid_qualifi;

  /// No description provided for @click_to_reload.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تحميل'**
  String get click_to_reload;

  /// No description provided for @per.
  ///
  /// In ar, this message translates to:
  /// **'مقابل '**
  String get per;

  /// No description provided for @sar.
  ///
  /// In ar, this message translates to:
  /// **'ريال'**
  String get sar;

  /// No description provided for @remaining_time.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المتبقي'**
  String get remaining_time;

  /// No description provided for @confirm_button.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirm_button;

  /// No description provided for @work_start_at.
  ///
  /// In ar, this message translates to:
  /// **'يبدء '**
  String get work_start_at;

  /// No description provided for @please_entry_phone.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم الهاتف'**
  String get please_entry_phone;

  /// No description provided for @please_entry_id.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم الهوية'**
  String get please_entry_id;

  /// No description provided for @please_entry_whats_number.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم الواتساب'**
  String get please_entry_whats_number;

  /// No description provided for @please_entry_birthdate.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال تاريخ الميلاد'**
  String get please_entry_birthdate;

  /// No description provided for @please_entry_weight.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الوزن'**
  String get please_entry_weight;

  /// No description provided for @please_entry_height.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الطول'**
  String get please_entry_height;

  /// No description provided for @error_qr.
  ///
  /// In ar, this message translates to:
  /// **'هذا الكود غير مخصص لهذا المشروع'**
  String get error_qr;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @new_account.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get new_account;

  /// No description provided for @required_login.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب منك تسجيل الدخول'**
  String get required_login;

  /// No description provided for @collect_cash_title.
  ///
  /// In ar, this message translates to:
  /// **'المعاملات المالية'**
  String get collect_cash_title;

  /// No description provided for @collected.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get collected;

  /// No description provided for @not_collected.
  ///
  /// In ar, this message translates to:
  /// **'قيد الانتظار'**
  String get not_collected;

  /// No description provided for @my_dues.
  ///
  /// In ar, this message translates to:
  /// **'المعاملات المالية'**
  String get my_dues;

  /// No description provided for @status.
  ///
  /// In ar, this message translates to:
  /// **'الحالة'**
  String get status;

  /// No description provided for @navigate.
  ///
  /// In ar, this message translates to:
  /// **'الإتجاهات'**
  String get navigate;

  /// No description provided for @cashier_locations.
  ///
  /// In ar, this message translates to:
  /// **'اماكن استلام النقدية'**
  String get cashier_locations;

  /// No description provided for @request_code.
  ///
  /// In ar, this message translates to:
  /// **'طلب الكود'**
  String get request_code;

  /// No description provided for @code_appear_here.
  ///
  /// In ar, this message translates to:
  /// **'سيظهر الكود هنا '**
  String get code_appear_here;

  /// No description provided for @share_code_with_cashier.
  ///
  /// In ar, this message translates to:
  /// **'قم بمشاركة الكود للكاشير فقط عند إستلام النقدية .'**
  String get share_code_with_cashier;

  /// No description provided for @code_valid_on_time.
  ///
  /// In ar, this message translates to:
  /// **'هذا الكود صالح للإستخدام لمرة واحدة فقط .'**
  String get code_valid_on_time;

  /// No description provided for @company_not_responsible_misuse.
  ///
  /// In ar, this message translates to:
  /// **'الشركة غير مسئولة عن سوء الإستخدام .'**
  String get company_not_responsible_misuse;

  /// No description provided for @verification_code.
  ///
  /// In ar, this message translates to:
  /// **'كود التفعيل'**
  String get verification_code;

  /// No description provided for @qualification_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المؤهل'**
  String get qualification_name;

  /// No description provided for @invalid_qualification_name.
  ///
  /// In ar, this message translates to:
  /// **'يرجي ادخال اسم المؤهل'**
  String get invalid_qualification_name;

  /// No description provided for @favorite_jobs.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المفضلة'**
  String get favorite_jobs;

  /// No description provided for @accept_copy_rights_label.
  ///
  /// In ar, this message translates to:
  /// **' لقد قرأت وأوافق على'**
  String get accept_copy_rights_label;

  /// No description provided for @copy_rights_title.
  ///
  /// In ar, this message translates to:
  /// **' الشروط والاحكام'**
  String get copy_rights_title;

  /// No description provided for @must_login_first.
  ///
  /// In ar, this message translates to:
  /// **'يجب تسجيل الدخول اولا'**
  String get must_login_first;

  /// No description provided for @please_entry_valid_fullName.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال اسم ثلاثي على الأقل'**
  String get please_entry_valid_fullName;

  /// No description provided for @previous_button.
  ///
  /// In ar, this message translates to:
  /// **'السابق'**
  String get previous_button;

  /// No description provided for @next_button.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next_button;

  /// No description provided for @education.
  ///
  /// In ar, this message translates to:
  /// **'التعليم'**
  String get education;

  /// No description provided for @skills.
  ///
  /// In ar, this message translates to:
  /// **'المهارات'**
  String get skills;

  /// No description provided for @previous_experiences.
  ///
  /// In ar, this message translates to:
  /// **'الخبرات السابقة'**
  String get previous_experiences;

  /// No description provided for @current_situation.
  ///
  /// In ar, this message translates to:
  /// **'ماهو وضعك الحالي ؟ '**
  String get current_situation;

  /// No description provided for @open_app_settings.
  ///
  /// In ar, this message translates to:
  /// **'فتح إعدادات التطبيق'**
  String get open_app_settings;

  /// No description provided for @open_location_settings.
  ///
  /// In ar, this message translates to:
  /// **'فتح إعدادات الموقع'**
  String get open_location_settings;

  /// No description provided for @denied_camera_permission.
  ///
  /// In ar, this message translates to:
  /// **'عذرًا ، يجب عليك الانتقال إلى إعدادات التطبيق والسماح بالوصول إلى الكاميرا حتى تتمكن من مسح رمز qr ضوئيًا'**
  String get denied_camera_permission;

  /// No description provided for @collect_button.
  ///
  /// In ar, this message translates to:
  /// **'تحصيل'**
  String get collect_button;

  /// No description provided for @mywallet.
  ///
  /// In ar, this message translates to:
  /// **'محفظتي'**
  String get mywallet;

  /// No description provided for @working_date.
  ///
  /// In ar, this message translates to:
  /// **' تاريخ العمل'**
  String get working_date;

  /// No description provided for @goto_map.
  ///
  /// In ar, this message translates to:
  /// **'عرض الموقع علي الخريطة'**
  String get goto_map;

  /// No description provided for @description.
  ///
  /// In ar, this message translates to:
  /// **'الوصف'**
  String get description;

  /// No description provided for @offer_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل العرض'**
  String get offer_details;

  /// No description provided for @job_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الوظيفة'**
  String get job_details;

  /// No description provided for @show_more.
  ///
  /// In ar, this message translates to:
  /// **'عرض المزيد...'**
  String get show_more;

  /// No description provided for @delete_account.
  ///
  /// In ar, this message translates to:
  /// **'حذف حسابي'**
  String get delete_account;

  /// No description provided for @delete_account_message.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد انك تريد حذف حسابك ؟ '**
  String get delete_account_message;

  /// No description provided for @not_now.
  ///
  /// In ar, this message translates to:
  /// **'ليس الان'**
  String get not_now;

  /// No description provided for @new_version_available.
  ///
  /// In ar, this message translates to:
  /// **'يتوفر تحديث للتطبيق يجب تحميله'**
  String get new_version_available;

  /// No description provided for @map.
  ///
  /// In ar, this message translates to:
  /// **'الخريطة'**
  String get map;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @job_terms_and_conditions.
  ///
  /// In ar, this message translates to:
  /// **'شروط وأحكام الوظيفة'**
  String get job_terms_and_conditions;

  /// No description provided for @all_jobs.
  ///
  /// In ar, this message translates to:
  /// **'كل الفرص'**
  String get all_jobs;

  /// No description provided for @vip_offers.
  ///
  /// In ar, this message translates to:
  /// **'فرص لا تفوتك'**
  String get vip_offers;

  /// No description provided for @you_favorite_jobs.
  ///
  /// In ar, this message translates to:
  /// **'فرصك المُفضلة'**
  String get you_favorite_jobs;

  /// No description provided for @view_all.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get view_all;

  /// No description provided for @jobs_in_waiting.
  ///
  /// In ar, this message translates to:
  /// **'فرص في انتظارك '**
  String get jobs_in_waiting;

  /// No description provided for @shift_expired_message.
  ///
  /// In ar, this message translates to:
  /// **'تم إنتهاء الدوام يجب تسجيل الانصراف'**
  String get shift_expired_message;

  /// No description provided for @checkout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل انصراف'**
  String get checkout;

  /// No description provided for @hour.
  ///
  /// In ar, this message translates to:
  /// **'ساعة'**
  String get hour;

  /// No description provided for @minute.
  ///
  /// In ar, this message translates to:
  /// **'دقيقة'**
  String get minute;

  /// No description provided for @second.
  ///
  /// In ar, this message translates to:
  /// **'ثانية'**
  String get second;

  /// No description provided for @remaining.
  ///
  /// In ar, this message translates to:
  /// **'متبقي'**
  String get remaining;

  /// No description provided for @open_map.
  ///
  /// In ar, this message translates to:
  /// **'فتح الخريطة'**
  String get open_map;

  /// No description provided for @earning_now.
  ///
  /// In ar, this message translates to:
  /// **' انضم الآن '**
  String get earning_now;

  /// No description provided for @day.
  ///
  /// In ar, this message translates to:
  /// **'يوم'**
  String get day;

  /// No description provided for @all.
  ///
  /// In ar, this message translates to:
  /// **'كل'**
  String get all;

  /// No description provided for @days.
  ///
  /// In ar, this message translates to:
  /// **'الايام'**
  String get days;

  /// No description provided for @company_details.
  ///
  /// In ar, this message translates to:
  /// **'معلومات الشركة'**
  String get company_details;

  /// No description provided for @offer_terms.
  ///
  /// In ar, this message translates to:
  /// **'شروط الفرصة'**
  String get offer_terms;

  /// No description provided for @career_field.
  ///
  /// In ar, this message translates to:
  /// **'المجال الوظيفي'**
  String get career_field;

  /// No description provided for @specialization.
  ///
  /// In ar, this message translates to:
  /// **'التخصص'**
  String get specialization;

  /// No description provided for @salary.
  ///
  /// In ar, this message translates to:
  /// **'قيمة الفرصة'**
  String get salary;

  /// No description provided for @qualification.
  ///
  /// In ar, this message translates to:
  /// **'المؤهل'**
  String get qualification;

  /// No description provided for @required_number.
  ///
  /// In ar, this message translates to:
  /// **'العدد المطلوب'**
  String get required_number;

  /// No description provided for @remaining_number.
  ///
  /// In ar, this message translates to:
  /// **'العدد المتبقي'**
  String get remaining_number;

  /// No description provided for @work_location.
  ///
  /// In ar, this message translates to:
  /// **'مقر العمل'**
  String get work_location;

  /// No description provided for @start_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ البداية'**
  String get start_date;

  /// No description provided for @end_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ النهاية'**
  String get end_date;

  /// No description provided for @working_time.
  ///
  /// In ar, this message translates to:
  /// **'وقت العمل'**
  String get working_time;

  /// No description provided for @select_working_time.
  ///
  /// In ar, this message translates to:
  /// **'اختر وقت العمل'**
  String get select_working_time;

  /// No description provided for @attendance_method.
  ///
  /// In ar, this message translates to:
  /// **'طريقة تسجيل الحضور'**
  String get attendance_method;

  /// No description provided for @location.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get location;

  /// No description provided for @from.
  ///
  /// In ar, this message translates to:
  /// **'من '**
  String get from;

  /// No description provided for @too.
  ///
  /// In ar, this message translates to:
  /// **'الى '**
  String get too;

  /// No description provided for @offer_description.
  ///
  /// In ar, this message translates to:
  /// **'وصف الفرصة'**
  String get offer_description;

  /// No description provided for @field_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع المجال'**
  String get field_type;

  /// No description provided for @qr_scanner.
  ///
  /// In ar, this message translates to:
  /// **'ماسح الباركود'**
  String get qr_scanner;

  /// No description provided for @section.
  ///
  /// In ar, this message translates to:
  /// **'القطاع'**
  String get section;

  /// No description provided for @company_description.
  ///
  /// In ar, this message translates to:
  /// **'وصف الشركة'**
  String get company_description;

  /// No description provided for @company_jobs.
  ///
  /// In ar, this message translates to:
  /// **'وظائف الشركة'**
  String get company_jobs;

  /// No description provided for @job.
  ///
  /// In ar, this message translates to:
  /// **'وظيفة'**
  String get job;

  /// No description provided for @show_details.
  ///
  /// In ar, this message translates to:
  /// **'عرض التفاصيل'**
  String get show_details;

  /// No description provided for @job_description.
  ///
  /// In ar, this message translates to:
  /// **'وصف الوظيفة'**
  String get job_description;

  /// No description provided for @checkin.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حضور'**
  String get checkin;

  /// No description provided for @withdrawal.
  ///
  /// In ar, this message translates to:
  /// **'سحب'**
  String get withdrawal;

  /// No description provided for @account.
  ///
  /// In ar, this message translates to:
  /// **'الحساب'**
  String get account;

  /// No description provided for @general_settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات العامة'**
  String get general_settings;

  /// No description provided for @personal_info.
  ///
  /// In ar, this message translates to:
  /// **'بياناتك الشخصية'**
  String get personal_info;

  /// No description provided for @enter_full_name.
  ///
  /// In ar, this message translates to:
  /// **'ادخل الاسم  بالكامل'**
  String get enter_full_name;

  /// No description provided for @enter_id_number.
  ///
  /// In ar, this message translates to:
  /// **'ادخل رقم الهوية'**
  String get enter_id_number;

  /// No description provided for @enter_email.
  ///
  /// In ar, this message translates to:
  /// **'ادخل البريد الالكتروني'**
  String get enter_email;

  /// No description provided for @enter_birthdate.
  ///
  /// In ar, this message translates to:
  /// **'ادخل تاريخ الميلاد ( هجري  او ميلادي )'**
  String get enter_birthdate;

  /// No description provided for @find_your_city.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن مدينتك'**
  String get find_your_city;

  /// No description provided for @select_current_situation.
  ///
  /// In ar, this message translates to:
  /// **'اختيار موقفك الحالي'**
  String get select_current_situation;

  /// No description provided for @expired.
  ///
  /// In ar, this message translates to:
  /// **'نفذت'**
  String get expired;

  /// No description provided for @offers.
  ///
  /// In ar, this message translates to:
  /// **'عرض'**
  String get offers;

  /// No description provided for @favorite_projects.
  ///
  /// In ar, this message translates to:
  /// **'اماكن العمل المفضلة'**
  String get favorite_projects;

  /// No description provided for @favorite_projects_not_selected.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتحديد اماكن عملك المفضلة'**
  String get favorite_projects_not_selected;

  /// No description provided for @select_favorite_projects.
  ///
  /// In ar, this message translates to:
  /// **'تحديد'**
  String get select_favorite_projects;

  /// No description provided for @cancel_shift_title.
  ///
  /// In ar, this message translates to:
  /// **'اعتذار عن الحضور'**
  String get cancel_shift_title;

  /// No description provided for @whats_reason_for_cancel.
  ///
  /// In ar, this message translates to:
  /// **'ما سبب الاعتذار عن الوظيفة'**
  String get whats_reason_for_cancel;

  /// No description provided for @select_all.
  ///
  /// In ar, this message translates to:
  /// **'إختر الكل'**
  String get select_all;

  /// No description provided for @bank_account.
  ///
  /// In ar, this message translates to:
  /// **'الحساب البنكي'**
  String get bank_account;

  /// No description provided for @select_withdraw_method.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة السحب'**
  String get select_withdraw_method;

  /// No description provided for @iban.
  ///
  /// In ar, this message translates to:
  /// **'ايبان'**
  String get iban;

  /// No description provided for @please_fill_iban.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك ادخل رقم الايبان'**
  String get please_fill_iban;

  /// No description provided for @invalid_iban.
  ///
  /// In ar, this message translates to:
  /// **'رقم الايبان غير صحيح'**
  String get invalid_iban;

  /// No description provided for @please_select_bank.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختر البنك'**
  String get please_select_bank;

  /// No description provided for @iban_not_matched.
  ///
  /// In ar, this message translates to:
  /// **'رقم الايبان غير متطابق'**
  String get iban_not_matched;

  /// No description provided for @withdraw_by_cashier.
  ///
  /// In ar, this message translates to:
  /// **'عن طريق الكاشير - امين الصندوق'**
  String get withdraw_by_cashier;

  /// No description provided for @withdraw_by_bank_account.
  ///
  /// In ar, this message translates to:
  /// **'عن طريق الحساب البنكي'**
  String get withdraw_by_bank_account;

  /// No description provided for @follow.
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get follow;

  /// No description provided for @amount_will_be_withdraw.
  ///
  /// In ar, this message translates to:
  /// **'سيتم ايداع المبلغ في حسابك البنكي '**
  String get amount_will_be_withdraw;

  /// No description provided for @add_bank_account.
  ///
  /// In ar, this message translates to:
  /// **'اضف حسابك الان'**
  String get add_bank_account;

  /// No description provided for @select_bank_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم البنك'**
  String get select_bank_name;

  /// No description provided for @bank_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم البنك'**
  String get bank_name;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'البحث'**
  String get search;

  /// No description provided for @confirm_iban.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد رقم الايبان'**
  String get confirm_iban;

  /// No description provided for @important_disclosure.
  ///
  /// In ar, this message translates to:
  /// **'توضيح هام'**
  String get important_disclosure;

  /// No description provided for @rate_title.
  ///
  /// In ar, this message translates to:
  /// **'قيم تجربتك للشركة'**
  String get rate_title;

  /// No description provided for @rate_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'ساعدنا في تحسين خدماتنا في تقيمك  لنا'**
  String get rate_subtitle;

  /// No description provided for @confirm_attendance_message.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتأكيد حضورك لوظيفة'**
  String get confirm_attendance_message;

  /// No description provided for @please_select_current_situation.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختر موقفك الحالي'**
  String get please_select_current_situation;

  /// No description provided for @attendance_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الحضور والانصراف'**
  String get attendance_title;

  /// No description provided for @check_finger.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الحضور او الانصراف'**
  String get check_finger;

  /// No description provided for @phone_wallet_title.
  ///
  /// In ar, this message translates to:
  /// **'محفظة الهاتف المحمول'**
  String get phone_wallet_title;

  /// No description provided for @withdraw_by_smart_wallet.
  ///
  /// In ar, this message translates to:
  /// **'عن طريق المحفظة الإلكترونية '**
  String get withdraw_by_smart_wallet;

  /// No description provided for @service_provider.
  ///
  /// In ar, this message translates to:
  /// **'مقدمي الخدمة'**
  String get service_provider;

  /// No description provided for @select_service_provider.
  ///
  /// In ar, this message translates to:
  /// **'اختر مقدم الخدمة'**
  String get select_service_provider;

  /// No description provided for @attendance.
  ///
  /// In ar, this message translates to:
  /// **'الحضور'**
  String get attendance;

  /// No description provided for @and.
  ///
  /// In ar, this message translates to:
  /// **' و '**
  String get and;

  /// No description provided for @start_overtime.
  ///
  /// In ar, this message translates to:
  /// **'بدء الوقت الإضافي'**
  String get start_overtime;

  /// No description provided for @end_overtime.
  ///
  /// In ar, this message translates to:
  /// **'إنها الوقت الإضافي'**
  String get end_overtime;

  /// No description provided for @overtime_screen_title.
  ///
  /// In ar, this message translates to:
  /// **'مكمل'**
  String get overtime_screen_title;

  /// No description provided for @attendance_days.
  ///
  /// In ar, this message translates to:
  /// **'ايام الحضور'**
  String get attendance_days;

  /// No description provided for @absence_days.
  ///
  /// In ar, this message translates to:
  /// **'ايام الغياب'**
  String get absence_days;

  /// No description provided for @delay_days.
  ///
  /// In ar, this message translates to:
  /// **'ايام التأخير'**
  String get delay_days;

  /// No description provided for @shift_hours.
  ///
  /// In ar, this message translates to:
  /// **'مواعيد العمل'**
  String get shift_hours;

  /// No description provided for @authenticate_bio_msg.
  ///
  /// In ar, this message translates to:
  /// **'يرجى المصادقة لتسجيل الدخول إلى حسابك'**
  String get authenticate_bio_msg;

  /// No description provided for @biometric_authentication.
  ///
  /// In ar, this message translates to:
  /// **'المصادقة بالبصمة'**
  String get biometric_authentication;

  /// No description provided for @no_thanks.
  ///
  /// In ar, this message translates to:
  /// **'لا شكراً'**
  String get no_thanks;

  /// No description provided for @phone_not_supported_bio.
  ///
  /// In ar, this message translates to:
  /// **'هاتفك لا يدعم القياسات الحيوية'**
  String get phone_not_supported_bio;

  /// No description provided for @scan_code.
  ///
  /// In ar, this message translates to:
  /// **'مسح الكود'**
  String get scan_code;

  /// No description provided for @back_camera.
  ///
  /// In ar, this message translates to:
  /// **'الكاميرا الخلفية'**
  String get back_camera;

  /// No description provided for @front_camera.
  ///
  /// In ar, this message translates to:
  /// **'الكاميرا الامامية'**
  String get front_camera;

  /// No description provided for @pause.
  ///
  /// In ar, this message translates to:
  /// **'توقف'**
  String get pause;

  /// No description provided for @resume_qr.
  ///
  /// In ar, this message translates to:
  /// **'استأنف'**
  String get resume_qr;

  /// No description provided for @special_offer.
  ///
  /// In ar, this message translates to:
  /// **'عروض خاصة (قريباً)'**
  String get special_offer;

  /// No description provided for @exclusive.
  ///
  /// In ar, this message translates to:
  /// **'فرصة مميزة'**
  String get exclusive;

  /// No description provided for @apply_now.
  ///
  /// In ar, this message translates to:
  /// **'تـــقـــــــدم الآن'**
  String get apply_now;

  /// No description provided for @dates_not_set.
  ///
  /// In ar, this message translates to:
  /// **'المواعيد لم تحدد'**
  String get dates_not_set;

  /// No description provided for @services.
  ///
  /// In ar, this message translates to:
  /// **'الخدمات'**
  String get services;

  /// No description provided for @serve_on_my_way.
  ///
  /// In ar, this message translates to:
  /// **'خدمة على طريقي'**
  String get serve_on_my_way;

  /// No description provided for @get_me_on_your_way.
  ///
  /// In ar, this message translates to:
  /// **'وصلنى على طريقك'**
  String get get_me_on_your_way;

  /// No description provided for @applied_jobs2.
  ///
  /// In ar, this message translates to:
  /// **'الوظائف المقدم عليها'**
  String get applied_jobs2;

  /// No description provided for @previous_jobs.
  ///
  /// In ar, this message translates to:
  /// **'الوظائف السابقة'**
  String get previous_jobs;

  /// No description provided for @admin.
  ///
  /// In ar, this message translates to:
  /// **'الأدمن'**
  String get admin;

  /// No description provided for @available_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المتاحة'**
  String get available_opportunities;

  /// No description provided for @jobs_review.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الوظائف'**
  String get jobs_review;

  /// No description provided for @attendance_departure.
  ///
  /// In ar, this message translates to:
  /// **'الحضور والانصراف'**
  String get attendance_departure;

  /// No description provided for @dta_service.
  ///
  /// In ar, this message translates to:
  /// **' الحضور والإنصراف'**
  String get dta_service;

  /// No description provided for @complete_service.
  ///
  /// In ar, this message translates to:
  /// **'خدمة مكمل'**
  String get complete_service;

  /// No description provided for @accounts.
  ///
  /// In ar, this message translates to:
  /// **'الحسابات'**
  String get accounts;

  /// No description provided for @wallet.
  ///
  /// In ar, this message translates to:
  /// **'المحفظة'**
  String get wallet;

  /// No description provided for @rating.
  ///
  /// In ar, this message translates to:
  /// **'تقييم'**
  String get rating;

  /// No description provided for @the_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'الفرصة'**
  String get the_opportunity;

  /// No description provided for @opportunity_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة الفرصة'**
  String get opportunity_value;

  /// No description provided for @sr.
  ///
  /// In ar, this message translates to:
  /// **'ر.س'**
  String get sr;

  /// No description provided for @job_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'شروط الفرصة'**
  String get job_opportunity;

  /// No description provided for @job_field.
  ///
  /// In ar, this message translates to:
  /// **'مجال الوظيفي'**
  String get job_field;

  /// No description provided for @work_specialty.
  ///
  /// In ar, this message translates to:
  /// **'تخصص العمل'**
  String get work_specialty;

  /// No description provided for @num.
  ///
  /// In ar, this message translates to:
  /// **'العدد'**
  String get num;

  /// description
  ///
  /// In ar, this message translates to:
  /// **'{quantity} شخص'**
  String person(int quantity);

  /// No description provided for @on_my_way.
  ///
  /// In ar, this message translates to:
  /// **'على طريقي'**
  String get on_my_way;

  /// No description provided for @general_conditions.
  ///
  /// In ar, this message translates to:
  /// **'الشروط العامة'**
  String get general_conditions;

  /// No description provided for @has_a_car.
  ///
  /// In ar, this message translates to:
  /// **'ان كنت تمتلك سيارة ,هل تود زيادة دخلك؟\n'**
  String get has_a_car;

  /// No description provided for @has_not_a_car.
  ///
  /// In ar, this message translates to:
  /// **'ان كنت لا تمتلك سيارة هل تود توصيلك للعمل؟'**
  String get has_not_a_car;

  /// No description provided for @add_new_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'إضافة فرصة عمل جديدة'**
  String get add_new_opportunity;

  /// No description provided for @job_opportunity_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل فرصة العمل'**
  String get job_opportunity_details;

  /// No description provided for @contract_clause.
  ///
  /// In ar, this message translates to:
  /// **'شرط العقد'**
  String get contract_clause;

  /// No description provided for @allowed_time_ahead.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المسموح قبل الميعادً'**
  String get allowed_time_ahead;

  /// No description provided for @time_allowed_after_deadline.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المسموح بعد الميعاد'**
  String get time_allowed_after_deadline;

  /// No description provided for @back_up_number.
  ///
  /// In ar, this message translates to:
  /// **'عدد القبول الاحتياطى'**
  String get back_up_number;

  /// No description provided for @working_day.
  ///
  /// In ar, this message translates to:
  /// **'يوم العمل'**
  String get working_day;

  /// No description provided for @how_accept_job.
  ///
  /// In ar, this message translates to:
  /// **'طريقة قبول الفرصه'**
  String get how_accept_job;

  /// No description provided for @method_calculating_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'طريقة حساب الفرصة'**
  String get method_calculating_opportunity;

  /// No description provided for @this_field_is_required.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get this_field_is_required;

  /// No description provided for @select_method_calculating_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة حساب الفرصة'**
  String get select_method_calculating_opportunity;

  /// No description provided for @select_contract_clause.
  ///
  /// In ar, this message translates to:
  /// **'اختر شرط العقد'**
  String get select_contract_clause;

  /// No description provided for @working_period.
  ///
  /// In ar, this message translates to:
  /// **'فترة العمل'**
  String get working_period;

  /// No description provided for @select_working_period.
  ///
  /// In ar, this message translates to:
  /// **'اختر فترة العمل'**
  String get select_working_period;

  /// No description provided for @select_how_accept_job.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة قبول الفرصة'**
  String get select_how_accept_job;

  /// No description provided for @amount.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ'**
  String get amount;

  /// No description provided for @num_applicants.
  ///
  /// In ar, this message translates to:
  /// **'عدد المتقدمين'**
  String get num_applicants;

  /// No description provided for @applicants.
  ///
  /// In ar, this message translates to:
  /// **' المتقدمين'**
  String get applicants;

  /// No description provided for @num_accepted.
  ///
  /// In ar, this message translates to:
  /// **'عدد المقبولين'**
  String get num_accepted;

  /// No description provided for @num_reserve.
  ///
  /// In ar, this message translates to:
  /// **'عدد الاحتياطي'**
  String get num_reserve;

  /// No description provided for @beginning_work.
  ///
  /// In ar, this message translates to:
  /// **'بداية العمل'**
  String get beginning_work;

  /// No description provided for @end_work.
  ///
  /// In ar, this message translates to:
  /// **'نهاية العمل'**
  String get end_work;

  /// No description provided for @add_employee_on_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'إضافة موظف على الفرصة'**
  String get add_employee_on_opportunity;

  /// No description provided for @mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال'**
  String get mobile_number;

  /// No description provided for @menu_applicants.
  ///
  /// In ar, this message translates to:
  /// **'قائمة المتقدمين'**
  String get menu_applicants;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إغلاق'**
  String get cancel;

  /// No description provided for @edit_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الفرصة'**
  String get edit_opportunity;

  /// No description provided for @add_applicant.
  ///
  /// In ar, this message translates to:
  /// **'إضافة كاشتفر'**
  String get add_applicant;

  /// No description provided for @cancel_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء الفرصة'**
  String get cancel_opportunity;

  /// No description provided for @cancel_message_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد إلغاء الفرصة؟'**
  String get cancel_message_opportunity;

  /// No description provided for @select_working_day_date.
  ///
  /// In ar, this message translates to:
  /// **'اختر تاريخ يوم العمل'**
  String get select_working_day_date;

  /// No description provided for @opportunity_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الفرصة'**
  String get opportunity_details;

  /// No description provided for @working_hours2.
  ///
  /// In ar, this message translates to:
  /// **'ساعات العمل'**
  String get working_hours2;

  /// No description provided for @project_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المشروع'**
  String get project_name;

  /// No description provided for @create_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الإنشاء'**
  String get create_date;

  /// No description provided for @opportunity_terms.
  ///
  /// In ar, this message translates to:
  /// **'شروط الفرصة'**
  String get opportunity_terms;

  /// No description provided for @show_less.
  ///
  /// In ar, this message translates to:
  /// **'عرض أقل'**
  String get show_less;

  /// No description provided for @required_mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال مطلوب'**
  String get required_mobile_number;

  /// No description provided for @opportunity_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الفرصة'**
  String get opportunity_date;

  /// No description provided for @opportunities_num.
  ///
  /// In ar, this message translates to:
  /// **'العدد المطلوب للفرصة'**
  String get opportunities_num;

  /// No description provided for @period_before_start_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'فترة السماح قبل بداية الفرصة'**
  String get period_before_start_opportunity;

  /// No description provided for @period_after_start_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'فترة السماح بعد بداية الفرصة'**
  String get period_after_start_opportunity;

  /// No description provided for @employee_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المتقدم'**
  String get employee_name;

  /// No description provided for @approval_order.
  ///
  /// In ar, this message translates to:
  /// **'الموافقة على الطلب'**
  String get approval_order;

  /// No description provided for @city.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get city;

  /// No description provided for @length.
  ///
  /// In ar, this message translates to:
  /// **'الطول'**
  String get length;

  /// No description provided for @enter_length.
  ///
  /// In ar, this message translates to:
  /// **'ادخل الطول'**
  String get enter_length;

  /// No description provided for @enter_weight.
  ///
  /// In ar, this message translates to:
  /// **'ادخل الوزن'**
  String get enter_weight;

  /// No description provided for @invalid_length.
  ///
  /// In ar, this message translates to:
  /// **'الطول غير صحيح'**
  String get invalid_length;

  /// No description provided for @opportunity_name.
  ///
  /// In ar, this message translates to:
  /// **'أسم الفرصة:'**
  String get opportunity_name;

  /// No description provided for @deserved_amount.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ المستحق'**
  String get deserved_amount;

  /// No description provided for @opportunity_details_more.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل معاملات الفرص'**
  String get opportunity_details_more;

  /// No description provided for @transfer_balance.
  ///
  /// In ar, this message translates to:
  /// **'رصيد محول'**
  String get transfer_balance;

  /// No description provided for @current_balance.
  ///
  /// In ar, this message translates to:
  /// **'رصيدك الحالي'**
  String get current_balance;

  /// No description provided for @rs.
  ///
  /// In ar, this message translates to:
  /// **'ر . س'**
  String get rs;

  /// No description provided for @transfer_money.
  ///
  /// In ar, this message translates to:
  /// **'لتحويل الاموال'**
  String get transfer_money;

  /// No description provided for @corporate_balances.
  ///
  /// In ar, this message translates to:
  /// **'أرصدة الشركات'**
  String get corporate_balances;

  /// No description provided for @transaction_history.
  ///
  /// In ar, this message translates to:
  /// **'سجل المعاملات'**
  String get transaction_history;

  /// No description provided for @submit_your_request.
  ///
  /// In ar, this message translates to:
  /// **'سيتم تقديم طلبك لإيداع المبلغ  فى حسابك'**
  String get submit_your_request;

  /// No description provided for @cancellation_transfer_request.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكنك إلغاء طلب التحويل'**
  String get cancellation_transfer_request;

  /// No description provided for @application_not_responsible.
  ///
  /// In ar, this message translates to:
  /// **'التطبيق غير مسؤول عن  أي خطأ في البيانات المدخله'**
  String get application_not_responsible;

  /// No description provided for @not_entitled_ask.
  ///
  /// In ar, this message translates to:
  /// **'لا يحق لك مطالبة التطبيق باسترجاع الأموال في حاله الخطأ'**
  String get not_entitled_ask;

  /// No description provided for @transfer_confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد تحويل'**
  String get transfer_confirm;

  /// description
  ///
  /// In ar, this message translates to:
  /// **'سيتم تحويل مبلغ {quantity}  ر.س من حسابك بشركة {companyName} عن طريق  {withdrawMethod}'**
  String transfer_confirm_message(String companyName, String quantity, String withdrawMethod);

  /// No description provided for @further_information.
  ///
  /// In ar, this message translates to:
  /// **'لمعلومات أخرى يمكنك التواصل مع '**
  String get further_information;

  /// No description provided for @balance_hidden.
  ///
  /// In ar, this message translates to:
  /// **'الرصيد مخفى'**
  String get balance_hidden;

  /// No description provided for @click_access_account.
  ///
  /// In ar, this message translates to:
  /// **'أضغط هنا للوصول لحسابك'**
  String get click_access_account;

  /// No description provided for @withdrawn_balance.
  ///
  /// In ar, this message translates to:
  /// **'الرصيد المسحوب'**
  String get withdrawn_balance;

  /// No description provided for @remaining_balance.
  ///
  /// In ar, this message translates to:
  /// **'الرصيد المتبقي'**
  String get remaining_balance;

  /// No description provided for @cancel_transfare.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء التحويل'**
  String get cancel_transfare;

  /// No description provided for @transfer_amount.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ المحول'**
  String get transfer_amount;

  /// No description provided for @transfer_fee.
  ///
  /// In ar, this message translates to:
  /// **'رسوم التحويل'**
  String get transfer_fee;

  /// No description provided for @net_amount_transferred.
  ///
  /// In ar, this message translates to:
  /// **'صافي المبلغ المحول'**
  String get net_amount_transferred;

  /// No description provided for @transfer_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل التحويل'**
  String get transfer_details;

  /// No description provided for @transfer.
  ///
  /// In ar, this message translates to:
  /// **'تحويل'**
  String get transfer;

  /// No description provided for @transfer_from.
  ///
  /// In ar, this message translates to:
  /// **'تحويل من'**
  String get transfer_from;

  /// No description provided for @transfer_method.
  ///
  /// In ar, this message translates to:
  /// **'طريقة التحويل'**
  String get transfer_method;

  /// No description provided for @amount_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة المبلغ'**
  String get amount_value;

  /// No description provided for @search_for_company.
  ///
  /// In ar, this message translates to:
  /// **'البحث عن الشركة'**
  String get search_for_company;

  /// No description provided for @please_select_company.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتحديد الشركة'**
  String get please_select_company;

  /// No description provided for @select_company.
  ///
  /// In ar, this message translates to:
  /// **'اختر الشركة'**
  String get select_company;

  /// No description provided for @select_transfer_method.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة التحويل'**
  String get select_transfer_method;

  /// No description provided for @not_added_phone_wallet_data.
  ///
  /// In ar, this message translates to:
  /// **'لم تقم بإضافة بيانات محفظة الهاتف'**
  String get not_added_phone_wallet_data;

  /// No description provided for @add_wallet.
  ///
  /// In ar, this message translates to:
  /// **'إضافة محفظة'**
  String get add_wallet;

  /// No description provided for @not_have_bank_account_data.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب بنكي'**
  String get not_have_bank_account_data;

  /// No description provided for @please_select_wallet.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتحديد محفظة'**
  String get please_select_wallet;

  /// No description provided for @select_wallet.
  ///
  /// In ar, this message translates to:
  /// **'اختر محفظة'**
  String get select_wallet;

  /// No description provided for @saudi_riyals.
  ///
  /// In ar, this message translates to:
  /// **'ريال سعودى'**
  String get saudi_riyals;

  /// No description provided for @id_number_recipient_account.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية لحساب المستلم'**
  String get id_number_recipient_account;

  /// No description provided for @account_received.
  ///
  /// In ar, this message translates to:
  /// **'حساب المستلم'**
  String get account_received;

  /// No description provided for @withdraw_from_phone_wallet.
  ///
  /// In ar, this message translates to:
  /// **'سحب من محفظة الهاتف'**
  String get withdraw_from_phone_wallet;

  /// No description provided for @withdraw_by_phone_wallet_screen_condition_1.
  ///
  /// In ar, this message translates to:
  /// **'عندم تقوم بتحديد محفظتك والضغط علي زر التأكيد سيتم تقديم طلب لإيدام المبلغ في محفظتك'**
  String get withdraw_by_phone_wallet_screen_condition_1;

  /// No description provided for @withdraw_by_phone_wallet_screen_condition_2.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن إلغاء الطلب'**
  String get withdraw_by_phone_wallet_screen_condition_2;

  /// No description provided for @withdraw_by_phone_wallet_screen_condition_3.
  ///
  /// In ar, this message translates to:
  /// **'التطبيق غير مسئول عن اي خطأ في بيانات محفظة الهاتف الخاصة بك'**
  String get withdraw_by_phone_wallet_screen_condition_3;

  /// No description provided for @withdraw_by_phone_wallet_screen_condition_4.
  ///
  /// In ar, this message translates to:
  /// **'لمعلومات اخري قم بالتواصل مع الدعم الفني'**
  String get withdraw_by_phone_wallet_screen_condition_4;

  /// No description provided for @withdraw_through.
  ///
  /// In ar, this message translates to:
  /// **'سحب من خلال'**
  String get withdraw_through;

  /// No description provided for @withdraw.
  ///
  /// In ar, this message translates to:
  /// **'سحب'**
  String get withdraw;

  /// No description provided for @cancel_transfer.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء التحويل'**
  String get cancel_transfer;

  /// No description provided for @are_you_sure_cancel_transfer.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من إلغاء التحويل؟'**
  String get are_you_sure_cancel_transfer;

  /// No description provided for @scan_your_code.
  ///
  /// In ar, this message translates to:
  /// **'امسح رمزك ضوئيًا'**
  String get scan_your_code;

  /// No description provided for @technical_support.
  ///
  /// In ar, this message translates to:
  /// **'الدعم الفني'**
  String get technical_support;

  /// No description provided for @edit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// No description provided for @saudi_phone_numbers_accepted.
  ///
  /// In ar, this message translates to:
  /// **'يقبل فقط ارقام الهواتف السعودية'**
  String get saudi_phone_numbers_accepted;

  /// No description provided for @iban_numbers_saudi_bank_customers_accepted.
  ///
  /// In ar, this message translates to:
  /// **'يقبل فقط ارقام ايبان الخاصة بعملاء بنوك السعودية'**
  String get iban_numbers_saudi_bank_customers_accepted;

  /// No description provided for @withdraw_from_bank_account.
  ///
  /// In ar, this message translates to:
  /// **'سحب من الحساب البنكي'**
  String get withdraw_from_bank_account;

  /// No description provided for @add_new_wallet.
  ///
  /// In ar, this message translates to:
  /// **'إضافة محفظة جديدة'**
  String get add_new_wallet;

  /// No description provided for @confirm_password.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirm_password;

  /// No description provided for @enter_password_again.
  ///
  /// In ar, this message translates to:
  /// **'أدخل كلمة المرور مرة أخرى'**
  String get enter_password_again;

  /// No description provided for @password_not_match.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور غير متطابقة'**
  String get password_not_match;

  /// No description provided for @enter_phone_number.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم الهاتف'**
  String get enter_phone_number;

  /// No description provided for @select_qualification_name.
  ///
  /// In ar, this message translates to:
  /// **'أختيار اسم المؤهل'**
  String get select_qualification_name;

  /// No description provided for @search_for_your_qualification_name.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن اسم مؤهلك'**
  String get search_for_your_qualification_name;

  /// No description provided for @hijri.
  ///
  /// In ar, this message translates to:
  /// **'هجري'**
  String get hijri;

  /// No description provided for @biometrics_service_not_enabled.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم تمكين خدمة القياسات الحيوية.'**
  String get biometrics_service_not_enabled;

  /// No description provided for @do_want_to_enable_it.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد تمكينها؟'**
  String get do_want_to_enable_it;

  /// No description provided for @enable.
  ///
  /// In ar, this message translates to:
  /// **'تمكين'**
  String get enable;

  /// No description provided for @welcome_log_in.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بك قم بتسجيل دخولك'**
  String get welcome_log_in;

  /// No description provided for @forgot_password.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgot_password;

  /// No description provided for @enter_your_phone_number_retrieve_password.
  ///
  /// In ar, this message translates to:
  /// **'ادخل رقم الهاتف الخاص بك لاسترجاع كلمة المرور'**
  String get enter_your_phone_number_retrieve_password;

  /// No description provided for @send.
  ///
  /// In ar, this message translates to:
  /// **'ارسال'**
  String get send;

  /// No description provided for @please_enter_new_password.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بإدخال كلمة السر الجديدة'**
  String get please_enter_new_password;

  /// No description provided for @new_password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة السر الجديدة'**
  String get new_password;

  /// No description provided for @favorite_places.
  ///
  /// In ar, this message translates to:
  /// **'الأماكن المفضلة'**
  String get favorite_places;

  /// No description provided for @add_new_place.
  ///
  /// In ar, this message translates to:
  /// **'إضافة مكان جديد'**
  String get add_new_place;

  /// No description provided for @please_enter_match_password.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بإدخال كلمة المرور متطابقة'**
  String get please_enter_match_password;

  /// No description provided for @official_wear.
  ///
  /// In ar, this message translates to:
  /// **'الزي الرسمي'**
  String get official_wear;

  /// No description provided for @apologies_for_submission.
  ///
  /// In ar, this message translates to:
  /// **'اعتذار عن التقديم'**
  String get apologies_for_submission;

  /// No description provided for @attendance_conditions.
  ///
  /// In ar, this message translates to:
  /// **'شروط الحضور'**
  String get attendance_conditions;

  /// No description provided for @working_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الدوام'**
  String get working_details;

  /// No description provided for @reserved_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المحجوزة'**
  String get reserved_opportunities;

  /// No description provided for @taught_us.
  ///
  /// In ar, this message translates to:
  /// **'علمنا'**
  String get taught_us;

  /// No description provided for @absenceNotice.
  ///
  /// In ar, this message translates to:
  /// **'أشعار الغياب'**
  String get absenceNotice;

  /// No description provided for @select_date_absence.
  ///
  /// In ar, this message translates to:
  /// **' حدد تاريخ الغياب'**
  String get select_date_absence;

  /// No description provided for @date_absence.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الغياب'**
  String get date_absence;

  /// No description provided for @reasons_for_absence.
  ///
  /// In ar, this message translates to:
  /// **'أسباب الغياب'**
  String get reasons_for_absence;

  /// No description provided for @absence_registration.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الغياب'**
  String get absence_registration;

  /// No description provided for @days_absence.
  ///
  /// In ar, this message translates to:
  /// **'أيام الغياب'**
  String get days_absence;

  /// No description provided for @offer_you_service.
  ///
  /// In ar, this message translates to:
  /// **'نقدم لك خدمة إشعار الغياب  وهو ابلغنا بعدم حضورك قبل بداية وقت عملك ب 12 ساعه ومنها سيتم خصم يوم الغياب فقط دون جزاء حرصاً وتقديراً لظروفك'**
  String get offer_you_service;

  /// No description provided for @validate_date.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل التاريخ'**
  String get validate_date;

  /// No description provided for @validate_resone.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك ادخل  سبب الغياب'**
  String get validate_resone;

  /// No description provided for @military_service_disclosure.
  ///
  /// In ar, this message translates to:
  /// **'اتعهد بإنني لا اعمل لدى اي جهة عسكرية وفي حالة حدث ذلك اتحمل المسئولية كاملة بصفة خاصة وليس لكاشفت ادنى مسئولية عن جهة عملي .'**
  String get military_service_disclosure;

  /// No description provided for @select_district.
  ///
  /// In ar, this message translates to:
  /// **'اختر الحى'**
  String get select_district;

  /// No description provided for @please_select_district.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختر الحى'**
  String get please_select_district;

  /// No description provided for @approval_job_application.
  ///
  /// In ar, this message translates to:
  /// **'الموافقة على طلب التوظيف'**
  String get approval_job_application;

  /// No description provided for @accept.
  ///
  /// In ar, this message translates to:
  /// **'مقبول'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض'**
  String get reject;

  /// No description provided for @employee.
  ///
  /// In ar, this message translates to:
  /// **' موظف'**
  String get employee;

  /// No description provided for @attendance_update.
  ///
  /// In ar, this message translates to:
  /// **'تحديث الحضور'**
  String get attendance_update;

  /// No description provided for @attendance_state.
  ///
  /// In ar, this message translates to:
  /// **'حالة الحضور'**
  String get attendance_state;

  /// No description provided for @recording_time.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الوقت'**
  String get recording_time;

  /// No description provided for @beginning_time.
  ///
  /// In ar, this message translates to:
  /// **'بداية الوقت'**
  String get beginning_time;

  /// No description provided for @end_time.
  ///
  /// In ar, this message translates to:
  /// **'نهاية الوقت'**
  String get end_time;

  /// No description provided for @attendance_registration.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حضور'**
  String get attendance_registration;

  /// No description provided for @departure_registration.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل انصراف'**
  String get departure_registration;

  /// No description provided for @attendance_and_departure_registration.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حضور وانصراف'**
  String get attendance_and_departure_registration;

  /// No description provided for @withdrawal_registration.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل إنسحاب'**
  String get withdrawal_registration;

  /// No description provided for @reason_refuse.
  ///
  /// In ar, this message translates to:
  /// **'سبب الرفض'**
  String get reason_refuse;

  /// No description provided for @select_profession.
  ///
  /// In ar, this message translates to:
  /// **'اختار المهنة'**
  String get select_profession;

  /// No description provided for @required_reason_refuse.
  ///
  /// In ar, this message translates to:
  /// **'سبب الرفض مطلوب'**
  String get required_reason_refuse;

  /// No description provided for @required_attendance_status.
  ///
  /// In ar, this message translates to:
  /// **'حالة الحضور مطلوبة'**
  String get required_attendance_status;

  /// No description provided for @not_found_applicants.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على متقدمين'**
  String get not_found_applicants;

  /// No description provided for @time_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'وقت  الفرصة'**
  String get time_opportunity;

  /// No description provided for @payment.
  ///
  /// In ar, this message translates to:
  /// **'طرق الدفع '**
  String get payment;

  /// No description provided for @opportunity_conditions.
  ///
  /// In ar, this message translates to:
  /// **'شروط  الفرصة'**
  String get opportunity_conditions;

  /// No description provided for @total.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي'**
  String get total;

  /// No description provided for @opportunity.
  ///
  /// In ar, this message translates to:
  /// **'فرصة'**
  String get opportunity;

  /// No description provided for @remaining_chances.
  ///
  /// In ar, this message translates to:
  /// **'فرص متبقية'**
  String get remaining_chances;

  /// No description provided for @favorite_work_times.
  ///
  /// In ar, this message translates to:
  /// **'فترات العمل المفضلة'**
  String get favorite_work_times;

  /// No description provided for @favorite_working_hours.
  ///
  /// In ar, this message translates to:
  /// **'عدد ساعات العمل المفضلة'**
  String get favorite_working_hours;

  /// No description provided for @please_enter_favorite_working_hours.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بإدخال عدد ساعات العمل المفضلة'**
  String get please_enter_favorite_working_hours;

  /// No description provided for @selection_skills.
  ///
  /// In ar, this message translates to:
  /// **'اختيار المهارات'**
  String get selection_skills;

  /// description
  ///
  /// In ar, this message translates to:
  /// **'المهارات المطلوبه لوظيفه {job}'**
  String skills_required_for_job(String job);

  /// No description provided for @employee_already_added.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الموظف بالفعل'**
  String get employee_already_added;

  /// No description provided for @special_jobs.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المميزه'**
  String get special_jobs;

  /// No description provided for @submitted_jobs.
  ///
  /// In ar, this message translates to:
  /// **'الوظائف المقدم عليها '**
  String get submitted_jobs;

  /// No description provided for @exit_app.
  ///
  /// In ar, this message translates to:
  /// **'خروج من التطبيق'**
  String get exit_app;

  /// No description provided for @register_attendance_required.
  ///
  /// In ar, this message translates to:
  /// **'يتوجب عليك تسجيل الحضور او الانصراف للدوام حتي يمكنك التمتع بمميزات التطبيق'**
  String get register_attendance_required;

  /// No description provided for @attendance_cashift_required.
  ///
  /// In ar, this message translates to:
  /// **'يتوجب عليك تسجيل الحضور او الانصراف لدوام كاشفت'**
  String get attendance_cashift_required;

  /// No description provided for @select_job.
  ///
  /// In ar, this message translates to:
  /// **'اختر الفرصه'**
  String get select_job;

  /// No description provided for @search_for_job.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن فرصة'**
  String get search_for_job;

  /// No description provided for @search_filtering.
  ///
  /// In ar, this message translates to:
  /// **'فلترة البحث'**
  String get search_filtering;

  /// No description provided for @select_your_current_city.
  ///
  /// In ar, this message translates to:
  /// **'اختر مدينتك الحاليه'**
  String get select_your_current_city;

  /// No description provided for @date_opportunity_offered.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ عرض الفرصه'**
  String get date_opportunity_offered;

  /// No description provided for @write_date.
  ///
  /// In ar, this message translates to:
  /// **'اكتب التاريخ'**
  String get write_date;

  /// No description provided for @opportunity_price.
  ///
  /// In ar, this message translates to:
  /// **'سعر الفرصه'**
  String get opportunity_price;

  /// No description provided for @minimum.
  ///
  /// In ar, this message translates to:
  /// **'الحد الادني'**
  String get minimum;

  /// No description provided for @maximum.
  ///
  /// In ar, this message translates to:
  /// **'الحد الاقصي'**
  String get maximum;

  /// No description provided for @delete_all.
  ///
  /// In ar, this message translates to:
  /// **'حذف الكل'**
  String get delete_all;

  /// No description provided for @save_filter.
  ///
  /// In ar, this message translates to:
  /// **'حفظ الفلتره'**
  String get save_filter;

  /// No description provided for @view_search_results.
  ///
  /// In ar, this message translates to:
  /// **'عرض نتائج البحث'**
  String get view_search_results;

  /// No description provided for @violation.
  ///
  /// In ar, this message translates to:
  /// **'مخالفة '**
  String get violation;

  /// No description provided for @violation_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ المخالفة '**
  String get violation_date;

  /// No description provided for @violation_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل المخالفة'**
  String get violation_details;

  /// No description provided for @violation_repeated.
  ///
  /// In ar, this message translates to:
  /// **'عدد مرات التكرار'**
  String get violation_repeated;

  /// No description provided for @salary_definition_request.
  ///
  /// In ar, this message translates to:
  /// **'طلب تعريف راتب'**
  String get salary_definition_request;

  /// No description provided for @direction_directed.
  ///
  /// In ar, this message translates to:
  /// **'الجهه الموجهه اليها'**
  String get direction_directed;

  /// No description provided for @purpose_request.
  ///
  /// In ar, this message translates to:
  /// **'الغرض من الطلب'**
  String get purpose_request;

  /// No description provided for @write_purpose_request.
  ///
  /// In ar, this message translates to:
  /// **'اكتب  غرض الطلب'**
  String get write_purpose_request;

  /// No description provided for @commerce_ratification.
  ///
  /// In ar, this message translates to:
  /// **'تصديق الغرفه التجاريه'**
  String get commerce_ratification;

  /// No description provided for @validate_purpose_request.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اكتب  غرض الطلب'**
  String get validate_purpose_request;

  /// No description provided for @validate_direction_directed.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اكتب الجهه الموجه اليها'**
  String get validate_direction_directed;

  /// No description provided for @validate_commerce_ratification.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختر تصديق الغرفه التجاريه'**
  String get validate_commerce_ratification;

  /// No description provided for @select.
  ///
  /// In ar, this message translates to:
  /// **'اختر'**
  String get select;

  /// No description provided for @write_direction_directed.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الجهه الموجه اليها'**
  String get write_direction_directed;

  /// No description provided for @waiting_for_review.
  ///
  /// In ar, this message translates to:
  /// **'في انتظار المراجعة'**
  String get waiting_for_review;

  /// No description provided for @approved.
  ///
  /// In ar, this message translates to:
  /// **'تمت الموافقه '**
  String get approved;

  /// No description provided for @rejected.
  ///
  /// In ar, this message translates to:
  /// **'تم الرفض'**
  String get rejected;

  /// No description provided for @requests.
  ///
  /// In ar, this message translates to:
  /// **'الطلبات'**
  String get requests;

  /// No description provided for @add_new_request.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طلب جديد'**
  String get add_new_request;

  /// No description provided for @loan_loan_request.
  ///
  /// In ar, this message translates to:
  /// **'طلب القرض المالي'**
  String get loan_loan_request;

  /// No description provided for @direction_to.
  ///
  /// In ar, this message translates to:
  /// **'الجهه الموجه اليها'**
  String get direction_to;

  /// No description provided for @purpose_of_request.
  ///
  /// In ar, this message translates to:
  /// **'الغرض من الطلب'**
  String get purpose_of_request;

  /// No description provided for @chamber_commerce_attestation_required.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب تصديق غرفه تجاريه'**
  String get chamber_commerce_attestation_required;

  /// No description provided for @date_request.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الطلب'**
  String get date_request;

  /// No description provided for @download_file.
  ///
  /// In ar, this message translates to:
  /// **'تحميل الملف'**
  String get download_file;

  /// No description provided for @wanted_number.
  ///
  /// In ar, this message translates to:
  /// **'عدد المطلوبين'**
  String get wanted_number;

  /// No description provided for @enter_price_opportunity_message.
  ///
  /// In ar, this message translates to:
  /// **'عفوا لا يوجد تسعير لهذه الوردية برجاء التحقق منها قبل إكمال عمليه الانشاء.'**
  String get enter_price_opportunity_message;

  /// No description provided for @employee_not_found.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على الموظف'**
  String get employee_not_found;

  /// No description provided for @no_more_data.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد المزيد من البيانات'**
  String get no_more_data;

  /// No description provided for @load_failed_refresh_data.
  ///
  /// In ar, this message translates to:
  /// **'فشل التحميل، قم بتحديث البيانات'**
  String get load_failed_refresh_data;

  /// No description provided for @load_more.
  ///
  /// In ar, this message translates to:
  /// **'تحميل المزيد'**
  String get load_more;

  /// No description provided for @today_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'فرص اليوم'**
  String get today_opportunities;

  /// No description provided for @active_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص النشطة'**
  String get active_opportunities;

  /// No description provided for @canceled_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص الملغية'**
  String get canceled_opportunities;

  /// No description provided for @finished_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المنتهية'**
  String get finished_opportunities;

  /// No description provided for @the_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'الفرص المتاحة'**
  String get the_opportunities;

  /// No description provided for @shift_times.
  ///
  /// In ar, this message translates to:
  /// **'مواعيد العمل'**
  String get shift_times;

  /// No description provided for @select_purpose_request.
  ///
  /// In ar, this message translates to:
  /// **'اختر الغرض من الطلب'**
  String get select_purpose_request;

  /// No description provided for @soon.
  ///
  /// In ar, this message translates to:
  /// **'قريبا'**
  String get soon;

  /// No description provided for @violations.
  ///
  /// In ar, this message translates to:
  /// **'المخالفات'**
  String get violations;

  /// No description provided for @violation_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع المخالفة'**
  String get violation_type;

  /// No description provided for @discount_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة الخصم'**
  String get discount_value;

  /// No description provided for @add_new_violation.
  ///
  /// In ar, this message translates to:
  /// **'إضافة مخالفة جديدة'**
  String get add_new_violation;

  /// No description provided for @rejection_reason.
  ///
  /// In ar, this message translates to:
  /// **'ماهو سبب الرفض ؟'**
  String get rejection_reason;

  /// No description provided for @rejection_warning_message.
  ///
  /// In ar, this message translates to:
  /// **'في حالة رفضك للمخالفه سوف يقوم السيستم بالغاء الفرصه واعتبارك منسحب'**
  String get rejection_warning_message;

  /// No description provided for @company_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الشركة'**
  String get company_name;

  /// No description provided for @write_rejection_reason.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب الرفض..'**
  String get write_rejection_reason;

  /// No description provided for @add.
  ///
  /// In ar, this message translates to:
  /// **'اضافة'**
  String get add;

  /// No description provided for @add_your_bank_account_now.
  ///
  /// In ar, this message translates to:
  /// **'اضف حسابك البنكي الان'**
  String get add_your_bank_account_now;

  /// No description provided for @search_your_job_location.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن وظيفتك او موقعك'**
  String get search_your_job_location;

  /// No description provided for @good_morning.
  ///
  /// In ar, this message translates to:
  /// **'صباح الخير'**
  String get good_morning;

  /// No description provided for @good_evening.
  ///
  /// In ar, this message translates to:
  /// **'مساء الخير'**
  String get good_evening;

  /// No description provided for @today.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get today;

  /// No description provided for @leave.
  ///
  /// In ar, this message translates to:
  /// **'الانصراف'**
  String get leave;

  /// No description provided for @vacation_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع الاجازه'**
  String get vacation_type;

  /// No description provided for @absence.
  ///
  /// In ar, this message translates to:
  /// **'غياب'**
  String get absence;

  /// No description provided for @delay.
  ///
  /// In ar, this message translates to:
  /// **'تأخير'**
  String get delay;

  /// No description provided for @vacations.
  ///
  /// In ar, this message translates to:
  /// **'الاجازات'**
  String get vacations;

  /// No description provided for @opportunities_review.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الفرص'**
  String get opportunities_review;

  /// No description provided for @waiting_approval.
  ///
  /// In ar, this message translates to:
  /// **'في انتظار الموافقة'**
  String get waiting_approval;

  /// No description provided for @order_status.
  ///
  /// In ar, this message translates to:
  /// **'حالة الطلب'**
  String get order_status;

  /// No description provided for @blocking_status.
  ///
  /// In ar, this message translates to:
  /// **'حالة الحظر'**
  String get blocking_status;

  /// No description provided for @choose_blocking_state.
  ///
  /// In ar, this message translates to:
  /// **'اختر حالة الحظر'**
  String get choose_blocking_state;

  /// No description provided for @payment_refused.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض الدفع'**
  String get payment_refused;

  /// No description provided for @payment_accepted.
  ///
  /// In ar, this message translates to:
  /// **'مقبول الدفع'**
  String get payment_accepted;

  /// No description provided for @notes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات'**
  String get notes;

  /// No description provided for @home_address.
  ///
  /// In ar, this message translates to:
  /// **'عنوان المنزل'**
  String get home_address;

  /// No description provided for @your_current_location.
  ///
  /// In ar, this message translates to:
  /// **'موقعك الحالي'**
  String get your_current_location;

  /// No description provided for @address.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get address;

  /// No description provided for @loan_requests.
  ///
  /// In ar, this message translates to:
  /// **'طلبات السلفه'**
  String get loan_requests;

  /// No description provided for @add_new_loan_request.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طلب سلفه جديد'**
  String get add_new_loan_request;

  /// No description provided for @waiting_for_approval.
  ///
  /// In ar, this message translates to:
  /// **'في انتظار الموافقه'**
  String get waiting_for_approval;

  /// No description provided for @loan_start_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ بداية السلفه'**
  String get loan_start_date;

  /// No description provided for @number_months_installment.
  ///
  /// In ar, this message translates to:
  /// **'عدد أشهر الاقساط'**
  String get number_months_installment;

  /// No description provided for @installment_amount.
  ///
  /// In ar, this message translates to:
  /// **'قيمه القسط'**
  String get installment_amount;

  /// No description provided for @loan_request_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل طلب السلفه'**
  String get loan_request_details;

  /// No description provided for @loan_request_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع طلب السلفه'**
  String get loan_request_type;

  /// No description provided for @number_months_loan.
  ///
  /// In ar, this message translates to:
  /// **'عدد أشهر السلفه'**
  String get number_months_loan;

  /// No description provided for @loan_amount.
  ///
  /// In ar, this message translates to:
  /// **'قيمه السلفه'**
  String get loan_amount;

  /// No description provided for @conditions.
  ///
  /// In ar, this message translates to:
  /// **'توافق الشروط'**
  String get conditions;

  /// No description provided for @select_loan_request_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع طلب السلفه'**
  String get select_loan_request_type;

  /// No description provided for @select_number_months_loan.
  ///
  /// In ar, this message translates to:
  /// **'اختر عدد أشهر السلفه'**
  String get select_number_months_loan;

  /// No description provided for @enter_loan_amount.
  ///
  /// In ar, this message translates to:
  /// **'اكتب قيمه السلفه'**
  String get enter_loan_amount;

  /// No description provided for @discard.
  ///
  /// In ar, this message translates to:
  /// **'تجاهل'**
  String get discard;

  /// No description provided for @type_transfer.
  ///
  /// In ar, this message translates to:
  /// **'نوع التحويل'**
  String get type_transfer;

  /// No description provided for @no_installment.
  ///
  /// In ar, this message translates to:
  /// **'عدد الاقساط'**
  String get no_installment;

  /// No description provided for @monthly_installment.
  ///
  /// In ar, this message translates to:
  /// **'القسط الشهري'**
  String get monthly_installment;

  /// No description provided for @loan_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع السلفة'**
  String get loan_type;

  /// No description provided for @skip.
  ///
  /// In ar, this message translates to:
  /// **'تخطي'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @landing_page_title1.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في كاشفت'**
  String get landing_page_title1;

  /// No description provided for @landing_page_title2.
  ///
  /// In ar, this message translates to:
  /// **'اختر الفرصة المناسبه لك'**
  String get landing_page_title2;

  /// No description provided for @landing_page_title3.
  ///
  /// In ar, this message translates to:
  /// **'سجل حضورك وانصرافك من خلال QRCode'**
  String get landing_page_title3;

  /// No description provided for @landing_page_title4.
  ///
  /// In ar, this message translates to:
  /// **'الحصول بشكل فوري علي المقابل المادي'**
  String get landing_page_title4;

  /// No description provided for @landing_page_desc1.
  ///
  /// In ar, this message translates to:
  /// **'اول منصة الكترونية مسجلة لدى هيئة الملكية الفكرية توفر فرص بشكل يومي بنظام الساعة والدفع فوري فور انتهاء ساعات عملك بواسطة احدث طرق الدفع '**
  String get landing_page_desc1;

  /// No description provided for @landing_page_desc2.
  ///
  /// In ar, this message translates to:
  /// **'مع كاشفت ابحث عن الفرص التي تناسبك و ابدأ في رحلة رفع مستوي دخلك'**
  String get landing_page_desc2;

  /// No description provided for @landing_page_desc3.
  ///
  /// In ar, this message translates to:
  /// **'نظام متكامل لحفظ حقوق جميع الاطراف من خلال QRCode المخصص لمنصة كاشفت والذي تستطيع من خلاله تسجيل الحضور والانصراف بمنتهى السهولة'**
  String get landing_page_desc3;

  /// No description provided for @landing_page_desc4.
  ///
  /// In ar, this message translates to:
  /// **'ابدا دوامك وتابع اداء عملك وانهي دوامك في الوقت المحدد واحصل علي المقابل المالي بشكل فوري '**
  String get landing_page_desc4;

  /// No description provided for @platform_description.
  ///
  /// In ar, this message translates to:
  /// **'هذه المنصه مسجله لدي الهيئة السعودية للملكية الفكرية'**
  String get platform_description;

  /// No description provided for @lets_start.
  ///
  /// In ar, this message translates to:
  /// **'فلنبدأ'**
  String get lets_start;

  /// No description provided for @attendance_fingerprint_at_beginning.
  ///
  /// In ar, this message translates to:
  /// **'بصمة حضور بداية الدوام'**
  String get attendance_fingerprint_at_beginning;

  /// No description provided for @temporary_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة انصراف مؤقته'**
  String get temporary_fingerprint;

  /// No description provided for @attendance_fingerprint_during_day.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الحضور خلال النهار'**
  String get attendance_fingerprint_during_day;

  /// No description provided for @final_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة انصراف نهائيه'**
  String get final_fingerprint;

  /// No description provided for @enter_password.
  ///
  /// In ar, this message translates to:
  /// **'ادخل كلمه المرور'**
  String get enter_password;

  /// No description provided for @clicking_check_mark_means_you_agree.
  ///
  /// In ar, this message translates to:
  /// **'الضغط علي علامة المربع يعني الموافقة'**
  String get clicking_check_mark_means_you_agree;

  /// No description provided for @gregorian_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ ميلادي'**
  String get gregorian_date;

  /// No description provided for @hijri_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ هجري'**
  String get hijri_date;

  /// No description provided for @confirm_phone_number.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد رقم الهاتف'**
  String get confirm_phone_number;

  /// No description provided for @confirm_phone_number_desc.
  ///
  /// In ar, this message translates to:
  /// **'قم بأدخال كود التفعيل الذي تم ارساله الي الهاتف رقم'**
  String get confirm_phone_number_desc;

  /// No description provided for @code_expires_within.
  ///
  /// In ar, this message translates to:
  /// **'تنتهي صلاحية الكود خلال :  '**
  String get code_expires_within;

  /// No description provided for @did_not_receive_code.
  ///
  /// In ar, this message translates to:
  /// **'لم تستلم الكود؟'**
  String get did_not_receive_code;

  /// No description provided for @resend_code.
  ///
  /// In ar, this message translates to:
  /// **'إعادة إرسال'**
  String get resend_code;

  /// No description provided for @sponsor_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الكفيل'**
  String get sponsor_data;

  /// No description provided for @sponsor_id_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم هويه الكفيل'**
  String get sponsor_id_number;

  /// No description provided for @sponsor_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الكفيل'**
  String get sponsor_name;

  /// No description provided for @sponsor_mobile.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get sponsor_mobile;

  /// No description provided for @bail_requests.
  ///
  /// In ar, this message translates to:
  /// **'طلبات الكفاله'**
  String get bail_requests;

  /// No description provided for @bail_application_pending_approval.
  ///
  /// In ar, this message translates to:
  /// **'طلب الكفاله في انتظار الموافقه'**
  String get bail_application_pending_approval;

  /// No description provided for @approved_bail_request.
  ///
  /// In ar, this message translates to:
  /// **'طلب كفالة تمت الموافقه عليه'**
  String get approved_bail_request;

  /// No description provided for @bail_request_denied.
  ///
  /// In ar, this message translates to:
  /// **'طلب كفاله تم رفضه'**
  String get bail_request_denied;

  /// No description provided for @sponsored_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المكفول'**
  String get sponsored_name;

  /// No description provided for @details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل'**
  String get details;

  /// No description provided for @approval.
  ///
  /// In ar, this message translates to:
  /// **'موافقه'**
  String get approval;

  /// No description provided for @refusal.
  ///
  /// In ar, this message translates to:
  /// **'رفض'**
  String get refusal;

  /// No description provided for @request_has_been_rejected.
  ///
  /// In ar, this message translates to:
  /// **'تم رفض الطلب'**
  String get request_has_been_rejected;

  /// No description provided for @request_has_been_rejected_message.
  ///
  /// In ar, this message translates to:
  /// **'برجاء كتابة سبب الرفض ثم تأكيد الرفض'**
  String get request_has_been_rejected_message;

  /// No description provided for @months.
  ///
  /// In ar, this message translates to:
  /// **'أشهر'**
  String get months;

  /// No description provided for @view_terms_conditions.
  ///
  /// In ar, this message translates to:
  /// **'الاطلاع علي الشروط والاحكام'**
  String get view_terms_conditions;

  /// No description provided for @i_agree_to_all_terms.
  ///
  /// In ar, this message translates to:
  /// **'اوافق علي جميع الشروط'**
  String get i_agree_to_all_terms;

  /// No description provided for @after_break.
  ///
  /// In ar, this message translates to:
  /// **'بعد البريك'**
  String get after_break;

  /// No description provided for @before_break.
  ///
  /// In ar, this message translates to:
  /// **'قبل البريك'**
  String get before_break;

  /// No description provided for @gates.
  ///
  /// In ar, this message translates to:
  /// **'بوابات'**
  String get gates;

  /// No description provided for @mosques.
  ///
  /// In ar, this message translates to:
  /// **'مساجد'**
  String get mosques;

  /// No description provided for @restaurants.
  ///
  /// In ar, this message translates to:
  /// **'مطاعم'**
  String get restaurants;

  /// Gate number
  ///
  /// In ar, this message translates to:
  /// **'بوابه رقم {number}'**
  String gate_number(dynamic number);

  /// No description provided for @projects.
  ///
  /// In ar, this message translates to:
  /// **'المشاريع'**
  String get projects;

  /// No description provided for @first_period.
  ///
  /// In ar, this message translates to:
  /// **'الفتره الاولي'**
  String get first_period;

  /// No description provided for @second_period.
  ///
  /// In ar, this message translates to:
  /// **'الفتره الثانيه'**
  String get second_period;

  /// No description provided for @third_period.
  ///
  /// In ar, this message translates to:
  /// **'الفتره الثالثه'**
  String get third_period;

  /// No description provided for @fourth_period.
  ///
  /// In ar, this message translates to:
  /// **'الفتره الرابعه'**
  String get fourth_period;

  /// No description provided for @active_gates.
  ///
  /// In ar, this message translates to:
  /// **'بوابات نشطه'**
  String get active_gates;

  /// No description provided for @completed_gates.
  ///
  /// In ar, this message translates to:
  /// **'تم الانتهاء منها'**
  String get completed_gates;

  /// No description provided for @my_gates.
  ///
  /// In ar, this message translates to:
  /// **'بواباتي'**
  String get my_gates;

  /// No description provided for @see_all.
  ///
  /// In ar, this message translates to:
  /// **'مشاهدة الكل'**
  String get see_all;

  /// No description provided for @after.
  ///
  /// In ar, this message translates to:
  /// **'بعد'**
  String get after;

  /// No description provided for @gate_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع البوابه : '**
  String get gate_type;

  /// No description provided for @time_start.
  ///
  /// In ar, this message translates to:
  /// **'وقت البدأ : '**
  String get time_start;

  /// No description provided for @time_end.
  ///
  /// In ar, this message translates to:
  /// **'وقت الانتهاء : '**
  String get time_end;

  /// No description provided for @record_attendance.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الحضور'**
  String get record_attendance;

  /// No description provided for @my_work_points.
  ///
  /// In ar, this message translates to:
  /// **'نقاط عملي'**
  String get my_work_points;

  /// No description provided for @connect_code.
  ///
  /// In ar, this message translates to:
  /// **'رمز التواصل : '**
  String get connect_code;

  /// No description provided for @remaining_time_to_rest.
  ///
  /// In ar, this message translates to:
  /// **'باقي من الزمن'**
  String get remaining_time_to_rest;

  /// No description provided for @to_end_rest.
  ///
  /// In ar, this message translates to:
  /// **'لانتهاء الراحه'**
  String get to_end_rest;

  /// No description provided for @alternative_factor.
  ///
  /// In ar, this message translates to:
  /// **'العامل البديل'**
  String get alternative_factor;

  /// No description provided for @administrator.
  ///
  /// In ar, this message translates to:
  /// **'المسؤول'**
  String get administrator;

  /// No description provided for @attendance_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة تسجيل الحضور'**
  String get attendance_fingerprint;

  /// No description provided for @attendance_fingerprint_desc.
  ///
  /// In ar, this message translates to:
  /// **'قم بفحص البصمه لتسجيل حضورك في بدايه الدوام'**
  String get attendance_fingerprint_desc;

  /// No description provided for @scan_now.
  ///
  /// In ar, this message translates to:
  /// **'فحص الان'**
  String get scan_now;

  /// No description provided for @tasks_duties.
  ///
  /// In ar, this message translates to:
  /// **'المهام والواجبات'**
  String get tasks_duties;

  /// No description provided for @communication_device.
  ///
  /// In ar, this message translates to:
  /// **'جهاز التواصل'**
  String get communication_device;

  /// No description provided for @notice_receipt_delivery.
  ///
  /// In ar, this message translates to:
  /// **'إشعار استلام وتسلم'**
  String get notice_receipt_delivery;

  /// No description provided for @notice_receipt_delivery_desc.
  ///
  /// In ar, this message translates to:
  /// **'يجب التأكد من حالة العهدة اولا قبل استلامها'**
  String get notice_receipt_delivery_desc;

  /// No description provided for @communication_device_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم جهاز التواصل  :'**
  String get communication_device_number;

  /// No description provided for @receipt_status.
  ///
  /// In ar, this message translates to:
  /// **'حالة استلام العهدة :'**
  String get receipt_status;

  /// No description provided for @there_are_notes.
  ///
  /// In ar, this message translates to:
  /// **'يوجد ملاحظات'**
  String get there_are_notes;

  /// No description provided for @there_are_no_notes.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد ملاحظات'**
  String get there_are_no_notes;

  /// No description provided for @add_notes.
  ///
  /// In ar, this message translates to:
  /// **'اضافة ملاحظات'**
  String get add_notes;

  /// No description provided for @your_notes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظاتك'**
  String get your_notes;

  /// No description provided for @write_your_notes_here.
  ///
  /// In ar, this message translates to:
  /// **'اكتب ملاحظاتك هنا ...'**
  String get write_your_notes_here;

  /// No description provided for @take_picture_showing_the_problem.
  ///
  /// In ar, this message translates to:
  /// **'التقط صوره توضح  المشكلة'**
  String get take_picture_showing_the_problem;

  /// No description provided for @add_details_to_image.
  ///
  /// In ar, this message translates to:
  /// **'اضف تفاصيل للصوره'**
  String get add_details_to_image;

  /// No description provided for @please_enter_your_notes.
  ///
  /// In ar, this message translates to:
  /// **'برجاء كتابة ملاحظاتك'**
  String get please_enter_your_notes;

  /// No description provided for @focus_point_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات نقطة التمركز'**
  String get focus_point_data;

  /// No description provided for @focus_point_times.
  ///
  /// In ar, this message translates to:
  /// **'اوقات نقطة التمركز'**
  String get focus_point_times;

  /// No description provided for @covenant_received.
  ///
  /// In ar, this message translates to:
  /// **'العهد المستلمة'**
  String get covenant_received;

  /// No description provided for @select_project.
  ///
  /// In ar, this message translates to:
  /// **'اختر المشروع'**
  String get select_project;

  /// No description provided for @point_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع النقطة'**
  String get point_type;

  /// No description provided for @select_point_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع النقطة'**
  String get select_point_type;

  /// No description provided for @point_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم النقطة'**
  String get point_name;

  /// No description provided for @write_point_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم النقطة'**
  String get write_point_name;

  /// No description provided for @priority_level.
  ///
  /// In ar, this message translates to:
  /// **'درجة الاهمية'**
  String get priority_level;

  /// No description provided for @determine_priority_level.
  ///
  /// In ar, this message translates to:
  /// **'حدد درجة الاهميه'**
  String get determine_priority_level;

  /// No description provided for @employee_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع الموظف'**
  String get employee_type;

  /// No description provided for @select_employee_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع الموظف'**
  String get select_employee_type;

  /// No description provided for @add_qr_code_pivot_point.
  ///
  /// In ar, this message translates to:
  /// **'اضافة QR Code لنقطة التمركز'**
  String get add_qr_code_pivot_point;

  /// No description provided for @qr_code_value_appear_when_checked.
  ///
  /// In ar, this message translates to:
  /// **'ستظهر قيمة QR Code عند فحصه'**
  String get qr_code_value_appear_when_checked;

  /// No description provided for @qr_code_added_successfully.
  ///
  /// In ar, this message translates to:
  /// **'تم اضافه QR Code بنجاح'**
  String get qr_code_added_successfully;

  /// No description provided for @current_location.
  ///
  /// In ar, this message translates to:
  /// **'الموقع الحالي'**
  String get current_location;

  /// No description provided for @add_focus_point.
  ///
  /// In ar, this message translates to:
  /// **'اضافة نقطة تمركز'**
  String get add_focus_point;

  /// No description provided for @add_new_time.
  ///
  /// In ar, this message translates to:
  /// **'اضف وقت جديد'**
  String get add_new_time;

  /// No description provided for @type.
  ///
  /// In ar, this message translates to:
  /// **'النوع'**
  String get type;

  /// No description provided for @add_covenant.
  ///
  /// In ar, this message translates to:
  /// **'اضف عهدة'**
  String get add_covenant;

  /// No description provided for @select_shift_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع الوردية'**
  String get select_shift_type;

  /// No description provided for @covenant_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات العهدة'**
  String get covenant_data;

  /// No description provided for @covenant_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع العهدة :'**
  String get covenant_type;

  /// No description provided for @select_covenant_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع العهدة'**
  String get select_covenant_type;

  /// No description provided for @determine_covenant_number.
  ///
  /// In ar, this message translates to:
  /// **'حدد رقم العهدة'**
  String get determine_covenant_number;

  /// No description provided for @covenant_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم العهدة :'**
  String get covenant_number;

  /// No description provided for @covenant_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم العهدة :'**
  String get covenant_name;

  /// No description provided for @list_gates_added.
  ///
  /// In ar, this message translates to:
  /// **'قائمة البوابات المضافة'**
  String get list_gates_added;

  /// No description provided for @added_focus_points.
  ///
  /// In ar, this message translates to:
  /// **'نقاط التمركز المضافة'**
  String get added_focus_points;

  /// No description provided for @add_new_point.
  ///
  /// In ar, this message translates to:
  /// **'اضافة نقطة جديده'**
  String get add_new_point;

  /// No description provided for @edit_focus_point.
  ///
  /// In ar, this message translates to:
  /// **'تعديل نقطة التمركز'**
  String get edit_focus_point;

  /// No description provided for @delete_focus_point.
  ///
  /// In ar, this message translates to:
  /// **'حذف نقطة التمركز'**
  String get delete_focus_point;

  /// No description provided for @added_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الاضافة : '**
  String get added_date;

  /// No description provided for @my_focus_points.
  ///
  /// In ar, this message translates to:
  /// **'نقاط التمركز الخاصه بي '**
  String get my_focus_points;

  /// No description provided for @invalid_qr_code.
  ///
  /// In ar, this message translates to:
  /// **'رمز QR غير صالح'**
  String get invalid_qr_code;

  /// No description provided for @edit_focus_point_data.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بيانات نقطة التمركز'**
  String get edit_focus_point_data;

  /// No description provided for @edit_focus_point_times.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اوقات نقطة التمركز'**
  String get edit_focus_point_times;

  /// No description provided for @edit_covenant_received.
  ///
  /// In ar, this message translates to:
  /// **'تعديل العهد المستلمه'**
  String get edit_covenant_received;

  /// No description provided for @delete_time.
  ///
  /// In ar, this message translates to:
  /// **'حذف الوقت'**
  String get delete_time;

  /// No description provided for @are_you_sure_delete_time.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من حذف هذا الوقت ؟'**
  String get are_you_sure_delete_time;

  /// No description provided for @write_covenant_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم العهده'**
  String get write_covenant_name;

  /// No description provided for @save_edit.
  ///
  /// In ar, this message translates to:
  /// **'حفظ التعديل'**
  String get save_edit;

  /// No description provided for @are_you_sure_delete_focus_point.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من حذف نقطة التمركز ؟'**
  String get are_you_sure_delete_focus_point;

  /// No description provided for @previous.
  ///
  /// In ar, this message translates to:
  /// **'السابق'**
  String get previous;

  /// No description provided for @delete_custody.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد انك تريد حذف هذه العهدة ؟'**
  String get delete_custody;

  /// No description provided for @saved_focus_point_time_dec.
  ///
  /// In ar, this message translates to:
  /// **'يجب حفظ هذا الوقت اولا قبل اضافة اخر'**
  String get saved_focus_point_time_dec;

  /// No description provided for @focus_point_location_message.
  ///
  /// In ar, this message translates to:
  /// **'يجب تفعيل اللوكيشن قبل اضافة نقطة تمركز'**
  String get focus_point_location_message;

  /// No description provided for @area.
  ///
  /// In ar, this message translates to:
  /// **'المنطقة'**
  String get area;

  /// No description provided for @select_area.
  ///
  /// In ar, this message translates to:
  /// **'اختر المنطقة'**
  String get select_area;

  /// No description provided for @tracking_focus_points.
  ///
  /// In ar, this message translates to:
  /// **'متابعة نقاط التمركز'**
  String get tracking_focus_points;

  /// No description provided for @finish_tracking.
  ///
  /// In ar, this message translates to:
  /// **'ينتهي'**
  String get finish_tracking;

  /// No description provided for @rest_time.
  ///
  /// In ar, this message translates to:
  /// **'وقت الراحة'**
  String get rest_time;

  /// No description provided for @record_departure.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الأنصراف'**
  String get record_departure;

  /// No description provided for @navigate_to_current_location.
  ///
  /// In ar, this message translates to:
  /// **'انتقال الي الموقع الحالي؟'**
  String get navigate_to_current_location;

  /// No description provided for @navigate_to_current_location_des.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد تعديل الموقع لموقعك الحالي؟'**
  String get navigate_to_current_location_des;

  /// No description provided for @work_point_location.
  ///
  /// In ar, this message translates to:
  /// **'موقع نقطة العمل'**
  String get work_point_location;

  /// No description provided for @coverage.
  ///
  /// In ar, this message translates to:
  /// **'تغطية الراحات'**
  String get coverage;

  /// No description provided for @select_coverage.
  ///
  /// In ar, this message translates to:
  /// **'اختر تغطية الراحات'**
  String get select_coverage;

  /// No description provided for @there_no_employees.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد موظفين'**
  String get there_no_employees;

  /// No description provided for @select_gate_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع البوابة'**
  String get select_gate_type;

  /// No description provided for @shifts.
  ///
  /// In ar, this message translates to:
  /// **'الورديات'**
  String get shifts;

  /// No description provided for @work_periods.
  ///
  /// In ar, this message translates to:
  /// **'فترات العمل'**
  String get work_periods;

  /// No description provided for @add_work_the_period.
  ///
  /// In ar, this message translates to:
  /// **'اضافة فترة العمل'**
  String get add_work_the_period;

  /// No description provided for @add_more_the_work_periods.
  ///
  /// In ar, this message translates to:
  /// **'اضافة المزيد من فترات العمل'**
  String get add_more_the_work_periods;

  /// No description provided for @no_focus_points_found_to_search_result.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد نقاط تمركز مطابقة لنتيجة البحث'**
  String get no_focus_points_found_to_search_result;

  /// No description provided for @point.
  ///
  /// In ar, this message translates to:
  /// **'نقطة'**
  String get point;

  /// No description provided for @points.
  ///
  /// In ar, this message translates to:
  /// **'نقاط'**
  String get points;

  /// No description provided for @time.
  ///
  /// In ar, this message translates to:
  /// **'الوقت'**
  String get time;

  /// No description provided for @date.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get date;

  /// No description provided for @activate_client.
  ///
  /// In ar, this message translates to:
  /// **'تفعيل العميل'**
  String get activate_client;

  /// No description provided for @successfully_done.
  ///
  /// In ar, this message translates to:
  /// **'تمت بنجاح'**
  String get successfully_done;

  /// No description provided for @pledges_and_generalization.
  ///
  /// In ar, this message translates to:
  /// **'التعهدات والتعميم'**
  String get pledges_and_generalization;

  /// No description provided for @pledges.
  ///
  /// In ar, this message translates to:
  /// **'التعهدات'**
  String get pledges;

  /// No description provided for @generalizations.
  ///
  /// In ar, this message translates to:
  /// **'التعاميم'**
  String get generalizations;

  /// No description provided for @date_pledge.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ التعهد'**
  String get date_pledge;

  /// No description provided for @reset.
  ///
  /// In ar, this message translates to:
  /// **'اعادة الضبط'**
  String get reset;

  /// No description provided for @users.
  ///
  /// In ar, this message translates to:
  /// **'المستخدمين'**
  String get users;

  /// No description provided for @inactive.
  ///
  /// In ar, this message translates to:
  /// **'غير نشط'**
  String get inactive;

  /// No description provided for @responsible_projects.
  ///
  /// In ar, this message translates to:
  /// **'المشاريع المسؤول عنها'**
  String get responsible_projects;

  /// No description provided for @e_mail.
  ///
  /// In ar, this message translates to:
  /// **'الايميل'**
  String get e_mail;

  /// No description provided for @edit_user_profile.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بيانات المستخدم'**
  String get edit_user_profile;

  /// No description provided for @activate_account.
  ///
  /// In ar, this message translates to:
  /// **'تفعيل الحساب'**
  String get activate_account;

  /// No description provided for @deactivate_account.
  ///
  /// In ar, this message translates to:
  /// **'تعطيل الحساب'**
  String get deactivate_account;

  /// No description provided for @delete_user.
  ///
  /// In ar, this message translates to:
  /// **'حذف المستخدم'**
  String get delete_user;

  /// No description provided for @added_users.
  ///
  /// In ar, this message translates to:
  /// **'المستخدمين المضافين'**
  String get added_users;

  /// No description provided for @add_new_user.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مستخدم جديد'**
  String get add_new_user;

  /// No description provided for @triple_username.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم الثلاثي'**
  String get triple_username;

  /// No description provided for @write_user_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المستخدم'**
  String get write_user_name;

  /// No description provided for @user_account.
  ///
  /// In ar, this message translates to:
  /// **'حساب المستخدم'**
  String get user_account;

  /// No description provided for @write_user_email.
  ///
  /// In ar, this message translates to:
  /// **'اكتب ايميل المستخدم'**
  String get write_user_email;

  /// No description provided for @write_user_mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب رقم الجوال'**
  String get write_user_mobile_number;

  /// No description provided for @write_user_password.
  ///
  /// In ar, this message translates to:
  /// **'اكتب كلمة السر'**
  String get write_user_password;

  /// No description provided for @password_confirmation.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة السر'**
  String get password_confirmation;

  /// No description provided for @what_user_permissions.
  ///
  /// In ar, this message translates to:
  /// **'ماهي صلاحيات المستخدم؟'**
  String get what_user_permissions;

  /// No description provided for @brand_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم البراند'**
  String get brand_name;

  /// No description provided for @select_brand_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم البراند'**
  String get select_brand_name;

  /// No description provided for @select_company_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم الشركة'**
  String get select_company_name;

  /// No description provided for @select_project_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم المشروع'**
  String get select_project_name;

  /// No description provided for @type_new_password.
  ///
  /// In ar, this message translates to:
  /// **'اكتب كلمة السر الجديدة'**
  String get type_new_password;

  /// No description provided for @retype_password.
  ///
  /// In ar, this message translates to:
  /// **'اعد كتابة كلمة السر'**
  String get retype_password;

  /// No description provided for @edit_password.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة السر'**
  String get edit_password;

  /// No description provided for @permissions.
  ///
  /// In ar, this message translates to:
  /// **'الصلاحيات'**
  String get permissions;

  /// No description provided for @search_project_name.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن اسم المشروع'**
  String get search_project_name;

  /// No description provided for @search_company_name.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن اسم الشركة'**
  String get search_company_name;

  /// No description provided for @search_brand_name.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن اسم البراند'**
  String get search_brand_name;

  /// No description provided for @search_shift_type.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن نوع الوردية'**
  String get search_shift_type;

  /// No description provided for @pledges_and_generalization_confirm_message.
  ///
  /// In ar, this message translates to:
  /// **'باختيارك اعادة ضبط البيانات ستتاح لك الفرصة لتغيير اختيارك اذا اردت الاستمرار اضغط تاكيد'**
  String get pledges_and_generalization_confirm_message;

  /// No description provided for @share.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get share;

  /// No description provided for @vision_certificate.
  ///
  /// In ar, this message translates to:
  /// **'رؤية الشهادة'**
  String get vision_certificate;

  /// No description provided for @download.
  ///
  /// In ar, this message translates to:
  /// **'تنزيل'**
  String get download;

  /// No description provided for @employees_certificates.
  ///
  /// In ar, this message translates to:
  /// **'شهادات الموظفين'**
  String get employees_certificates;

  /// No description provided for @employee_certificate.
  ///
  /// In ar, this message translates to:
  /// **'شهادة الموظف'**
  String get employee_certificate;

  /// No description provided for @personal_information.
  ///
  /// In ar, this message translates to:
  /// **'معلومات شخصية'**
  String get personal_information;

  /// No description provided for @previous_experience.
  ///
  /// In ar, this message translates to:
  /// **'الخبرات السابقة'**
  String get previous_experience;

  /// No description provided for @customer_reviews.
  ///
  /// In ar, this message translates to:
  /// **'اراء العملاء'**
  String get customer_reviews;

  /// No description provided for @something_went_wrong.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ ما'**
  String get something_went_wrong;

  /// No description provided for @projects_management.
  ///
  /// In ar, this message translates to:
  /// **'ادارة المشاريع'**
  String get projects_management;

  /// No description provided for @add_project.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مشروع'**
  String get add_project;

  /// No description provided for @add_projects.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مشاريع'**
  String get add_projects;

  /// No description provided for @project_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات المشروع'**
  String get project_data;

  /// No description provided for @attendance_departure_report.
  ///
  /// In ar, this message translates to:
  /// **'تقرير الحضور والانصراف'**
  String get attendance_departure_report;

  /// No description provided for @edit_project_data.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بيانات المشروع'**
  String get edit_project_data;

  /// No description provided for @adjust_periods.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الفترات'**
  String get adjust_periods;

  /// No description provided for @pricing_adjustment.
  ///
  /// In ar, this message translates to:
  /// **'تعديل التسعير'**
  String get pricing_adjustment;

  /// No description provided for @edit_additional_sites.
  ///
  /// In ar, this message translates to:
  /// **'تعديل المواقع الاضافية'**
  String get edit_additional_sites;

  /// No description provided for @print_qr_code.
  ///
  /// In ar, this message translates to:
  /// **'طباعه QR code'**
  String get print_qr_code;

  /// No description provided for @project_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اسم المشروع بالعربي'**
  String get project_name_ar;

  /// No description provided for @project_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اسم المشروع بالانجليزي'**
  String get project_name_en;

  /// No description provided for @city_ar.
  ///
  /// In ar, this message translates to:
  /// **'المدينه بالعربي'**
  String get city_ar;

  /// No description provided for @city_en.
  ///
  /// In ar, this message translates to:
  /// **'المدينه بالانجليزي'**
  String get city_en;

  /// No description provided for @write_city.
  ///
  /// In ar, this message translates to:
  /// **'اكتب المدينه'**
  String get write_city;

  /// No description provided for @address_ar.
  ///
  /// In ar, this message translates to:
  /// **'العنوان بالعربي'**
  String get address_ar;

  /// No description provided for @address_en.
  ///
  /// In ar, this message translates to:
  /// **'العنوان بالانجليزي'**
  String get address_en;

  /// No description provided for @write_address.
  ///
  /// In ar, this message translates to:
  /// **'اكتب العنوان'**
  String get write_address;

  /// No description provided for @brand_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع البراند'**
  String get brand_type;

  /// No description provided for @select_brand_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع البراند'**
  String get select_brand_type;

  /// No description provided for @main_location.
  ///
  /// In ar, this message translates to:
  /// **'الموقع الرئيسي'**
  String get main_location;

  /// No description provided for @location_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الموقع'**
  String get location_name;

  /// No description provided for @additional_locations.
  ///
  /// In ar, this message translates to:
  /// **'المواقع الاضافيه'**
  String get additional_locations;

  /// No description provided for @add_location.
  ///
  /// In ar, this message translates to:
  /// **'اضف موقع'**
  String get add_location;

  /// No description provided for @start_typing_search.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ الكتابة للبحث'**
  String get start_typing_search;

  /// No description provided for @tap_map_get_address.
  ///
  /// In ar, this message translates to:
  /// **'اضغط على الخريطة للحصول على العنوان'**
  String get tap_map_get_address;

  /// No description provided for @nearby_places.
  ///
  /// In ar, this message translates to:
  /// **'الاماكن المجاورة'**
  String get nearby_places;

  /// No description provided for @no_results_found.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على نتائج'**
  String get no_results_found;

  /// No description provided for @finding_place.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ البحث عن مكان ...'**
  String get finding_place;

  /// No description provided for @add_new_period.
  ///
  /// In ar, this message translates to:
  /// **'اضف فترة جديدة'**
  String get add_new_period;

  /// No description provided for @edit_period.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الفترة '**
  String get edit_period;

  /// No description provided for @period_order.
  ///
  /// In ar, this message translates to:
  /// **'ترتيب الفترة'**
  String get period_order;

  /// No description provided for @select_period_order.
  ///
  /// In ar, this message translates to:
  /// **'اختر ترتيب الفترة'**
  String get select_period_order;

  /// No description provided for @search_period.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن الفترة'**
  String get search_period;

  /// No description provided for @period_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اسم الفترة بالعربي'**
  String get period_name_ar;

  /// No description provided for @period_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اسم الفترة بالانجليزي'**
  String get period_name_en;

  /// No description provided for @write_period_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الفترة'**
  String get write_period_name;

  /// No description provided for @occupation.
  ///
  /// In ar, this message translates to:
  /// **'المهنة'**
  String get occupation;

  /// No description provided for @select_occupation.
  ///
  /// In ar, this message translates to:
  /// **'اختر المهنة'**
  String get select_occupation;

  /// No description provided for @search_occupation.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن المهنة'**
  String get search_occupation;

  /// No description provided for @working_hours_num.
  ///
  /// In ar, this message translates to:
  /// **'عدد ساعات العمل'**
  String get working_hours_num;

  /// No description provided for @period_pricing.
  ///
  /// In ar, this message translates to:
  /// **'تسعير الفترة'**
  String get period_pricing;

  /// No description provided for @add_period_pricing.
  ///
  /// In ar, this message translates to:
  /// **'اضف تسعير الفترة'**
  String get add_period_pricing;

  /// No description provided for @city_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المدينة'**
  String get city_name;

  /// No description provided for @select_city_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم المدينة'**
  String get select_city_name;

  /// No description provided for @from_day.
  ///
  /// In ar, this message translates to:
  /// **'من يوم '**
  String get from_day;

  /// No description provided for @to_day.
  ///
  /// In ar, this message translates to:
  /// **'الى يوم '**
  String get to_day;

  /// No description provided for @select_day.
  ///
  /// In ar, this message translates to:
  /// **'حدد يوم '**
  String get select_day;

  /// No description provided for @value_pricing.
  ///
  /// In ar, this message translates to:
  /// **'قيمة التسعير'**
  String get value_pricing;

  /// No description provided for @rosacea.
  ///
  /// In ar, this message translates to:
  /// **'الوردية'**
  String get rosacea;

  /// No description provided for @select_rosacea.
  ///
  /// In ar, this message translates to:
  /// **' اختر الوردية'**
  String get select_rosacea;

  /// No description provided for @search_rosacea.
  ///
  /// In ar, this message translates to:
  /// **' ابحث عن وردية'**
  String get search_rosacea;

  /// No description provided for @search_the_job.
  ///
  /// In ar, this message translates to:
  /// **' ابحث عن وظيفة'**
  String get search_the_job;

  /// No description provided for @select_the_job.
  ///
  /// In ar, this message translates to:
  /// **' اختر الفرصه'**
  String get select_the_job;

  /// No description provided for @the_salary.
  ///
  /// In ar, this message translates to:
  /// **'الراتب'**
  String get the_salary;

  /// No description provided for @write_value_pricing.
  ///
  /// In ar, this message translates to:
  /// **' ادخل قيمة التسعير'**
  String get write_value_pricing;

  /// No description provided for @dont_save.
  ///
  /// In ar, this message translates to:
  /// **' اهمال'**
  String get dont_save;

  /// No description provided for @edit_pricing.
  ///
  /// In ar, this message translates to:
  /// **'تعديل  تسعيرة  الفترة'**
  String get edit_pricing;

  /// No description provided for @last_pricing.
  ///
  /// In ar, this message translates to:
  /// **'التسعيرات السابقه'**
  String get last_pricing;

  /// No description provided for @to_.
  ///
  /// In ar, this message translates to:
  /// **'الى'**
  String get to_;

  /// No description provided for @validation_day.
  ///
  /// In ar, this message translates to:
  /// **'ادخل  يوم ما بين 1 الى 31  '**
  String get validation_day;

  /// No description provided for @add_logo.
  ///
  /// In ar, this message translates to:
  /// **'اضف شعار'**
  String get add_logo;

  /// No description provided for @download_image_file.
  ///
  /// In ar, this message translates to:
  /// **'تحميل ملف الصورة'**
  String get download_image_file;

  /// No description provided for @vision_qr_code.
  ///
  /// In ar, this message translates to:
  /// **'رؤية QR Code'**
  String get vision_qr_code;

  /// No description provided for @back_to_projects.
  ///
  /// In ar, this message translates to:
  /// **'العودة للمشاريع'**
  String get back_to_projects;

  /// No description provided for @download_qr_code.
  ///
  /// In ar, this message translates to:
  /// **'تحميل QR Code'**
  String get download_qr_code;

  /// No description provided for @please_add_logo.
  ///
  /// In ar, this message translates to:
  /// **'برجاء اضافة شعار'**
  String get please_add_logo;

  /// No description provided for @project_added_successfully.
  ///
  /// In ar, this message translates to:
  /// **'تم اضافة المشروع بنجاح'**
  String get project_added_successfully;

  /// No description provided for @project_added_manage_projects_list.
  ///
  /// In ar, this message translates to:
  /// **'تم اضافة المشروع لقائمة ادارة المشاريع'**
  String get project_added_manage_projects_list;

  /// No description provided for @you_can_download_project_now_share_it.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك تحميل المشروع الان او مشاركته'**
  String get you_can_download_project_now_share_it;

  /// No description provided for @must_be_arabic_letters.
  ///
  /// In ar, this message translates to:
  /// **'يجب ان تكون حروف عربية'**
  String get must_be_arabic_letters;

  /// No description provided for @must_be_english_letters.
  ///
  /// In ar, this message translates to:
  /// **'يجب ان تكون حروف انجليزية'**
  String get must_be_english_letters;

  /// No description provided for @employment_management.
  ///
  /// In ar, this message translates to:
  /// **'اداره التوظيف'**
  String get employment_management;

  /// No description provided for @procedures.
  ///
  /// In ar, this message translates to:
  /// **'الاجراءات'**
  String get procedures;

  /// No description provided for @more_details.
  ///
  /// In ar, this message translates to:
  /// **'المزيد من التفاصيل'**
  String get more_details;

  /// No description provided for @nationality.
  ///
  /// In ar, this message translates to:
  /// **'الجنسيه'**
  String get nationality;

  /// No description provided for @chashifter_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الكاشيفتر'**
  String get chashifter_data;

  /// No description provided for @employee_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الموظف'**
  String get employee_data;

  /// No description provided for @ban.
  ///
  /// In ar, this message translates to:
  /// **'الحظر'**
  String get ban;

  /// No description provided for @accept_but.
  ///
  /// In ar, this message translates to:
  /// **'موافقة'**
  String get accept_but;

  /// No description provided for @reject_but.
  ///
  /// In ar, this message translates to:
  /// **'رفض'**
  String get reject_but;

  /// No description provided for @project.
  ///
  /// In ar, this message translates to:
  /// **'المشروع '**
  String get project;

  /// No description provided for @nods.
  ///
  /// In ar, this message translates to:
  /// **'الملاحظات'**
  String get nods;

  /// No description provided for @review_project.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي التقييمات علي المشروع '**
  String get review_project;

  /// No description provided for @review_company.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي التقييمات علي الشركة '**
  String get review_company;

  /// No description provided for @more_than_about_emp.
  ///
  /// In ar, this message translates to:
  /// **'لمعرفة المزيد عن هذا الموظف  '**
  String get more_than_about_emp;

  /// No description provided for @click.
  ///
  /// In ar, this message translates to:
  /// **'انقر هنا'**
  String get click;

  /// No description provided for @more_than.
  ///
  /// In ar, this message translates to:
  /// **'المزيد من التفاصيل'**
  String get more_than;

  /// No description provided for @block_emp.
  ///
  /// In ar, this message translates to:
  /// **'حظر الموظفين'**
  String get block_emp;

  /// No description provided for @cv_emp.
  ///
  /// In ar, this message translates to:
  /// **'شهادة الموظف'**
  String get cv_emp;

  /// No description provided for @statistic_emp.
  ///
  /// In ar, this message translates to:
  /// **'احصائيات الموظف'**
  String get statistic_emp;

  /// No description provided for @base_inf.
  ///
  /// In ar, this message translates to:
  /// **'البيانات الاساسيه'**
  String get base_inf;

  /// No description provided for @level_computer.
  ///
  /// In ar, this message translates to:
  /// **'المستوي في الكمبيوتر'**
  String get level_computer;

  /// No description provided for @current_state.
  ///
  /// In ar, this message translates to:
  /// **'الوضع  الحالي '**
  String get current_state;

  /// No description provided for @level_eng.
  ///
  /// In ar, this message translates to:
  /// **'المستوي في الانجليزي'**
  String get level_eng;

  /// No description provided for @level_education.
  ///
  /// In ar, this message translates to:
  /// **'المؤهل التعليمي'**
  String get level_education;

  /// No description provided for @favorite_proportion.
  ///
  /// In ar, this message translates to:
  /// **' الفرص المفضله'**
  String get favorite_proportion;

  /// No description provided for @work_inf.
  ///
  /// In ar, this message translates to:
  /// **'بيانات العمل '**
  String get work_inf;

  /// No description provided for @employee_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الموظف'**
  String get employee_details;

  /// No description provided for @previous_opportunities_and_evaluations.
  ///
  /// In ar, this message translates to:
  /// **'الفرص السابقه والتقييمات'**
  String get previous_opportunities_and_evaluations;

  /// No description provided for @average_feedbacks.
  ///
  /// In ar, this message translates to:
  /// **'متوسط التقيمات'**
  String get average_feedbacks;

  /// No description provided for @previous_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'فرص سابقه'**
  String get previous_opportunities;

  /// No description provided for @previous_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'فرصه سابقه'**
  String get previous_opportunity;

  /// No description provided for @are_you_sure_ban_employee.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من حظر الموظف؟'**
  String get are_you_sure_ban_employee;

  /// No description provided for @are_you_sure_approval_employee.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من الموافقة علي الموظف؟'**
  String get are_you_sure_approval_employee;

  /// No description provided for @please_select_permission.
  ///
  /// In ar, this message translates to:
  /// **'برجاء اختيار الصلاحية'**
  String get please_select_permission;

  /// No description provided for @punishments.
  ///
  /// In ar, this message translates to:
  /// **'العقوبات'**
  String get punishments;

  /// No description provided for @add_new_punishment.
  ///
  /// In ar, this message translates to:
  /// **'اضف عقوبة جديدة'**
  String get add_new_punishment;

  /// No description provided for @punishment_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم العقوبة'**
  String get punishment_name;

  /// No description provided for @select_punishment_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم العقوبة'**
  String get select_punishment_name;

  /// No description provided for @punishment_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع العقوبة'**
  String get punishment_type;

  /// No description provided for @select_punishment_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع العقوبة'**
  String get select_punishment_type;

  /// No description provided for @num_prohibited_days.
  ///
  /// In ar, this message translates to:
  /// **'عدد الايام المحظورة'**
  String get num_prohibited_days;

  /// No description provided for @determine_prohibited_days.
  ///
  /// In ar, this message translates to:
  /// **'حدد الايام المحظوره'**
  String get determine_prohibited_days;

  /// No description provided for @value_discounted_amount.
  ///
  /// In ar, this message translates to:
  /// **'قيمه المبلغ المخصوم'**
  String get value_discounted_amount;

  /// No description provided for @edit_punishment.
  ///
  /// In ar, this message translates to:
  /// **'تعديل العقوبه'**
  String get edit_punishment;

  /// No description provided for @deactivate_punishment.
  ///
  /// In ar, this message translates to:
  /// **'الغاء تفعيل العقوبه'**
  String get deactivate_punishment;

  /// No description provided for @activate_punishment.
  ///
  /// In ar, this message translates to:
  /// **'تفعيل العقوبه'**
  String get activate_punishment;

  /// No description provided for @delete_punishment.
  ///
  /// In ar, this message translates to:
  /// **'حذف العقوبة'**
  String get delete_punishment;

  /// No description provided for @active_f.
  ///
  /// In ar, this message translates to:
  /// **'نشطه'**
  String get active_f;

  /// No description provided for @inactive_f.
  ///
  /// In ar, this message translates to:
  /// **'غير نشطه'**
  String get inactive_f;

  /// No description provided for @violation_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة المخالفه'**
  String get violation_value;

  /// No description provided for @are_you_sure_approval_violation.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من الموافقة علي المخالفه؟'**
  String get are_you_sure_approval_violation;

  /// No description provided for @are_you_sure_delete_punishment.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من حذف العقوبة؟'**
  String get are_you_sure_delete_punishment;

  /// No description provided for @are_you_sure_deactivate_punishment.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من الغاء تفعيل العقوبه؟'**
  String get are_you_sure_deactivate_punishment;

  /// No description provided for @are_you_sure_activate_punishment.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من تفعيل العقوبه؟'**
  String get are_you_sure_activate_punishment;

  /// No description provided for @employment_officials.
  ///
  /// In ar, this message translates to:
  /// **'مسئولي التوظيف'**
  String get employment_officials;

  /// No description provided for @add_employment_official.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مسئول توظيف'**
  String get add_employment_official;

  /// No description provided for @edit_employment_official_data.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بيانات مسئول توظيف'**
  String get edit_employment_official_data;

  /// No description provided for @determine_shift_hours.
  ///
  /// In ar, this message translates to:
  /// **'حدد مواعيد العمل'**
  String get determine_shift_hours;

  /// No description provided for @workdays.
  ///
  /// In ar, this message translates to:
  /// **'ايام العمل'**
  String get workdays;

  /// No description provided for @write_working_days.
  ///
  /// In ar, this message translates to:
  /// **'اكتب ايام العمل'**
  String get write_working_days;

  /// No description provided for @add_notes_in_arabic.
  ///
  /// In ar, this message translates to:
  /// **'اضف ملاحظات باللغة العربية'**
  String get add_notes_in_arabic;

  /// No description provided for @add_notes_in_english.
  ///
  /// In ar, this message translates to:
  /// **'اضف ملاحظات باللغة الانجليزية'**
  String get add_notes_in_english;

  /// No description provided for @write_note.
  ///
  /// In ar, this message translates to:
  /// **'اكتب ملاحظة'**
  String get write_note;

  /// No description provided for @write_employee_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الموظف'**
  String get write_employee_name;

  /// No description provided for @write_email.
  ///
  /// In ar, this message translates to:
  /// **'اكتب البريد الالكتروني'**
  String get write_email;

  /// No description provided for @add_employment_location.
  ///
  /// In ar, this message translates to:
  /// **'اضافة موقع التوظيف'**
  String get add_employment_location;

  /// No description provided for @delete_employment_official_data.
  ///
  /// In ar, this message translates to:
  /// **'حذف بيانات مسئول التوظيف'**
  String get delete_employment_official_data;

  /// No description provided for @are_you_sure_deactivate_employment_official.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متاكد من تعطيل مسئول التوظيف؟'**
  String get are_you_sure_deactivate_employment_official;

  /// No description provided for @employment_department.
  ///
  /// In ar, this message translates to:
  /// **'اداره التوظيف'**
  String get employment_department;

  /// No description provided for @add_copy_rights_title.
  ///
  /// In ar, this message translates to:
  /// **'اضافة الشروط والاحكام'**
  String get add_copy_rights_title;

  /// No description provided for @add_condition.
  ///
  /// In ar, this message translates to:
  /// **'اضافة شرط'**
  String get add_condition;

  /// No description provided for @edit_condition.
  ///
  /// In ar, this message translates to:
  /// **'تعديل شرط'**
  String get edit_condition;

  /// No description provided for @update_status_active.
  ///
  /// In ar, this message translates to:
  /// **'تغير الحالة الي نشط'**
  String get update_status_active;

  /// No description provided for @update_status_unActive.
  ///
  /// In ar, this message translates to:
  /// **'تغير الحالة الي غير نشط'**
  String get update_status_unActive;

  /// No description provided for @condition_ar.
  ///
  /// In ar, this message translates to:
  /// **'كتابه الشرط باللغه العربيه'**
  String get condition_ar;

  /// No description provided for @condition_ar_validation.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الشرط باللغه العربيه'**
  String get condition_ar_validation;

  /// No description provided for @condition_en.
  ///
  /// In ar, this message translates to:
  /// **'الشرط باللغه الانجليزيه'**
  String get condition_en;

  /// No description provided for @delete.
  ///
  /// In ar, this message translates to:
  /// **'حذف'**
  String get delete;

  /// No description provided for @add_job_requirements.
  ///
  /// In ar, this message translates to:
  /// **'اضافة متطلبات الوظيفه'**
  String get add_job_requirements;

  /// No description provided for @edit_job_requirements.
  ///
  /// In ar, this message translates to:
  /// **'تعديل متطلبات الوظيفه'**
  String get edit_job_requirements;

  /// No description provided for @job_requirements.
  ///
  /// In ar, this message translates to:
  /// **' متطلبات الوظيفه'**
  String get job_requirements;

  /// No description provided for @condition_en_validation.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الشرط باللغه الانجليزيه'**
  String get condition_en_validation;

  /// No description provided for @writing_requirements_ar.
  ///
  /// In ar, this message translates to:
  /// **'كتابه المتطلبات باللغه العربيه'**
  String get writing_requirements_ar;

  /// No description provided for @writing_requirements_ar_validation.
  ///
  /// In ar, this message translates to:
  /// **'اكتب المتطلبات باللغه العربيه'**
  String get writing_requirements_ar_validation;

  /// No description provided for @writing_requirements_en.
  ///
  /// In ar, this message translates to:
  /// **'كتابه المتطلبات باللغه الانجليزيه'**
  String get writing_requirements_en;

  /// No description provided for @writing_requirements_en_validation.
  ///
  /// In ar, this message translates to:
  /// **'اكتب المتطلبات باللغه الانجليزيه'**
  String get writing_requirements_en_validation;

  /// No description provided for @not_found_data.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات'**
  String get not_found_data;

  /// No description provided for @deactivate_employment_official.
  ///
  /// In ar, this message translates to:
  /// **'تعطيل مسئول التوظيف'**
  String get deactivate_employment_official;

  /// No description provided for @scan.
  ///
  /// In ar, this message translates to:
  /// **'فحص'**
  String get scan;

  /// No description provided for @qr_code_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الQR Code'**
  String get qr_code_fingerprint;

  /// No description provided for @record_attendance_scan_description_face_print.
  ///
  /// In ar, this message translates to:
  /// **'اول خطوه للتسجيل وهي ان يتم فحص الوجه عن طريق كاميرا الجوال'**
  String get record_attendance_scan_description_face_print;

  /// No description provided for @record_attendance_scan_description_qr_code_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'ثاني خطوه للتسجيل وهي ان يتم فحص الQr Code الخاص بالفرصه'**
  String get record_attendance_scan_description_qr_code_fingerprint;

  /// No description provided for @location_accuracy.
  ///
  /// In ar, this message translates to:
  /// **'دقة الموقع'**
  String get location_accuracy;

  /// No description provided for @metre.
  ///
  /// In ar, this message translates to:
  /// **'متر'**
  String get metre;

  /// No description provided for @face_print.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الوجه'**
  String get face_print;

  /// No description provided for @add_face_print.
  ///
  /// In ar, this message translates to:
  /// **'اضافة بصمة الوجه'**
  String get add_face_print;

  /// No description provided for @scan_fac_identify_you.
  ///
  /// In ar, this message translates to:
  /// **'قم بفحص الوجه لتعريف هويتك'**
  String get scan_fac_identify_you;

  /// No description provided for @scan_fac_note.
  ///
  /// In ar, this message translates to:
  /// **'اضافة بصمة الوجه اختياريه للاناث ويمكن تخطيها'**
  String get scan_fac_note;

  /// No description provided for @update_scan_face_note.
  ///
  /// In ar, this message translates to:
  /// **'اذا اردت تعديل بصمة الوجه عليك مراجعه الاداره اولا '**
  String get update_scan_face_note;

  /// No description provided for @update_button.
  ///
  /// In ar, this message translates to:
  /// **'تحديث'**
  String get update_button;

  /// No description provided for @working_document.
  ///
  /// In ar, this message translates to:
  /// **'وثيقة العمل'**
  String get working_document;

  /// No description provided for @advantages_freelancer_document.
  ///
  /// In ar, this message translates to:
  /// **'مميزات وثيقه العمل الحر'**
  String get advantages_freelancer_document;

  /// No description provided for @there_many_ways_pay.
  ///
  /// In ar, this message translates to:
  /// **'هناك طرق عديده للدفع'**
  String get there_many_ways_pay;

  /// No description provided for @there_many_ways_pay_desc.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك اختيار الطرق المناسبه لك'**
  String get there_many_ways_pay_desc;

  /// No description provided for @payment_by_tamara.
  ///
  /// In ar, this message translates to:
  /// **'الدفع عن طريق تمارا'**
  String get payment_by_tamara;

  /// No description provided for @payment_by_credit_card.
  ///
  /// In ar, this message translates to:
  /// **'عن طريق ال Credit'**
  String get payment_by_credit_card;

  /// No description provided for @payment_by_opportunity_value.
  ///
  /// In ar, this message translates to:
  /// **'اخذ نسبه من قيمة الفرصه'**
  String get payment_by_opportunity_value;

  /// No description provided for @click_here.
  ///
  /// In ar, this message translates to:
  /// **'اضغط هنا'**
  String get click_here;

  /// No description provided for @discount_certificate_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل شهادة الخصم'**
  String get discount_certificate_details;

  /// No description provided for @installment_package.
  ///
  /// In ar, this message translates to:
  /// **'باقة التقسيط'**
  String get installment_package;

  /// No description provided for @select_installment_package.
  ///
  /// In ar, this message translates to:
  /// **'اختر باقة التقسيط'**
  String get select_installment_package;

  /// No description provided for @certificate_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة الشهادة'**
  String get certificate_value;

  /// No description provided for @installment_with_cashift_note.
  ///
  /// In ar, this message translates to:
  /// **'في حالة عدم  تكملة الاقساط لا يحق لك المطالبه بالاقساط المدفوعه'**
  String get installment_with_cashift_note;

  /// No description provided for @smil.
  ///
  /// In ar, this message translates to:
  /// **'إبتسم'**
  String get smil;

  /// No description provided for @face_not_matched.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الوجه غير متطابقة'**
  String get face_not_matched;

  /// No description provided for @seen.
  ///
  /// In ar, this message translates to:
  /// **'تم الاطلاع'**
  String get seen;

  /// No description provided for @terms_and_conditions_message.
  ///
  /// In ar, this message translates to:
  /// **'اوافق علي جميع الشروط والأحكام'**
  String get terms_and_conditions_message;

  /// No description provided for @installment_postponement_desc.
  ///
  /// In ar, this message translates to:
  /// **'في حال التأكيد علي عدم الموافقه في اصدار الوثيقه سوف يتم تجميد الحساب'**
  String get installment_postponement_desc;

  /// No description provided for @what_is_reason.
  ///
  /// In ar, this message translates to:
  /// **'ماهو السبب؟'**
  String get what_is_reason;

  /// No description provided for @type_reason.
  ///
  /// In ar, this message translates to:
  /// **'اكتب السبب...'**
  String get type_reason;

  /// No description provided for @number_req.
  ///
  /// In ar, this message translates to:
  /// **'العدد المطلوب :'**
  String get number_req;

  /// No description provided for @deposit.
  ///
  /// In ar, this message translates to:
  /// **'الايداع'**
  String get deposit;

  /// No description provided for @salary_hanging.
  ///
  /// In ar, this message translates to:
  /// **'المبالغ المعلقه '**
  String get salary_hanging;

  /// No description provided for @payments.
  ///
  /// In ar, this message translates to:
  /// **'المدفوعات'**
  String get payments;

  /// No description provided for @filter.
  ///
  /// In ar, this message translates to:
  /// **'فلتره'**
  String get filter;

  /// No description provided for @success_processing.
  ///
  /// In ar, this message translates to:
  /// **'العمليات الناجحه :'**
  String get success_processing;

  /// No description provided for @value_success_processing.
  ///
  /// In ar, this message translates to:
  /// **'قيمة العمليات الناجحه :'**
  String get value_success_processing;

  /// No description provided for @failed_processing.
  ///
  /// In ar, this message translates to:
  /// **'عدد الغير مكتمل :'**
  String get failed_processing;

  /// No description provided for @value_failed_processing.
  ///
  /// In ar, this message translates to:
  /// **'قيمة عدد الغير مكتمل :'**
  String get value_failed_processing;

  /// No description provided for @value_total.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي القيمة المستردة'**
  String get value_total;

  /// No description provided for @current.
  ///
  /// In ar, this message translates to:
  /// **'الاحدث'**
  String get current;

  /// No description provided for @from_week.
  ///
  /// In ar, this message translates to:
  /// **'منذ اسبوع'**
  String get from_week;

  /// No description provided for @from_tow_week.
  ///
  /// In ar, this message translates to:
  /// **'منذ اسبوعين'**
  String get from_tow_week;

  /// No description provided for @from_month_week.
  ///
  /// In ar, this message translates to:
  /// **'منذ شهر'**
  String get from_month_week;

  /// No description provided for @name_mole.
  ///
  /// In ar, this message translates to:
  /// **'اسم المول :'**
  String get name_mole;

  /// No description provided for @opportunity_time.
  ///
  /// In ar, this message translates to:
  /// **'موعد الفرصة :'**
  String get opportunity_time;

  /// No description provided for @attendance_confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد  الحضور'**
  String get attendance_confirm;

  /// No description provided for @why_not_attended.
  ///
  /// In ar, this message translates to:
  /// **'لماذا لا يمكنك الحضور ؟'**
  String get why_not_attended;

  /// No description provided for @confirm_today.
  ///
  /// In ar, this message translates to:
  /// **'برجاء تأكيد حضورك اليوم'**
  String get confirm_today;

  /// No description provided for @write_reason_apology.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب اعتذارك'**
  String get write_reason_apology;

  /// No description provided for @apology.
  ///
  /// In ar, this message translates to:
  /// **'اعتذار'**
  String get apology;

  /// No description provided for @i_accept.
  ///
  /// In ar, this message translates to:
  /// **'أوافق على'**
  String get i_accept;

  /// No description provided for @confirm_attendance.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الحضور'**
  String get confirm_attendance;

  /// No description provided for @search_places.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن الاماكن'**
  String get search_places;

  /// No description provided for @classification.
  ///
  /// In ar, this message translates to:
  /// **'التصنيفات'**
  String get classification;

  /// No description provided for @add_classification.
  ///
  /// In ar, this message translates to:
  /// **'اضافة تصنيف جديد '**
  String get add_classification;

  /// No description provided for @edit_classification.
  ///
  /// In ar, this message translates to:
  /// **'تعديل تصنيف  '**
  String get edit_classification;

  /// No description provided for @back_to_home_page.
  ///
  /// In ar, this message translates to:
  /// **'العودة للصفحة الرئيسية'**
  String get back_to_home_page;

  /// No description provided for @date_dispose.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الايداع'**
  String get date_dispose;

  /// No description provided for @add_new_job_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'اضافة فرصه عمل جديده'**
  String get add_new_job_opportunity;

  /// No description provided for @all_employees.
  ///
  /// In ar, this message translates to:
  /// **'جميع الموظفين'**
  String get all_employees;

  /// No description provided for @ways_accept_job.
  ///
  /// In ar, this message translates to:
  /// **'طرق قبول الوظيفه'**
  String get ways_accept_job;

  /// No description provided for @total_statistic.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي الاحصائيات '**
  String get total_statistic;

  /// No description provided for @method_arrival_departure.
  ///
  /// In ar, this message translates to:
  /// **'طريقة الحضور والانصراف'**
  String get method_arrival_departure;

  /// No description provided for @select_opportunity_date.
  ///
  /// In ar, this message translates to:
  /// **'حدد تاريخ الفرصه'**
  String get select_opportunity_date;

  /// No description provided for @type_opportunity_value.
  ///
  /// In ar, this message translates to:
  /// **'اكتب قيمة الفرصه'**
  String get type_opportunity_value;

  /// No description provided for @type_opportunities_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب العدد المطلوب'**
  String get type_opportunities_number;

  /// No description provided for @method_selecting_employees.
  ///
  /// In ar, this message translates to:
  /// **'طريقة اختيار المتقدمين'**
  String get method_selecting_employees;

  /// No description provided for @type_back_up_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب عدد القبول الاحتياطى'**
  String get type_back_up_number;

  /// No description provided for @method_accept_employees.
  ///
  /// In ar, this message translates to:
  /// **'طريقه قبول المتقدمين'**
  String get method_accept_employees;

  /// No description provided for @please_select_employees.
  ///
  /// In ar, this message translates to:
  /// **'برجاء اختيار المتقدمين'**
  String get please_select_employees;

  /// No description provided for @terms_conditions_job.
  ///
  /// In ar, this message translates to:
  /// **'شروط و احكام الوظيفة'**
  String get terms_conditions_job;

  /// No description provided for @send_personal_interview_request.
  ///
  /// In ar, this message translates to:
  /// **'إرسال طلب مقابلة شخصية'**
  String get send_personal_interview_request;

  /// No description provided for @area_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المنطقة'**
  String get area_name;

  /// No description provided for @scan_qr_code_project_confirm_shift.
  ///
  /// In ar, this message translates to:
  /// **'قم بفحص ال QR code الخاص بالمشروع لكي تم تاكيد دوامك'**
  String get scan_qr_code_project_confirm_shift;

  /// No description provided for @check_qr_code_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'قم بفحص ال Qr Code الخاص بالفرصه'**
  String get check_qr_code_opportunity;

  /// No description provided for @background_service_permission_message.
  ///
  /// In ar, this message translates to:
  /// **'*يحتاج تطبيق \"كاشفت \" السماح بإستخدام خدمة الموقع الجغرافي في الخلفية ليمكن من الإستفادة بخدمة تسجيل الحضور والإنصراف التلقائي.'**
  String get background_service_permission_message;

  /// No description provided for @location_service_permission_message.
  ///
  /// In ar, this message translates to:
  /// **'*يحتاج تطبيق كاشفت السماح بإستخدام خدمة الموقع الجغرافي ليمكن للتطبيق إرسال موقع العمل الخاص بالوظيفة الخاص بك للتحقق من وجودك في موقع العمل الصحيح.'**
  String get location_service_permission_message;

  /// No description provided for @face_recognition_service_permission_message.
  ///
  /// In ar, this message translates to:
  /// **'يحتاج التطبيق السماح بإستخدام الكاميرا وملفات الذاكرة , من فضلك اضف الاذونات من خلال الاعدادت'**
  String get face_recognition_service_permission_message;

  /// No description provided for @reject_service_permission_message.
  ///
  /// In ar, this message translates to:
  /// **'*وفي حالة عدم الموافقة على تمكين البرنامج بالعمل لاثبات وقت الحضور والإنصراف بشكل صحيح تعتبر حالتك غياب.'**
  String get reject_service_permission_message;

  /// No description provided for @search_contract_clause.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن شرط العقد'**
  String get search_contract_clause;

  /// No description provided for @number_required_for_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'العدد المطلوب للفرصة'**
  String get number_required_for_opportunity;

  /// No description provided for @type_number_required_for_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'اكتب العدد المطلوب للفرصة'**
  String get type_number_required_for_opportunity;

  /// No description provided for @terms_conditions_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'شروط واحكام الفرص'**
  String get terms_conditions_opportunities;

  /// No description provided for @add_terms_conditions_opportunities.
  ///
  /// In ar, this message translates to:
  /// **'اضافة شروط واحكام الفرص'**
  String get add_terms_conditions_opportunities;

  /// No description provided for @writing_terms_conditions_ar.
  ///
  /// In ar, this message translates to:
  /// **'كتابة الشروط والاحكام باللغة العربية'**
  String get writing_terms_conditions_ar;

  /// No description provided for @write_terms_conditions_ar.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الشروط والاحكام باللغة العربية'**
  String get write_terms_conditions_ar;

  /// No description provided for @writing_terms_conditions_en.
  ///
  /// In ar, this message translates to:
  /// **'كتابة الشروط والاحكام باللغة الانجليزية'**
  String get writing_terms_conditions_en;

  /// No description provided for @write_terms_conditions_en.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الشروط والاحكام باللغة الانجليزية'**
  String get write_terms_conditions_en;

  /// No description provided for @add_new.
  ///
  /// In ar, this message translates to:
  /// **'اضافة جديد'**
  String get add_new;

  /// No description provided for @manager_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المسئول'**
  String get manager_name;

  /// No description provided for @total_deductions.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي الاستقطاعات'**
  String get total_deductions;

  /// No description provided for @deductions.
  ///
  /// In ar, this message translates to:
  /// **' الاستقطاعات'**
  String get deductions;

  /// No description provided for @no_deductions.
  ///
  /// In ar, this message translates to:
  /// **' لا يوجد اي مستقطعات'**
  String get no_deductions;

  /// No description provided for @total_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي قيمة الفرصة'**
  String get total_opportunity;

  /// No description provided for @net.
  ///
  /// In ar, this message translates to:
  /// **'الصافي'**
  String get net;

  /// No description provided for @type_manager_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المسئول'**
  String get type_manager_name;

  /// No description provided for @loan.
  ///
  /// In ar, this message translates to:
  /// **'سلفة :'**
  String get loan;

  /// No description provided for @infringement.
  ///
  /// In ar, this message translates to:
  /// **'مخالفه :'**
  String get infringement;

  /// No description provided for @status_infringement.
  ///
  /// In ar, this message translates to:
  /// **'حالة المخالفه'**
  String get status_infringement;

  /// No description provided for @start_date_blocking.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ بدأ الحجب :'**
  String get start_date_blocking;

  /// No description provided for @end_date_blocking.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ انهاء الحجب :'**
  String get end_date_blocking;

  /// No description provided for @deducting_certificate.
  ///
  /// In ar, this message translates to:
  /// **'خصم شهاده خلو سوابق :'**
  String get deducting_certificate;

  /// No description provided for @reset_mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'اعادة ضبط رقم الجوال'**
  String get reset_mobile_number;

  /// No description provided for @reset_face_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'اعادة تعيين بصمة الوجه'**
  String get reset_face_fingerprint;

  /// No description provided for @company_wide_ban.
  ///
  /// In ar, this message translates to:
  /// **'حظر علي مستوي الشركه'**
  String get company_wide_ban;

  /// No description provided for @ban_employee_desc.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متاكد من حظر الموظف علي مستوي الشركه؟'**
  String get ban_employee_desc;

  /// No description provided for @type_reason_ban.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب الحظر'**
  String get type_reason_ban;

  /// No description provided for @must_choose_where_send_verification_code.
  ///
  /// In ar, this message translates to:
  /// **'يجب اختيار اين تريد ارسال كود التحقق'**
  String get must_choose_where_send_verification_code;

  /// No description provided for @proof_file_must_uploaded.
  ///
  /// In ar, this message translates to:
  /// **'يجب رفع ملف الإثبات'**
  String get proof_file_must_uploaded;

  /// No description provided for @verification_code_sent_desc.
  ///
  /// In ar, this message translates to:
  /// **'سوف يتم ارسال كود التحقق الي رقم الجوال القديم , عليك مراجعته الان'**
  String get verification_code_sent_desc;

  /// No description provided for @i_accept_to.
  ///
  /// In ar, this message translates to:
  /// **'اوافق علي'**
  String get i_accept_to;

  /// No description provided for @successfully_downloaded.
  ///
  /// In ar, this message translates to:
  /// **'تم التحميل بنجاح'**
  String get successfully_downloaded;

  /// No description provided for @type_discount_value.
  ///
  /// In ar, this message translates to:
  /// **'اكتب قيمة الخصم'**
  String get type_discount_value;

  /// No description provided for @cashifter_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الكاشفتر'**
  String get cashifter_name;

  /// No description provided for @select_cashifter.
  ///
  /// In ar, this message translates to:
  /// **'اختر الكاشفتر'**
  String get select_cashifter;

  /// No description provided for @discount_percentage.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم'**
  String get discount_percentage;

  /// No description provided for @select_discount_percentage.
  ///
  /// In ar, this message translates to:
  /// **'اختر نسبة الخصم'**
  String get select_discount_percentage;

  /// No description provided for @select_loan_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع السلفة'**
  String get select_loan_type;

  /// No description provided for @loan_value.
  ///
  /// In ar, this message translates to:
  /// **'قيمة السلفة'**
  String get loan_value;

  /// No description provided for @type_loan_value.
  ///
  /// In ar, this message translates to:
  /// **'اكتب قيمة السلفة'**
  String get type_loan_value;

  /// No description provided for @search_by_phone.
  ///
  /// In ar, this message translates to:
  /// **'ابحث برقم جوال كاشفتر'**
  String get search_by_phone;

  /// No description provided for @loans.
  ///
  /// In ar, this message translates to:
  /// **'السُلف'**
  String get loans;

  /// No description provided for @type_loans.
  ///
  /// In ar, this message translates to:
  /// **'نوع السلفه '**
  String get type_loans;

  /// No description provided for @value_collect.
  ///
  /// In ar, this message translates to:
  /// **'نسبة التحصيل'**
  String get value_collect;

  /// No description provided for @value_loans.
  ///
  /// In ar, this message translates to:
  /// **'قيمة السلفة'**
  String get value_loans;

  /// No description provided for @value_discount.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم'**
  String get value_discount;

  /// No description provided for @value_opportunity.
  ///
  /// In ar, this message translates to:
  /// **'قيمه الفرصه'**
  String get value_opportunity;

  /// No description provided for @total_loans.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي السُلف'**
  String get total_loans;

  /// No description provided for @active_loans.
  ///
  /// In ar, this message translates to:
  /// **'سُلف نشطة'**
  String get active_loans;

  /// No description provided for @total_collection.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي التحصيل'**
  String get total_collection;

  /// No description provided for @loans_collection.
  ///
  /// In ar, this message translates to:
  /// **'تحصيل السلف '**
  String get loans_collection;

  /// No description provided for @data_collection.
  ///
  /// In ar, this message translates to:
  /// **'بيانات التحصيل'**
  String get data_collection;

  /// No description provided for @total_value_loan.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي قيمة السلفه '**
  String get total_value_loan;

  /// No description provided for @total_residual.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي المتبقي  '**
  String get total_residual;

  /// No description provided for @add_loans.
  ///
  /// In ar, this message translates to:
  /// **'إضافه سلفه جديده '**
  String get add_loans;

  /// No description provided for @chashifter_collect_loan.
  ///
  /// In ar, this message translates to:
  /// **'تحصيل سُلف الكاشفتر '**
  String get chashifter_collect_loan;

  /// No description provided for @value_collection.
  ///
  /// In ar, this message translates to:
  /// **'القيمة المحصله '**
  String get value_collection;

  /// No description provided for @collect.
  ///
  /// In ar, this message translates to:
  /// **'التحصيل  '**
  String get collect;

  /// No description provided for @chashifter_details_loan.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل سُلف الكاشفتر '**
  String get chashifter_details_loan;

  /// No description provided for @residual.
  ///
  /// In ar, this message translates to:
  /// **'المتبقي '**
  String get residual;

  /// No description provided for @collection_done.
  ///
  /// In ar, this message translates to:
  /// **'تم التحصيل'**
  String get collection_done;

  /// No description provided for @whats_reason_apologizing.
  ///
  /// In ar, this message translates to:
  /// **'ماهو سبب الاعتذار؟'**
  String get whats_reason_apologizing;

  /// No description provided for @type_reason_apologizing.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب الاعتذار'**
  String get type_reason_apologizing;

  /// No description provided for @opportunity_classification.
  ///
  /// In ar, this message translates to:
  /// **'تصنيف الفرصة'**
  String get opportunity_classification;

  /// No description provided for @opportunity_condition.
  ///
  /// In ar, this message translates to:
  /// **'شروط الوظيفه'**
  String get opportunity_condition;

  /// No description provided for @show_details_data.
  ///
  /// In ar, this message translates to:
  /// **'رؤية التفاصيل  '**
  String get show_details_data;

  /// No description provided for @applied.
  ///
  /// In ar, this message translates to:
  /// **' متقدم'**
  String get applied;

  /// No description provided for @paid_off.
  ///
  /// In ar, this message translates to:
  /// **' تم الصرف'**
  String get paid_off;

  /// No description provided for @canceled_withdrawn.
  ///
  /// In ar, this message translates to:
  /// **'ملغي او معتذر'**
  String get canceled_withdrawn;

  /// No description provided for @applied_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل المتقدم'**
  String get applied_details;

  /// No description provided for @applied_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المتقدم '**
  String get applied_name;

  /// No description provided for @change_hours.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الدوام '**
  String get change_hours;

  /// No description provided for @date_create.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الانشاء '**
  String get date_create;

  /// No description provided for @no_internet.
  ///
  /// In ar, this message translates to:
  /// **'عفوا لا يوجد اتصال بشبكة الانترنت !'**
  String get no_internet;

  /// No description provided for @no_internet_description.
  ///
  /// In ar, this message translates to:
  /// **'نظراً لعدم اتصال جهازك بالانترنت يمكنك تسجيل الحضور عن طريق :'**
  String get no_internet_description;

  /// No description provided for @chashift_attendance.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حضور وانصراف كاشفت'**
  String get chashift_attendance;

  /// No description provided for @chashift_attendance_finger.
  ///
  /// In ar, this message translates to:
  /// **'قم بتسجيل حضورك من خلال بصمه'**
  String get chashift_attendance_finger;

  /// No description provided for @chashift_attendance_dta.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل حضور وانصراف DTA'**
  String get chashift_attendance_dta;

  /// No description provided for @reject_reason.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب رفض الدفع'**
  String get reject_reason;

  /// No description provided for @confairm_data.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من حفظ البيانات'**
  String get confairm_data;

  /// No description provided for @confairm_status_order.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بتحديد حالة الطلب !'**
  String get confairm_status_order;

  /// No description provided for @rating_confairm.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بالتقيم اولا  '**
  String get rating_confairm;

  /// No description provided for @ready_to_start.
  ///
  /// In ar, this message translates to:
  /// **'جاهز للبدء'**
  String get ready_to_start;

  /// No description provided for @wait_active.
  ///
  /// In ar, this message translates to:
  /// **'في انتظار التفعيل'**
  String get wait_active;

  /// No description provided for @not_active.
  ///
  /// In ar, this message translates to:
  /// **'تم الايقاف'**
  String get not_active;

  /// No description provided for @employees.
  ///
  /// In ar, this message translates to:
  /// **'الموظفين'**
  String get employees;

  /// No description provided for @rest_day.
  ///
  /// In ar, this message translates to:
  /// **'ايام الراحه'**
  String get rest_day;

  /// No description provided for @in_work.
  ///
  /// In ar, this message translates to:
  /// **'علي رأس العمل'**
  String get in_work;

  /// No description provided for @state_emp.
  ///
  /// In ar, this message translates to:
  /// **'حالة الموظف'**
  String get state_emp;

  /// No description provided for @duration_monthly.
  ///
  /// In ar, this message translates to:
  /// **'مدة الحساب شهريا'**
  String get duration_monthly;

  /// No description provided for @edit_employee.
  ///
  /// In ar, this message translates to:
  /// **'تعديل موظف'**
  String get edit_employee;

  /// No description provided for @search_by_phone_employee.
  ///
  /// In ar, this message translates to:
  /// **'ابحث برقم جوال الكاشفترز'**
  String get search_by_phone_employee;

  /// No description provided for @cashifters.
  ///
  /// In ar, this message translates to:
  /// **'كاشفترز'**
  String get cashifters;

  /// No description provided for @add_cashifters.
  ///
  /// In ar, this message translates to:
  /// **'اضافة كاشفتر جديد'**
  String get add_cashifters;

  /// No description provided for @edit_cashifters.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كاشفتر '**
  String get edit_cashifters;

  /// No description provided for @dont_have_work_time.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد  وقت عمل'**
  String get dont_have_work_time;

  /// No description provided for @calculation_method.
  ///
  /// In ar, this message translates to:
  /// **'طريقة الحساب '**
  String get calculation_method;

  /// No description provided for @select_method_selecting_employees.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة اختيار الموظفين'**
  String get select_method_selecting_employees;

  /// No description provided for @select_method_arrival_departure.
  ///
  /// In ar, this message translates to:
  /// **'اختر طريقة الحضور والانصراف'**
  String get select_method_arrival_departure;

  /// No description provided for @view_work_hazards.
  ///
  /// In ar, this message translates to:
  /// **'عرض مخاطر العمل'**
  String get view_work_hazards;

  /// No description provided for @add_hazards.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مخاطر'**
  String get add_hazards;

  /// No description provided for @work_hazards.
  ///
  /// In ar, this message translates to:
  /// **'مخاطر العمل'**
  String get work_hazards;

  /// No description provided for @degree_importance.
  ///
  /// In ar, this message translates to:
  /// **'درجة الاهمية'**
  String get degree_importance;

  /// No description provided for @select_degree_importance.
  ///
  /// In ar, this message translates to:
  /// **'اختر درجة الاهمية'**
  String get select_degree_importance;

  /// No description provided for @submission_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ التقديم'**
  String get submission_date;

  /// No description provided for @view_details.
  ///
  /// In ar, this message translates to:
  /// **'عرض التفاصيل'**
  String get view_details;

  /// No description provided for @upload_pdf_image.
  ///
  /// In ar, this message translates to:
  /// **'رفع صورة او ملف PDF'**
  String get upload_pdf_image;

  /// No description provided for @add_complaint_files_desc.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك اضافة اكثر من صورة توضح الشكوي'**
  String get add_complaint_files_desc;

  /// No description provided for @search_here.
  ///
  /// In ar, this message translates to:
  /// **'ابحث هنا...'**
  String get search_here;

  /// No description provided for @select_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر النوع'**
  String get select_type;

  /// No description provided for @work_hazard_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل مخاطر العمل'**
  String get work_hazard_details;

  /// No description provided for @attached_attachments.
  ///
  /// In ar, this message translates to:
  /// **'المرفقات الملحقة'**
  String get attached_attachments;

  /// No description provided for @responsible_response.
  ///
  /// In ar, this message translates to:
  /// **'رد المسئول'**
  String get responsible_response;

  /// No description provided for @show_focus_points_in_map.
  ///
  /// In ar, this message translates to:
  /// **'اظهار نقاط التمركز علي الخريطة'**
  String get show_focus_points_in_map;

  /// No description provided for @shift_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الدوام'**
  String get shift_name;

  /// No description provided for @blink_your_eyes.
  ///
  /// In ar, this message translates to:
  /// **'ارمش عينيك'**
  String get blink_your_eyes;

  /// No description provided for @turn_left.
  ///
  /// In ar, this message translates to:
  /// **'تحرك يسارا'**
  String get turn_left;

  /// No description provided for @turn_right.
  ///
  /// In ar, this message translates to:
  /// **'تحرك يمينا'**
  String get turn_right;

  /// No description provided for @tasks_and_duties.
  ///
  /// In ar, this message translates to:
  /// **'المهام والواجبات'**
  String get tasks_and_duties;

  /// No description provided for @add_vehicles.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مركبة'**
  String get add_vehicles;

  /// No description provided for @vehicles_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل المركبة'**
  String get vehicles_details;

  /// No description provided for @vehicles_info.
  ///
  /// In ar, this message translates to:
  /// **'معلومات المركبة الأساسية'**
  String get vehicles_info;

  /// No description provided for @tasks_and_responsibilities.
  ///
  /// In ar, this message translates to:
  /// **'المهام والمسؤوليات'**
  String get tasks_and_responsibilities;

  /// No description provided for @add_task_responsibility.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مهمة او مسؤولية'**
  String get add_task_responsibility;

  /// No description provided for @attendance_and_departure_notifications.
  ///
  /// In ar, this message translates to:
  /// **'اشعارات الحضور والانصراف'**
  String get attendance_and_departure_notifications;

  /// No description provided for @attendance_and_departure_notifications_reports.
  ///
  /// In ar, this message translates to:
  /// **'تقارير الحضور والانصراف'**
  String get attendance_and_departure_notifications_reports;

  /// No description provided for @type_request.
  ///
  /// In ar, this message translates to:
  /// **'نوع الطلب'**
  String get type_request;

  /// No description provided for @leave_period.
  ///
  /// In ar, this message translates to:
  /// **'فتره الاستئذان'**
  String get leave_period;

  /// No description provided for @status_request.
  ///
  /// In ar, this message translates to:
  /// **'حالة الطلب '**
  String get status_request;

  /// No description provided for @add_request.
  ///
  /// In ar, this message translates to:
  /// **'اضافة طلب'**
  String get add_request;

  /// No description provided for @edit_task_responsibility.
  ///
  /// In ar, this message translates to:
  /// **'تعديل مهمة او مسؤولية'**
  String get edit_task_responsibility;

  /// No description provided for @add_vehicle.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مركبة'**
  String get add_vehicle;

  /// No description provided for @edit_vehicle.
  ///
  /// In ar, this message translates to:
  /// **'تعديل المركبة'**
  String get edit_vehicle;

  /// No description provided for @vehicles.
  ///
  /// In ar, this message translates to:
  /// **'المركبات'**
  String get vehicles;

  /// No description provided for @model.
  ///
  /// In ar, this message translates to:
  /// **'الموديل '**
  String get model;

  /// No description provided for @color.
  ///
  /// In ar, this message translates to:
  /// **' لون '**
  String get color;

  /// No description provided for @year_crate.
  ///
  /// In ar, this message translates to:
  /// **'سنة الصنع '**
  String get year_crate;

  /// No description provided for @edit_data_vehicles.
  ///
  /// In ar, this message translates to:
  /// **'تعديل بيانات المركبة'**
  String get edit_data_vehicles;

  /// No description provided for @data_vehicles.
  ///
  /// In ar, this message translates to:
  /// **' بيانات المركبة'**
  String get data_vehicles;

  /// No description provided for @vehicle_components.
  ///
  /// In ar, this message translates to:
  /// **'مكونات المركبة'**
  String get vehicle_components;

  /// No description provided for @vehicle_note.
  ///
  /// In ar, this message translates to:
  /// **'اضغط علي  ( لا ) عندما لا يوجد اي ملاحظات علي المركبة أو ( نعم ) في حالة لم تكن تعمل أو يوجد بها ملاحظات مع التوضيح .'**
  String get vehicle_note;

  /// No description provided for @edit_covenant.
  ///
  /// In ar, this message translates to:
  /// **'تعديل العُهد'**
  String get edit_covenant;

  /// No description provided for @maintenance.
  ///
  /// In ar, this message translates to:
  /// **'صيانة'**
  String get maintenance;

  /// No description provided for @vehicle_insurance.
  ///
  /// In ar, this message translates to:
  /// **'تأمين المركبة'**
  String get vehicle_insurance;

  /// No description provided for @vehicle_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع المركبة'**
  String get vehicle_type;

  /// No description provided for @expair_date_license.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ انتهاء الرخصة'**
  String get expair_date_license;

  /// No description provided for @license_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الرخصة'**
  String get license_number;

  /// No description provided for @type_license_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب رقم الرخصة'**
  String get type_license_number;

  /// No description provided for @number_plate.
  ///
  /// In ar, this message translates to:
  /// **'رقم اللوحة'**
  String get number_plate;

  /// No description provided for @plate_license_info.
  ///
  /// In ar, this message translates to:
  /// **'معلومات اللوحة والرخصة'**
  String get plate_license_info;

  /// No description provided for @additional_specifications.
  ///
  /// In ar, this message translates to:
  /// **'المواصفات الإضافية'**
  String get additional_specifications;

  /// No description provided for @vehicle_specifications.
  ///
  /// In ar, this message translates to:
  /// **'مواصفات المركبة'**
  String get vehicle_specifications;

  /// No description provided for @vehicle_image.
  ///
  /// In ar, this message translates to:
  /// **'صور المركبة'**
  String get vehicle_image;

  /// No description provided for @covenant.
  ///
  /// In ar, this message translates to:
  /// **'العُهد'**
  String get covenant;

  /// No description provided for @damage.
  ///
  /// In ar, this message translates to:
  /// **'العطل'**
  String get damage;

  /// No description provided for @add_insurance.
  ///
  /// In ar, this message translates to:
  /// **'اضافة تأمين'**
  String get add_insurance;

  /// No description provided for @insurance.
  ///
  /// In ar, this message translates to:
  /// **'التأمين'**
  String get insurance;

  /// No description provided for @type_insurance.
  ///
  /// In ar, this message translates to:
  /// **'نوع التأمين '**
  String get type_insurance;

  /// No description provided for @select_type_insurance.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع التأمين '**
  String get select_type_insurance;

  /// No description provided for @number_insurance.
  ///
  /// In ar, this message translates to:
  /// **'رقم التأمين'**
  String get number_insurance;

  /// No description provided for @write_number_insurance.
  ///
  /// In ar, this message translates to:
  /// **'اكتب رقم التأمين'**
  String get write_number_insurance;

  /// No description provided for @company_name_insurance.
  ///
  /// In ar, this message translates to:
  /// **'اسم شركة التأمين'**
  String get company_name_insurance;

  /// No description provided for @write_company_name_insurance.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم شركة التأمين'**
  String get write_company_name_insurance;

  /// No description provided for @expire_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ انتهاء الصلاحيه'**
  String get expire_date;

  /// No description provided for @write_expire_date.
  ///
  /// In ar, this message translates to:
  /// **'اكتب تاريخ انتهاء الصلاحيه EXP.'**
  String get write_expire_date;

  /// No description provided for @write_damage.
  ///
  /// In ar, this message translates to:
  /// **'اكتب العطل الحادث'**
  String get write_damage;

  /// No description provided for @write_vehicle_specifications.
  ///
  /// In ar, this message translates to:
  /// **'اكتب مواصفات المركبة هنا ..'**
  String get write_vehicle_specifications;

  /// No description provided for @basic_vehicle_information.
  ///
  /// In ar, this message translates to:
  /// **'معلومات المركبة الأساسية'**
  String get basic_vehicle_information;

  /// No description provided for @license_and_plate_information.
  ///
  /// In ar, this message translates to:
  /// **'معلومات اللوحة والرخصة'**
  String get license_and_plate_information;

  /// No description provided for @model_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الموديل'**
  String get model_name;

  /// No description provided for @select_vehicle_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع المركبة'**
  String get select_vehicle_type;

  /// No description provided for @type_model_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الموديل'**
  String get type_model_name;

  /// No description provided for @year_manufacture.
  ///
  /// In ar, this message translates to:
  /// **'سنة الصنع'**
  String get year_manufacture;

  /// No description provided for @type_year_manufacture.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سنة الصنع'**
  String get type_year_manufacture;

  /// No description provided for @type_vehicle_specifications_here.
  ///
  /// In ar, this message translates to:
  /// **'اكتب مواصفات المركبة هنا ..'**
  String get type_vehicle_specifications_here;

  /// No description provided for @plate_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم اللوحة'**
  String get plate_number;

  /// No description provided for @type_plate_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب رقم اللوحة'**
  String get type_plate_number;

  /// No description provided for @vehicle_color.
  ///
  /// In ar, this message translates to:
  /// **'لون المركبة'**
  String get vehicle_color;

  /// No description provided for @select_vehicle_color.
  ///
  /// In ar, this message translates to:
  /// **'اختر لون المركبة'**
  String get select_vehicle_color;

  /// No description provided for @license_expiry_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ انتهاء الرخصة'**
  String get license_expiry_date;

  /// No description provided for @select_license_expiry_date.
  ///
  /// In ar, this message translates to:
  /// **'اختر تاريخ انتهاء الرخصة'**
  String get select_license_expiry_date;

  /// No description provided for @type_covenant_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم العهدة'**
  String get type_covenant_name;

  /// No description provided for @covenant_desc.
  ///
  /// In ar, this message translates to:
  /// **'وصف العهدة'**
  String get covenant_desc;

  /// No description provided for @type_covenant_desc.
  ///
  /// In ar, this message translates to:
  /// **'اكتب وصف العهدة'**
  String get type_covenant_desc;

  /// No description provided for @attachments.
  ///
  /// In ar, this message translates to:
  /// **'المرفقات'**
  String get attachments;

  /// No description provided for @please_upload_pdf_image.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم برفع صورة او ملف PDF'**
  String get please_upload_pdf_image;

  /// No description provided for @download_image.
  ///
  /// In ar, this message translates to:
  /// **'تحميل الصورة'**
  String get download_image;

  /// No description provided for @please_select_all_images.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم برفع جميع الصور'**
  String get please_select_all_images;

  /// No description provided for @body_mass.
  ///
  /// In ar, this message translates to:
  /// **'كتلة الجسم'**
  String get body_mass;

  /// No description provided for @write_body_mass.
  ///
  /// In ar, this message translates to:
  /// **'اكتب كتلة الجسم'**
  String get write_body_mass;

  /// No description provided for @covenants.
  ///
  /// In ar, this message translates to:
  /// **'العُهد'**
  String get covenants;

  /// No description provided for @power.
  ///
  /// In ar, this message translates to:
  /// **'قوة'**
  String get power;

  /// No description provided for @number_hour.
  ///
  /// In ar, this message translates to:
  /// **'عدد الساعات'**
  String get number_hour;

  /// No description provided for @starting_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة البدأ'**
  String get starting_fingerprint;

  /// No description provided for @ending_fingerprint.
  ///
  /// In ar, this message translates to:
  /// **'بصمة الانتهاء'**
  String get ending_fingerprint;

  /// No description provided for @total_attendance.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي الحضور'**
  String get total_attendance;

  /// No description provided for @period.
  ///
  /// In ar, this message translates to:
  /// **'الفترة'**
  String get period;

  /// No description provided for @no_employee.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد موظفين '**
  String get no_employee;

  /// No description provided for @no_employee_decr.
  ///
  /// In ar, this message translates to:
  /// **'قم بتحديد اسم المشروع اولاً ليظهرلك الموظفين '**
  String get no_employee_decr;

  /// No description provided for @total_contracting_power.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي القوة التعاقدية'**
  String get total_contracting_power;

  /// No description provided for @empty_tasks_and_duties.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد مهام و واجبات'**
  String get empty_tasks_and_duties;

  /// No description provided for @location_disclosure.
  ///
  /// In ar, this message translates to:
  /// **'يجمع هذا التطبيق بيانات الموقع لمساعدتك في العثور على الفرص القريبة والتحقق من موقعك عند بدء العمل، حتى عندما يكون التطبيق مغلقًا أو غير قيد الاستخدام.'**
  String get location_disclosure;

  /// No description provided for @allow_required_permissions.
  ///
  /// In ar, this message translates to:
  /// **'الأذونات المطلوبة من تطبيق كاشفت.'**
  String get allow_required_permissions;

  /// No description provided for @violation_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المخالفة'**
  String get violation_name;

  /// No description provided for @violation_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اسم المخالفة بالعربية'**
  String get violation_name_ar;

  /// No description provided for @violation_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اسم المخالفة بالانجليزي '**
  String get violation_name_en;

  /// No description provided for @type_violation_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المخالفة بالعربي'**
  String get type_violation_name_ar;

  /// No description provided for @type_violation_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المخالفة بالانجليزي'**
  String get type_violation_name_en;

  /// No description provided for @violations_types.
  ///
  /// In ar, this message translates to:
  /// **'انواع المخالفات'**
  String get violations_types;

  /// No description provided for @add_violation_type.
  ///
  /// In ar, this message translates to:
  /// **'اضافة نوع مخالفة'**
  String get add_violation_type;

  /// No description provided for @edit_violation_type.
  ///
  /// In ar, this message translates to:
  /// **'تعديل نوع مخالفة'**
  String get edit_violation_type;

  /// No description provided for @select_employee_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم الموظف'**
  String get select_employee_name;

  /// No description provided for @add_violation.
  ///
  /// In ar, this message translates to:
  /// **'اضافة مخالفة'**
  String get add_violation;

  /// No description provided for @edit_violation.
  ///
  /// In ar, this message translates to:
  /// **'تعديل مخالفة'**
  String get edit_violation;

  /// No description provided for @select_violation_name.
  ///
  /// In ar, this message translates to:
  /// **'اختر اسم المخالفة'**
  String get select_violation_name;

  /// No description provided for @edit_insurance.
  ///
  /// In ar, this message translates to:
  /// **'تعديل التأمين'**
  String get edit_insurance;

  /// No description provided for @type_area_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم المنطقة'**
  String get type_area_name;

  /// No description provided for @number_field_survey_hours.
  ///
  /// In ar, this message translates to:
  /// **'عدد ساعات المسح الميداني'**
  String get number_field_survey_hours;

  /// No description provided for @type_number_hours.
  ///
  /// In ar, this message translates to:
  /// **'اكتب عدد الساعات'**
  String get type_number_hours;

  /// No description provided for @number_minutes.
  ///
  /// In ar, this message translates to:
  /// **'عدد الدقائق'**
  String get number_minutes;

  /// No description provided for @type_number_minutes.
  ///
  /// In ar, this message translates to:
  /// **'اكتب عدد الدقائق'**
  String get type_number_minutes;

  /// No description provided for @select_vehicles.
  ///
  /// In ar, this message translates to:
  /// **'اختر المركبات'**
  String get select_vehicles;

  /// No description provided for @locate_area_map.
  ///
  /// In ar, this message translates to:
  /// **'قم بتحديد المنطقة علي الخريطة'**
  String get locate_area_map;

  /// No description provided for @add_data.
  ///
  /// In ar, this message translates to:
  /// **'اضافة البيانات'**
  String get add_data;

  /// No description provided for @mark_box_map.
  ///
  /// In ar, this message translates to:
  /// **'تحديد المنطقة علي الخريطة'**
  String get mark_box_map;

  /// No description provided for @select_map.
  ///
  /// In ar, this message translates to:
  /// **'تحديد المنطقة'**
  String get select_map;

  /// No description provided for @edit_select_map.
  ///
  /// In ar, this message translates to:
  /// **'تعديل تحديد المنطقة'**
  String get edit_select_map;

  /// No description provided for @search_by_area.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن المنطقه التي تريدها .'**
  String get search_by_area;

  /// No description provided for @you_have_to_take_some_points_into_consideration_check_box.
  ///
  /// In ar, this message translates to:
  /// **'عليك اخذ بعض النقط في عين الاعتبار لتقوم بتحديد المربع:'**
  String get you_have_to_take_some_points_into_consideration_check_box;

  /// No description provided for @areas.
  ///
  /// In ar, this message translates to:
  /// **'المناطق'**
  String get areas;

  /// No description provided for @add_area.
  ///
  /// In ar, this message translates to:
  /// **'اضافة منطقة'**
  String get add_area;

  /// No description provided for @edit_area.
  ///
  /// In ar, this message translates to:
  /// **'تعديل منطقة'**
  String get edit_area;

  /// No description provided for @view_areas.
  ///
  /// In ar, this message translates to:
  /// **'عرض المناطق'**
  String get view_areas;

  /// No description provided for @edit_map.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الخريطة'**
  String get edit_map;

  /// No description provided for @edit_data.
  ///
  /// In ar, this message translates to:
  /// **'تعديل البيانات'**
  String get edit_data;

  /// No description provided for @delete_area.
  ///
  /// In ar, this message translates to:
  /// **'حذف المنطقة'**
  String get delete_area;

  /// No description provided for @please_select_area.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختر المنطقة'**
  String get please_select_area;

  /// No description provided for @vehicle.
  ///
  /// In ar, this message translates to:
  /// **'المركبة'**
  String get vehicle;

  /// No description provided for @no.
  ///
  /// In ar, this message translates to:
  /// **'لا'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In ar, this message translates to:
  /// **'نعم'**
  String get yes;

  /// No description provided for @add_image.
  ///
  /// In ar, this message translates to:
  /// **'قم بتحميل صور توضح هذه الملاحظات'**
  String get add_image;

  /// No description provided for @receive_vehicle.
  ///
  /// In ar, this message translates to:
  /// **'استلام مركبة'**
  String get receive_vehicle;

  /// No description provided for @save_selection.
  ///
  /// In ar, this message translates to:
  /// **'حفظ التحديد'**
  String get save_selection;

  /// No description provided for @company_or_factory_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الشركة / المصنع'**
  String get company_or_factory_name;

  /// No description provided for @street_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الشارع'**
  String get street_name;

  /// No description provided for @type_street_name.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الشارع'**
  String get type_street_name;

  /// No description provided for @incomplete_receipt.
  ///
  /// In ar, this message translates to:
  /// **'غير مكتملة الاستلام'**
  String get incomplete_receipt;

  /// No description provided for @complete_receipt.
  ///
  /// In ar, this message translates to:
  /// **' مكتملة الاستلام'**
  String get complete_receipt;

  /// No description provided for @name_receipt.
  ///
  /// In ar, this message translates to:
  /// **'الموظف المُستلِم '**
  String get name_receipt;

  /// No description provided for @complete_receipt_information.
  ///
  /// In ar, this message translates to:
  /// **'تكملة بيانات الاستلام'**
  String get complete_receipt_information;

  /// No description provided for @add_violation_files_desc.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك اضافة اكثر من صورة توضح المخالفة'**
  String get add_violation_files_desc;

  /// No description provided for @camera.
  ///
  /// In ar, this message translates to:
  /// **'الكاميرا'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In ar, this message translates to:
  /// **'المعرض'**
  String get gallery;

  /// No description provided for @pdf.
  ///
  /// In ar, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// No description provided for @upload_image.
  ///
  /// In ar, this message translates to:
  /// **'رفع صورة'**
  String get upload_image;

  /// No description provided for @district.
  ///
  /// In ar, this message translates to:
  /// **'الحي'**
  String get district;

  /// No description provided for @clear.
  ///
  /// In ar, this message translates to:
  /// **'مسح'**
  String get clear;

  /// No description provided for @scan_code_car.
  ///
  /// In ar, this message translates to:
  /// **'قم بمسح QR CODE لعرض بيانات المركبة'**
  String get scan_code_car;

  /// No description provided for @period_from.
  ///
  /// In ar, this message translates to:
  /// **'الفترة من'**
  String get period_from;

  /// No description provided for @period_to.
  ///
  /// In ar, this message translates to:
  /// **'الفترة الى'**
  String get period_to;

  /// No description provided for @request_track_attendance_departure.
  ///
  /// In ar, this message translates to:
  /// **'طلب تتبع الحضور والانصراف'**
  String get request_track_attendance_departure;

  /// No description provided for @view_tracking_requests.
  ///
  /// In ar, this message translates to:
  /// **'عرض طلبات التتبع'**
  String get view_tracking_requests;

  /// No description provided for @add_tracking_request.
  ///
  /// In ar, this message translates to:
  /// **'اضافة طلب تتبع'**
  String get add_tracking_request;

  /// No description provided for @tracking_period.
  ///
  /// In ar, this message translates to:
  /// **'فترة التتبُع'**
  String get tracking_period;

  /// No description provided for @show_cashifter_images.
  ///
  /// In ar, this message translates to:
  /// **'إظهار صور الكاشيفتر'**
  String get show_cashifter_images;

  /// No description provided for @total_male.
  ///
  /// In ar, this message translates to:
  /// **'اجمالي الذكور '**
  String get total_male;

  /// No description provided for @total_female.
  ///
  /// In ar, this message translates to:
  /// **' اجمالي الاناث'**
  String get total_female;

  /// No description provided for @all_city.
  ///
  /// In ar, this message translates to:
  /// **'جميع  المدن'**
  String get all_city;

  /// No description provided for @all_job.
  ///
  /// In ar, this message translates to:
  /// **'جميع الوظائف'**
  String get all_job;

  /// No description provided for @add_address.
  ///
  /// In ar, this message translates to:
  /// **'اضافة عنوان '**
  String get add_address;

  /// No description provided for @fingerprint_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع البصمة'**
  String get fingerprint_type;

  /// No description provided for @cashifter_attendance_tracking.
  ///
  /// In ar, this message translates to:
  /// **'متابعة حضور الكاشفتر'**
  String get cashifter_attendance_tracking;

  /// No description provided for @operating_plan.
  ///
  /// In ar, this message translates to:
  /// **'خطة التشغيل'**
  String get operating_plan;

  /// No description provided for @select_operating_plan.
  ///
  /// In ar, this message translates to:
  /// **'اختر خطة التشغيل'**
  String get select_operating_plan;

  /// No description provided for @tour_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع الجولة'**
  String get tour_type;

  /// No description provided for @select_tour_type.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع الجولة'**
  String get select_tour_type;

  /// No description provided for @start_tour_warning_msg.
  ///
  /// In ar, this message translates to:
  /// **'قبل بدأ الجولة يجب ان تحدد نوع جولة لكي يتم استلامك  للمركبة.'**
  String get start_tour_warning_msg;

  /// No description provided for @job_duties.
  ///
  /// In ar, this message translates to:
  /// **'مهام العمل'**
  String get job_duties;

  /// No description provided for @end_field_survey.
  ///
  /// In ar, this message translates to:
  /// **'انهاء المسح الميداني'**
  String get end_field_survey;

  /// No description provided for @end_tour.
  ///
  /// In ar, this message translates to:
  /// **'انهاء الجولة'**
  String get end_tour;

  /// No description provided for @tour_history.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الجولات'**
  String get tour_history;

  /// No description provided for @follow_tours.
  ///
  /// In ar, this message translates to:
  /// **'متابعة الجولات'**
  String get follow_tours;

  /// No description provided for @change_operating_plan.
  ///
  /// In ar, this message translates to:
  /// **'تغيير خطة التشغيل'**
  String get change_operating_plan;

  /// No description provided for @start_tour.
  ///
  /// In ar, this message translates to:
  /// **'بدأ الجولة'**
  String get start_tour;

  /// No description provided for @violations_num.
  ///
  /// In ar, this message translates to:
  /// **'عدد المخالفات'**
  String get violations_num;

  /// No description provided for @end_field_survey_warning_msg.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من انهاء المسح الميداني؟'**
  String get end_field_survey_warning_msg;

  /// No description provided for @search_for_areas.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن المناطق'**
  String get search_for_areas;

  /// No description provided for @cheek_face.
  ///
  /// In ar, this message translates to:
  /// **'جاري التحقيق من  بصمة  الوجه'**
  String get cheek_face;

  /// No description provided for @contractual_power_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم القوة التعاقدية'**
  String get contractual_power_number;

  /// No description provided for @type_contractual_power_number.
  ///
  /// In ar, this message translates to:
  /// **'اكتب القوة التعاقدية'**
  String get type_contractual_power_number;

  /// No description provided for @please_add_all.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اكمل الاخيارات'**
  String get please_add_all;

  /// No description provided for @please_save_yes.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بحفظ الاختيارات التي بنعم '**
  String get please_save_yes;

  /// No description provided for @list_empty.
  ///
  /// In ar, this message translates to:
  /// **'القائمة فارغة'**
  String get list_empty;

  /// No description provided for @discount_criminal_certificate.
  ///
  /// In ar, this message translates to:
  /// **'خصم شهادة خلو السوابق'**
  String get discount_criminal_certificate;

  /// No description provided for @fines_discount.
  ///
  /// In ar, this message translates to:
  /// **'خصم مخالفات'**
  String get fines_discount;

  /// No description provided for @value_due.
  ///
  /// In ar, this message translates to:
  /// **'القيمة المستحقة'**
  String get value_due;

  /// No description provided for @please_fill_all_fields.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك قم بملء جميع الحقول'**
  String get please_fill_all_fields;

  /// No description provided for @search_city_name.
  ///
  /// In ar, this message translates to:
  /// **'أبحث عن اسم المدينة'**
  String get search_city_name;

  /// No description provided for @job_uniform.
  ///
  /// In ar, this message translates to:
  /// **'الزي الوظيفي'**
  String get job_uniform;

  /// No description provided for @upload_picture.
  ///
  /// In ar, this message translates to:
  /// **'تحميل صوره'**
  String get upload_picture;

  /// No description provided for @add_some_notes.
  ///
  /// In ar, this message translates to:
  /// **'اضافه بعض الملاحظات'**
  String get add_some_notes;

  /// No description provided for @add_details_image.
  ///
  /// In ar, this message translates to:
  /// **'اضف تفاصيل للصوره'**
  String get add_details_image;

  /// No description provided for @select_job_choose_job_uniform.
  ///
  /// In ar, this message translates to:
  /// **'حدد الوظيفه لاختيار الزي الوظيفي'**
  String get select_job_choose_job_uniform;

  /// No description provided for @add_photo.
  ///
  /// In ar, this message translates to:
  /// **'اضف صورة'**
  String get add_photo;

  /// No description provided for @add_mobile_new.
  ///
  /// In ar, this message translates to:
  /// **'عليك ادخال رقم الجوال الجديد لنرسل لك رمز التحقق علي جوالك'**
  String get add_mobile_new;

  /// No description provided for @mobile_number_new.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال الجديد'**
  String get mobile_number_new;

  /// No description provided for @confirm_code.
  ///
  /// In ar, this message translates to:
  /// **'كود التحقيق'**
  String get confirm_code;

  /// No description provided for @ok_teams_ms.
  ///
  /// In ar, this message translates to:
  /// **'عليك اولا ان توافق علي هذه التعهدات وقرائتها جيداً بعد ذلك سنرسل طلبك الي المشرف.'**
  String get ok_teams_ms;

  /// No description provided for @will_send_request.
  ///
  /// In ar, this message translates to:
  /// **'سيتم تقديم طلبك بنجاح!'**
  String get will_send_request;

  /// No description provided for @confirm_yes.
  ///
  /// In ar, this message translates to:
  /// **'نعم أوافق علي هذه التعهدات'**
  String get confirm_yes;

  /// No description provided for @please_confirm_yes.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك وافق علي هذه التعهدات'**
  String get please_confirm_yes;

  /// No description provided for @completed.
  ///
  /// In ar, this message translates to:
  /// **'إكتمل'**
  String get completed;

  /// No description provided for @not_completed.
  ///
  /// In ar, this message translates to:
  /// **'لم يكتمل'**
  String get not_completed;

  /// No description provided for @pledge_attachment_reject.
  ///
  /// In ar, this message translates to:
  /// **' عند التأكيد سيتم انتقال هذا المرفق الي قائمة ( تم الرفض ).'**
  String get pledge_attachment_reject;

  /// No description provided for @pledge_sub_reject.
  ///
  /// In ar, this message translates to:
  /// **'اذا كنت متأكد من رفض المرفق عليك كتابة سبب الرفض  '**
  String get pledge_sub_reject;

  /// No description provided for @pledge_title_reject.
  ///
  /// In ar, this message translates to:
  /// **'لماذا تريد رفض هذا المرفق ؟'**
  String get pledge_title_reject;

  /// No description provided for @pledge_attachment_accept.
  ///
  /// In ar, this message translates to:
  /// **'اتعهد بأنني اطّلعت على اصل المرفق واقر  بانه سليم  , واتحمل المسئولية القانونية إذا ثبت عكس ذلك.'**
  String get pledge_attachment_accept;

  /// No description provided for @pledge_sub_accept.
  ///
  /// In ar, this message translates to:
  /// **'عليك تأكيد القبول والاقرار بانك اطلعت علي المرفق واستملت الاصل'**
  String get pledge_sub_accept;

  /// No description provided for @pledge_title_accept.
  ///
  /// In ar, this message translates to:
  /// **' هل انت متاكد من قبول هذا المرفق ؟'**
  String get pledge_title_accept;

  /// No description provided for @please_agree_pledge.
  ///
  /// In ar, this message translates to:
  /// **' من فضلك  وافق  علي التعهد'**
  String get please_agree_pledge;

  /// No description provided for @model_year.
  ///
  /// In ar, this message translates to:
  /// **'سنة الموديل'**
  String get model_year;

  /// No description provided for @vehicle_data.
  ///
  /// In ar, this message translates to:
  /// **'بيانات المركبة'**
  String get vehicle_data;

  /// No description provided for @images.
  ///
  /// In ar, this message translates to:
  /// **'الصور'**
  String get images;

  /// No description provided for @vehicle_receive_review.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة استلام المركبة'**
  String get vehicle_receive_review;

  /// No description provided for @reviewed.
  ///
  /// In ar, this message translates to:
  /// **'تمت المراجعة'**
  String get reviewed;

  /// No description provided for @take_action.
  ///
  /// In ar, this message translates to:
  /// **'اتخذ اجراء'**
  String get take_action;

  /// No description provided for @vehicle_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم المركبة'**
  String get vehicle_name;

  /// No description provided for @receiver_cashifter.
  ///
  /// In ar, this message translates to:
  /// **'الكاشفتر المُستلِم'**
  String get receiver_cashifter;

  /// No description provided for @vehicle_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم المركبة'**
  String get vehicle_number;

  /// No description provided for @receive_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الاستلام'**
  String get receive_date;

  /// No description provided for @receive_period.
  ///
  /// In ar, this message translates to:
  /// **'فترة الاستلام'**
  String get receive_period;

  /// No description provided for @warning_rejection_desc.
  ///
  /// In ar, this message translates to:
  /// **'سيتم تسجيل كل الملاحظات التي تم تدوينها وسيتم إرسالها إلى المسئول .'**
  String get warning_rejection_desc;

  /// No description provided for @warning_rejection.
  ///
  /// In ar, this message translates to:
  /// **'تحذير الرفض'**
  String get warning_rejection;

  /// No description provided for @are_you_sure_want_receive.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من الاستلام؟'**
  String get are_you_sure_want_receive;

  /// No description provided for @receive_confirm_desc.
  ///
  /// In ar, this message translates to:
  /// **'عند عدم استلامك ستحفظ جميع البيانات'**
  String get receive_confirm_desc;

  /// No description provided for @why_want_refuse_receive.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من الرفض؟'**
  String get why_want_refuse_receive;

  /// No description provided for @receive_reject_desc.
  ///
  /// In ar, this message translates to:
  /// **'اذا كنت متأكد من رفض السياره لمشكلة ما عليك كتابتها لنرسلها الي المسئول وحل هذة المشكلة .'**
  String get receive_reject_desc;

  /// No description provided for @receive_confirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الاستلام'**
  String get receive_confirm;

  /// No description provided for @receive_reject.
  ///
  /// In ar, this message translates to:
  /// **'رفض الاستلام'**
  String get receive_reject;

  /// No description provided for @action_taken.
  ///
  /// In ar, this message translates to:
  /// **'الاجراء المتخذ'**
  String get action_taken;

  /// No description provided for @the_problem_causer.
  ///
  /// In ar, this message translates to:
  /// **'المُتسبب بالمشكلة'**
  String get the_problem_causer;

  /// No description provided for @procedure.
  ///
  /// In ar, this message translates to:
  /// **'الإجراء'**
  String get procedure;

  /// No description provided for @action_taken_waring_msg.
  ///
  /// In ar, this message translates to:
  /// **'سيتم حفظ اجراءك وارساله الي مدير المشروع لمراجعته والرد عليه'**
  String get action_taken_waring_msg;

  /// No description provided for @final_action.
  ///
  /// In ar, this message translates to:
  /// **'إتخذ إجراء نهائي'**
  String get final_action;

  /// No description provided for @final_action_taken_waring_msg.
  ///
  /// In ar, this message translates to:
  /// **'سيتم حفظ اجراءك وارساله الي قائمة ( تمت المراجعة )'**
  String get final_action_taken_waring_msg;

  /// No description provided for @take_final_action.
  ///
  /// In ar, this message translates to:
  /// **'إتخاذ الإجراء النهائي'**
  String get take_final_action;

  /// No description provided for @write_action_you_will_take.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الاجراء الذي ستتخذه'**
  String get write_action_you_will_take;

  /// No description provided for @write_final_action_you_will_take.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الاجراء النهائي الذي ستتخذه'**
  String get write_final_action_you_will_take;

  /// No description provided for @mobile_number_change_requests.
  ///
  /// In ar, this message translates to:
  /// **'طلبات تغيير رقم الجوال'**
  String get mobile_number_change_requests;

  /// No description provided for @new_mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال الجديد'**
  String get new_mobile_number;

  /// No description provided for @show_cashifter_data.
  ///
  /// In ar, this message translates to:
  /// **'إظهار بيانات الكاشيفتر'**
  String get show_cashifter_data;

  /// No description provided for @user_request_reject_title.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من الرفض؟'**
  String get user_request_reject_title;

  /// No description provided for @user_request_reject_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'اذا كنت ترفض طلب الكاشفتر عليك كتابة السبب'**
  String get user_request_reject_subtitle;

  /// No description provided for @user_request_accept_title.
  ///
  /// In ar, this message translates to:
  /// **'هل انت متأكد من الموافقة؟'**
  String get user_request_accept_title;

  /// No description provided for @user_request_accept_subtitle_msg.
  ///
  /// In ar, this message translates to:
  /// **'اذا كنت توافق علي طلب الكاشفتر سينتقل الطلب الي قائمة الموافقة ويتحول الطلب الي الادارة'**
  String get user_request_accept_subtitle_msg;

  /// No description provided for @cashifters_requests.
  ///
  /// In ar, this message translates to:
  /// **'طلبات الكاشفترز'**
  String get cashifters_requests;

  /// No description provided for @it_will_sent_supervisor.
  ///
  /// In ar, this message translates to:
  /// **'سيتم ارساله للمشرف.'**
  String get it_will_sent_supervisor;

  /// No description provided for @search_for.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن'**
  String get search_for;

  /// No description provided for @add_file_mobile.
  ///
  /// In ar, this message translates to:
  /// **'للتأكد من ان هذا رقم جوالك الخاص عليك ارفاق ملف لاثبات صحة امتلاكك لهذا الرقم  :'**
  String get add_file_mobile;

  /// No description provided for @confirm_code_ms.
  ///
  /// In ar, this message translates to:
  /// **'سوف يتم ارسال كود التحقق الي رقم الجوال الجديد , عليك كتابته الآن '**
  String get confirm_code_ms;

  /// No description provided for @add_gas_stations.
  ///
  /// In ar, this message translates to:
  /// **'اضافة محطات الوقود '**
  String get add_gas_stations;

  /// No description provided for @name_en_gas_stations.
  ///
  /// In ar, this message translates to:
  /// **'اسم محطة الوقود بالانجليزية'**
  String get name_en_gas_stations;

  /// No description provided for @name_gas_stations.
  ///
  /// In ar, this message translates to:
  /// **'اسم محطة الوقود بالعربي '**
  String get name_gas_stations;

  /// No description provided for @location_gas_stations.
  ///
  /// In ar, this message translates to:
  /// **'موقع محطة الوقود علي الخريطة'**
  String get location_gas_stations;

  /// No description provided for @gas_stations.
  ///
  /// In ar, this message translates to:
  /// **' محطات الوقود '**
  String get gas_stations;

  /// No description provided for @start_but.
  ///
  /// In ar, this message translates to:
  /// **' ابدأ '**
  String get start_but;

  /// No description provided for @do_you_navigation_map.
  ///
  /// In ar, this message translates to:
  /// **' هل تريد  التوجه  الي تطبيق جوجل ماب '**
  String get do_you_navigation_map;

  /// No description provided for @end_but.
  ///
  /// In ar, this message translates to:
  /// **' انتهاء '**
  String get end_but;

  /// No description provided for @image_before_maintenance.
  ///
  /// In ar, this message translates to:
  /// **' صورة قبل الصيانة '**
  String get image_before_maintenance;

  /// No description provided for @image_after_maintenance.
  ///
  /// In ar, this message translates to:
  /// **' صورة بعد الصيانة '**
  String get image_after_maintenance;

  /// No description provided for @shod_image_before_maintenance.
  ///
  /// In ar, this message translates to:
  /// **' يرجي اختيار صورة قبل الصيانة '**
  String get shod_image_before_maintenance;

  /// No description provided for @shod_image_after_maintenance.
  ///
  /// In ar, this message translates to:
  /// **'يرجي اختيار صورة بعد الصيانة '**
  String get shod_image_after_maintenance;

  /// No description provided for @type_operation.
  ///
  /// In ar, this message translates to:
  /// **'نوع العملية'**
  String get type_operation;

  /// No description provided for @verification.
  ///
  /// In ar, this message translates to:
  /// **'تحقق'**
  String get verification;

  /// No description provided for @view_maintenance.
  ///
  /// In ar, this message translates to:
  /// **'عرض الصيانة والأعطال'**
  String get view_maintenance;

  /// No description provided for @breakdown_maintenance.
  ///
  /// In ar, this message translates to:
  /// **' الصيانة والأعطال'**
  String get breakdown_maintenance;

  /// No description provided for @waring_action_notification.
  ///
  /// In ar, this message translates to:
  /// **' سيتم حفظ اجراءك وارساله الي مدير المشروع لمراجعته والرد عليه '**
  String get waring_action_notification;

  /// No description provided for @waring_final_action_notification.
  ///
  /// In ar, this message translates to:
  /// **'سيتم ارساله للمشرف .'**
  String get waring_final_action_notification;

  /// No description provided for @add_maintenance.
  ///
  /// In ar, this message translates to:
  /// **'طلب صيانة'**
  String get add_maintenance;

  /// No description provided for @add_breakdown.
  ///
  /// In ar, this message translates to:
  /// **'اضافة عطل '**
  String get add_breakdown;

  /// No description provided for @driver_violations.
  ///
  /// In ar, this message translates to:
  /// **'مخالفات السائق'**
  String get driver_violations;

  /// No description provided for @speeding_during_violation.
  ///
  /// In ar, this message translates to:
  /// **'السرعة أثناء المخالفة'**
  String get speeding_during_violation;

  /// No description provided for @click_here_view_violation_location.
  ///
  /// In ar, this message translates to:
  /// **'اضغط هنا لرؤية موقع  المخالفة'**
  String get click_here_view_violation_location;

  /// No description provided for @violation_time.
  ///
  /// In ar, this message translates to:
  /// **'وقت المخالفة'**
  String get violation_time;

  /// No description provided for @vehicle_performance.
  ///
  /// In ar, this message translates to:
  /// **'أداء المركبة'**
  String get vehicle_performance;

  /// No description provided for @maximum_recorded_speed.
  ///
  /// In ar, this message translates to:
  /// **'أقصى سرعة مسجلة'**
  String get maximum_recorded_speed;

  /// No description provided for @vehicle_path.
  ///
  /// In ar, this message translates to:
  /// **'مسار المركبة'**
  String get vehicle_path;

  /// No description provided for @km_h.
  ///
  /// In ar, this message translates to:
  /// **'كم/س'**
  String get km_h;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الاشعارات'**
  String get notifications;

  /// No description provided for @receive_vehicle_details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل استلام المركبة'**
  String get receive_vehicle_details;

  /// No description provided for @write_action_to_be_taken.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الإجراء الذي ستتخذه'**
  String get write_action_to_be_taken;

  /// No description provided for @track_vehicle_on_map.
  ///
  /// In ar, this message translates to:
  /// **'تتبع المركبة علي الخريطة'**
  String get track_vehicle_on_map;

  /// No description provided for @driver_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم السائق'**
  String get driver_name;

  /// No description provided for @select_date_from_to.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك اختار تاريخ من إلى'**
  String get select_date_from_to;

  /// No description provided for @play.
  ///
  /// In ar, this message translates to:
  /// **'تشغيل'**
  String get play;

  /// No description provided for @stop.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف'**
  String get stop;

  /// No description provided for @position.
  ///
  /// In ar, this message translates to:
  /// **'الموضع:'**
  String get position;

  /// No description provided for @speed.
  ///
  /// In ar, this message translates to:
  /// **'السرعة:'**
  String get speed;

  /// No description provided for @vehicle_camera_code.
  ///
  /// In ar, this message translates to:
  /// **'معرف كود الكاميرا للمركبة'**
  String get vehicle_camera_code;

  /// No description provided for @go_violation_site.
  ///
  /// In ar, this message translates to:
  /// **'توجه لموقع المخالفة'**
  String get go_violation_site;

  /// No description provided for @download_violation_image.
  ///
  /// In ar, this message translates to:
  /// **'تحميل صورة المخالفة'**
  String get download_violation_image;

  /// No description provided for @camera_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اسم الكاميرا عربي'**
  String get camera_name_ar;

  /// No description provided for @type_camera_name_ar.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الكاميرا بالعربي'**
  String get type_camera_name_ar;

  /// No description provided for @camera_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اسم الكاميرا بالانجليزي'**
  String get camera_name_en;

  /// No description provided for @type_camera_name_en.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم الكاميرا بالانجليزي'**
  String get type_camera_name_en;

  /// No description provided for @camera_code.
  ///
  /// In ar, this message translates to:
  /// **'كود الكاميرا'**
  String get camera_code;

  /// No description provided for @type_camera_code.
  ///
  /// In ar, this message translates to:
  /// **'اكتب كود الكاميرا'**
  String get type_camera_code;

  /// No description provided for @start_video.
  ///
  /// In ar, this message translates to:
  /// **'بدأ الفيديو'**
  String get start_video;

  /// No description provided for @live_feed.
  ///
  /// In ar, this message translates to:
  /// **'بث المباشر'**
  String get live_feed;

  /// No description provided for @select_video_date.
  ///
  /// In ar, this message translates to:
  /// **'اختر تاريخ الفيديو'**
  String get select_video_date;

  /// No description provided for @camera_name.
  ///
  /// In ar, this message translates to:
  /// **'اسم الكاميرا'**
  String get camera_name;

  /// No description provided for @camera_type.
  ///
  /// In ar, this message translates to:
  /// **'نوع الكاميرا'**
  String get camera_type;

  /// No description provided for @start_live_feed.
  ///
  /// In ar, this message translates to:
  /// **'بدأ البث المباشر'**
  String get start_live_feed;

  /// No description provided for @camera_add.
  ///
  /// In ar, this message translates to:
  /// **'اضافة كاميرا'**
  String get camera_add;

  /// No description provided for @cameras.
  ///
  /// In ar, this message translates to:
  /// **'الكاميرات'**
  String get cameras;

  /// No description provided for @view_cameras.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكاميرات'**
  String get view_cameras;

  /// No description provided for @add_camera.
  ///
  /// In ar, this message translates to:
  /// **'اضافة كاميرا'**
  String get add_camera;

  /// No description provided for @edit_camera.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كاميرا'**
  String get edit_camera;

  /// No description provided for @delete_camera.
  ///
  /// In ar, this message translates to:
  /// **'حذف كاميرا'**
  String get delete_camera;

  /// No description provided for @edit_date_time.
  ///
  /// In ar, this message translates to:
  /// **'تعديل التاريخ والوقت'**
  String get edit_date_time;

  /// No description provided for @videos.
  ///
  /// In ar, this message translates to:
  /// **'فيديوهات'**
  String get videos;

  /// No description provided for @video.
  ///
  /// In ar, this message translates to:
  /// **'الفيديو'**
  String get video;

  /// No description provided for @live_streaming.
  ///
  /// In ar, this message translates to:
  /// **'بث مباشر'**
  String get live_streaming;

  /// No description provided for @select_camera.
  ///
  /// In ar, this message translates to:
  /// **'اختر الكاميرا'**
  String get select_camera;

  /// No description provided for @date_from.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ من'**
  String get date_from;

  /// No description provided for @date_to.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ الي'**
  String get date_to;

  /// No description provided for @date_to_must_be_greater_than_date_from.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ الي يجب ان يكون اكبر من التاريخ من'**
  String get date_to_must_be_greater_than_date_from;

  /// No description provided for @there_are_videos_yet.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد فيديوهات بعد'**
  String get there_are_videos_yet;

  /// No description provided for @videos_dates_validate_msg.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك حدّد الوقت والتاريخ الذي تريده لعرض الفيديوهات فيه'**
  String get videos_dates_validate_msg;

  /// No description provided for @select_date_and_time.
  ///
  /// In ar, this message translates to:
  /// **'اختر التاريخ والوقت'**
  String get select_date_and_time;

  /// No description provided for @drivers.
  ///
  /// In ar, this message translates to:
  /// **'السائقين'**
  String get drivers;

  /// No description provided for @maximum_speed.
  ///
  /// In ar, this message translates to:
  /// **'أقصي سرعة'**
  String get maximum_speed;

  /// No description provided for @transactions.
  ///
  /// In ar, this message translates to:
  /// **'المعاملات'**
  String get transactions;

  /// No description provided for @view_transactions.
  ///
  /// In ar, this message translates to:
  /// **'عرض المعاملات'**
  String get view_transactions;

  /// No description provided for @add_transactions.
  ///
  /// In ar, this message translates to:
  /// **'اضافة  معاملة'**
  String get add_transactions;

  /// No description provided for @update_transactions.
  ///
  /// In ar, this message translates to:
  /// **' تحديث المعاملة'**
  String get update_transactions;

  /// No description provided for @completed_tasks.
  ///
  /// In ar, this message translates to:
  /// **'التاسكات المنتهية'**
  String get completed_tasks;

  /// No description provided for @in_progress.
  ///
  /// In ar, this message translates to:
  /// **'جاري المعالجة'**
  String get in_progress;

  /// No description provided for @reschedule.
  ///
  /// In ar, this message translates to:
  /// **'إعادة جدولة'**
  String get reschedule;

  /// No description provided for @delivery_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الاستلام'**
  String get delivery_date;

  /// No description provided for @entity.
  ///
  /// In ar, this message translates to:
  /// **'الجهة'**
  String get entity;

  /// No description provided for @reload.
  ///
  /// In ar, this message translates to:
  /// **'إعادة تحميل'**
  String get reload;

  /// No description provided for @violations_of_operation.
  ///
  /// In ar, this message translates to:
  /// **'مخالفات التشغيل'**
  String get violations_of_operation;

  /// No description provided for @violations_of_factory.
  ///
  /// In ar, this message translates to:
  /// **'مخالفات المصانع'**
  String get violations_of_factory;

  /// No description provided for @face_image_required_proceed.
  ///
  /// In ar, this message translates to:
  /// **'يجب اضافة بصمة الوجه للمتابعة'**
  String get face_image_required_proceed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
