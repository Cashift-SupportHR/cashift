// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(number) => "بوابه رقم ${number}";

  static String m1(quantity) => "${quantity} شخص";

  static String m2(job) => "المهارات المطلوبه لوظيفه ${job}";

  static String m3(companyName, quantity, withdrawMethod) =>
      "سيتم تحويل مبلغ ${quantity}  ر.س من حسابك بشركة ${companyName} عن طريق  ${withdrawMethod}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "absence": MessageLookupByLibrary.simpleMessage("غياب"),
        "absenceNotice": MessageLookupByLibrary.simpleMessage("أشعار الغياب"),
        "absence_days": MessageLookupByLibrary.simpleMessage("ايام الغياب"),
        "absence_registration":
            MessageLookupByLibrary.simpleMessage("تسجيل الغياب"),
        "accept": MessageLookupByLibrary.simpleMessage("مقبول"),
        "accept_but": MessageLookupByLibrary.simpleMessage("موافقة"),
        "accept_copy_rights_label":
            MessageLookupByLibrary.simpleMessage(" لقد قرأت وأوافق على"),
        "account": MessageLookupByLibrary.simpleMessage("الحساب"),
        "account_received":
            MessageLookupByLibrary.simpleMessage("حساب المستلم"),
        "accounts": MessageLookupByLibrary.simpleMessage("الحسابات"),
        "activate_account":
            MessageLookupByLibrary.simpleMessage("تفعيل الحساب"),
        "activate_client": MessageLookupByLibrary.simpleMessage("تفعيل العميل"),
        "activate_punishment":
            MessageLookupByLibrary.simpleMessage("تفعيل العقوبه"),
        "active": MessageLookupByLibrary.simpleMessage("نشط"),
        "active_f": MessageLookupByLibrary.simpleMessage("نشطه"),
        "active_gates": MessageLookupByLibrary.simpleMessage("بوابات نشطه"),
        "active_loans": MessageLookupByLibrary.simpleMessage("سُلف نشطة"),
        "active_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص النشطة"),
        "activity_log_title":
            MessageLookupByLibrary.simpleMessage("سجل الانشطة"),
        "add": MessageLookupByLibrary.simpleMessage("اضافة"),
        "add_address": MessageLookupByLibrary.simpleMessage("اضافة عنوان "),
        "add_applicant": MessageLookupByLibrary.simpleMessage("إضافة كاشتفر"),
        "add_area": MessageLookupByLibrary.simpleMessage("اضافة منطقة"),
        "add_bank_account":
            MessageLookupByLibrary.simpleMessage("اضف حسابك الان"),
        "add_breakdown": MessageLookupByLibrary.simpleMessage("اضافة عطل "),
        "add_camera": MessageLookupByLibrary.simpleMessage("اضافة كاميرا"),
        "add_cashifters":
            MessageLookupByLibrary.simpleMessage("اضافة كاشفتر جديد"),
        "add_classification":
            MessageLookupByLibrary.simpleMessage("اضافة تصنيف جديد "),
        "add_complaint_files_desc": MessageLookupByLibrary.simpleMessage(
            "يمكنك اضافة اكثر من صورة توضح الشكوي"),
        "add_condition": MessageLookupByLibrary.simpleMessage("اضافة شرط"),
        "add_copy_rights_title":
            MessageLookupByLibrary.simpleMessage("اضافة الشروط والاحكام"),
        "add_covenant": MessageLookupByLibrary.simpleMessage("اضف عهدة"),
        "add_data": MessageLookupByLibrary.simpleMessage("اضافة البيانات"),
        "add_details_image":
            MessageLookupByLibrary.simpleMessage("اضف تفاصيل للصوره"),
        "add_details_to_image":
            MessageLookupByLibrary.simpleMessage("اضف تفاصيل للصوره"),
        "add_employee_on_opportunity":
            MessageLookupByLibrary.simpleMessage("إضافة موظف على الفرصة"),
        "add_employment_location":
            MessageLookupByLibrary.simpleMessage("اضافة موقع التوظيف"),
        "add_employment_official":
            MessageLookupByLibrary.simpleMessage("اضافة مسئول توظيف"),
        "add_face_print":
            MessageLookupByLibrary.simpleMessage("اضافة بصمة الوجه"),
        "add_file_mobile": MessageLookupByLibrary.simpleMessage(
            "للتأكد من ان هذا رقم جوالك الخاص عليك ارفاق ملف لاثبات صحة امتلاكك لهذا الرقم  :"),
        "add_focus_point":
            MessageLookupByLibrary.simpleMessage("اضافة نقطة تمركز"),
        "add_gas_stations":
            MessageLookupByLibrary.simpleMessage("اضافة محطات الوقود "),
        "add_hazards": MessageLookupByLibrary.simpleMessage("اضافة مخاطر"),
        "add_image": MessageLookupByLibrary.simpleMessage(
            "قم بتحميل صور توضح هذه الملاحظات"),
        "add_insurance": MessageLookupByLibrary.simpleMessage("اضافة تأمين"),
        "add_job_requirements":
            MessageLookupByLibrary.simpleMessage("اضافة متطلبات الوظيفه"),
        "add_loans": MessageLookupByLibrary.simpleMessage("إضافه سلفه جديده "),
        "add_location": MessageLookupByLibrary.simpleMessage("اضف موقع"),
        "add_logo": MessageLookupByLibrary.simpleMessage("اضف شعار"),
        "add_maintenance": MessageLookupByLibrary.simpleMessage("طلب صيانة"),
        "add_mobile_new": MessageLookupByLibrary.simpleMessage(
            "عليك ادخال رقم الجوال الجديد لنرسل لك رمز التحقق علي جوالك"),
        "add_more_the_work_periods":
            MessageLookupByLibrary.simpleMessage("اضافة المزيد من فترات العمل"),
        "add_new": MessageLookupByLibrary.simpleMessage("اضافة جديد"),
        "add_new_job_opportunity":
            MessageLookupByLibrary.simpleMessage("اضافة فرصه عمل جديده"),
        "add_new_loan_request":
            MessageLookupByLibrary.simpleMessage("إضافة طلب سلفه جديد"),
        "add_new_opportunity":
            MessageLookupByLibrary.simpleMessage("إضافة فرصة عمل جديدة"),
        "add_new_period":
            MessageLookupByLibrary.simpleMessage("اضف فترة جديدة"),
        "add_new_place":
            MessageLookupByLibrary.simpleMessage("إضافة مكان جديد"),
        "add_new_point":
            MessageLookupByLibrary.simpleMessage("اضافة نقطة جديده"),
        "add_new_punishment":
            MessageLookupByLibrary.simpleMessage("اضف عقوبة جديدة"),
        "add_new_request":
            MessageLookupByLibrary.simpleMessage("إضافة طلب جديد"),
        "add_new_time": MessageLookupByLibrary.simpleMessage("اضف وقت جديد"),
        "add_new_user":
            MessageLookupByLibrary.simpleMessage("اضافة مستخدم جديد"),
        "add_new_wallet":
            MessageLookupByLibrary.simpleMessage("إضافة محفظة جديدة"),
        "add_notes": MessageLookupByLibrary.simpleMessage("اضافة ملاحظات"),
        "add_notes_in_arabic":
            MessageLookupByLibrary.simpleMessage("اضف ملاحظات باللغة العربية"),
        "add_notes_in_english": MessageLookupByLibrary.simpleMessage(
            "اضف ملاحظات باللغة الانجليزية"),
        "add_period_pricing":
            MessageLookupByLibrary.simpleMessage("اضف تسعير الفترة"),
        "add_photo": MessageLookupByLibrary.simpleMessage("اضف صورة"),
        "add_project": MessageLookupByLibrary.simpleMessage("اضافة مشروع"),
        "add_projects": MessageLookupByLibrary.simpleMessage("اضافة مشاريع"),
        "add_qr_code_pivot_point":
            MessageLookupByLibrary.simpleMessage("اضافة QR Code لنقطة التمركز"),
        "add_request": MessageLookupByLibrary.simpleMessage("اضافة طلب"),
        "add_some_notes":
            MessageLookupByLibrary.simpleMessage("اضافه بعض الملاحظات"),
        "add_task_responsibility":
            MessageLookupByLibrary.simpleMessage("اضافة مهمة او مسؤولية"),
        "add_terms_conditions_opportunities":
            MessageLookupByLibrary.simpleMessage("اضافة شروط واحكام الفرص"),
        "add_tracking_request":
            MessageLookupByLibrary.simpleMessage("اضافة طلب تتبع"),
        "add_transactions":
            MessageLookupByLibrary.simpleMessage("اضافة  معاملة"),
        "add_vehicle": MessageLookupByLibrary.simpleMessage("اضافة مركبة"),
        "add_vehicles": MessageLookupByLibrary.simpleMessage("اضافة مركبة"),
        "add_violation": MessageLookupByLibrary.simpleMessage("اضافة مخالفة"),
        "add_violation_files_desc": MessageLookupByLibrary.simpleMessage(
            "يمكنك اضافة اكثر من صورة توضح المخالفة"),
        "add_violation_type":
            MessageLookupByLibrary.simpleMessage("اضافة نوع مخالفة"),
        "add_wallet": MessageLookupByLibrary.simpleMessage("إضافة محفظة"),
        "add_work_the_period":
            MessageLookupByLibrary.simpleMessage("اضافة فترة العمل"),
        "add_your_bank_account_now":
            MessageLookupByLibrary.simpleMessage("اضف حسابك البنكي الان"),
        "add_your_notes": MessageLookupByLibrary.simpleMessage("اضف ملاحظاتك"),
        "added_date": MessageLookupByLibrary.simpleMessage("تاريخ الاضافة : "),
        "added_focus_points":
            MessageLookupByLibrary.simpleMessage("نقاط التمركز المضافة"),
        "added_users":
            MessageLookupByLibrary.simpleMessage("المستخدمين المضافين"),
        "additional_locations":
            MessageLookupByLibrary.simpleMessage("المواقع الاضافيه"),
        "additional_specifications":
            MessageLookupByLibrary.simpleMessage("المواصفات الإضافية"),
        "address": MessageLookupByLibrary.simpleMessage("العنوان"),
        "address_ar": MessageLookupByLibrary.simpleMessage("العنوان بالعربي"),
        "address_en":
            MessageLookupByLibrary.simpleMessage("العنوان بالانجليزي"),
        "adjust_periods": MessageLookupByLibrary.simpleMessage("تعديل الفترات"),
        "admin": MessageLookupByLibrary.simpleMessage("الأدمن"),
        "administrator": MessageLookupByLibrary.simpleMessage("المسؤول"),
        "advantages_freelancer_document":
            MessageLookupByLibrary.simpleMessage("مميزات وثيقه العمل الحر"),
        "after": MessageLookupByLibrary.simpleMessage("بعد"),
        "after_break": MessageLookupByLibrary.simpleMessage("بعد البريك"),
        "age": MessageLookupByLibrary.simpleMessage("العمر"),
        "all": MessageLookupByLibrary.simpleMessage("كل"),
        "all_city": MessageLookupByLibrary.simpleMessage("جميع  المدن"),
        "all_employees": MessageLookupByLibrary.simpleMessage("جميع الموظفين"),
        "all_job": MessageLookupByLibrary.simpleMessage("جميع الوظائف"),
        "all_jobs": MessageLookupByLibrary.simpleMessage("كل الفرص"),
        "allow_required_permissions": MessageLookupByLibrary.simpleMessage(
            "الأذونات المطلوبة من تطبيق كاشفت."),
        "allowed_time_ahead":
            MessageLookupByLibrary.simpleMessage("الوقت المسموح قبل الميعادً"),
        "alternative_factor":
            MessageLookupByLibrary.simpleMessage("العامل البديل"),
        "amount": MessageLookupByLibrary.simpleMessage("المبلغ"),
        "amount_value": MessageLookupByLibrary.simpleMessage("قيمة المبلغ"),
        "amount_will_be_withdraw": MessageLookupByLibrary.simpleMessage(
            "سيتم ايداع المبلغ في حسابك البنكي "),
        "and": MessageLookupByLibrary.simpleMessage(" و "),
        "apologies_for_submission":
            MessageLookupByLibrary.simpleMessage("اعتذار عن التقديم"),
        "apology": MessageLookupByLibrary.simpleMessage("اعتذار"),
        "applicants": MessageLookupByLibrary.simpleMessage(" المتقدمين"),
        "application_not_responsible": MessageLookupByLibrary.simpleMessage(
            "التطبيق غير مسؤول عن  أي خطأ في البيانات المدخله"),
        "applied": MessageLookupByLibrary.simpleMessage(" متقدم"),
        "applied_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل المتقدم"),
        "applied_jobs": MessageLookupByLibrary.simpleMessage("ساعات عملي"),
        "applied_jobs2":
            MessageLookupByLibrary.simpleMessage("الوظائف المقدم عليها"),
        "applied_name": MessageLookupByLibrary.simpleMessage("اسم المتقدم "),
        "applied_opportunities":
            MessageLookupByLibrary.simpleMessage("ساعات عملي"),
        "apply_now":
            MessageLookupByLibrary.simpleMessage("تـــقـــــــدم الآن"),
        "approval": MessageLookupByLibrary.simpleMessage("موافقه"),
        "approval_job_application":
            MessageLookupByLibrary.simpleMessage("الموافقة على طلب التوظيف"),
        "approval_order":
            MessageLookupByLibrary.simpleMessage("الموافقة على الطلب"),
        "approved": MessageLookupByLibrary.simpleMessage("تمت الموافقه "),
        "approved_bail_request":
            MessageLookupByLibrary.simpleMessage("طلب كفالة تمت الموافقه عليه"),
        "are_you_sure_activate_punishment":
            MessageLookupByLibrary.simpleMessage(
                "هل انت متاكد من تفعيل العقوبه؟"),
        "are_you_sure_approval_employee": MessageLookupByLibrary.simpleMessage(
            "هل انت متاكد من الموافقة علي الموظف؟"),
        "are_you_sure_approval_violation": MessageLookupByLibrary.simpleMessage(
            "هل انت متاكد من الموافقة علي المخالفه؟"),
        "are_you_sure_ban_employee":
            MessageLookupByLibrary.simpleMessage("هل انت متاكد من حظر الموظف؟"),
        "are_you_sure_cancel_transfer": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من إلغاء التحويل؟"),
        "are_you_sure_deactivate_employment_official":
            MessageLookupByLibrary.simpleMessage(
                "هل انت متاكد من تعطيل مسئول التوظيف؟"),
        "are_you_sure_deactivate_punishment":
            MessageLookupByLibrary.simpleMessage(
                "هل انت متاكد من الغاء تفعيل العقوبه؟"),
        "are_you_sure_delete_focus_point": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من حذف نقطة التمركز ؟"),
        "are_you_sure_delete_punishment": MessageLookupByLibrary.simpleMessage(
            "هل انت متاكد من حذف العقوبة؟"),
        "are_you_sure_delete_time": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من حذف هذا الوقت ؟"),
        "area": MessageLookupByLibrary.simpleMessage("المنطقة"),
        "area_name": MessageLookupByLibrary.simpleMessage("اسم المنطقة"),
        "areas": MessageLookupByLibrary.simpleMessage("المناطق"),
        "attached_attachments":
            MessageLookupByLibrary.simpleMessage("المرفقات الملحقة"),
        "attachments": MessageLookupByLibrary.simpleMessage("المرفقات"),
        "attendance": MessageLookupByLibrary.simpleMessage("الحضور"),
        "attendance_and_departure_notifications":
            MessageLookupByLibrary.simpleMessage("اشعارات الحضور والانصراف"),
        "attendance_and_departure_notifications_reports":
            MessageLookupByLibrary.simpleMessage("تقارير الحضور والانصراف"),
        "attendance_and_departure_registration":
            MessageLookupByLibrary.simpleMessage("تسجيل حضور وانصراف"),
        "attendance_cashift_required": MessageLookupByLibrary.simpleMessage(
            "يتوجب عليك تسجيل الحضور او الانصراف لدوام كاشفت"),
        "attendance_conditions":
            MessageLookupByLibrary.simpleMessage("شروط الحضور"),
        "attendance_confirm":
            MessageLookupByLibrary.simpleMessage("تأكيد  الحضور"),
        "attendance_days": MessageLookupByLibrary.simpleMessage("ايام الحضور"),
        "attendance_departure":
            MessageLookupByLibrary.simpleMessage("الحضور والانصراف"),
        "attendance_departure_report":
            MessageLookupByLibrary.simpleMessage("تقرير الحضور والانصراف"),
        "attendance_fingerprint":
            MessageLookupByLibrary.simpleMessage("بصمة تسجيل الحضور"),
        "attendance_fingerprint_at_beginning":
            MessageLookupByLibrary.simpleMessage("بصمة حضور بداية الدوام"),
        "attendance_fingerprint_desc": MessageLookupByLibrary.simpleMessage(
            "قم بفحص البصمه لتسجيل حضورك في بدايه الدوام"),
        "attendance_fingerprint_during_day":
            MessageLookupByLibrary.simpleMessage("بصمة الحضور خلال النهار"),
        "attendance_method":
            MessageLookupByLibrary.simpleMessage("طريقة تسجيل الحضور"),
        "attendance_registration":
            MessageLookupByLibrary.simpleMessage("تسجيل حضور"),
        "attendance_state": MessageLookupByLibrary.simpleMessage("حالة الحضور"),
        "attendance_title":
            MessageLookupByLibrary.simpleMessage("تسجيل الحضور والانصراف"),
        "attendance_update":
            MessageLookupByLibrary.simpleMessage("تحديث الحضور"),
        "authenticate_bio_msg": MessageLookupByLibrary.simpleMessage(
            "يرجى المصادقة لتسجيل الدخول إلى حسابك"),
        "available_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص المتاحة"),
        "average_feedbacks":
            MessageLookupByLibrary.simpleMessage("متوسط التقيمات"),
        "back_camera": MessageLookupByLibrary.simpleMessage("الكاميرا الخلفية"),
        "back_to_home_page":
            MessageLookupByLibrary.simpleMessage("العودة للصفحة الرئيسية"),
        "back_to_projects":
            MessageLookupByLibrary.simpleMessage("العودة للمشاريع"),
        "back_up_number":
            MessageLookupByLibrary.simpleMessage("عدد القبول الاحتياطى"),
        "background_service_permission_message":
            MessageLookupByLibrary.simpleMessage(
                "*يحتاج تطبيق \"كاشفت \" السماح بإستخدام خدمة الموقع الجغرافي في الخلفية ليمكن من الإستفادة بخدمة تسجيل الحضور والإنصراف التلقائي."),
        "bail_application_pending_approval":
            MessageLookupByLibrary.simpleMessage(
                "طلب الكفاله في انتظار الموافقه"),
        "bail_request_denied":
            MessageLookupByLibrary.simpleMessage("طلب كفاله تم رفضه"),
        "bail_requests": MessageLookupByLibrary.simpleMessage("طلبات الكفاله"),
        "balance_hidden": MessageLookupByLibrary.simpleMessage("الرصيد مخفى"),
        "ban": MessageLookupByLibrary.simpleMessage("الحظر"),
        "ban_employee_desc": MessageLookupByLibrary.simpleMessage(
            "هل أنت متاكد من حظر الموظف علي مستوي الشركه؟"),
        "bank_account": MessageLookupByLibrary.simpleMessage("الحساب البنكي"),
        "bank_iban": MessageLookupByLibrary.simpleMessage("رقم الايبان "),
        "bank_name": MessageLookupByLibrary.simpleMessage("اسم البنك"),
        "base_inf": MessageLookupByLibrary.simpleMessage("البيانات الاساسيه"),
        "basic_vehicle_information":
            MessageLookupByLibrary.simpleMessage("معلومات المركبة الأساسية"),
        "before_break": MessageLookupByLibrary.simpleMessage("قبل البريك"),
        "beginning_time": MessageLookupByLibrary.simpleMessage("بداية الوقت"),
        "beginning_work": MessageLookupByLibrary.simpleMessage("بداية العمل"),
        "biometric_authentication":
            MessageLookupByLibrary.simpleMessage("المصادقة بالبصمة"),
        "biometrics_service_not_enabled": MessageLookupByLibrary.simpleMessage(
            "لم يتم تمكين خدمة القياسات الحيوية."),
        "birthdate": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
        "blink_your_eyes": MessageLookupByLibrary.simpleMessage("ارمش عينيك"),
        "block_emp": MessageLookupByLibrary.simpleMessage("حظر الموظفين"),
        "blocking_status": MessageLookupByLibrary.simpleMessage("حالة الحظر"),
        "body_mass": MessageLookupByLibrary.simpleMessage("كتلة الجسم"),
        "brand_name": MessageLookupByLibrary.simpleMessage("اسم البراند"),
        "brand_type": MessageLookupByLibrary.simpleMessage("نوع البراند"),
        "breakdown_maintenance":
            MessageLookupByLibrary.simpleMessage(" الصيانة والأعطال"),
        "calculation_method":
            MessageLookupByLibrary.simpleMessage("طريقة الحساب "),
        "camera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
        "camera_add": MessageLookupByLibrary.simpleMessage("اضافة كاميرا"),
        "camera_code": MessageLookupByLibrary.simpleMessage("كود الكاميرا"),
        "camera_name": MessageLookupByLibrary.simpleMessage("اسم الكاميرا"),
        "camera_name_ar":
            MessageLookupByLibrary.simpleMessage("اسم الكاميرا عربي"),
        "camera_name_en":
            MessageLookupByLibrary.simpleMessage("اسم الكاميرا بالانجليزي"),
        "camera_type": MessageLookupByLibrary.simpleMessage("نوع الكاميرا"),
        "cameras": MessageLookupByLibrary.simpleMessage("الكاميرات"),
        "cancel": MessageLookupByLibrary.simpleMessage("إغلاق"),
        "cancel_button": MessageLookupByLibrary.simpleMessage("الغاء"),
        "cancel_message_opportunity":
            MessageLookupByLibrary.simpleMessage("هل تريد إلغاء الفرصة؟"),
        "cancel_opportunity":
            MessageLookupByLibrary.simpleMessage("إلغاء الفرصة"),
        "cancel_shift_title":
            MessageLookupByLibrary.simpleMessage("اعتذار عن الحضور"),
        "cancel_transfare":
            MessageLookupByLibrary.simpleMessage("إلغاء التحويل"),
        "cancel_transfer":
            MessageLookupByLibrary.simpleMessage("إلغاء التحويل"),
        "canceled_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص الملغية"),
        "canceled_withdrawn":
            MessageLookupByLibrary.simpleMessage("ملغي او معتذر"),
        "cancellation_transfer_request":
            MessageLookupByLibrary.simpleMessage("لا يمكنك إلغاء طلب التحويل"),
        "career_field": MessageLookupByLibrary.simpleMessage("المجال الوظيفي"),
        "cashier_locations":
            MessageLookupByLibrary.simpleMessage("اماكن استلام النقدية"),
        "cashifter_attendance_tracking":
            MessageLookupByLibrary.simpleMessage("متابعة حضور الكاشفتر"),
        "cashifter_name": MessageLookupByLibrary.simpleMessage("اسم الكاشفتر"),
        "cashifters": MessageLookupByLibrary.simpleMessage("كاشفترز"),
        "cashifters_requests":
            MessageLookupByLibrary.simpleMessage("طلبات الكاشفترز"),
        "certificate_value":
            MessageLookupByLibrary.simpleMessage("قيمة الشهادة"),
        "chamber_commerce_attestation_required":
            MessageLookupByLibrary.simpleMessage("يتطلب تصديق غرفه تجاريه"),
        "change_hours": MessageLookupByLibrary.simpleMessage("تعديل الدوام "),
        "change_language_label":
            MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
        "change_operating_plan":
            MessageLookupByLibrary.simpleMessage("تغيير خطة التشغيل"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "chashift_attendance":
            MessageLookupByLibrary.simpleMessage("تسجيل حضور وانصراف كاشفت"),
        "chashift_attendance_dta":
            MessageLookupByLibrary.simpleMessage("تسجيل حضور وانصراف DTA"),
        "chashift_attendance_finger": MessageLookupByLibrary.simpleMessage(
            "قم بتسجيل حضورك من خلال بصمه"),
        "chashifter_collect_loan":
            MessageLookupByLibrary.simpleMessage("تحصيل سُلف الكاشفتر "),
        "chashifter_data":
            MessageLookupByLibrary.simpleMessage("بيانات الكاشيفتر"),
        "chashifter_details_loan":
            MessageLookupByLibrary.simpleMessage("تفاصيل سُلف الكاشفتر "),
        "check_finger":
            MessageLookupByLibrary.simpleMessage("بصمة الحضور او الانصراف"),
        "check_network_connection": MessageLookupByLibrary.simpleMessage(
            "تحقق من اتصال الشبكة لديك وحاول مرة أخرى"),
        "check_qr_code_opportunity": MessageLookupByLibrary.simpleMessage(
            "قم بفحص ال Qr Code الخاص بالفرصه"),
        "checkin": MessageLookupByLibrary.simpleMessage("تسجيل حضور"),
        "checkout": MessageLookupByLibrary.simpleMessage("تسجيل انصراف"),
        "cheek_face": MessageLookupByLibrary.simpleMessage(
            "جاري التحقيق من  بصمة  الوجه"),
        "choose_blocking_state":
            MessageLookupByLibrary.simpleMessage("اختر حالة الحظر"),
        "city": MessageLookupByLibrary.simpleMessage("المدينة"),
        "city_ar": MessageLookupByLibrary.simpleMessage("المدينه بالعربي"),
        "city_en": MessageLookupByLibrary.simpleMessage("المدينه بالانجليزي"),
        "city_name": MessageLookupByLibrary.simpleMessage("اسم المدينة"),
        "classification": MessageLookupByLibrary.simpleMessage("التصنيفات"),
        "clear": MessageLookupByLibrary.simpleMessage("مسح"),
        "click": MessageLookupByLibrary.simpleMessage("انقر هنا"),
        "click_access_account":
            MessageLookupByLibrary.simpleMessage("أضغط هنا للوصول لحسابك"),
        "click_here": MessageLookupByLibrary.simpleMessage("اضغط هنا"),
        "click_here_view_violation_location":
            MessageLookupByLibrary.simpleMessage(
                "اضغط هنا لرؤية موقع  المخالفة"),
        "click_to_reload": MessageLookupByLibrary.simpleMessage("إعادة تحميل"),
        "clicking_check_mark_means_you_agree":
            MessageLookupByLibrary.simpleMessage(
                "الضغط علي علامة المربع يعني الموافقة"),
        "code_appear_here":
            MessageLookupByLibrary.simpleMessage("سيظهر الكود هنا "),
        "code_expires_within":
            MessageLookupByLibrary.simpleMessage("تنتهي صلاحية الكود خلال :  "),
        "code_valid_on_time": MessageLookupByLibrary.simpleMessage(
            "هذا الكود صالح للإستخدام لمرة واحدة فقط ."),
        "collect": MessageLookupByLibrary.simpleMessage("التحصيل  "),
        "collect_button": MessageLookupByLibrary.simpleMessage("تحصيل"),
        "collect_cash_title":
            MessageLookupByLibrary.simpleMessage("المعاملات المالية"),
        "collected": MessageLookupByLibrary.simpleMessage("مكتملة"),
        "collection_done": MessageLookupByLibrary.simpleMessage("تم التحصيل"),
        "color": MessageLookupByLibrary.simpleMessage(" لون "),
        "commerce_ratification":
            MessageLookupByLibrary.simpleMessage("تصديق الغرفه التجاريه"),
        "communication_device":
            MessageLookupByLibrary.simpleMessage("جهاز التواصل"),
        "communication_device_number":
            MessageLookupByLibrary.simpleMessage("رقم جهاز التواصل  :"),
        "company_description":
            MessageLookupByLibrary.simpleMessage("وصف الشركة"),
        "company_details":
            MessageLookupByLibrary.simpleMessage("معلومات الشركة"),
        "company_jobs": MessageLookupByLibrary.simpleMessage("وظائف الشركة"),
        "company_name": MessageLookupByLibrary.simpleMessage("اسم الشركة"),
        "company_name_insurance":
            MessageLookupByLibrary.simpleMessage("اسم شركة التأمين"),
        "company_not_responsible_misuse": MessageLookupByLibrary.simpleMessage(
            "الشركة غير مسئولة عن سوء الإستخدام ."),
        "company_or_factory_name":
            MessageLookupByLibrary.simpleMessage("اسم الشركة / المصنع"),
        "company_wide_ban":
            MessageLookupByLibrary.simpleMessage("حظر علي مستوي الشركه"),
        "complete_cv": MessageLookupByLibrary.simpleMessage(
            "برجاء استكمال بيانات السيرة الذاتية"),
        "complete_profile":
            MessageLookupByLibrary.simpleMessage("إستكمال السيرة الذاتية"),
        "complete_receipt":
            MessageLookupByLibrary.simpleMessage(" مكتملة الاستلام"),
        "complete_receipt_information":
            MessageLookupByLibrary.simpleMessage("تكملة بيانات الاستلام"),
        "complete_service": MessageLookupByLibrary.simpleMessage("خدمة مكمل"),
        "completed": MessageLookupByLibrary.simpleMessage("إكتمل"),
        "completed_gates":
            MessageLookupByLibrary.simpleMessage("تم الانتهاء منها"),
        "completed_tasks":
            MessageLookupByLibrary.simpleMessage("التاسكات المنتهية"),
        "condition_ar":
            MessageLookupByLibrary.simpleMessage("كتابه الشرط باللغه العربيه"),
        "condition_ar_validation":
            MessageLookupByLibrary.simpleMessage("اكتب الشرط باللغه العربيه"),
        "condition_en":
            MessageLookupByLibrary.simpleMessage("الشرط باللغه الانجليزيه"),
        "condition_en_validation": MessageLookupByLibrary.simpleMessage(
            "اكتب الشرط باللغه الانجليزيه"),
        "conditions": MessageLookupByLibrary.simpleMessage("توافق الشروط"),
        "confairm_data": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من حفظ البيانات"),
        "confairm_status_order": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بتحديد حالة الطلب !"),
        "confirm_attendance":
            MessageLookupByLibrary.simpleMessage("تأكيد الحضور"),
        "confirm_attendance_message": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بتأكيد حضورك لوظيفة"),
        "confirm_button": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "confirm_code": MessageLookupByLibrary.simpleMessage("كود التحقيق"),
        "confirm_code_ms": MessageLookupByLibrary.simpleMessage(
            "سوف يتم ارسال كود التحقق الي رقم الجوال الجديد , عليك كتابته الآن "),
        "confirm_iban":
            MessageLookupByLibrary.simpleMessage("تأكيد رقم الايبان"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "confirm_phone_number":
            MessageLookupByLibrary.simpleMessage("تأكيد رقم الهاتف"),
        "confirm_phone_number_desc": MessageLookupByLibrary.simpleMessage(
            "قم بأدخال كود التفعيل الذي تم ارساله الي الهاتف رقم"),
        "confirm_today":
            MessageLookupByLibrary.simpleMessage("برجاء تأكيد حضورك اليوم"),
        "confirm_yes":
            MessageLookupByLibrary.simpleMessage("نعم أوافق علي هذه التعهدات"),
        "connect_code": MessageLookupByLibrary.simpleMessage("رمز التواصل : "),
        "contract_clause": MessageLookupByLibrary.simpleMessage("شرط العقد"),
        "contractual_power_number":
            MessageLookupByLibrary.simpleMessage("رقم القوة التعاقدية"),
        "copy_rights_title":
            MessageLookupByLibrary.simpleMessage(" الشروط والاحكام"),
        "corporate_balances":
            MessageLookupByLibrary.simpleMessage("أرصدة الشركات"),
        "covenant": MessageLookupByLibrary.simpleMessage("العُهد"),
        "covenant_data": MessageLookupByLibrary.simpleMessage("بيانات العهدة"),
        "covenant_desc": MessageLookupByLibrary.simpleMessage("وصف العهدة"),
        "covenant_name": MessageLookupByLibrary.simpleMessage("اسم العهدة :"),
        "covenant_number": MessageLookupByLibrary.simpleMessage("رقم العهدة :"),
        "covenant_received":
            MessageLookupByLibrary.simpleMessage("العهد المستلمة"),
        "covenant_type": MessageLookupByLibrary.simpleMessage("نوع العهدة :"),
        "covenants": MessageLookupByLibrary.simpleMessage("العُهد"),
        "coverage": MessageLookupByLibrary.simpleMessage("تغطية الراحات"),
        "create_date": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
        "current_balance": MessageLookupByLibrary.simpleMessage("رصيدك الحالي"),
        "current_location":
            MessageLookupByLibrary.simpleMessage("الموقع الحالي"),
        "current_shift": MessageLookupByLibrary.simpleMessage("العمل الحالي"),
        "current_situation":
            MessageLookupByLibrary.simpleMessage("ماهو وضعك الحالي ؟ "),
        "current_state": MessageLookupByLibrary.simpleMessage("الوضع  الحالي "),
        "customer_reviews":
            MessageLookupByLibrary.simpleMessage("اراء العملاء"),
        "cv_emp": MessageLookupByLibrary.simpleMessage("شهادة الموظف"),
        "damage": MessageLookupByLibrary.simpleMessage("العطل"),
        "data_collection":
            MessageLookupByLibrary.simpleMessage("بيانات التحصيل"),
        "data_vehicles":
            MessageLookupByLibrary.simpleMessage(" بيانات المركبة"),
        "date": MessageLookupByLibrary.simpleMessage("التاريخ"),
        "date_absence": MessageLookupByLibrary.simpleMessage("تاريخ الغياب"),
        "date_create": MessageLookupByLibrary.simpleMessage("تاريخ الانشاء "),
        "date_dispose": MessageLookupByLibrary.simpleMessage("تاريخ الايداع"),
        "date_from": MessageLookupByLibrary.simpleMessage("التاريخ من"),
        "date_opportunity_offered":
            MessageLookupByLibrary.simpleMessage("تاريخ عرض الفرصه"),
        "date_pledge": MessageLookupByLibrary.simpleMessage("تاريخ التعهد"),
        "date_request": MessageLookupByLibrary.simpleMessage("تاريخ الطلب"),
        "date_to": MessageLookupByLibrary.simpleMessage("التاريخ الي"),
        "date_to_must_be_greater_than_date_from":
            MessageLookupByLibrary.simpleMessage(
                "التاريخ الي يجب ان يكون اكبر من التاريخ من"),
        "dates_not_set":
            MessageLookupByLibrary.simpleMessage("المواعيد لم تحدد"),
        "day": MessageLookupByLibrary.simpleMessage("يوم"),
        "days": MessageLookupByLibrary.simpleMessage("الايام"),
        "days_absence": MessageLookupByLibrary.simpleMessage("أيام الغياب"),
        "deactivate_account":
            MessageLookupByLibrary.simpleMessage("تعطيل الحساب"),
        "deactivate_employment_official":
            MessageLookupByLibrary.simpleMessage("تعطيل مسئول التوظيف"),
        "deactivate_punishment":
            MessageLookupByLibrary.simpleMessage("الغاء تفعيل العقوبه"),
        "deducting_certificate":
            MessageLookupByLibrary.simpleMessage("خصم شهاده خلو سوابق :"),
        "degree_importance":
            MessageLookupByLibrary.simpleMessage("درجة الاهمية"),
        "delay": MessageLookupByLibrary.simpleMessage("تأخير"),
        "delay_days": MessageLookupByLibrary.simpleMessage("ايام التأخير"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "delete_account": MessageLookupByLibrary.simpleMessage("حذف حسابي"),
        "delete_account_message": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد انك تريد حذف حسابك ؟ "),
        "delete_all": MessageLookupByLibrary.simpleMessage("حذف الكل"),
        "delete_area": MessageLookupByLibrary.simpleMessage("حذف المنطقة"),
        "delete_camera": MessageLookupByLibrary.simpleMessage("حذف كاميرا"),
        "delete_custody": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد انك تريد حذف هذه العهدة ؟"),
        "delete_employment_official_data":
            MessageLookupByLibrary.simpleMessage("حذف بيانات مسئول التوظيف"),
        "delete_focus_point":
            MessageLookupByLibrary.simpleMessage("حذف نقطة التمركز"),
        "delete_punishment":
            MessageLookupByLibrary.simpleMessage("حذف العقوبة"),
        "delete_time": MessageLookupByLibrary.simpleMessage("حذف الوقت"),
        "delete_user": MessageLookupByLibrary.simpleMessage("حذف المستخدم"),
        "delivery_date": MessageLookupByLibrary.simpleMessage("تاريخ الاستلام"),
        "denied_camera_permission": MessageLookupByLibrary.simpleMessage(
            "عذرًا ، يجب عليك الانتقال إلى إعدادات التطبيق والسماح بالوصول إلى الكاميرا حتى تتمكن من مسح رمز qr ضوئيًا"),
        "departure_registration":
            MessageLookupByLibrary.simpleMessage("تسجيل انصراف"),
        "deposit": MessageLookupByLibrary.simpleMessage("الايداع"),
        "description": MessageLookupByLibrary.simpleMessage("الوصف"),
        "deserved_amount":
            MessageLookupByLibrary.simpleMessage("المبلغ المستحق"),
        "details": MessageLookupByLibrary.simpleMessage("تفاصيل"),
        "determine_covenant_number":
            MessageLookupByLibrary.simpleMessage("حدد رقم العهدة"),
        "determine_prohibited_days":
            MessageLookupByLibrary.simpleMessage("حدد الايام المحظوره"),
        "determine_shift_hours":
            MessageLookupByLibrary.simpleMessage("حدد مواعيد العمل"),
        "did_not_receive_code":
            MessageLookupByLibrary.simpleMessage("لم تستلم الكود؟"),
        "direction_directed":
            MessageLookupByLibrary.simpleMessage("الجهه الموجهه اليها"),
        "direction_to":
            MessageLookupByLibrary.simpleMessage("الجهه الموجه اليها"),
        "discard": MessageLookupByLibrary.simpleMessage("تجاهل"),
        "discount_certificate_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل شهادة الخصم"),
        "discount_criminal_certificate":
            MessageLookupByLibrary.simpleMessage("خصم شهادة خلو السوابق"),
        "discount_percentage":
            MessageLookupByLibrary.simpleMessage("نسبة الخصم"),
        "discount_value": MessageLookupByLibrary.simpleMessage("قيمة الخصم"),
        "do_want_to_enable_it":
            MessageLookupByLibrary.simpleMessage("هل تريد تمكينها؟"),
        "do_you_navigation_map": MessageLookupByLibrary.simpleMessage(
            " هل تريد  التوجه  الي تطبيق جوجل ماب "),
        "dont_have_acount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب ؟ سجل الان"),
        "dont_have_work_time":
            MessageLookupByLibrary.simpleMessage("لا يوجد  وقت عمل"),
        "dont_save": MessageLookupByLibrary.simpleMessage(" اهمال"),
        "download": MessageLookupByLibrary.simpleMessage("تنزيل"),
        "download_file": MessageLookupByLibrary.simpleMessage("تحميل الملف"),
        "download_image": MessageLookupByLibrary.simpleMessage("تحميل الصورة"),
        "download_image_file":
            MessageLookupByLibrary.simpleMessage("تحميل ملف الصورة"),
        "download_qr_code":
            MessageLookupByLibrary.simpleMessage("تحميل QR Code"),
        "download_violation_image":
            MessageLookupByLibrary.simpleMessage("تحميل صورة المخالفة"),
        "driver_name": MessageLookupByLibrary.simpleMessage("اسم السائق"),
        "driver_violations":
            MessageLookupByLibrary.simpleMessage("مخالفات السائق"),
        "drivers": MessageLookupByLibrary.simpleMessage("السائقين"),
        "dta_service":
            MessageLookupByLibrary.simpleMessage(" الحضور والإنصراف"),
        "duration_monthly":
            MessageLookupByLibrary.simpleMessage("مدة الحساب شهريا"),
        "earning_now": MessageLookupByLibrary.simpleMessage(" انضم الآن "),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "edit_additional_sites":
            MessageLookupByLibrary.simpleMessage("تعديل المواقع الاضافية"),
        "edit_area": MessageLookupByLibrary.simpleMessage("تعديل منطقة"),
        "edit_camera": MessageLookupByLibrary.simpleMessage("تعديل كاميرا"),
        "edit_cashifters":
            MessageLookupByLibrary.simpleMessage("تعديل كاشفتر "),
        "edit_classification":
            MessageLookupByLibrary.simpleMessage("تعديل تصنيف  "),
        "edit_condition": MessageLookupByLibrary.simpleMessage("تعديل شرط"),
        "edit_covenant": MessageLookupByLibrary.simpleMessage("تعديل العُهد"),
        "edit_covenant_received":
            MessageLookupByLibrary.simpleMessage("تعديل العهد المستلمه"),
        "edit_data": MessageLookupByLibrary.simpleMessage("تعديل البيانات"),
        "edit_data_vehicles":
            MessageLookupByLibrary.simpleMessage("تعديل بيانات المركبة"),
        "edit_date_time":
            MessageLookupByLibrary.simpleMessage("تعديل التاريخ والوقت"),
        "edit_employee": MessageLookupByLibrary.simpleMessage("تعديل موظف"),
        "edit_employment_official_data":
            MessageLookupByLibrary.simpleMessage("تعديل بيانات مسئول توظيف"),
        "edit_focus_point":
            MessageLookupByLibrary.simpleMessage("تعديل نقطة التمركز"),
        "edit_focus_point_data":
            MessageLookupByLibrary.simpleMessage("تعديل بيانات نقطة التمركز"),
        "edit_focus_point_times":
            MessageLookupByLibrary.simpleMessage("تعديل اوقات نقطة التمركز"),
        "edit_insurance": MessageLookupByLibrary.simpleMessage("تعديل التأمين"),
        "edit_map": MessageLookupByLibrary.simpleMessage("تعديل الخريطة"),
        "edit_opportunity":
            MessageLookupByLibrary.simpleMessage("تعديل الفرصة"),
        "edit_password":
            MessageLookupByLibrary.simpleMessage("تعديل كلمة السر"),
        "edit_period": MessageLookupByLibrary.simpleMessage("تعديل الفترة "),
        "edit_pricing":
            MessageLookupByLibrary.simpleMessage("تعديل  تسعيرة  الفترة"),
        "edit_project_data":
            MessageLookupByLibrary.simpleMessage("تعديل بيانات المشروع"),
        "edit_punishment":
            MessageLookupByLibrary.simpleMessage("تعديل العقوبه"),
        "edit_select_map":
            MessageLookupByLibrary.simpleMessage("تعديل تحديد المنطقة"),
        "edit_task_responsibility":
            MessageLookupByLibrary.simpleMessage("تعديل مهمة او مسؤولية"),
        "edit_user_profile":
            MessageLookupByLibrary.simpleMessage("تعديل بيانات المستخدم"),
        "edit_vehicle": MessageLookupByLibrary.simpleMessage("تعديل المركبة"),
        "edit_violation": MessageLookupByLibrary.simpleMessage("تعديل مخالفة"),
        "edit_violation_type":
            MessageLookupByLibrary.simpleMessage("تعديل نوع مخالفة"),
        "education": MessageLookupByLibrary.simpleMessage("التعليم"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "employee": MessageLookupByLibrary.simpleMessage(" موظف"),
        "employee_already_added":
            MessageLookupByLibrary.simpleMessage("تم إضافة الموظف بالفعل"),
        "employee_certificate":
            MessageLookupByLibrary.simpleMessage("شهادة الموظف"),
        "employee_data": MessageLookupByLibrary.simpleMessage("بيانات الموظف"),
        "employee_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل الموظف"),
        "employee_name": MessageLookupByLibrary.simpleMessage("اسم المتقدم"),
        "employee_not_found":
            MessageLookupByLibrary.simpleMessage("لم يتم العثور على الموظف"),
        "employee_type": MessageLookupByLibrary.simpleMessage("نوع الموظف"),
        "employees": MessageLookupByLibrary.simpleMessage("الموظفين"),
        "employees_certificates":
            MessageLookupByLibrary.simpleMessage("شهادات الموظفين"),
        "employment_department":
            MessageLookupByLibrary.simpleMessage("اداره التوظيف"),
        "employment_management":
            MessageLookupByLibrary.simpleMessage("اداره التوظيف"),
        "employment_officials":
            MessageLookupByLibrary.simpleMessage("مسئولي التوظيف"),
        "empty_tasks_and_duties":
            MessageLookupByLibrary.simpleMessage("لا يوجد مهام و واجبات"),
        "enable": MessageLookupByLibrary.simpleMessage("تمكين"),
        "end_but": MessageLookupByLibrary.simpleMessage(" انتهاء "),
        "end_date": MessageLookupByLibrary.simpleMessage("تاريخ النهاية"),
        "end_date_blocking":
            MessageLookupByLibrary.simpleMessage("تاريخ انهاء الحجب :"),
        "end_field_survey":
            MessageLookupByLibrary.simpleMessage("انهاء المسح الميداني"),
        "end_field_survey_warning_msg": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من انهاء المسح الميداني؟"),
        "end_overtime":
            MessageLookupByLibrary.simpleMessage("إنها الوقت الإضافي"),
        "end_time": MessageLookupByLibrary.simpleMessage("نهاية الوقت"),
        "end_tour": MessageLookupByLibrary.simpleMessage("انهاء الجولة"),
        "end_work": MessageLookupByLibrary.simpleMessage("نهاية العمل"),
        "enter_birthdate": MessageLookupByLibrary.simpleMessage(
            "ادخل تاريخ الميلاد ( هجري  او ميلادي )"),
        "enter_email":
            MessageLookupByLibrary.simpleMessage("ادخل البريد الالكتروني"),
        "enter_full_name":
            MessageLookupByLibrary.simpleMessage("ادخل الاسم  بالكامل"),
        "enter_id_number":
            MessageLookupByLibrary.simpleMessage("ادخل رقم الهوية"),
        "enter_length": MessageLookupByLibrary.simpleMessage("ادخل الطول"),
        "enter_loan_amount":
            MessageLookupByLibrary.simpleMessage("اكتب قيمه السلفه"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("ادخل كلمه المرور"),
        "enter_password_again":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور مرة أخرى"),
        "enter_phone_number":
            MessageLookupByLibrary.simpleMessage("أدخل رقم الهاتف"),
        "enter_weight": MessageLookupByLibrary.simpleMessage("ادخل الوزن"),
        "enter_your_phone_number_retrieve_password":
            MessageLookupByLibrary.simpleMessage(
                "ادخل رقم الهاتف الخاص بك لاسترجاع كلمة المرور"),
        "entity": MessageLookupByLibrary.simpleMessage("الجهة"),
        "error_internet_connection":
            MessageLookupByLibrary.simpleMessage("خطأ في الاتصال بالشبكة"),
        "error_qr": MessageLookupByLibrary.simpleMessage(
            "هذا الكود غير مخصص لهذا المشروع"),
        "exclusive": MessageLookupByLibrary.simpleMessage("فرصة مميزة"),
        "exit_app": MessageLookupByLibrary.simpleMessage("خروج من التطبيق"),
        "expair_date_license":
            MessageLookupByLibrary.simpleMessage("تاريخ انتهاء الرخصة"),
        "expire_date":
            MessageLookupByLibrary.simpleMessage("تاريخ انتهاء الصلاحيه"),
        "expired": MessageLookupByLibrary.simpleMessage("نفذت"),
        "face_image_required_proceed": MessageLookupByLibrary.simpleMessage(
            "يجب اضافة بصمة الوجه للمتابعة"),
        "face_not_matched":
            MessageLookupByLibrary.simpleMessage("بصمة الوجه غير متطابقة"),
        "face_print": MessageLookupByLibrary.simpleMessage("بصمة الوجه"),
        "face_recognition_service_permission_message":
            MessageLookupByLibrary.simpleMessage(
                "يحتاج التطبيق السماح بإستخدام الكاميرا وملفات الذاكرة , من فضلك اضف الاذونات من خلال الاعدادت"),
        "failed_processing":
            MessageLookupByLibrary.simpleMessage("عدد الغير مكتمل :"),
        "favorite_jobs": MessageLookupByLibrary.simpleMessage("الفرص المفضلة"),
        "favorite_places":
            MessageLookupByLibrary.simpleMessage("الأماكن المفضلة"),
        "favorite_projects":
            MessageLookupByLibrary.simpleMessage("اماكن العمل المفضلة"),
        "favorite_projects_not_selected": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بتحديد اماكن عملك المفضلة"),
        "favorite_proportion":
            MessageLookupByLibrary.simpleMessage(" الفرص المفضله"),
        "favorite_work_times":
            MessageLookupByLibrary.simpleMessage("فترات العمل المفضلة"),
        "favorite_working_hours":
            MessageLookupByLibrary.simpleMessage("عدد ساعات العمل المفضلة"),
        "female": MessageLookupByLibrary.simpleMessage("انثي"),
        "field_type": MessageLookupByLibrary.simpleMessage("نوع المجال"),
        "filter": MessageLookupByLibrary.simpleMessage("فلتره"),
        "final_fingerprint":
            MessageLookupByLibrary.simpleMessage("بصمة انصراف نهائيه"),
        "find_your_city":
            MessageLookupByLibrary.simpleMessage("ابحث عن مدينتك"),
        "finding_place":
            MessageLookupByLibrary.simpleMessage("جارٍ البحث عن مكان ..."),
        "fines_discount": MessageLookupByLibrary.simpleMessage("خصم مخالفات"),
        "fingerprint_type": MessageLookupByLibrary.simpleMessage("نوع البصمة"),
        "finish": MessageLookupByLibrary.simpleMessage("إنهاء الدوام"),
        "finish_shift_label":
            MessageLookupByLibrary.simpleMessage("إنهاء الدوام لفترة عمل "),
        "finish_tracking": MessageLookupByLibrary.simpleMessage("ينتهي"),
        "finished": MessageLookupByLibrary.simpleMessage("منتهية"),
        "finished_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص المنتهية"),
        "first_period": MessageLookupByLibrary.simpleMessage("الفتره الاولي"),
        "focus_point_data":
            MessageLookupByLibrary.simpleMessage("بيانات نقطة التمركز"),
        "focus_point_location_message": MessageLookupByLibrary.simpleMessage(
            "يجب تفعيل اللوكيشن قبل اضافة نقطة تمركز"),
        "focus_point_times":
            MessageLookupByLibrary.simpleMessage("اوقات نقطة التمركز"),
        "follow": MessageLookupByLibrary.simpleMessage("متابعة"),
        "follow_tours": MessageLookupByLibrary.simpleMessage("متابعة الجولات"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
        "fourth_period": MessageLookupByLibrary.simpleMessage("الفتره الرابعه"),
        "from": MessageLookupByLibrary.simpleMessage("من "),
        "from_day": MessageLookupByLibrary.simpleMessage("من يوم "),
        "from_month_week": MessageLookupByLibrary.simpleMessage("منذ شهر"),
        "from_tow_week": MessageLookupByLibrary.simpleMessage("منذ اسبوعين"),
        "from_week": MessageLookupByLibrary.simpleMessage("منذ اسبوع"),
        "front_camera":
            MessageLookupByLibrary.simpleMessage("الكاميرا الامامية"),
        "further_information": MessageLookupByLibrary.simpleMessage(
            "لمعلومات أخرى يمكنك التواصل مع "),
        "gallery": MessageLookupByLibrary.simpleMessage("المعرض"),
        "gas_stations": MessageLookupByLibrary.simpleMessage(" محطات الوقود "),
        "gate_number": m0,
        "gate_type": MessageLookupByLibrary.simpleMessage("نوع البوابه : "),
        "gates": MessageLookupByLibrary.simpleMessage("بوابات"),
        "gender": MessageLookupByLibrary.simpleMessage("الجنس"),
        "general_conditions":
            MessageLookupByLibrary.simpleMessage("الشروط العامة"),
        "general_settings":
            MessageLookupByLibrary.simpleMessage("الإعدادات العامة"),
        "generalizations": MessageLookupByLibrary.simpleMessage("التعاميم"),
        "get_me_on_your_way":
            MessageLookupByLibrary.simpleMessage("وصلنى على طريقك"),
        "go_violation_site":
            MessageLookupByLibrary.simpleMessage("توجه لموقع المخالفة"),
        "good_evening": MessageLookupByLibrary.simpleMessage("مساء الخير"),
        "good_morning": MessageLookupByLibrary.simpleMessage("صباح الخير"),
        "goto_map":
            MessageLookupByLibrary.simpleMessage("عرض الموقع علي الخريطة"),
        "gregorian_date": MessageLookupByLibrary.simpleMessage("تاريخ ميلادي"),
        "has_a_car": MessageLookupByLibrary.simpleMessage(
            "ان كنت تمتلك سيارة ,هل تود زيادة دخلك؟\n"),
        "has_not_a_car": MessageLookupByLibrary.simpleMessage(
            "ان كنت لا تمتلك سيارة هل تود توصيلك للعمل؟"),
        "have_account":
            MessageLookupByLibrary.simpleMessage("امتلك حساب ؟ تسجيل الدخول"),
        "height": MessageLookupByLibrary.simpleMessage("الطول"),
        "hijri": MessageLookupByLibrary.simpleMessage("هجري"),
        "hijri_date": MessageLookupByLibrary.simpleMessage("تاريخ هجري"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "home_address": MessageLookupByLibrary.simpleMessage("عنوان المنزل"),
        "hour": MessageLookupByLibrary.simpleMessage("ساعة"),
        "hours": MessageLookupByLibrary.simpleMessage("ساعات "),
        "how_accept_job":
            MessageLookupByLibrary.simpleMessage("طريقة قبول الفرصه"),
        "i_accept": MessageLookupByLibrary.simpleMessage("أوافق على"),
        "i_accept_to": MessageLookupByLibrary.simpleMessage("اوافق علي"),
        "iban": MessageLookupByLibrary.simpleMessage("ايبان"),
        "iban_not_matched":
            MessageLookupByLibrary.simpleMessage("رقم الايبان غير متطابق"),
        "iban_numbers_saudi_bank_customers_accepted":
            MessageLookupByLibrary.simpleMessage(
                "يقبل فقط ارقام ايبان الخاصة بعملاء بنوك السعودية"),
        "id_number": MessageLookupByLibrary.simpleMessage("رقم الهوية"),
        "id_number_recipient_account":
            MessageLookupByLibrary.simpleMessage("رقم الهوية لحساب المستلم"),
        "image_after_maintenance":
            MessageLookupByLibrary.simpleMessage(" صورة بعد الصيانة "),
        "image_before_maintenance":
            MessageLookupByLibrary.simpleMessage(" صورة قبل الصيانة "),
        "important_disclosure":
            MessageLookupByLibrary.simpleMessage("توضيح هام"),
        "in_progress": MessageLookupByLibrary.simpleMessage("جاري المعالجة"),
        "in_work": MessageLookupByLibrary.simpleMessage("علي رأس العمل"),
        "inactive": MessageLookupByLibrary.simpleMessage("غير نشط"),
        "inactive_f": MessageLookupByLibrary.simpleMessage("غير نشطه"),
        "incomplete_receipt":
            MessageLookupByLibrary.simpleMessage("غير مكتملة الاستلام"),
        "infringement": MessageLookupByLibrary.simpleMessage("مخالفه :"),
        "installment_amount":
            MessageLookupByLibrary.simpleMessage("قيمه القسط"),
        "installment_package":
            MessageLookupByLibrary.simpleMessage("باقة التقسيط"),
        "installment_postponement_desc": MessageLookupByLibrary.simpleMessage(
            "في حال التأكيد علي عدم الموافقه في اصدار الوثيقه سوف يتم تجميد الحساب"),
        "installment_with_cashift_note": MessageLookupByLibrary.simpleMessage(
            "في حالة عدم  تكملة الاقساط لا يحق لك المطالبه بالاقساط المدفوعه"),
        "insurance": MessageLookupByLibrary.simpleMessage("التأمين"),
        "invalid_ar_name":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال الاسم بالعربي"),
        "invalid_bank_id": MessageLookupByLibrary.simpleMessage("رقم غير صحيح"),
        "invalid_city":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار المدينة"),
        "invalid_comp_level": MessageLookupByLibrary.simpleMessage(
            "يرجى اختيار مستوى الحاسب الالي"),
        "invalid_date": MessageLookupByLibrary.simpleMessage("تاريخ غير صحيح"),
        "invalid_email":
            MessageLookupByLibrary.simpleMessage("البريد الإلكتروني غير صحيح"),
        "invalid_en_name": MessageLookupByLibrary.simpleMessage(
            "يرجى إدخال الاسم بالانجليزية"),
        "invalid_height": MessageLookupByLibrary.simpleMessage("طول غير صحيح"),
        "invalid_iban":
            MessageLookupByLibrary.simpleMessage("رقم الايبان غير صحيح"),
        "invalid_id_number":
            MessageLookupByLibrary.simpleMessage("رقم الهوية غير صحيح"),
        "invalid_lang_level": MessageLookupByLibrary.simpleMessage(
            "يرجى اختيار مستوى اللغة الانجليزية"),
        "invalid_length":
            MessageLookupByLibrary.simpleMessage("الطول غير صحيح"),
        "invalid_name":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال الاسم"),
        "invalid_password": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب الا تقل عن ستة حروف او ارقام"),
        "invalid_phone": MessageLookupByLibrary.simpleMessage(
            "رقم الهاتف الذي ادخلته غير صحيح . قم بأدخال رقم الهاتف صحيح "),
        "invalid_qr_code":
            MessageLookupByLibrary.simpleMessage("رمز QR غير صالح"),
        "invalid_qualifi":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار المؤهل العلمي"),
        "invalid_qualification_name":
            MessageLookupByLibrary.simpleMessage("يرجي ادخال اسم المؤهل"),
        "invalid_weight": MessageLookupByLibrary.simpleMessage("وزن غير صحيح"),
        "job": MessageLookupByLibrary.simpleMessage("وظيفة"),
        "job_description": MessageLookupByLibrary.simpleMessage("وصف الوظيفة"),
        "job_duties": MessageLookupByLibrary.simpleMessage("مهام العمل"),
        "job_field": MessageLookupByLibrary.simpleMessage("مجال الوظيفي"),
        "job_opportunity": MessageLookupByLibrary.simpleMessage("شروط الفرصة"),
        "job_opportunity_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل فرصة العمل"),
        "job_requirements":
            MessageLookupByLibrary.simpleMessage(" متطلبات الوظيفه"),
        "job_terms_and_conditions":
            MessageLookupByLibrary.simpleMessage("شروط وأحكام الوظيفة"),
        "job_uniform": MessageLookupByLibrary.simpleMessage("الزي الوظيفي"),
        "jobs": MessageLookupByLibrary.simpleMessage("الوظائف"),
        "jobs_in_waiting":
            MessageLookupByLibrary.simpleMessage("فرص في انتظارك "),
        "jobs_review": MessageLookupByLibrary.simpleMessage("مراجعة الوظائف"),
        "join": MessageLookupByLibrary.simpleMessage("التحاق"),
        "km_h": MessageLookupByLibrary.simpleMessage("كم/س"),
        "landing_page_desc1": MessageLookupByLibrary.simpleMessage(
            "اول منصة الكترونية مسجلة لدى هيئة الملكية الفكرية توفر فرص بشكل يومي بنظام الساعة والدفع فوري فور انتهاء ساعات عملك بواسطة احدث طرق الدفع "),
        "landing_page_desc2": MessageLookupByLibrary.simpleMessage(
            "مع كاشفت ابحث عن الفرص التي تناسبك و ابدأ في رحلة رفع مستوي دخلك"),
        "landing_page_desc3": MessageLookupByLibrary.simpleMessage(
            "نظام متكامل لحفظ حقوق جميع الاطراف من خلال QRCode المخصص لمنصة كاشفت والذي تستطيع من خلاله تسجيل الحضور والانصراف بمنتهى السهولة"),
        "landing_page_desc4": MessageLookupByLibrary.simpleMessage(
            "ابدا دوامك وتابع اداء عملك وانهي دوامك في الوقت المحدد واحصل علي المقابل المالي بشكل فوري "),
        "landing_page_title1":
            MessageLookupByLibrary.simpleMessage("مرحباً بك في كاشفت"),
        "landing_page_title2":
            MessageLookupByLibrary.simpleMessage("اختر الفرصة المناسبه لك"),
        "landing_page_title3": MessageLookupByLibrary.simpleMessage(
            "سجل حضورك وانصرافك من خلال QRCode"),
        "landing_page_title4": MessageLookupByLibrary.simpleMessage(
            "الحصول بشكل فوري علي المقابل المادي"),
        "last_pricing":
            MessageLookupByLibrary.simpleMessage("التسعيرات السابقه"),
        "leave": MessageLookupByLibrary.simpleMessage("الانصراف"),
        "leave_period": MessageLookupByLibrary.simpleMessage("فتره الاستئذان"),
        "length": MessageLookupByLibrary.simpleMessage("الطول"),
        "lets_start": MessageLookupByLibrary.simpleMessage("فلنبدأ"),
        "level_computer":
            MessageLookupByLibrary.simpleMessage("المستوي في الكمبيوتر"),
        "level_education":
            MessageLookupByLibrary.simpleMessage("المؤهل التعليمي"),
        "level_eng":
            MessageLookupByLibrary.simpleMessage("المستوي في الانجليزي"),
        "license_and_plate_information":
            MessageLookupByLibrary.simpleMessage("معلومات اللوحة والرخصة"),
        "license_expiry_date":
            MessageLookupByLibrary.simpleMessage("تاريخ انتهاء الرخصة"),
        "license_number": MessageLookupByLibrary.simpleMessage("رقم الرخصة"),
        "list_empty": MessageLookupByLibrary.simpleMessage("القائمة فارغة"),
        "list_gates_added":
            MessageLookupByLibrary.simpleMessage("قائمة البوابات المضافة"),
        "live_feed": MessageLookupByLibrary.simpleMessage("بث المباشر"),
        "live_streaming": MessageLookupByLibrary.simpleMessage("بث مباشر"),
        "load_failed_refresh_data": MessageLookupByLibrary.simpleMessage(
            "فشل التحميل، قم بتحديث البيانات"),
        "load_more": MessageLookupByLibrary.simpleMessage("تحميل المزيد"),
        "loan": MessageLookupByLibrary.simpleMessage("سلفة :"),
        "loan_request_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل طلب السلفه"),
        "loan_request_type":
            MessageLookupByLibrary.simpleMessage("نوع طلب السلفه"),
        "loan_requests": MessageLookupByLibrary.simpleMessage("طلبات السلفه"),
        "loan_start_date":
            MessageLookupByLibrary.simpleMessage("تاريخ بداية السلفه"),
        "loan_type": MessageLookupByLibrary.simpleMessage("نوع السلفة"),
        "loan_value": MessageLookupByLibrary.simpleMessage("قيمة السلفة"),
        "loans": MessageLookupByLibrary.simpleMessage("السُلف"),
        "loans_collection":
            MessageLookupByLibrary.simpleMessage("تحصيل السلف "),
        "locate_area_map": MessageLookupByLibrary.simpleMessage(
            "قم بتحديد المنطقة علي الخريطة"),
        "location": MessageLookupByLibrary.simpleMessage("الموقع"),
        "location_accuracy": MessageLookupByLibrary.simpleMessage("دقة الموقع"),
        "location_disclosure": MessageLookupByLibrary.simpleMessage(
            "يجمع هذا التطبيق بيانات الموقع لمساعدتك في العثور على الفرص القريبة والتحقق من موقعك عند بدء العمل، حتى عندما يكون التطبيق مغلقًا أو غير قيد الاستخدام."),
        "location_gas_stations": MessageLookupByLibrary.simpleMessage(
            "موقع محطة الوقود علي الخريطة"),
        "location_name": MessageLookupByLibrary.simpleMessage("اسم الموقع"),
        "location_service_permission_message": MessageLookupByLibrary.simpleMessage(
            "*يحتاج تطبيق كاشفت السماح بإستخدام خدمة الموقع الجغرافي ليمكن للتطبيق إرسال موقع العمل الخاص بالوظيفة الخاص بك للتحقق من وجودك في موقع العمل الصحيح."),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "login_button": MessageLookupByLibrary.simpleMessage("متابعة"),
        "login_title": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "logout_message": MessageLookupByLibrary.simpleMessage(
            "هل انت متأكد من انك تريد تسجيل الخروج ؟"),
        "main_location": MessageLookupByLibrary.simpleMessage("الموقع الرئيسي"),
        "maintenance": MessageLookupByLibrary.simpleMessage("صيانة"),
        "male": MessageLookupByLibrary.simpleMessage("ذكر"),
        "manager_name": MessageLookupByLibrary.simpleMessage("اسم المسئول"),
        "map": MessageLookupByLibrary.simpleMessage("الخريطة"),
        "mark_box_map":
            MessageLookupByLibrary.simpleMessage("تحديد المنطقة علي الخريطة"),
        "maximum": MessageLookupByLibrary.simpleMessage("الحد الاقصي"),
        "maximum_recorded_speed":
            MessageLookupByLibrary.simpleMessage("أقصى سرعة مسجلة"),
        "maximum_speed": MessageLookupByLibrary.simpleMessage("أقصي سرعة"),
        "menu_applicants":
            MessageLookupByLibrary.simpleMessage("قائمة المتقدمين"),
        "method_accept_employees":
            MessageLookupByLibrary.simpleMessage("طريقه قبول المتقدمين"),
        "method_arrival_departure":
            MessageLookupByLibrary.simpleMessage("طريقة الحضور والانصراف"),
        "method_calculating_opportunity":
            MessageLookupByLibrary.simpleMessage("طريقة حساب الفرصة"),
        "method_selecting_employees":
            MessageLookupByLibrary.simpleMessage("طريقة اختيار المتقدمين"),
        "metre": MessageLookupByLibrary.simpleMessage("متر"),
        "military_service_disclosure": MessageLookupByLibrary.simpleMessage(
            "اتعهد بإنني لا اعمل لدى اي جهة عسكرية وفي حالة حدث ذلك اتحمل المسئولية كاملة بصفة خاصة وليس لكاشفت ادنى مسئولية عن جهة عملي ."),
        "minimum": MessageLookupByLibrary.simpleMessage("الحد الادني"),
        "minute": MessageLookupByLibrary.simpleMessage("دقيقة"),
        "mobile_number": MessageLookupByLibrary.simpleMessage("رقم الجوال"),
        "mobile_number_change_requests":
            MessageLookupByLibrary.simpleMessage("طلبات تغيير رقم الجوال"),
        "mobile_number_new":
            MessageLookupByLibrary.simpleMessage("رقم الجوال الجديد"),
        "model": MessageLookupByLibrary.simpleMessage("الموديل "),
        "model_name": MessageLookupByLibrary.simpleMessage("اسم الموديل"),
        "model_year": MessageLookupByLibrary.simpleMessage("سنة الموديل"),
        "monthly_installment":
            MessageLookupByLibrary.simpleMessage("القسط الشهري"),
        "months": MessageLookupByLibrary.simpleMessage("أشهر"),
        "more_details":
            MessageLookupByLibrary.simpleMessage("المزيد من التفاصيل"),
        "more_than": MessageLookupByLibrary.simpleMessage("المزيد من التفاصيل"),
        "more_than_about_emp": MessageLookupByLibrary.simpleMessage(
            "لمعرفة المزيد عن هذا الموظف  "),
        "mosques": MessageLookupByLibrary.simpleMessage("مساجد"),
        "must_be_arabic_letters":
            MessageLookupByLibrary.simpleMessage("يجب ان تكون حروف عربية"),
        "must_be_english_letters":
            MessageLookupByLibrary.simpleMessage("يجب ان تكون حروف انجليزية"),
        "must_choose_where_send_verification_code":
            MessageLookupByLibrary.simpleMessage(
                "يجب اختيار اين تريد ارسال كود التحقق"),
        "must_login_first":
            MessageLookupByLibrary.simpleMessage("يجب تسجيل الدخول اولا"),
        "my_dues": MessageLookupByLibrary.simpleMessage("المعاملات المالية"),
        "my_focus_points":
            MessageLookupByLibrary.simpleMessage("نقاط التمركز الخاصه بي "),
        "my_gates": MessageLookupByLibrary.simpleMessage("بواباتي"),
        "my_work_points": MessageLookupByLibrary.simpleMessage("نقاط عملي"),
        "mywallet": MessageLookupByLibrary.simpleMessage("محفظتي"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "name_ar": MessageLookupByLibrary.simpleMessage("الاسم بالعربي"),
        "name_en": MessageLookupByLibrary.simpleMessage("الاسم بالانجليزية"),
        "name_en_gas_stations":
            MessageLookupByLibrary.simpleMessage("اسم محطة الوقود بالانجليزية"),
        "name_gas_stations":
            MessageLookupByLibrary.simpleMessage("اسم محطة الوقود بالعربي "),
        "name_mole": MessageLookupByLibrary.simpleMessage("اسم المول :"),
        "name_receipt":
            MessageLookupByLibrary.simpleMessage("الموظف المُستلِم "),
        "nationality": MessageLookupByLibrary.simpleMessage("الجنسيه"),
        "navigate": MessageLookupByLibrary.simpleMessage("الإتجاهات"),
        "navigate_to_current_location_des":
            MessageLookupByLibrary.simpleMessage(
                "هل تريد تعديل الموقع لموقعك الحالي؟"),
        "nearby_places":
            MessageLookupByLibrary.simpleMessage("الاماكن المجاورة"),
        "net": MessageLookupByLibrary.simpleMessage("الصافي"),
        "net_amount_transferred":
            MessageLookupByLibrary.simpleMessage("صافي المبلغ المحول"),
        "new_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "new_jobs": MessageLookupByLibrary.simpleMessage("عروض جديدة"),
        "new_mobile_number":
            MessageLookupByLibrary.simpleMessage("رقم الجوال الجديد"),
        "new_password":
            MessageLookupByLibrary.simpleMessage("كلمة السر الجديدة"),
        "new_version_available": MessageLookupByLibrary.simpleMessage(
            "يتوفر تحديث للتطبيق يجب تحميله"),
        "next": MessageLookupByLibrary.simpleMessage("التالي"),
        "next_button": MessageLookupByLibrary.simpleMessage("التالي"),
        "no": MessageLookupByLibrary.simpleMessage("لا"),
        "no_deductions":
            MessageLookupByLibrary.simpleMessage(" لا يوجد اي مستقطعات"),
        "no_employee": MessageLookupByLibrary.simpleMessage("لا يوجد موظفين "),
        "no_employee_decr": MessageLookupByLibrary.simpleMessage(
            "قم بتحديد اسم المشروع اولاً ليظهرلك الموظفين "),
        "no_focus_points_found_to_search_result":
            MessageLookupByLibrary.simpleMessage(
                "لا يوجد نقاط تمركز مطابقة لنتيجة البحث"),
        "no_installment": MessageLookupByLibrary.simpleMessage("عدد الاقساط"),
        "no_internet": MessageLookupByLibrary.simpleMessage(
            "عفوا لا يوجد اتصال بشبكة الانترنت !"),
        "no_internet_description": MessageLookupByLibrary.simpleMessage(
            "نظراً لعدم اتصال جهازك بالانترنت يمكنك تسجيل الحضور عن طريق :"),
        "no_more_data":
            MessageLookupByLibrary.simpleMessage("لا يوجد المزيد من البيانات"),
        "no_results_found":
            MessageLookupByLibrary.simpleMessage("لم يتم العثور على نتائج"),
        "no_thanks": MessageLookupByLibrary.simpleMessage("لا شكراً"),
        "nods": MessageLookupByLibrary.simpleMessage("الملاحظات"),
        "not_active": MessageLookupByLibrary.simpleMessage("تم الايقاف"),
        "not_added_phone_wallet_data": MessageLookupByLibrary.simpleMessage(
            "لم تقم بإضافة بيانات محفظة الهاتف"),
        "not_collected": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
        "not_completed": MessageLookupByLibrary.simpleMessage("لم يكتمل"),
        "not_entitled_ask": MessageLookupByLibrary.simpleMessage(
            "لا يحق لك مطالبة التطبيق باسترجاع الأموال في حاله الخطأ"),
        "not_found_applicants":
            MessageLookupByLibrary.simpleMessage("لم يتم العثور على متقدمين"),
        "not_found_data":
            MessageLookupByLibrary.simpleMessage("لا توجد بيانات"),
        "not_now": MessageLookupByLibrary.simpleMessage("ليس الان"),
        "notes": MessageLookupByLibrary.simpleMessage("ملاحظات"),
        "notice_receipt_delivery":
            MessageLookupByLibrary.simpleMessage("إشعار استلام وتسلم"),
        "notice_receipt_delivery_desc": MessageLookupByLibrary.simpleMessage(
            "يجب التأكد من حالة العهدة اولا قبل استلامها"),
        "notifications": MessageLookupByLibrary.simpleMessage("الاشعارات"),
        "num": MessageLookupByLibrary.simpleMessage("العدد"),
        "num_accepted": MessageLookupByLibrary.simpleMessage("عدد المقبولين"),
        "num_applicants": MessageLookupByLibrary.simpleMessage("عدد المتقدمين"),
        "num_prohibited_days":
            MessageLookupByLibrary.simpleMessage("عدد الايام المحظورة"),
        "num_reserve": MessageLookupByLibrary.simpleMessage("عدد الاحتياطي"),
        "number_field_survey_hours":
            MessageLookupByLibrary.simpleMessage("عدد ساعات المسح الميداني"),
        "number_hour": MessageLookupByLibrary.simpleMessage("عدد الساعات"),
        "number_insurance": MessageLookupByLibrary.simpleMessage("رقم التأمين"),
        "number_minutes": MessageLookupByLibrary.simpleMessage("عدد الدقائق"),
        "number_months_installment":
            MessageLookupByLibrary.simpleMessage("عدد أشهر الاقساط"),
        "number_months_loan":
            MessageLookupByLibrary.simpleMessage("عدد أشهر السلفه"),
        "number_plate": MessageLookupByLibrary.simpleMessage("رقم اللوحة"),
        "number_req": MessageLookupByLibrary.simpleMessage("العدد المطلوب :"),
        "number_required_for_opportunity":
            MessageLookupByLibrary.simpleMessage("العدد المطلوب للفرصة"),
        "occupation": MessageLookupByLibrary.simpleMessage("المهنة"),
        "offer_description": MessageLookupByLibrary.simpleMessage("وصف الفرصة"),
        "offer_details": MessageLookupByLibrary.simpleMessage("تفاصيل العرض"),
        "offer_terms": MessageLookupByLibrary.simpleMessage("شروط الفرصة"),
        "offer_you_service": MessageLookupByLibrary.simpleMessage(
            "نقدم لك خدمة إشعار الغياب  وهو ابلغنا بعدم حضورك قبل بداية وقت عملك ب 12 ساعه ومنها سيتم خصم يوم الغياب فقط دون جزاء حرصاً وتقديراً لظروفك"),
        "offers": MessageLookupByLibrary.simpleMessage("عرض"),
        "official_wear": MessageLookupByLibrary.simpleMessage("الزي الرسمي"),
        "ok_button": MessageLookupByLibrary.simpleMessage("موافق"),
        "ok_teams_ms": MessageLookupByLibrary.simpleMessage(
            "عليك اولا ان توافق علي هذه التعهدات وقرائتها جيداً بعد ذلك سنرسل طلبك الي المشرف."),
        "on_my_way": MessageLookupByLibrary.simpleMessage("على طريقي"),
        "open_app_settings":
            MessageLookupByLibrary.simpleMessage("فتح إعدادات التطبيق"),
        "open_location": MessageLookupByLibrary.simpleMessage(
            "يجب تشغيل خدمة الموقع للتأكد من وجودك في موقع العمل"),
        "open_location_settings":
            MessageLookupByLibrary.simpleMessage("فتح إعدادات الموقع"),
        "open_map": MessageLookupByLibrary.simpleMessage("فتح الخريطة"),
        "operating_plan": MessageLookupByLibrary.simpleMessage("خطة التشغيل"),
        "opportunities_num":
            MessageLookupByLibrary.simpleMessage("العدد المطلوب للفرصة"),
        "opportunities_review":
            MessageLookupByLibrary.simpleMessage("مراجعة الفرص"),
        "opportunity": MessageLookupByLibrary.simpleMessage("فرصة"),
        "opportunity_classification":
            MessageLookupByLibrary.simpleMessage("تصنيف الفرصة"),
        "opportunity_condition":
            MessageLookupByLibrary.simpleMessage("شروط الوظيفه"),
        "opportunity_conditions":
            MessageLookupByLibrary.simpleMessage("شروط  الفرصة"),
        "opportunity_date":
            MessageLookupByLibrary.simpleMessage("تاريخ الفرصة"),
        "opportunity_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل الفرصة"),
        "opportunity_details_more":
            MessageLookupByLibrary.simpleMessage("تفاصيل معاملات الفرص"),
        "opportunity_name": MessageLookupByLibrary.simpleMessage("أسم الفرصة:"),
        "opportunity_price": MessageLookupByLibrary.simpleMessage("سعر الفرصه"),
        "opportunity_terms":
            MessageLookupByLibrary.simpleMessage("شروط الفرصة"),
        "opportunity_time":
            MessageLookupByLibrary.simpleMessage("موعد الفرصة :"),
        "opportunity_value":
            MessageLookupByLibrary.simpleMessage("قيمة الفرصة"),
        "order_status": MessageLookupByLibrary.simpleMessage("حالة الطلب"),
        "overtime_screen_title": MessageLookupByLibrary.simpleMessage("مكمل"),
        "overview": MessageLookupByLibrary.simpleMessage("نظره عامه"),
        "paid_off": MessageLookupByLibrary.simpleMessage(" تم الصرف"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "password_confirmation":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة السر"),
        "password_not_match":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير متطابقة"),
        "pause": MessageLookupByLibrary.simpleMessage("توقف"),
        "payment": MessageLookupByLibrary.simpleMessage("طرق الدفع "),
        "payment_accepted": MessageLookupByLibrary.simpleMessage("مقبول الدفع"),
        "payment_by_credit_card":
            MessageLookupByLibrary.simpleMessage("عن طريق ال Credit"),
        "payment_by_opportunity_value":
            MessageLookupByLibrary.simpleMessage("اخذ نسبه من قيمة الفرصه"),
        "payment_by_tamara":
            MessageLookupByLibrary.simpleMessage("الدفع عن طريق تمارا"),
        "payment_refused": MessageLookupByLibrary.simpleMessage("مرفوض الدفع"),
        "payments": MessageLookupByLibrary.simpleMessage("المدفوعات"),
        "pdf": MessageLookupByLibrary.simpleMessage("PDF"),
        "per": MessageLookupByLibrary.simpleMessage("مقابل "),
        "period": MessageLookupByLibrary.simpleMessage("الفترة"),
        "period_after_start_opportunity": MessageLookupByLibrary.simpleMessage(
            "فترة السماح بعد بداية الفرصة"),
        "period_before_start_opportunity": MessageLookupByLibrary.simpleMessage(
            "فترة السماح قبل بداية الفرصة"),
        "period_from": MessageLookupByLibrary.simpleMessage("الفترة من"),
        "period_name_ar":
            MessageLookupByLibrary.simpleMessage("اسم الفترة بالعربي"),
        "period_name_en":
            MessageLookupByLibrary.simpleMessage("اسم الفترة بالانجليزي"),
        "period_order": MessageLookupByLibrary.simpleMessage("ترتيب الفترة"),
        "period_pricing": MessageLookupByLibrary.simpleMessage("تسعير الفترة"),
        "period_to": MessageLookupByLibrary.simpleMessage("الفترة الى"),
        "permissions": MessageLookupByLibrary.simpleMessage("الصلاحيات"),
        "person": m1,
        "personal_info":
            MessageLookupByLibrary.simpleMessage("بياناتك الشخصية"),
        "personal_information":
            MessageLookupByLibrary.simpleMessage("معلومات شخصية"),
        "phone": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "phone_not_supported_bio": MessageLookupByLibrary.simpleMessage(
            "هاتفك لا يدعم القياسات الحيوية"),
        "phone_wallet_title":
            MessageLookupByLibrary.simpleMessage("محفظة الهاتف المحمول"),
        "plate_license_info":
            MessageLookupByLibrary.simpleMessage("معلومات اللوحة والرخصة"),
        "plate_number": MessageLookupByLibrary.simpleMessage("رقم اللوحة"),
        "platform_description": MessageLookupByLibrary.simpleMessage(
            "هذه المنصه مسجله لدي الهيئة السعودية للملكية الفكرية"),
        "play": MessageLookupByLibrary.simpleMessage("تشغيل"),
        "please_add_all":
            MessageLookupByLibrary.simpleMessage("من فضلك اكمل الاخيارات"),
        "please_add_logo":
            MessageLookupByLibrary.simpleMessage("برجاء اضافة شعار"),
        "please_agree_pledge":
            MessageLookupByLibrary.simpleMessage(" من فضلك  وافق  علي التعهد"),
        "please_confirm_yes": MessageLookupByLibrary.simpleMessage(
            "من فضلك وافق علي هذه التعهدات"),
        "please_enter_favorite_working_hours":
            MessageLookupByLibrary.simpleMessage(
                "من فضلك قم بإدخال عدد ساعات العمل المفضلة"),
        "please_enter_match_password": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بإدخال كلمة المرور متطابقة"),
        "please_enter_new_password": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بإدخال كلمة السر الجديدة"),
        "please_enter_your_notes":
            MessageLookupByLibrary.simpleMessage("برجاء كتابة ملاحظاتك"),
        "please_entry_birthdate":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال تاريخ الميلاد"),
        "please_entry_height":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال الطول"),
        "please_entry_id":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم الهوية"),
        "please_entry_phone":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم الهاتف"),
        "please_entry_valid_fullName": MessageLookupByLibrary.simpleMessage(
            "يرجى إدخال اسم ثلاثي على الأقل"),
        "please_entry_weight":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال الوزن"),
        "please_entry_whats_number":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم الواتساب"),
        "please_fill_all_fields":
            MessageLookupByLibrary.simpleMessage("من فضلك قم بملء جميع الحقول"),
        "please_fill_iban":
            MessageLookupByLibrary.simpleMessage("من فضلك ادخل رقم الايبان"),
        "please_save_yes": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم بحفظ الاختيارات التي بنعم "),
        "please_select_all_images":
            MessageLookupByLibrary.simpleMessage("من فضلك قم برفع جميع الصور"),
        "please_select_area":
            MessageLookupByLibrary.simpleMessage("من فضلك اختر المنطقة"),
        "please_select_bank":
            MessageLookupByLibrary.simpleMessage("من فضلك اختر البنك"),
        "please_select_company":
            MessageLookupByLibrary.simpleMessage("من فضلك قم بتحديد الشركة"),
        "please_select_current_situation":
            MessageLookupByLibrary.simpleMessage("من فضلك اختر موقفك الحالي"),
        "please_select_district":
            MessageLookupByLibrary.simpleMessage("من فضلك اختر الحى"),
        "please_select_employees":
            MessageLookupByLibrary.simpleMessage("برجاء اختيار المتقدمين"),
        "please_select_permission":
            MessageLookupByLibrary.simpleMessage("برجاء اختيار الصلاحية"),
        "please_select_wallet":
            MessageLookupByLibrary.simpleMessage("من فضلك قم بتحديد محفظة"),
        "please_upload_pdf_image": MessageLookupByLibrary.simpleMessage(
            "من فضلك قم برفع صورة او ملف PDF"),
        "pledge_attachment_accept": MessageLookupByLibrary.simpleMessage(
            "اتعهد بأنني اطّلعت على اصل المرفق واقر  بانه سليم  , واتحمل المسئولية القانونية إذا ثبت عكس ذلك."),
        "pledge_attachment_reject": MessageLookupByLibrary.simpleMessage(
            " عند التأكيد سيتم انتقال هذا المرفق الي قائمة ( تم الرفض )."),
        "pledge_sub_accept": MessageLookupByLibrary.simpleMessage(
            "عليك تأكيد القبول والاقرار بانك اطلعت علي المرفق واستملت الاصل"),
        "pledge_sub_reject": MessageLookupByLibrary.simpleMessage(
            "اذا كنت متأكد من رفض المرفق عليك كتابة سبب الرفض  "),
        "pledge_title_accept": MessageLookupByLibrary.simpleMessage(
            " هل انت متاكد من قبول هذا المرفق ؟"),
        "pledge_title_reject":
            MessageLookupByLibrary.simpleMessage("لماذا تريد رفض هذا المرفق ؟"),
        "pledges": MessageLookupByLibrary.simpleMessage("التعهدات"),
        "pledges_and_generalization":
            MessageLookupByLibrary.simpleMessage("التعهدات والتعميم"),
        "pledges_and_generalization_confirm_message":
            MessageLookupByLibrary.simpleMessage(
                "باختيارك اعادة ضبط البيانات ستتاح لك الفرصة لتغيير اختيارك اذا اردت الاستمرار اضغط تاكيد"),
        "point": MessageLookupByLibrary.simpleMessage("نقطة"),
        "point_type": MessageLookupByLibrary.simpleMessage("نوع النقطة"),
        "points": MessageLookupByLibrary.simpleMessage("نقاط"),
        "position": MessageLookupByLibrary.simpleMessage("الموضع:"),
        "power": MessageLookupByLibrary.simpleMessage("قوة"),
        "previous": MessageLookupByLibrary.simpleMessage("السابق"),
        "previous_button": MessageLookupByLibrary.simpleMessage("السابق"),
        "previous_experience":
            MessageLookupByLibrary.simpleMessage("الخبرات السابقة"),
        "previous_experiences":
            MessageLookupByLibrary.simpleMessage("الخبرات السابقة"),
        "previous_jobs":
            MessageLookupByLibrary.simpleMessage("الوظائف السابقة"),
        "previous_opportunities":
            MessageLookupByLibrary.simpleMessage("فرص سابقه"),
        "previous_opportunities_and_evaluations":
            MessageLookupByLibrary.simpleMessage("الفرص السابقه والتقييمات"),
        "previous_opportunity":
            MessageLookupByLibrary.simpleMessage("فرصه سابقه"),
        "pricing_adjustment":
            MessageLookupByLibrary.simpleMessage("تعديل التسعير"),
        "print_qr_code": MessageLookupByLibrary.simpleMessage("طباعه QR code"),
        "priority_level": MessageLookupByLibrary.simpleMessage("درجة الاهمية"),
        "procedures": MessageLookupByLibrary.simpleMessage("الاجراءات"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "project": MessageLookupByLibrary.simpleMessage("المشروع "),
        "project_added_manage_projects_list":
            MessageLookupByLibrary.simpleMessage(
                "تم اضافة المشروع لقائمة ادارة المشاريع"),
        "project_added_successfully":
            MessageLookupByLibrary.simpleMessage("تم اضافة المشروع بنجاح"),
        "project_data": MessageLookupByLibrary.simpleMessage("بيانات المشروع"),
        "project_name": MessageLookupByLibrary.simpleMessage("اسم المشروع"),
        "project_name_ar":
            MessageLookupByLibrary.simpleMessage("اسم المشروع بالعربي"),
        "project_name_en":
            MessageLookupByLibrary.simpleMessage("اسم المشروع بالانجليزي"),
        "projects": MessageLookupByLibrary.simpleMessage("المشاريع"),
        "projects_management":
            MessageLookupByLibrary.simpleMessage("ادارة المشاريع"),
        "proof_file_must_uploaded":
            MessageLookupByLibrary.simpleMessage("يجب رفع ملف الإثبات"),
        "punishment_name": MessageLookupByLibrary.simpleMessage("اسم العقوبة"),
        "punishment_type": MessageLookupByLibrary.simpleMessage("نوع العقوبة"),
        "punishments": MessageLookupByLibrary.simpleMessage("العقوبات"),
        "purpose_of_request":
            MessageLookupByLibrary.simpleMessage("الغرض من الطلب"),
        "purpose_request":
            MessageLookupByLibrary.simpleMessage("الغرض من الطلب"),
        "qr_code_added_successfully":
            MessageLookupByLibrary.simpleMessage("تم اضافه QR Code بنجاح"),
        "qr_code_fingerprint":
            MessageLookupByLibrary.simpleMessage("بصمة الQR Code"),
        "qr_code_scanned": MessageLookupByLibrary.simpleMessage(
            "تم فحص QrCode هل تريد المتابعة؟"),
        "qr_code_value_appear_when_checked":
            MessageLookupByLibrary.simpleMessage("ستظهر قيمة QR Code عند فحصه"),
        "qr_scanner": MessageLookupByLibrary.simpleMessage("ماسح الباركود"),
        "qualification": MessageLookupByLibrary.simpleMessage("المؤهل"),
        "qualification_name":
            MessageLookupByLibrary.simpleMessage("اسم المؤهل"),
        "rate_subtitle": MessageLookupByLibrary.simpleMessage(
            "ساعدنا في تحسين خدماتنا في تقيمك  لنا"),
        "rate_title": MessageLookupByLibrary.simpleMessage("قيم تجربتك للشركة"),
        "rating": MessageLookupByLibrary.simpleMessage("تقييم"),
        "rating_confairm":
            MessageLookupByLibrary.simpleMessage("من فضلك قم بالتقيم اولا  "),
        "ready_to_start": MessageLookupByLibrary.simpleMessage("جاهز للبدء"),
        "reason_refuse": MessageLookupByLibrary.simpleMessage("سبب الرفض"),
        "reasons_for_absence":
            MessageLookupByLibrary.simpleMessage("أسباب الغياب"),
        "receipt_status":
            MessageLookupByLibrary.simpleMessage("حالة استلام العهدة :"),
        "receive_vehicle": MessageLookupByLibrary.simpleMessage("استلام مركبة"),
        "receive_vehicle_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل استلام المركبة"),
        "record_attendance":
            MessageLookupByLibrary.simpleMessage("تسجيل الحضور"),
        "record_attendance_scan_description_face_print":
            MessageLookupByLibrary.simpleMessage(
                "اول خطوه للتسجيل وهي ان يتم فحص الوجه عن طريق كاميرا الجوال"),
        "record_attendance_scan_description_qr_code_fingerprint":
            MessageLookupByLibrary.simpleMessage(
                "ثاني خطوه للتسجيل وهي ان يتم فحص الQr Code الخاص بالفرصه"),
        "record_departure":
            MessageLookupByLibrary.simpleMessage("تسجيل الأنصراف"),
        "recording_time": MessageLookupByLibrary.simpleMessage("تسجيل الوقت"),
        "refusal": MessageLookupByLibrary.simpleMessage("رفض"),
        "register": MessageLookupByLibrary.simpleMessage("تسجيل"),
        "register_attendance_required": MessageLookupByLibrary.simpleMessage(
            "يتوجب عليك تسجيل الحضور او الانصراف للدوام حتي يمكنك التمتع بمميزات التطبيق"),
        "register_title":
            MessageLookupByLibrary.simpleMessage("تسجيل حساب كاشفت"),
        "reject": MessageLookupByLibrary.simpleMessage("مرفوض"),
        "reject_but": MessageLookupByLibrary.simpleMessage("رفض"),
        "reject_reason":
            MessageLookupByLibrary.simpleMessage("اكتب سبب رفض الدفع"),
        "reject_service_permission_message": MessageLookupByLibrary.simpleMessage(
            "*وفي حالة عدم الموافقة على تمكين البرنامج بالعمل لاثبات وقت الحضور والإنصراف بشكل صحيح تعتبر حالتك غياب."),
        "rejected": MessageLookupByLibrary.simpleMessage("تم الرفض"),
        "reload": MessageLookupByLibrary.simpleMessage("إعادة تحميل"),
        "remaining": MessageLookupByLibrary.simpleMessage("متبقي"),
        "remaining_balance":
            MessageLookupByLibrary.simpleMessage("الرصيد المتبقي"),
        "remaining_chances": MessageLookupByLibrary.simpleMessage("فرص متبقية"),
        "remaining_number":
            MessageLookupByLibrary.simpleMessage("العدد المتبقي"),
        "remaining_time": MessageLookupByLibrary.simpleMessage("الوقت المتبقي"),
        "remaining_time_to_rest":
            MessageLookupByLibrary.simpleMessage("باقي من الزمن"),
        "request_code": MessageLookupByLibrary.simpleMessage("طلب الكود"),
        "request_has_been_rejected":
            MessageLookupByLibrary.simpleMessage("تم رفض الطلب"),
        "request_has_been_rejected_message":
            MessageLookupByLibrary.simpleMessage(
                "برجاء كتابة سبب الرفض ثم تأكيد الرفض"),
        "request_track_attendance_departure":
            MessageLookupByLibrary.simpleMessage("طلب تتبع الحضور والانصراف"),
        "requests": MessageLookupByLibrary.simpleMessage("الطلبات"),
        "required_attendance_status":
            MessageLookupByLibrary.simpleMessage("حالة الحضور مطلوبة"),
        "required_login":
            MessageLookupByLibrary.simpleMessage("يتطلب منك تسجيل الدخول"),
        "required_mobile_number":
            MessageLookupByLibrary.simpleMessage("رقم الجوال مطلوب"),
        "required_number":
            MessageLookupByLibrary.simpleMessage("العدد المطلوب"),
        "required_reason_refuse":
            MessageLookupByLibrary.simpleMessage("سبب الرفض مطلوب"),
        "reschedule": MessageLookupByLibrary.simpleMessage("إعادة جدولة"),
        "resend_code": MessageLookupByLibrary.simpleMessage("إعادة إرسال"),
        "reserved_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص المحجوزة"),
        "reset": MessageLookupByLibrary.simpleMessage("اعادة الضبط"),
        "reset_face_fingerprint":
            MessageLookupByLibrary.simpleMessage("اعادة تعيين بصمة الوجه"),
        "reset_mobile_number":
            MessageLookupByLibrary.simpleMessage("اعادة ضبط رقم الجوال"),
        "residual": MessageLookupByLibrary.simpleMessage("المتبقي "),
        "responsible_projects":
            MessageLookupByLibrary.simpleMessage("المشاريع المسؤول عنها"),
        "responsible_response":
            MessageLookupByLibrary.simpleMessage("رد المسئول"),
        "rest_day": MessageLookupByLibrary.simpleMessage("ايام الراحه"),
        "rest_time": MessageLookupByLibrary.simpleMessage("وقت الراحة"),
        "restaurants": MessageLookupByLibrary.simpleMessage("مطاعم"),
        "resume": MessageLookupByLibrary.simpleMessage("السيرة الذاتية"),
        "resume_qr": MessageLookupByLibrary.simpleMessage("استأنف"),
        "retype_password":
            MessageLookupByLibrary.simpleMessage("اعد كتابة كلمة السر"),
        "review_company": MessageLookupByLibrary.simpleMessage(
            "اجمالي التقييمات علي الشركة "),
        "review_project": MessageLookupByLibrary.simpleMessage(
            "اجمالي التقييمات علي المشروع "),
        "rosacea": MessageLookupByLibrary.simpleMessage("الوردية"),
        "rs": MessageLookupByLibrary.simpleMessage("ر . س"),
        "salary": MessageLookupByLibrary.simpleMessage("قيمة الفرصة"),
        "salary_definition_request":
            MessageLookupByLibrary.simpleMessage("طلب تعريف راتب"),
        "salary_hanging":
            MessageLookupByLibrary.simpleMessage("المبالغ المعلقه "),
        "sar": MessageLookupByLibrary.simpleMessage("ريال"),
        "saudi_phone_numbers_accepted": MessageLookupByLibrary.simpleMessage(
            "يقبل فقط ارقام الهواتف السعودية"),
        "saudi_riyals": MessageLookupByLibrary.simpleMessage("ريال سعودى"),
        "save_button": MessageLookupByLibrary.simpleMessage("حفظ"),
        "save_edit": MessageLookupByLibrary.simpleMessage("حفظ التعديل"),
        "save_filter": MessageLookupByLibrary.simpleMessage("حفظ الفلتره"),
        "save_selection": MessageLookupByLibrary.simpleMessage("حفظ التحديد"),
        "saved_focus_point_time_dec": MessageLookupByLibrary.simpleMessage(
            "يجب حفظ هذا الوقت اولا قبل اضافة اخر"),
        "scan": MessageLookupByLibrary.simpleMessage("فحص"),
        "scan_code": MessageLookupByLibrary.simpleMessage("مسح الكود"),
        "scan_code_car": MessageLookupByLibrary.simpleMessage(
            "قم بمسح QR CODE لعرض بيانات المركبة"),
        "scan_fac_identify_you":
            MessageLookupByLibrary.simpleMessage("قم بفحص الوجه لتعريف هويتك"),
        "scan_fac_note": MessageLookupByLibrary.simpleMessage(
            "اضافة بصمة الوجه اختياريه للاناث ويمكن تخطيها"),
        "scan_now": MessageLookupByLibrary.simpleMessage("فحص الان"),
        "scan_qr_code_project_confirm_shift":
            MessageLookupByLibrary.simpleMessage(
                "قم بفحص ال QR code الخاص بالمشروع لكي تم تاكيد دوامك"),
        "scan_your_code":
            MessageLookupByLibrary.simpleMessage("امسح رمزك ضوئيًا"),
        "search": MessageLookupByLibrary.simpleMessage("البحث"),
        "search_brand_name":
            MessageLookupByLibrary.simpleMessage("ابحث عن اسم البراند"),
        "search_by_area": MessageLookupByLibrary.simpleMessage(
            "ابحث عن المنطقه التي تريدها ."),
        "search_by_phone":
            MessageLookupByLibrary.simpleMessage("ابحث برقم جوال كاشفتر"),
        "search_by_phone_employee":
            MessageLookupByLibrary.simpleMessage("ابحث برقم جوال الكاشفترز"),
        "search_city_name":
            MessageLookupByLibrary.simpleMessage("أبحث عن اسم المدينة"),
        "search_company_name":
            MessageLookupByLibrary.simpleMessage("ابحث عن اسم الشركة"),
        "search_contract_clause":
            MessageLookupByLibrary.simpleMessage("ابحث عن شرط العقد"),
        "search_filtering": MessageLookupByLibrary.simpleMessage("فلترة البحث"),
        "search_for_areas":
            MessageLookupByLibrary.simpleMessage("ابحث عن المناطق"),
        "search_for_company":
            MessageLookupByLibrary.simpleMessage("البحث عن الشركة"),
        "search_for_job": MessageLookupByLibrary.simpleMessage("ابحث عن فرصة"),
        "search_for_your_qualification_name":
            MessageLookupByLibrary.simpleMessage("ابحث عن اسم مؤهلك"),
        "search_here": MessageLookupByLibrary.simpleMessage("ابحث هنا..."),
        "search_occupation":
            MessageLookupByLibrary.simpleMessage("ابحث عن المهنة"),
        "search_period": MessageLookupByLibrary.simpleMessage("ابحث عن الفترة"),
        "search_places":
            MessageLookupByLibrary.simpleMessage("ابحث عن الاماكن"),
        "search_project_name":
            MessageLookupByLibrary.simpleMessage("ابحث عن اسم المشروع"),
        "search_rosacea":
            MessageLookupByLibrary.simpleMessage(" ابحث عن وردية"),
        "search_shift_type":
            MessageLookupByLibrary.simpleMessage("ابحث عن نوع الوردية"),
        "search_the_job":
            MessageLookupByLibrary.simpleMessage(" ابحث عن وظيفة"),
        "search_your_job_location":
            MessageLookupByLibrary.simpleMessage("ابحث عن وظيفتك او موقعك"),
        "second": MessageLookupByLibrary.simpleMessage("ثانية"),
        "second_period": MessageLookupByLibrary.simpleMessage("الفتره الثانيه"),
        "section": MessageLookupByLibrary.simpleMessage("القطاع"),
        "see_all": MessageLookupByLibrary.simpleMessage("مشاهدة الكل"),
        "seen": MessageLookupByLibrary.simpleMessage("تم الاطلاع"),
        "select": MessageLookupByLibrary.simpleMessage("اختر"),
        "select_all": MessageLookupByLibrary.simpleMessage("إختر الكل"),
        "select_area": MessageLookupByLibrary.simpleMessage("اختر المنطقة"),
        "select_bank_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم البنك"),
        "select_brand_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم البراند"),
        "select_brand_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع البراند"),
        "select_camera": MessageLookupByLibrary.simpleMessage("اختر الكاميرا"),
        "select_cashifter":
            MessageLookupByLibrary.simpleMessage("اختر الكاشفتر"),
        "select_city": MessageLookupByLibrary.simpleMessage("اختر المدينة"),
        "select_city_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم المدينة"),
        "select_company": MessageLookupByLibrary.simpleMessage("اختر الشركة"),
        "select_company_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم الشركة"),
        "select_computer_level":
            MessageLookupByLibrary.simpleMessage("اختر مستوى الحاسب الالي"),
        "select_contract_clause":
            MessageLookupByLibrary.simpleMessage("اختر شرط العقد"),
        "select_covenant_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع العهدة"),
        "select_coverage":
            MessageLookupByLibrary.simpleMessage("اختر تغطية الراحات"),
        "select_current_situation":
            MessageLookupByLibrary.simpleMessage("اختيار موقفك الحالي"),
        "select_date_absence":
            MessageLookupByLibrary.simpleMessage(" حدد تاريخ الغياب"),
        "select_date_and_time":
            MessageLookupByLibrary.simpleMessage("اختر التاريخ والوقت"),
        "select_date_from_to":
            MessageLookupByLibrary.simpleMessage("من فضلك اختار تاريخ من إلى"),
        "select_day": MessageLookupByLibrary.simpleMessage("حدد يوم "),
        "select_degree_importance":
            MessageLookupByLibrary.simpleMessage("اختر درجة الاهمية"),
        "select_discount_percentage":
            MessageLookupByLibrary.simpleMessage("اختر نسبة الخصم"),
        "select_district": MessageLookupByLibrary.simpleMessage("اختر الحى"),
        "select_employee_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم الموظف"),
        "select_english_level":
            MessageLookupByLibrary.simpleMessage("اختر مستوى اللغة الانجليزية"),
        "select_favorite_projects":
            MessageLookupByLibrary.simpleMessage("تحديد"),
        "select_gate_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع البوابة"),
        "select_how_accept_job":
            MessageLookupByLibrary.simpleMessage("اختر طريقة قبول الفرصة"),
        "select_installment_package":
            MessageLookupByLibrary.simpleMessage("اختر باقة التقسيط"),
        "select_job": MessageLookupByLibrary.simpleMessage("اختر الفرصه"),
        "select_job_choose_job_uniform": MessageLookupByLibrary.simpleMessage(
            "حدد الوظيفه لاختيار الزي الوظيفي"),
        "select_language_title":
            MessageLookupByLibrary.simpleMessage("اختر اللغة"),
        "select_license_expiry_date":
            MessageLookupByLibrary.simpleMessage("اختر تاريخ انتهاء الرخصة"),
        "select_loan_request_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع طلب السلفه"),
        "select_loan_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع السلفة"),
        "select_map": MessageLookupByLibrary.simpleMessage("تحديد المنطقة"),
        "select_method_arrival_departure":
            MessageLookupByLibrary.simpleMessage("اختر طريقة الحضور والانصراف"),
        "select_method_calculating_opportunity":
            MessageLookupByLibrary.simpleMessage("اختر طريقة حساب الفرصة"),
        "select_method_selecting_employees":
            MessageLookupByLibrary.simpleMessage("اختر طريقة اختيار الموظفين"),
        "select_number_months_loan":
            MessageLookupByLibrary.simpleMessage("اختر عدد أشهر السلفه"),
        "select_occupation":
            MessageLookupByLibrary.simpleMessage("اختر المهنة"),
        "select_operating_plan":
            MessageLookupByLibrary.simpleMessage("اختر خطة التشغيل"),
        "select_opportunity_date":
            MessageLookupByLibrary.simpleMessage("حدد تاريخ الفرصه"),
        "select_period_order":
            MessageLookupByLibrary.simpleMessage("اختر ترتيب الفترة"),
        "select_point_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع النقطة"),
        "select_profession":
            MessageLookupByLibrary.simpleMessage("اختار المهنة"),
        "select_project": MessageLookupByLibrary.simpleMessage("اختر المشروع"),
        "select_project_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم المشروع"),
        "select_punishment_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم العقوبة"),
        "select_punishment_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع العقوبة"),
        "select_purpose_request":
            MessageLookupByLibrary.simpleMessage("اختر الغرض من الطلب"),
        "select_qualification":
            MessageLookupByLibrary.simpleMessage("اختر المؤهل "),
        "select_qualification_name":
            MessageLookupByLibrary.simpleMessage("أختيار اسم المؤهل"),
        "select_rosacea": MessageLookupByLibrary.simpleMessage(" اختر الوردية"),
        "select_service_provider":
            MessageLookupByLibrary.simpleMessage("اختر مقدم الخدمة"),
        "select_shift_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع الوردية"),
        "select_the_job": MessageLookupByLibrary.simpleMessage(" اختر الفرصه"),
        "select_tour_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع الجولة"),
        "select_transfer_method":
            MessageLookupByLibrary.simpleMessage("اختر طريقة التحويل"),
        "select_type": MessageLookupByLibrary.simpleMessage("اختر النوع"),
        "select_type_insurance":
            MessageLookupByLibrary.simpleMessage("اختر نوع التأمين "),
        "select_vehicle_color":
            MessageLookupByLibrary.simpleMessage("اختر لون المركبة"),
        "select_vehicle_type":
            MessageLookupByLibrary.simpleMessage("اختر نوع المركبة"),
        "select_vehicles":
            MessageLookupByLibrary.simpleMessage("اختر المركبات"),
        "select_video_date":
            MessageLookupByLibrary.simpleMessage("اختر تاريخ الفيديو"),
        "select_violation_name":
            MessageLookupByLibrary.simpleMessage("اختر اسم المخالفة"),
        "select_wallet": MessageLookupByLibrary.simpleMessage("اختر محفظة"),
        "select_withdraw_method":
            MessageLookupByLibrary.simpleMessage("اختر طريقة السحب"),
        "select_working_day_date":
            MessageLookupByLibrary.simpleMessage("اختر تاريخ يوم العمل"),
        "select_working_period":
            MessageLookupByLibrary.simpleMessage("اختر فترة العمل"),
        "select_working_time":
            MessageLookupByLibrary.simpleMessage("اختر وقت العمل"),
        "select_your_current_city":
            MessageLookupByLibrary.simpleMessage("اختر مدينتك الحاليه"),
        "selection_skills":
            MessageLookupByLibrary.simpleMessage("اختيار المهارات"),
        "send": MessageLookupByLibrary.simpleMessage("ارسال"),
        "send_personal_interview_request":
            MessageLookupByLibrary.simpleMessage("إرسال طلب مقابلة شخصية"),
        "serve_on_my_way":
            MessageLookupByLibrary.simpleMessage("خدمة على طريقي"),
        "service_provider":
            MessageLookupByLibrary.simpleMessage("مقدمي الخدمة"),
        "services": MessageLookupByLibrary.simpleMessage("الخدمات"),
        "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "share": MessageLookupByLibrary.simpleMessage("مشاركة"),
        "share_code_with_cashier": MessageLookupByLibrary.simpleMessage(
            "قم بمشاركة الكود للكاشير فقط عند إستلام النقدية ."),
        "shift_expired_message": MessageLookupByLibrary.simpleMessage(
            "تم إنتهاء الدوام يجب تسجيل الانصراف"),
        "shift_hours": MessageLookupByLibrary.simpleMessage("مواعيد العمل"),
        "shift_name": MessageLookupByLibrary.simpleMessage("اسم الدوام"),
        "shift_times": MessageLookupByLibrary.simpleMessage("مواعيد العمل"),
        "shod_image_after_maintenance": MessageLookupByLibrary.simpleMessage(
            "يرجي اختيار صورة بعد الصيانة "),
        "shod_image_before_maintenance": MessageLookupByLibrary.simpleMessage(
            " يرجي اختيار صورة قبل الصيانة "),
        "show_cashifter_data":
            MessageLookupByLibrary.simpleMessage("إظهار بيانات الكاشيفتر"),
        "show_cashifter_images":
            MessageLookupByLibrary.simpleMessage("إظهار صور الكاشيفتر"),
        "show_details": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
        "show_details_data":
            MessageLookupByLibrary.simpleMessage("رؤية التفاصيل  "),
        "show_focus_points_in_map": MessageLookupByLibrary.simpleMessage(
            "اظهار نقاط التمركز علي الخريطة"),
        "show_less": MessageLookupByLibrary.simpleMessage("عرض أقل"),
        "show_more": MessageLookupByLibrary.simpleMessage("عرض المزيد..."),
        "skills": MessageLookupByLibrary.simpleMessage("المهارات"),
        "skills_required_for_job": m2,
        "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
        "smil": MessageLookupByLibrary.simpleMessage("إبتسم"),
        "something_went_wrong":
            MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
        "soon": MessageLookupByLibrary.simpleMessage("قريبا"),
        "special_jobs": MessageLookupByLibrary.simpleMessage("الفرص المميزه"),
        "special_offer":
            MessageLookupByLibrary.simpleMessage("عروض خاصة (قريباً)"),
        "specialization": MessageLookupByLibrary.simpleMessage("التخصص"),
        "speed": MessageLookupByLibrary.simpleMessage("السرعة:"),
        "speeding_during_violation":
            MessageLookupByLibrary.simpleMessage("السرعة أثناء المخالفة"),
        "sponsor_data": MessageLookupByLibrary.simpleMessage("بيانات الكفيل"),
        "sponsor_mobile": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "sponsor_name": MessageLookupByLibrary.simpleMessage("اسم الكفيل"),
        "sponsored_name": MessageLookupByLibrary.simpleMessage("اسم المكفول"),
        "sr": MessageLookupByLibrary.simpleMessage("ر.س"),
        "start": MessageLookupByLibrary.simpleMessage("ابدء الدوام"),
        "start_but": MessageLookupByLibrary.simpleMessage(" ابدأ "),
        "start_date": MessageLookupByLibrary.simpleMessage("تاريخ البداية"),
        "start_date_blocking":
            MessageLookupByLibrary.simpleMessage("تاريخ بدأ الحجب :"),
        "start_live_feed":
            MessageLookupByLibrary.simpleMessage("بدأ البث المباشر"),
        "start_overtime":
            MessageLookupByLibrary.simpleMessage("بدء الوقت الإضافي"),
        "start_shift_label":
            MessageLookupByLibrary.simpleMessage("بدء الدوام لفترة عمل "),
        "start_tour": MessageLookupByLibrary.simpleMessage("بدأ الجولة"),
        "start_tour_warning_msg": MessageLookupByLibrary.simpleMessage(
            "قبل بدأ الجولة يجب ان تحدد نوع جولة لكي يتم استلامك  للمركبة."),
        "start_typing_search":
            MessageLookupByLibrary.simpleMessage("ابدأ الكتابة للبحث"),
        "start_video": MessageLookupByLibrary.simpleMessage("بدأ الفيديو"),
        "state_emp": MessageLookupByLibrary.simpleMessage("حالة الموظف"),
        "statistic_emp":
            MessageLookupByLibrary.simpleMessage("احصائيات الموظف"),
        "status": MessageLookupByLibrary.simpleMessage("الحالة"),
        "status_infringement":
            MessageLookupByLibrary.simpleMessage("حالة المخالفه"),
        "status_request": MessageLookupByLibrary.simpleMessage("حالة الطلب "),
        "stop": MessageLookupByLibrary.simpleMessage("إيقاف"),
        "street_name": MessageLookupByLibrary.simpleMessage("اسم الشارع"),
        "submission_date":
            MessageLookupByLibrary.simpleMessage("تاريخ التقديم"),
        "submit_your_request": MessageLookupByLibrary.simpleMessage(
            "سيتم تقديم طلبك لإيداع المبلغ  فى حسابك"),
        "submitted_jobs":
            MessageLookupByLibrary.simpleMessage("الوظائف المقدم عليها "),
        "success_processing":
            MessageLookupByLibrary.simpleMessage("العمليات الناجحه :"),
        "successfully_done": MessageLookupByLibrary.simpleMessage("تمت بنجاح"),
        "successfully_downloaded":
            MessageLookupByLibrary.simpleMessage("تم التحميل بنجاح"),
        "take_picture_showing_the_problem":
            MessageLookupByLibrary.simpleMessage("التقط صوره توضح  المشكلة"),
        "tall": MessageLookupByLibrary.simpleMessage("Tall"),
        "tap_map_get_address": MessageLookupByLibrary.simpleMessage(
            "اضغط على الخريطة للحصول على العنوان"),
        "tasks_and_duties":
            MessageLookupByLibrary.simpleMessage("المهام والواجبات"),
        "tasks_and_responsibilities":
            MessageLookupByLibrary.simpleMessage("المهام والمسؤوليات"),
        "tasks_duties":
            MessageLookupByLibrary.simpleMessage("المهام والواجبات"),
        "taught_us": MessageLookupByLibrary.simpleMessage("علمنا"),
        "technical_support":
            MessageLookupByLibrary.simpleMessage("الدعم الفني"),
        "temporary_fingerprint":
            MessageLookupByLibrary.simpleMessage("بصمة انصراف مؤقته"),
        "terms_and_conditions_message": MessageLookupByLibrary.simpleMessage(
            "اوافق علي جميع الشروط والأحكام"),
        "terms_conditions_job":
            MessageLookupByLibrary.simpleMessage("شروط و احكام الوظيفة"),
        "terms_conditions_opportunities":
            MessageLookupByLibrary.simpleMessage("شروط واحكام الفرص"),
        "the_opportunities":
            MessageLookupByLibrary.simpleMessage("الفرص المتاحة"),
        "the_opportunity": MessageLookupByLibrary.simpleMessage("الفرصة"),
        "the_salary": MessageLookupByLibrary.simpleMessage("الراتب"),
        "there_are_no_notes":
            MessageLookupByLibrary.simpleMessage("لا يوجد ملاحظات"),
        "there_are_notes": MessageLookupByLibrary.simpleMessage("يوجد ملاحظات"),
        "there_are_videos_yet":
            MessageLookupByLibrary.simpleMessage("لا توجد فيديوهات بعد"),
        "there_many_ways_pay":
            MessageLookupByLibrary.simpleMessage("هناك طرق عديده للدفع"),
        "there_many_ways_pay_desc": MessageLookupByLibrary.simpleMessage(
            "يمكنك اختيار الطرق المناسبه لك"),
        "there_no_employees":
            MessageLookupByLibrary.simpleMessage("لا يوجد موظفين"),
        "third_period": MessageLookupByLibrary.simpleMessage("الفتره الثالثه"),
        "this_field_is_required":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
        "time": MessageLookupByLibrary.simpleMessage("الوقت"),
        "time_allowed_after_deadline":
            MessageLookupByLibrary.simpleMessage("الوقت المسموح بعد الميعاد"),
        "time_end": MessageLookupByLibrary.simpleMessage("وقت الانتهاء : "),
        "time_opportunity": MessageLookupByLibrary.simpleMessage("وقت  الفرصة"),
        "time_start": MessageLookupByLibrary.simpleMessage("وقت البدأ : "),
        "to": MessageLookupByLibrary.simpleMessage("لـ"),
        "to_": MessageLookupByLibrary.simpleMessage("الى"),
        "to_day": MessageLookupByLibrary.simpleMessage("الى يوم "),
        "to_end_rest": MessageLookupByLibrary.simpleMessage("لانتهاء الراحه"),
        "today": MessageLookupByLibrary.simpleMessage("اليوم"),
        "today_opportunities":
            MessageLookupByLibrary.simpleMessage("فرص اليوم"),
        "too": MessageLookupByLibrary.simpleMessage("الى "),
        "total": MessageLookupByLibrary.simpleMessage("إجمالي"),
        "total_attendance":
            MessageLookupByLibrary.simpleMessage("إجمالي الحضور"),
        "total_collection":
            MessageLookupByLibrary.simpleMessage("اجمالي التحصيل"),
        "total_contracting_power":
            MessageLookupByLibrary.simpleMessage("إجمالي القوة التعاقدية"),
        "total_deductions":
            MessageLookupByLibrary.simpleMessage("اجمالي الاستقطاعات"),
        "total_loans": MessageLookupByLibrary.simpleMessage("اجمالي السُلف"),
        "total_opportunity":
            MessageLookupByLibrary.simpleMessage("اجمالي قيمة الفرصة"),
        "total_residual":
            MessageLookupByLibrary.simpleMessage("اجمالي المتبقي  "),
        "total_statistic":
            MessageLookupByLibrary.simpleMessage("اجمالي الاحصائيات "),
        "total_value_loan":
            MessageLookupByLibrary.simpleMessage("اجمالي قيمة السلفه "),
        "tour_history": MessageLookupByLibrary.simpleMessage("تاريخ الجولات"),
        "tour_type": MessageLookupByLibrary.simpleMessage("نوع الجولة"),
        "track_vehicle_on_map":
            MessageLookupByLibrary.simpleMessage("تتبع المركبة علي الخريطة"),
        "tracking_focus_points":
            MessageLookupByLibrary.simpleMessage("متابعة نقاط التمركز"),
        "tracking_period": MessageLookupByLibrary.simpleMessage("فترة التتبُع"),
        "transaction_history":
            MessageLookupByLibrary.simpleMessage("سجل المعاملات"),
        "transactions": MessageLookupByLibrary.simpleMessage("المعاملات"),
        "transfer": MessageLookupByLibrary.simpleMessage("تحويل"),
        "transfer_amount": MessageLookupByLibrary.simpleMessage("مبلغ المحول"),
        "transfer_balance": MessageLookupByLibrary.simpleMessage("رصيد محول"),
        "transfer_confirm": MessageLookupByLibrary.simpleMessage("تأكيد تحويل"),
        "transfer_confirm_message": m3,
        "transfer_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل التحويل"),
        "transfer_fee": MessageLookupByLibrary.simpleMessage("رسوم التحويل"),
        "transfer_from": MessageLookupByLibrary.simpleMessage("تحويل من"),
        "transfer_method":
            MessageLookupByLibrary.simpleMessage("طريقة التحويل"),
        "transfer_money":
            MessageLookupByLibrary.simpleMessage("لتحويل الاموال"),
        "triple_username":
            MessageLookupByLibrary.simpleMessage("اسم المستخدم الثلاثي"),
        "turn_left": MessageLookupByLibrary.simpleMessage("تحرك يسارا"),
        "turn_right": MessageLookupByLibrary.simpleMessage("تحرك يمينا"),
        "type": MessageLookupByLibrary.simpleMessage("النوع"),
        "type_area_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم المنطقة"),
        "type_back_up_number":
            MessageLookupByLibrary.simpleMessage("اكتب عدد القبول الاحتياطى"),
        "type_camera_code":
            MessageLookupByLibrary.simpleMessage("اكتب كود الكاميرا"),
        "type_camera_name_ar":
            MessageLookupByLibrary.simpleMessage("اكتب اسم الكاميرا بالعربي"),
        "type_camera_name_en": MessageLookupByLibrary.simpleMessage(
            "اكتب اسم الكاميرا بالانجليزي"),
        "type_contractual_power_number":
            MessageLookupByLibrary.simpleMessage("اكتب القوة التعاقدية"),
        "type_covenant_desc":
            MessageLookupByLibrary.simpleMessage("اكتب وصف العهدة"),
        "type_covenant_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم العهدة"),
        "type_discount_value":
            MessageLookupByLibrary.simpleMessage("اكتب قيمة الخصم"),
        "type_insurance": MessageLookupByLibrary.simpleMessage("نوع التأمين "),
        "type_license_number":
            MessageLookupByLibrary.simpleMessage("اكتب رقم الرخصة"),
        "type_loan_value":
            MessageLookupByLibrary.simpleMessage("اكتب قيمة السلفة"),
        "type_loans": MessageLookupByLibrary.simpleMessage("نوع السلفه "),
        "type_manager_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم المسئول"),
        "type_model_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم الموديل"),
        "type_new_password":
            MessageLookupByLibrary.simpleMessage("اكتب كلمة السر الجديدة"),
        "type_number_hours":
            MessageLookupByLibrary.simpleMessage("اكتب عدد الساعات"),
        "type_number_minutes":
            MessageLookupByLibrary.simpleMessage("اكتب عدد الدقائق"),
        "type_number_required_for_opportunity":
            MessageLookupByLibrary.simpleMessage("اكتب العدد المطلوب للفرصة"),
        "type_operation": MessageLookupByLibrary.simpleMessage("نوع العملية"),
        "type_opportunities_number":
            MessageLookupByLibrary.simpleMessage("اكتب العدد المطلوب"),
        "type_opportunity_value":
            MessageLookupByLibrary.simpleMessage("اكتب قيمة الفرصه"),
        "type_plate_number":
            MessageLookupByLibrary.simpleMessage("اكتب رقم اللوحة"),
        "type_reason": MessageLookupByLibrary.simpleMessage("اكتب السبب..."),
        "type_reason_apologizing":
            MessageLookupByLibrary.simpleMessage("اكتب سبب الاعتذار"),
        "type_reason_ban":
            MessageLookupByLibrary.simpleMessage("اكتب سبب الحظر"),
        "type_request": MessageLookupByLibrary.simpleMessage("نوع الطلب"),
        "type_street_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم الشارع"),
        "type_transfer": MessageLookupByLibrary.simpleMessage("نوع التحويل"),
        "type_vehicle_specifications_here":
            MessageLookupByLibrary.simpleMessage("اكتب مواصفات المركبة هنا .."),
        "type_violation_name_ar":
            MessageLookupByLibrary.simpleMessage("اكتب اسم المخالفة بالعربي"),
        "type_violation_name_en": MessageLookupByLibrary.simpleMessage(
            "اكتب اسم المخالفة بالانجليزي"),
        "type_year_manufacture":
            MessageLookupByLibrary.simpleMessage("اكتب سنة الصنع"),
        "undefine_error": MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
        "update_button": MessageLookupByLibrary.simpleMessage("تحديث"),
        "update_scan_face_note": MessageLookupByLibrary.simpleMessage(
            "اذا اردت تعديل بصمة الوجه عليك مراجعه الاداره اولا "),
        "update_status_active":
            MessageLookupByLibrary.simpleMessage("تغير الحالة الي نشط"),
        "update_status_unActive":
            MessageLookupByLibrary.simpleMessage("تغير الحالة الي غير نشط"),
        "update_transactions":
            MessageLookupByLibrary.simpleMessage(" تحديث المعاملة"),
        "upload_image": MessageLookupByLibrary.simpleMessage("رفع صورة"),
        "upload_pdf_image":
            MessageLookupByLibrary.simpleMessage("رفع صورة او ملف PDF"),
        "upload_picture": MessageLookupByLibrary.simpleMessage("تحميل صوره"),
        "user_account": MessageLookupByLibrary.simpleMessage("حساب المستخدم"),
        "user_request_accept_subtitle_msg": MessageLookupByLibrary.simpleMessage(
            "اذا كنت توافق علي طلب الكاشفتر سينتقل الطلب الي قائمة الموافقة ويتحول الطلب الي الادارة"),
        "user_request_accept_title":
            MessageLookupByLibrary.simpleMessage("هل انت متأكد من الموافقة؟"),
        "user_request_reject_subtitle": MessageLookupByLibrary.simpleMessage(
            "اذا كنت ترفض طلب الكاشفتر عليك كتابة السبب"),
        "user_request_reject_title":
            MessageLookupByLibrary.simpleMessage("هل انت متأكد من الرفض؟"),
        "users": MessageLookupByLibrary.simpleMessage("المستخدمين"),
        "vacation_type": MessageLookupByLibrary.simpleMessage("نوع الاجازه"),
        "vacations": MessageLookupByLibrary.simpleMessage("الاجازات"),
        "validate_commerce_ratification": MessageLookupByLibrary.simpleMessage(
            "من فضلك اختر تصديق الغرفه التجاريه"),
        "validate_date":
            MessageLookupByLibrary.simpleMessage("من فضلك أدخل التاريخ"),
        "validate_direction_directed": MessageLookupByLibrary.simpleMessage(
            "من فضلك اكتب الجهه الموجه اليها"),
        "validate_purpose_request":
            MessageLookupByLibrary.simpleMessage("من فضلك اكتب  غرض الطلب"),
        "validate_resone":
            MessageLookupByLibrary.simpleMessage("من فضلك ادخل  سبب الغياب"),
        "validation_day":
            MessageLookupByLibrary.simpleMessage("ادخل  يوم ما بين 1 الى 31  "),
        "value_collect": MessageLookupByLibrary.simpleMessage("نسبة التحصيل"),
        "value_collection":
            MessageLookupByLibrary.simpleMessage("القيمة المحصله "),
        "value_discount": MessageLookupByLibrary.simpleMessage("نسبة الخصم"),
        "value_discounted_amount":
            MessageLookupByLibrary.simpleMessage("قيمه المبلغ المخصوم"),
        "value_due": MessageLookupByLibrary.simpleMessage("القيمة المستحقة"),
        "value_failed_processing":
            MessageLookupByLibrary.simpleMessage("قيمة عدد الغير مكتمل :"),
        "value_loans": MessageLookupByLibrary.simpleMessage("قيمة السلفة"),
        "value_opportunity":
            MessageLookupByLibrary.simpleMessage("قيمه الفرصه"),
        "value_pricing": MessageLookupByLibrary.simpleMessage("قيمة التسعير"),
        "value_success_processing":
            MessageLookupByLibrary.simpleMessage("قيمة العمليات الناجحه :"),
        "value_total":
            MessageLookupByLibrary.simpleMessage("اجمالي القيمة المستردة"),
        "vehicle": MessageLookupByLibrary.simpleMessage("المركبة"),
        "vehicle_camera_code":
            MessageLookupByLibrary.simpleMessage("معرف كود الكاميرا للمركبة"),
        "vehicle_color": MessageLookupByLibrary.simpleMessage("لون المركبة"),
        "vehicle_components":
            MessageLookupByLibrary.simpleMessage("مكونات المركبة"),
        "vehicle_data": MessageLookupByLibrary.simpleMessage("بيانات المركبة"),
        "vehicle_image": MessageLookupByLibrary.simpleMessage("صور المركبة"),
        "vehicle_insurance":
            MessageLookupByLibrary.simpleMessage("تأمين المركبة"),
        "vehicle_note": MessageLookupByLibrary.simpleMessage(
            "اضغط علي  ( لا ) عندما لا يوجد اي ملاحظات علي المركبة أو ( نعم ) في حالة لم تكن تعمل أو يوجد بها ملاحظات مع التوضيح ."),
        "vehicle_path": MessageLookupByLibrary.simpleMessage("مسار المركبة"),
        "vehicle_performance":
            MessageLookupByLibrary.simpleMessage("أداء المركبة"),
        "vehicle_specifications":
            MessageLookupByLibrary.simpleMessage("مواصفات المركبة"),
        "vehicle_type": MessageLookupByLibrary.simpleMessage("نوع المركبة"),
        "vehicles": MessageLookupByLibrary.simpleMessage("المركبات"),
        "vehicles_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل المركبة"),
        "vehicles_info":
            MessageLookupByLibrary.simpleMessage("معلومات المركبة الأساسية"),
        "verification": MessageLookupByLibrary.simpleMessage("تحقق"),
        "verification_code":
            MessageLookupByLibrary.simpleMessage("كود التفعيل"),
        "verification_code_sent_desc": MessageLookupByLibrary.simpleMessage(
            "سوف يتم ارسال كود التحقق الي رقم الجوال القديم , عليك مراجعته الان"),
        "video": MessageLookupByLibrary.simpleMessage("الفيديو"),
        "videos": MessageLookupByLibrary.simpleMessage("فيديوهات"),
        "videos_dates_validate_msg": MessageLookupByLibrary.simpleMessage(
            "من فضلك حدّد الوقت والتاريخ الذي تريده لعرض الفيديوهات فيه"),
        "view_all": MessageLookupByLibrary.simpleMessage("عرض الكل"),
        "view_areas": MessageLookupByLibrary.simpleMessage("عرض المناطق"),
        "view_cameras": MessageLookupByLibrary.simpleMessage("عرض الكاميرات"),
        "view_details": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
        "view_maintenance":
            MessageLookupByLibrary.simpleMessage("عرض الصيانة والأعطال"),
        "view_search_results":
            MessageLookupByLibrary.simpleMessage("عرض نتائج البحث"),
        "view_terms_conditions":
            MessageLookupByLibrary.simpleMessage("الاطلاع علي الشروط والاحكام"),
        "view_tracking_requests":
            MessageLookupByLibrary.simpleMessage("عرض طلبات التتبع"),
        "view_transactions":
            MessageLookupByLibrary.simpleMessage("عرض المعاملات"),
        "view_work_hazards":
            MessageLookupByLibrary.simpleMessage("عرض مخاطر العمل"),
        "violation": MessageLookupByLibrary.simpleMessage("مخالفة "),
        "violation_date":
            MessageLookupByLibrary.simpleMessage("تاريخ المخالفة "),
        "violation_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل المخالفة"),
        "violation_name": MessageLookupByLibrary.simpleMessage("اسم المخالفة"),
        "violation_name_ar":
            MessageLookupByLibrary.simpleMessage("اسم المخالفة بالعربية"),
        "violation_name_en":
            MessageLookupByLibrary.simpleMessage("اسم المخالفة بالانجليزي "),
        "violation_repeated":
            MessageLookupByLibrary.simpleMessage("عدد مرات التكرار"),
        "violation_time": MessageLookupByLibrary.simpleMessage("وقت المخالفة"),
        "violation_type": MessageLookupByLibrary.simpleMessage("نوع المخالفة"),
        "violation_value":
            MessageLookupByLibrary.simpleMessage("قيمة المخالفه"),
        "violations": MessageLookupByLibrary.simpleMessage("المخالفات"),
        "violations_num": MessageLookupByLibrary.simpleMessage("عدد المخالفات"),
        "violations_of_factory":
            MessageLookupByLibrary.simpleMessage("مخالفات المصانع"),
        "violations_of_operation":
            MessageLookupByLibrary.simpleMessage("مخالفات التشغيل"),
        "violations_types":
            MessageLookupByLibrary.simpleMessage("انواع المخالفات"),
        "vip_offers": MessageLookupByLibrary.simpleMessage("فرص لا تفوتك"),
        "vision_certificate":
            MessageLookupByLibrary.simpleMessage("رؤية الشهادة"),
        "vision_qr_code": MessageLookupByLibrary.simpleMessage("رؤية QR Code"),
        "wait_active":
            MessageLookupByLibrary.simpleMessage("في انتظار التفعيل"),
        "waiting_approval":
            MessageLookupByLibrary.simpleMessage("في انتظار الموافقة"),
        "waiting_for_approval":
            MessageLookupByLibrary.simpleMessage("في انتظار الموافقه"),
        "waiting_for_review":
            MessageLookupByLibrary.simpleMessage("في انتظار المراجعة"),
        "wallet": MessageLookupByLibrary.simpleMessage("المحفظة"),
        "wanted_number": MessageLookupByLibrary.simpleMessage("عدد المطلوبين"),
        "waring_action_notification": MessageLookupByLibrary.simpleMessage(
            " سيتم حفظ اجراءك وارساله الي مدير المشروع لمراجعته والرد عليه "),
        "waring_final_action_notification":
            MessageLookupByLibrary.simpleMessage("سيتم ارساله للمشرف ."),
        "ways_accept_job":
            MessageLookupByLibrary.simpleMessage("طرق قبول الوظيفه"),
        "weight": MessageLookupByLibrary.simpleMessage("الوزن"),
        "welcome_log_in":
            MessageLookupByLibrary.simpleMessage("مرحبا بك قم بتسجيل دخولك"),
        "what_is_reason": MessageLookupByLibrary.simpleMessage("ماهو السبب؟"),
        "what_user_permissions":
            MessageLookupByLibrary.simpleMessage("ماهي صلاحيات المستخدم؟"),
        "whats_number": MessageLookupByLibrary.simpleMessage("رقم الواتساب"),
        "whats_reason_apologizing":
            MessageLookupByLibrary.simpleMessage("ماهو سبب الاعتذار؟"),
        "whats_reason_for_cancel":
            MessageLookupByLibrary.simpleMessage("ما سبب الاعتذار عن الوظيفة"),
        "why_not_attended":
            MessageLookupByLibrary.simpleMessage("لماذا لا يمكنك الحضور ؟"),
        "will_send_request":
            MessageLookupByLibrary.simpleMessage("سيتم تقديم طلبك بنجاح!"),
        "withdraw": MessageLookupByLibrary.simpleMessage("سحب"),
        "withdraw_by_bank_account":
            MessageLookupByLibrary.simpleMessage("عن طريق الحساب البنكي"),
        "withdraw_by_cashier": MessageLookupByLibrary.simpleMessage(
            "عن طريق الكاشير - امين الصندوق"),
        "withdraw_by_phone_wallet_screen_condition_1":
            MessageLookupByLibrary.simpleMessage(
                "عندم تقوم بتحديد محفظتك والضغط علي زر التأكيد سيتم تقديم طلب لإيدام المبلغ في محفظتك"),
        "withdraw_by_phone_wallet_screen_condition_2":
            MessageLookupByLibrary.simpleMessage("لا يمكن إلغاء الطلب"),
        "withdraw_by_phone_wallet_screen_condition_3":
            MessageLookupByLibrary.simpleMessage(
                "التطبيق غير مسئول عن اي خطأ في بيانات محفظة الهاتف الخاصة بك"),
        "withdraw_by_phone_wallet_screen_condition_4":
            MessageLookupByLibrary.simpleMessage(
                "لمعلومات اخري قم بالتواصل مع الدعم الفني"),
        "withdraw_by_smart_wallet": MessageLookupByLibrary.simpleMessage(
            "عن طريق المحفظة الإلكترونية "),
        "withdraw_from_bank_account":
            MessageLookupByLibrary.simpleMessage("سحب من الحساب البنكي"),
        "withdraw_from_phone_wallet":
            MessageLookupByLibrary.simpleMessage("سحب من محفظة الهاتف"),
        "withdraw_through": MessageLookupByLibrary.simpleMessage("سحب من خلال"),
        "withdrawal": MessageLookupByLibrary.simpleMessage("سحب"),
        "withdrawal_registration":
            MessageLookupByLibrary.simpleMessage("تسجيل إنسحاب"),
        "withdrawn_balance":
            MessageLookupByLibrary.simpleMessage("الرصيد المسحوب"),
        "work_finish_at": MessageLookupByLibrary.simpleMessage("ينتهي في "),
        "work_hazard_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل مخاطر العمل"),
        "work_hazards": MessageLookupByLibrary.simpleMessage("مخاطر العمل"),
        "work_inf": MessageLookupByLibrary.simpleMessage("بيانات العمل "),
        "work_location": MessageLookupByLibrary.simpleMessage("مقر العمل"),
        "work_periods": MessageLookupByLibrary.simpleMessage("فترات العمل"),
        "work_point_location":
            MessageLookupByLibrary.simpleMessage("موقع نقطة العمل"),
        "work_specialty": MessageLookupByLibrary.simpleMessage("تخصص العمل"),
        "work_start_at": MessageLookupByLibrary.simpleMessage("يبدء "),
        "workdays": MessageLookupByLibrary.simpleMessage("ايام العمل"),
        "working_date": MessageLookupByLibrary.simpleMessage(" تاريخ العمل"),
        "working_day": MessageLookupByLibrary.simpleMessage("يوم العمل"),
        "working_details":
            MessageLookupByLibrary.simpleMessage("تفاصيل الدوام"),
        "working_document": MessageLookupByLibrary.simpleMessage("وثيقة العمل"),
        "working_hours": MessageLookupByLibrary.simpleMessage("ساعات عملي"),
        "working_hours2": MessageLookupByLibrary.simpleMessage("ساعات العمل"),
        "working_hours_num":
            MessageLookupByLibrary.simpleMessage("عدد ساعات العمل"),
        "working_period": MessageLookupByLibrary.simpleMessage("فترة العمل"),
        "working_time": MessageLookupByLibrary.simpleMessage("وقت العمل"),
        "write_action_to_be_taken":
            MessageLookupByLibrary.simpleMessage("اكتب الإجراء الذي ستتخذه"),
        "write_address": MessageLookupByLibrary.simpleMessage("اكتب العنوان"),
        "write_body_mass":
            MessageLookupByLibrary.simpleMessage("اكتب كتلة الجسم"),
        "write_city": MessageLookupByLibrary.simpleMessage("اكتب المدينه"),
        "write_company_name_insurance":
            MessageLookupByLibrary.simpleMessage("اكتب اسم شركة التأمين"),
        "write_covenant_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم العهده"),
        "write_damage":
            MessageLookupByLibrary.simpleMessage("اكتب العطل الحادث"),
        "write_date": MessageLookupByLibrary.simpleMessage("اكتب التاريخ"),
        "write_direction_directed":
            MessageLookupByLibrary.simpleMessage("اكتب الجهه الموجه اليها"),
        "write_email":
            MessageLookupByLibrary.simpleMessage("اكتب البريد الالكتروني"),
        "write_employee_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم الموظف"),
        "write_expire_date": MessageLookupByLibrary.simpleMessage(
            "اكتب تاريخ انتهاء الصلاحيه EXP."),
        "write_note": MessageLookupByLibrary.simpleMessage("اكتب ملاحظة"),
        "write_number_insurance":
            MessageLookupByLibrary.simpleMessage("اكتب رقم التأمين"),
        "write_period_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم الفترة"),
        "write_purpose_request":
            MessageLookupByLibrary.simpleMessage("اكتب  غرض الطلب"),
        "write_reason_apology":
            MessageLookupByLibrary.simpleMessage("اكتب سبب اعتذارك"),
        "write_terms_conditions_ar": MessageLookupByLibrary.simpleMessage(
            "اكتب الشروط والاحكام باللغة العربية"),
        "write_terms_conditions_en": MessageLookupByLibrary.simpleMessage(
            "اكتب الشروط والاحكام باللغة الانجليزية"),
        "write_user_email":
            MessageLookupByLibrary.simpleMessage("اكتب ايميل المستخدم"),
        "write_user_mobile_number":
            MessageLookupByLibrary.simpleMessage("اكتب رقم الجوال"),
        "write_user_name":
            MessageLookupByLibrary.simpleMessage("اكتب اسم المستخدم"),
        "write_user_password":
            MessageLookupByLibrary.simpleMessage("اكتب كلمة السر"),
        "write_value_pricing":
            MessageLookupByLibrary.simpleMessage(" ادخل قيمة التسعير"),
        "write_vehicle_specifications":
            MessageLookupByLibrary.simpleMessage("اكتب مواصفات المركبة هنا .."),
        "write_working_days":
            MessageLookupByLibrary.simpleMessage("اكتب ايام العمل"),
        "write_your_notes_here":
            MessageLookupByLibrary.simpleMessage("اكتب ملاحظاتك هنا ..."),
        "writing_requirements_ar": MessageLookupByLibrary.simpleMessage(
            "كتابه المتطلبات باللغه العربيه"),
        "writing_requirements_ar_validation":
            MessageLookupByLibrary.simpleMessage(
                "اكتب المتطلبات باللغه العربيه"),
        "writing_requirements_en": MessageLookupByLibrary.simpleMessage(
            "كتابه المتطلبات باللغه الانجليزيه"),
        "writing_requirements_en_validation":
            MessageLookupByLibrary.simpleMessage(
                "اكتب المتطلبات باللغه الانجليزيه"),
        "writing_terms_conditions_ar": MessageLookupByLibrary.simpleMessage(
            "كتابة الشروط والاحكام باللغة العربية"),
        "writing_terms_conditions_en": MessageLookupByLibrary.simpleMessage(
            "كتابة الشروط والاحكام باللغة الانجليزية"),
        "year_crate": MessageLookupByLibrary.simpleMessage("سنة الصنع "),
        "year_manufacture": MessageLookupByLibrary.simpleMessage("سنة الصنع"),
        "yes": MessageLookupByLibrary.simpleMessage("نعم"),
        "you_can_download_project_now_share_it":
            MessageLookupByLibrary.simpleMessage(
                "يمكنك تحميل المشروع الان او مشاركته"),
        "you_favorite_jobs":
            MessageLookupByLibrary.simpleMessage("فرصك المُفضلة"),
        "you_have_to_take_some_points_into_consideration_check_box":
            MessageLookupByLibrary.simpleMessage(
                "عليك اخذ بعض النقط في عين الاعتبار لتقوم بتحديد المربع:"),
        "your_current_location":
            MessageLookupByLibrary.simpleMessage("موقعك الحالي"),
        "your_notes": MessageLookupByLibrary.simpleMessage("ملاحظاتك")
      };
}
