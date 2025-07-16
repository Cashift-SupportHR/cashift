// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select language`
  String get select_language_title {
    return Intl.message(
      'Select language',
      name: 'select_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language_label {
    return Intl.message(
      'Change language',
      name: 'change_language_label',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get working_hours {
    return Intl.message(
      'Working hours',
      name: 'working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `My working hours`
  String get applied_jobs {
    return Intl.message(
      'My working hours',
      name: 'applied_jobs',
      desc: '',
      args: [],
    );
  }

  /// `My resume`
  String get resume {
    return Intl.message(
      'My resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `edit period `
  String get edit_period {
    return Intl.message(
      'edit period ',
      name: 'edit_period',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Tall`
  String get tall {
    return Intl.message(
      'Tall',
      name: 'tall',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be less than six letters or numbers`
  String get invalid_password {
    return Intl.message(
      'Password must not be less than six letters or numbers',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get please_enter_password {
    return Intl.message(
      'Please enter password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get please_enter_email {
    return Intl.message(
      'Please enter email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get login_button {
    return Intl.message(
      'Follow',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account? Register now`
  String get dont_have_acount {
    return Intl.message(
      'Don\\\'t have an account? Register now',
      name: 'dont_have_acount',
      desc: '',
      args: [],
    );
  }

  /// `Current Shift`
  String get current_shift {
    return Intl.message(
      'Current Shift',
      name: 'current_shift',
      desc: '',
      args: [],
    );
  }

  /// `New Jobs`
  String get new_jobs {
    return Intl.message(
      'New Jobs',
      name: 'new_jobs',
      desc: '',
      args: [],
    );
  }

  /// `My working hours`
  String get applied_opportunities {
    return Intl.message(
      'My working hours',
      name: 'applied_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Id Number`
  String get id_number {
    return Intl.message(
      'Id Number',
      name: 'id_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Id Number`
  String get invalid_id_number {
    return Intl.message(
      'Invalid Id Number',
      name: 'invalid_id_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid PhoneNumber`
  String get invalid_phone {
    return Intl.message(
      'Invalid PhoneNumber',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Number`
  String get whats_number {
    return Intl.message(
      'WhatsApp Number',
      name: 'whats_number',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account Number`
  String get bank_iban {
    return Intl.message(
      'Bank Account Number',
      name: 'bank_iban',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Bank account`
  String get invalid_bank_id {
    return Intl.message(
      'Invalid Bank account',
      name: 'invalid_bank_id',
      desc: '',
      args: [],
    );
  }

  /// `BirthDate`
  String get birthdate {
    return Intl.message(
      'BirthDate',
      name: 'birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get invalid_date {
    return Intl.message(
      'Invalid date',
      name: 'invalid_date',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `invalid height`
  String get invalid_height {
    return Intl.message(
      'invalid height',
      name: 'invalid_height',
      desc: '',
      args: [],
    );
  }

  /// `Invalid weight`
  String get invalid_weight {
    return Intl.message(
      'Invalid weight',
      name: 'invalid_weight',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get select_city {
    return Intl.message(
      'Select City',
      name: 'select_city',
      desc: '',
      args: [],
    );
  }

  /// `Select Qualification `
  String get select_qualification {
    return Intl.message(
      'Select Qualification ',
      name: 'select_qualification',
      desc: '',
      args: [],
    );
  }

  /// `Select English Level`
  String get select_english_level {
    return Intl.message(
      'Select English Level',
      name: 'select_english_level',
      desc: '',
      args: [],
    );
  }

  /// `Select Computer Level`
  String get select_computer_level {
    return Intl.message(
      'Select Computer Level',
      name: 'select_computer_level',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_button {
    return Intl.message(
      'Save',
      name: 'save_button',
      desc: '',
      args: [],
    );
  }

  /// `Register Into Cashift`
  String get register_title {
    return Intl.message(
      'Register Into Cashift',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Name in arabic`
  String get name_ar {
    return Intl.message(
      'Name in arabic',
      name: 'name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Name in english`
  String get name_en {
    return Intl.message(
      'Name in english',
      name: 'name_en',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `please entry name in arabic`
  String get invalid_ar_name {
    return Intl.message(
      'please entry name in arabic',
      name: 'invalid_ar_name',
      desc: '',
      args: [],
    );
  }

  /// `please entry name in english `
  String get invalid_en_name {
    return Intl.message(
      'please entry name in english ',
      name: 'invalid_en_name',
      desc: '',
      args: [],
    );
  }

  /// `please entry name `
  String get invalid_name {
    return Intl.message(
      'please entry name ',
      name: 'invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `have an account? Login `
  String get have_account {
    return Intl.message(
      'have an account? Login ',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Error internet connection!`
  String get error_internet_connection {
    return Intl.message(
      'Error internet connection!',
      name: 'error_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your CV`
  String get complete_cv {
    return Intl.message(
      'Please complete your CV',
      name: 'complete_cv',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok_button {
    return Intl.message(
      'Ok',
      name: 'ok_button',
      desc: '',
      args: [],
    );
  }

  /// `Complete Profile`
  String get complete_profile {
    return Intl.message(
      'Complete Profile',
      name: 'complete_profile',
      desc: '',
      args: [],
    );
  }

  /// `The location service must be turned on to ensure that you are on the job site`
  String get open_location {
    return Intl.message(
      'The location service must be turned on to ensure that you are on the job site',
      name: 'open_location',
      desc: '',
      args: [],
    );
  }

  /// `Finish Shift for `
  String get finish_shift_label {
    return Intl.message(
      'Finish Shift for ',
      name: 'finish_shift_label',
      desc: '',
      args: [],
    );
  }

  /// `Start Shift for `
  String get start_shift_label {
    return Intl.message(
      'Start Shift for ',
      name: 'start_shift_label',
      desc: '',
      args: [],
    );
  }

  /// `Add your notes`
  String get add_your_notes {
    return Intl.message(
      'Add your notes',
      name: 'add_your_notes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_button {
    return Intl.message(
      'Cancel',
      name: 'cancel_button',
      desc: '',
      args: [],
    );
  }

  /// `are you sure you want to logout ?`
  String get logout_message {
    return Intl.message(
      'are you sure you want to logout ?',
      name: 'logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error !`
  String get undefine_error {
    return Intl.message(
      'Unknown error !',
      name: 'undefine_error',
      desc: '',
      args: [],
    );
  }

  /// `Check your network connection and try again`
  String get check_network_connection {
    return Intl.message(
      'Check your network connection and try again',
      name: 'check_network_connection',
      desc: '',
      args: [],
    );
  }

  /// `Activity log`
  String get activity_log_title {
    return Intl.message(
      'Activity log',
      name: 'activity_log_title',
      desc: '',
      args: [],
    );
  }

  /// `QrCode have been scanned do you want continue ? `
  String get qr_code_scanned {
    return Intl.message(
      'QrCode have been scanned do you want continue ? ',
      name: 'qr_code_scanned',
      desc: '',
      args: [],
    );
  }

  /// `Please entry city `
  String get invalid_city {
    return Intl.message(
      'Please entry city ',
      name: 'invalid_city',
      desc: '',
      args: [],
    );
  }

  /// `Finish at `
  String get work_finish_at {
    return Intl.message(
      'Finish at ',
      name: 'work_finish_at',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Computer level`
  String get invalid_comp_level {
    return Intl.message(
      'Please Select Computer level',
      name: 'invalid_comp_level',
      desc: '',
      args: [],
    );
  }

  /// `please select english level`
  String get invalid_lang_level {
    return Intl.message(
      'please select english level',
      name: 'invalid_lang_level',
      desc: '',
      args: [],
    );
  }

  /// `please select qualification`
  String get invalid_qualifi {
    return Intl.message(
      'please select qualification',
      name: 'invalid_qualifi',
      desc: '',
      args: [],
    );
  }

  /// `reload`
  String get click_to_reload {
    return Intl.message(
      'reload',
      name: 'click_to_reload',
      desc: '',
      args: [],
    );
  }

  /// ` For`
  String get per {
    return Intl.message(
      ' For',
      name: 'per',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get sar {
    return Intl.message(
      'SAR',
      name: 'sar',
      desc: '',
      args: [],
    );
  }

  /// `remaining time`
  String get remaining_time {
    return Intl.message(
      'remaining time',
      name: 'remaining_time',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm_button {
    return Intl.message(
      'Confirm',
      name: 'confirm_button',
      desc: '',
      args: [],
    );
  }

  /// `Start at`
  String get work_start_at {
    return Intl.message(
      'Start at',
      name: 'work_start_at',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get please_entry_phone {
    return Intl.message(
      'Please enter phone number',
      name: 'please_entry_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter national number`
  String get please_entry_id {
    return Intl.message(
      'Please enter national number',
      name: 'please_entry_id',
      desc: '',
      args: [],
    );
  }

  /// `Please enter whatsapp number`
  String get please_entry_whats_number {
    return Intl.message(
      'Please enter whatsapp number',
      name: 'please_entry_whats_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter birthdate`
  String get please_entry_birthdate {
    return Intl.message(
      'Please enter birthdate',
      name: 'please_entry_birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter weight`
  String get please_entry_weight {
    return Intl.message(
      'Please enter weight',
      name: 'please_entry_weight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter height`
  String get please_entry_height {
    return Intl.message(
      'Please enter height',
      name: 'please_entry_height',
      desc: '',
      args: [],
    );
  }

  /// `This code is not intended for this project`
  String get error_qr {
    return Intl.message(
      'This code is not intended for this project',
      name: 'error_qr',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get new_account {
    return Intl.message(
      'Create New Account',
      name: 'new_account',
      desc: '',
      args: [],
    );
  }

  /// `required login`
  String get required_login {
    return Intl.message(
      'required login',
      name: 'required_login',
      desc: '',
      args: [],
    );
  }

  /// `My financial dues`
  String get collect_cash_title {
    return Intl.message(
      'My financial dues',
      name: 'collect_cash_title',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get collected {
    return Intl.message(
      'Completed',
      name: 'collected',
      desc: '',
      args: [],
    );
  }

  /// `Dues`
  String get not_collected {
    return Intl.message(
      'Dues',
      name: 'not_collected',
      desc: '',
      args: [],
    );
  }

  /// `My dues`
  String get my_dues {
    return Intl.message(
      'My dues',
      name: 'my_dues',
      desc: '',
      args: [],
    );
  }

  /// `status`
  String get status {
    return Intl.message(
      'status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Navigate`
  String get navigate {
    return Intl.message(
      'Navigate',
      name: 'navigate',
      desc: '',
      args: [],
    );
  }

  /// `Cashier locations`
  String get cashier_locations {
    return Intl.message(
      'Cashier locations',
      name: 'cashier_locations',
      desc: '',
      args: [],
    );
  }

  /// `Request code`
  String get request_code {
    return Intl.message(
      'Request code',
      name: 'request_code',
      desc: '',
      args: [],
    );
  }

  /// `Code will appear here`
  String get code_appear_here {
    return Intl.message(
      'Code will appear here',
      name: 'code_appear_here',
      desc: '',
      args: [],
    );
  }

  /// `Share the code for the cashier only when receiving cash.`
  String get share_code_with_cashier {
    return Intl.message(
      'Share the code for the cashier only when receiving cash.',
      name: 'share_code_with_cashier',
      desc: '',
      args: [],
    );
  }

  /// `This code is valid for one time use only.`
  String get code_valid_on_time {
    return Intl.message(
      'This code is valid for one time use only.',
      name: 'code_valid_on_time',
      desc: '',
      args: [],
    );
  }

  /// `The company is not responsible for misuse.`
  String get company_not_responsible_misuse {
    return Intl.message(
      'The company is not responsible for misuse.',
      name: 'company_not_responsible_misuse',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verification_code {
    return Intl.message(
      'Verification code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Qualification Name`
  String get qualification_name {
    return Intl.message(
      'Qualification Name',
      name: 'qualification_name',
      desc: '',
      args: [],
    );
  }

  /// `Please entry qualification name`
  String get invalid_qualification_name {
    return Intl.message(
      'Please entry qualification name',
      name: 'invalid_qualification_name',
      desc: '',
      args: [],
    );
  }

  /// `Favorite jobs`
  String get favorite_jobs {
    return Intl.message(
      'Favorite jobs',
      name: 'favorite_jobs',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to `
  String get accept_copy_rights_label {
    return Intl.message(
      'I have read and agree to ',
      name: 'accept_copy_rights_label',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get copy_rights_title {
    return Intl.message(
      'Terms and Conditions',
      name: 'copy_rights_title',
      desc: '',
      args: [],
    );
  }

  /// `You must login first`
  String get must_login_first {
    return Intl.message(
      'You must login first',
      name: 'must_login_first',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least a triple name`
  String get please_entry_valid_fullName {
    return Intl.message(
      'Please enter at least a triple name',
      name: 'please_entry_valid_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous_button {
    return Intl.message(
      'Previous',
      name: 'previous_button',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next_button {
    return Intl.message(
      'Next',
      name: 'next_button',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Previous Experiences`
  String get previous_experiences {
    return Intl.message(
      'Previous Experiences',
      name: 'previous_experiences',
      desc: '',
      args: [],
    );
  }

  /// `What is your current situation?`
  String get current_situation {
    return Intl.message(
      'What is your current situation?',
      name: 'current_situation',
      desc: '',
      args: [],
    );
  }

  /// `Open app settings`
  String get open_app_settings {
    return Intl.message(
      'Open app settings',
      name: 'open_app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Open location settings`
  String get open_location_settings {
    return Intl.message(
      'Open location settings',
      name: 'open_location_settings',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, you have to go to the application settings and allow permission to access the camera so that you can scan qr code `
  String get denied_camera_permission {
    return Intl.message(
      'Sorry, you have to go to the application settings and allow permission to access the camera so that you can scan qr code ',
      name: 'denied_camera_permission',
      desc: '',
      args: [],
    );
  }

  /// `Collect`
  String get collect_button {
    return Intl.message(
      'Collect',
      name: 'collect_button',
      desc: '',
      args: [],
    );
  }

  /// `My wallet`
  String get mywallet {
    return Intl.message(
      'My wallet',
      name: 'mywallet',
      desc: '',
      args: [],
    );
  }

  /// `working date `
  String get working_date {
    return Intl.message(
      'working date ',
      name: 'working_date',
      desc: '',
      args: [],
    );
  }

  /// `Show location on the map`
  String get goto_map {
    return Intl.message(
      'Show location on the map',
      name: 'goto_map',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Offer Details`
  String get offer_details {
    return Intl.message(
      'Offer Details',
      name: 'offer_details',
      desc: '',
      args: [],
    );
  }

  /// `Show More...`
  String get show_more {
    return Intl.message(
      'Show More...',
      name: 'show_more',
      desc: '',
      args: [],
    );
  }

  /// `Delete My Account`
  String get delete_account {
    return Intl.message(
      'Delete My Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account ? `
  String get delete_account_message {
    return Intl.message(
      'Are you sure you want to delete your account ? ',
      name: 'delete_account_message',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get not_now {
    return Intl.message(
      'Not Now',
      name: 'not_now',
      desc: '',
      args: [],
    );
  }

  /// `There is an app update available that you must download`
  String get new_version_available {
    return Intl.message(
      'There is an app update available that you must download',
      name: 'new_version_available',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Job terms and conditions`
  String get job_terms_and_conditions {
    return Intl.message(
      'Job terms and conditions',
      name: 'job_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `All opportunity`
  String get all_jobs {
    return Intl.message(
      'All opportunity',
      name: 'all_jobs',
      desc: '',
      args: [],
    );
  }

  /// `Vip offers`
  String get vip_offers {
    return Intl.message(
      'Vip offers',
      name: 'vip_offers',
      desc: '',
      args: [],
    );
  }

  /// `your favorite opportunity`
  String get you_favorite_jobs {
    return Intl.message(
      'your favorite opportunity',
      name: 'you_favorite_jobs',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get view_all {
    return Intl.message(
      'view all',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// ` offers waiting you`
  String get jobs_in_waiting {
    return Intl.message(
      ' offers waiting you',
      name: 'jobs_in_waiting',
      desc: '',
      args: [],
    );
  }

  /// `Shift has expired, check-out must be made`
  String get shift_expired_message {
    return Intl.message(
      'Shift has expired, check-out must be made',
      name: 'shift_expired_message',
      desc: '',
      args: [],
    );
  }

  /// `check out`
  String get checkout {
    return Intl.message(
      'check out',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get hour {
    return Intl.message(
      'hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `minute`
  String get minute {
    return Intl.message(
      'minute',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `second`
  String get second {
    return Intl.message(
      'second',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `remaining`
  String get remaining {
    return Intl.message(
      'remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `open map`
  String get open_map {
    return Intl.message(
      'open map',
      name: 'open_map',
      desc: '',
      args: [],
    );
  }

  /// `Earning now `
  String get earning_now {
    return Intl.message(
      'Earning now ',
      name: 'earning_now',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `company details`
  String get company_details {
    return Intl.message(
      'company details',
      name: 'company_details',
      desc: '',
      args: [],
    );
  }

  /// `offer terms`
  String get offer_terms {
    return Intl.message(
      'offer terms',
      name: 'offer_terms',
      desc: '',
      args: [],
    );
  }

  /// `career field`
  String get career_field {
    return Intl.message(
      'career field',
      name: 'career_field',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `salary`
  String get salary {
    return Intl.message(
      'salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Qualification`
  String get qualification {
    return Intl.message(
      'Qualification',
      name: 'qualification',
      desc: '',
      args: [],
    );
  }

  /// `required.No`
  String get required_number {
    return Intl.message(
      'required.No',
      name: 'required_number',
      desc: '',
      args: [],
    );
  }

  /// `remaining.No`
  String get remaining_number {
    return Intl.message(
      'remaining.No',
      name: 'remaining_number',
      desc: '',
      args: [],
    );
  }

  /// `work location`
  String get work_location {
    return Intl.message(
      'work location',
      name: 'work_location',
      desc: '',
      args: [],
    );
  }

  /// `start date`
  String get start_date {
    return Intl.message(
      'start date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  /// `end date`
  String get end_date {
    return Intl.message(
      'end date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  /// `Working time`
  String get working_time {
    return Intl.message(
      'Working time',
      name: 'working_time',
      desc: '',
      args: [],
    );
  }

  /// `How to register attendance`
  String get attendance_method {
    return Intl.message(
      'How to register attendance',
      name: 'attendance_method',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `from `
  String get from {
    return Intl.message(
      'from ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to `
  String get too {
    return Intl.message(
      'to ',
      name: 'too',
      desc: '',
      args: [],
    );
  }

  /// `offer description`
  String get offer_description {
    return Intl.message(
      'offer description',
      name: 'offer_description',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get company_name {
    return Intl.message(
      'Company name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `field type`
  String get field_type {
    return Intl.message(
      'field type',
      name: 'field_type',
      desc: '',
      args: [],
    );
  }

  /// `section`
  String get section {
    return Intl.message(
      'section',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `Qr Scanner`
  String get qr_scanner {
    return Intl.message(
      'Qr Scanner',
      name: 'qr_scanner',
      desc: '',
      args: [],
    );
  }

  /// `Company description`
  String get company_description {
    return Intl.message(
      'Company description',
      name: 'company_description',
      desc: '',
      args: [],
    );
  }

  /// `company jobs`
  String get company_jobs {
    return Intl.message(
      'company jobs',
      name: 'company_jobs',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Show details`
  String get show_details {
    return Intl.message(
      'Show details',
      name: 'show_details',
      desc: '',
      args: [],
    );
  }

  /// `job description`
  String get job_description {
    return Intl.message(
      'job description',
      name: 'job_description',
      desc: '',
      args: [],
    );
  }

  /// `check in`
  String get checkin {
    return Intl.message(
      'check in',
      name: 'checkin',
      desc: '',
      args: [],
    );
  }

  /// `withdrawal`
  String get withdrawal {
    return Intl.message(
      'withdrawal',
      name: 'withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get account {
    return Intl.message(
      'Profile',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `general settings`
  String get general_settings {
    return Intl.message(
      'general settings',
      name: 'general_settings',
      desc: '',
      args: [],
    );
  }

  /// `Personal info`
  String get personal_info {
    return Intl.message(
      'Personal info',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enter_full_name {
    return Intl.message(
      'Enter your full name',
      name: 'enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter the ID number`
  String get enter_id_number {
    return Intl.message(
      'Enter the ID number',
      name: 'enter_id_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enter_email {
    return Intl.message(
      'Enter email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter the date of birth (Hijri or Gregorian)`
  String get enter_birthdate {
    return Intl.message(
      'Enter the date of birth (Hijri or Gregorian)',
      name: 'enter_birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Find your city`
  String get find_your_city {
    return Intl.message(
      'Find your city',
      name: 'find_your_city',
      desc: '',
      args: [],
    );
  }

  /// `Select your current situation`
  String get select_current_situation {
    return Intl.message(
      'Select your current situation',
      name: 'select_current_situation',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get expired {
    return Intl.message(
      'Full',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `favorite work places`
  String get favorite_projects {
    return Intl.message(
      'favorite work places',
      name: 'favorite_projects',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select_favorite_projects {
    return Intl.message(
      'Select',
      name: 'select_favorite_projects',
      desc: '',
      args: [],
    );
  }

  /// `please select your preferred workplaces`
  String get favorite_projects_not_selected {
    return Intl.message(
      'please select your preferred workplaces',
      name: 'favorite_projects_not_selected',
      desc: '',
      args: [],
    );
  }

  /// `Apologies for not attending`
  String get cancel_shift_title {
    return Intl.message(
      'Apologies for not attending',
      name: 'cancel_shift_title',
      desc: '',
      args: [],
    );
  }

  /// `What is the reason for the apology for the job?`
  String get whats_reason_for_cancel {
    return Intl.message(
      'What is the reason for the apology for the job?',
      name: 'whats_reason_for_cancel',
      desc: '',
      args: [],
    );
  }

  /// `select all`
  String get select_all {
    return Intl.message(
      'select all',
      name: 'select_all',
      desc: '',
      args: [],
    );
  }

  /// `Bank account`
  String get bank_account {
    return Intl.message(
      'Bank account',
      name: 'bank_account',
      desc: '',
      args: [],
    );
  }

  /// `select withdraw method`
  String get select_withdraw_method {
    return Intl.message(
      'select withdraw method',
      name: 'select_withdraw_method',
      desc: '',
      args: [],
    );
  }

  /// `IBAN Code`
  String get iban {
    return Intl.message(
      'IBAN Code',
      name: 'iban',
      desc: '',
      args: [],
    );
  }

  /// `please fill iban`
  String get please_fill_iban {
    return Intl.message(
      'please fill iban',
      name: 'please_fill_iban',
      desc: '',
      args: [],
    );
  }

  /// `Invalid iban`
  String get invalid_iban {
    return Intl.message(
      'Invalid iban',
      name: 'invalid_iban',
      desc: '',
      args: [],
    );
  }

  /// `please select bank`
  String get please_select_bank {
    return Intl.message(
      'please select bank',
      name: 'please_select_bank',
      desc: '',
      args: [],
    );
  }

  /// `iban not matched`
  String get iban_not_matched {
    return Intl.message(
      'iban not matched',
      name: 'iban_not_matched',
      desc: '',
      args: [],
    );
  }

  /// `withdraw by cashier`
  String get withdraw_by_cashier {
    return Intl.message(
      'withdraw by cashier',
      name: 'withdraw_by_cashier',
      desc: '',
      args: [],
    );
  }

  /// `withdraw by bank account`
  String get withdraw_by_bank_account {
    return Intl.message(
      'withdraw by bank account',
      name: 'withdraw_by_bank_account',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `The amount will be deposited into your bank account`
  String get amount_will_be_withdraw {
    return Intl.message(
      'The amount will be deposited into your bank account',
      name: 'amount_will_be_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Add Bank Account`
  String get add_bank_account {
    return Intl.message(
      'Add Bank Account',
      name: 'add_bank_account',
      desc: '',
      args: [],
    );
  }

  /// `select bank name`
  String get select_bank_name {
    return Intl.message(
      'select bank name',
      name: 'select_bank_name',
      desc: '',
      args: [],
    );
  }

  /// `bank name`
  String get bank_name {
    return Intl.message(
      'bank name',
      name: 'bank_name',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Confirm IBAN Code`
  String get confirm_iban {
    return Intl.message(
      'Confirm IBAN Code',
      name: 'confirm_iban',
      desc: '',
      args: [],
    );
  }

  /// `Important Disclosure`
  String get important_disclosure {
    return Intl.message(
      'Important Disclosure',
      name: 'important_disclosure',
      desc: '',
      args: [],
    );
  }

  /// `Rate your experience with the company`
  String get rate_title {
    return Intl.message(
      'Rate your experience with the company',
      name: 'rate_title',
      desc: '',
      args: [],
    );
  }

  /// `Help us improve our services by rating us`
  String get rate_subtitle {
    return Intl.message(
      'Help us improve our services by rating us',
      name: 'rate_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your attendance for a shift`
  String get confirm_attendance_message {
    return Intl.message(
      'Please confirm your attendance for a shift',
      name: 'confirm_attendance_message',
      desc: '',
      args: [],
    );
  }

  /// `Please select you current situation`
  String get please_select_current_situation {
    return Intl.message(
      'Please select you current situation',
      name: 'please_select_current_situation',
      desc: '',
      args: [],
    );
  }

  /// `Check-in and check-out`
  String get attendance_title {
    return Intl.message(
      'Check-in and check-out',
      name: 'attendance_title',
      desc: '',
      args: [],
    );
  }

  /// `Check-in Or check-out`
  String get check_finger {
    return Intl.message(
      'Check-in Or check-out',
      name: 'check_finger',
      desc: '',
      args: [],
    );
  }

  /// `Phone wallet`
  String get phone_wallet_title {
    return Intl.message(
      'Phone wallet',
      name: 'phone_wallet_title',
      desc: '',
      args: [],
    );
  }

  /// `withdraw by electronic wallet`
  String get withdraw_by_smart_wallet {
    return Intl.message(
      'withdraw by electronic wallet',
      name: 'withdraw_by_smart_wallet',
      desc: '',
      args: [],
    );
  }

  /// `service provider`
  String get service_provider {
    return Intl.message(
      'service provider',
      name: 'service_provider',
      desc: '',
      args: [],
    );
  }

  /// `select service provider`
  String get select_service_provider {
    return Intl.message(
      'select service provider',
      name: 'select_service_provider',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `start overtime`
  String get start_overtime {
    return Intl.message(
      'start overtime',
      name: 'start_overtime',
      desc: '',
      args: [],
    );
  }

  /// `end overtime`
  String get end_overtime {
    return Intl.message(
      'end overtime',
      name: 'end_overtime',
      desc: '',
      args: [],
    );
  }

  /// `overtime`
  String get overtime_screen_title {
    return Intl.message(
      'overtime',
      name: 'overtime_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `attendance`
  String get attendance_days {
    return Intl.message(
      'attendance',
      name: 'attendance_days',
      desc: '',
      args: [],
    );
  }

  /// `absence`
  String get absence_days {
    return Intl.message(
      'absence',
      name: 'absence_days',
      desc: '',
      args: [],
    );
  }

  /// `delay`
  String get delay_days {
    return Intl.message(
      'delay',
      name: 'delay_days',
      desc: '',
      args: [],
    );
  }

  /// `working hours`
  String get shift_hours {
    return Intl.message(
      'working hours',
      name: 'shift_hours',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to login your account `
  String get authenticate_bio_msg {
    return Intl.message(
      'Please authenticate to login your account ',
      name: 'authenticate_bio_msg',
      desc: '',
      args: [],
    );
  }

  /// `Biometric authentication`
  String get biometric_authentication {
    return Intl.message(
      'Biometric authentication',
      name: 'biometric_authentication',
      desc: '',
      args: [],
    );
  }

  /// `No thanks`
  String get no_thanks {
    return Intl.message(
      'No thanks',
      name: 'no_thanks',
      desc: '',
      args: [],
    );
  }

  /// `Your phone does not support biometrics`
  String get phone_not_supported_bio {
    return Intl.message(
      'Your phone does not support biometrics',
      name: 'phone_not_supported_bio',
      desc: '',
      args: [],
    );
  }

  /// `Scan a code`
  String get scan_code {
    return Intl.message(
      'Scan a code',
      name: 'scan_code',
      desc: '',
      args: [],
    );
  }

  /// `back camera`
  String get back_camera {
    return Intl.message(
      'back camera',
      name: 'back_camera',
      desc: '',
      args: [],
    );
  }

  /// `front camera`
  String get front_camera {
    return Intl.message(
      'front camera',
      name: 'front_camera',
      desc: '',
      args: [],
    );
  }

  /// `pause`
  String get pause {
    return Intl.message(
      'pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `resume`
  String get resume_qr {
    return Intl.message(
      'resume',
      name: 'resume_qr',
      desc: '',
      args: [],
    );
  }

  /// `Special offers (soon)`
  String get special_offer {
    return Intl.message(
      'Special offers (soon)',
      name: 'special_offer',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive`
  String get exclusive {
    return Intl.message(
      'Exclusive',
      name: 'exclusive',
      desc: '',
      args: [],
    );
  }

  /// `Apply now`
  String get apply_now {
    return Intl.message(
      'Apply now',
      name: 'apply_now',
      desc: '',
      args: [],
    );
  }

  /// `Serve on my way`
  String get serve_on_my_way {
    return Intl.message(
      'Serve on my way',
      name: 'serve_on_my_way',
      desc: '',
      args: [],
    );
  }

  /// `Get me on your way`
  String get get_me_on_your_way {
    return Intl.message(
      'Get me on your way',
      name: 'get_me_on_your_way',
      desc: '',
      args: [],
    );
  }

  /// `applied jobs`
  String get applied_jobs2 {
    return Intl.message(
      'applied jobs',
      name: 'applied_jobs2',
      desc: '',
      args: [],
    );
  }

  /// `previous jobs`
  String get previous_jobs {
    return Intl.message(
      'previous jobs',
      name: 'previous_jobs',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Available opportunities`
  String get available_opportunities {
    return Intl.message(
      'Available opportunities',
      name: 'available_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Jobs review`
  String get jobs_review {
    return Intl.message(
      'Jobs review',
      name: 'jobs_review',
      desc: '',
      args: [],
    );
  }

  /// `Attendance and departure`
  String get attendance_departure {
    return Intl.message(
      'Attendance and departure',
      name: 'attendance_departure',
      desc: '',
      args: [],
    );
  }

  /// `attendance`
  String get dta_service {
    return Intl.message(
      'attendance',
      name: 'dta_service',
      desc: '',
      args: [],
    );
  }

  /// `Complete service`
  String get complete_service {
    return Intl.message(
      'Complete service',
      name: 'complete_service',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity value`
  String get opportunity_value {
    return Intl.message(
      'Opportunity value',
      name: 'opportunity_value',
      desc: '',
      args: [],
    );
  }

  /// `SR`
  String get sr {
    return Intl.message(
      'SR',
      name: 'sr',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity terms`
  String get job_opportunity {
    return Intl.message(
      'Opportunity terms',
      name: 'job_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Job field`
  String get job_field {
    return Intl.message(
      'Job field',
      name: 'job_field',
      desc: '',
      args: [],
    );
  }

  /// `Work specialty`
  String get work_specialty {
    return Intl.message(
      'Work specialty',
      name: 'work_specialty',
      desc: '',
      args: [],
    );
  }

  /// `Num`
  String get num {
    return Intl.message(
      'Num',
      name: 'num',
      desc: '',
      args: [],
    );
  }

  /// `{quantity} Person`
  String person(int quantity) {
    return Intl.message(
      '$quantity Person',
      name: 'person',
      desc: 'description',
      args: [quantity],
    );
  }

  /// `On my way`
  String get on_my_way {
    return Intl.message(
      'On my way',
      name: 'on_my_way',
      desc: '',
      args: [],
    );
  }

  /// `General conditions`
  String get general_conditions {
    return Intl.message(
      'General conditions',
      name: 'general_conditions',
      desc: '',
      args: [],
    );
  }

  /// `If you own a car, would you like to increase your income?`
  String get has_a_car {
    return Intl.message(
      'If you own a car, would you like to increase your income?',
      name: 'has_a_car',
      desc: '',
      args: [],
    );
  }

  /// `If you do not have a car, would you like to drive you to work?`
  String get has_not_a_car {
    return Intl.message(
      'If you do not have a car, would you like to drive you to work?',
      name: 'has_not_a_car',
      desc: '',
      args: [],
    );
  }

  /// `Add a new opportunity`
  String get add_new_opportunity {
    return Intl.message(
      'Add a new opportunity',
      name: 'add_new_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Job opportunity details`
  String get job_opportunity_details {
    return Intl.message(
      'Job opportunity details',
      name: 'job_opportunity_details',
      desc: '',
      args: [],
    );
  }

  /// `Contract clause`
  String get contract_clause {
    return Intl.message(
      'Contract clause',
      name: 'contract_clause',
      desc: '',
      args: [],
    );
  }

  /// `Allowed time ahead`
  String get allowed_time_ahead {
    return Intl.message(
      'Allowed time ahead',
      name: 'allowed_time_ahead',
      desc: '',
      args: [],
    );
  }

  /// `Time allowed after deadline`
  String get time_allowed_after_deadline {
    return Intl.message(
      'Time allowed after deadline',
      name: 'time_allowed_after_deadline',
      desc: '',
      args: [],
    );
  }

  /// `Back-up number`
  String get back_up_number {
    return Intl.message(
      'Back-up number',
      name: 'back_up_number',
      desc: '',
      args: [],
    );
  }

  /// `Working day`
  String get working_day {
    return Intl.message(
      'Working day',
      name: 'working_day',
      desc: '',
      args: [],
    );
  }

  /// `How to accept the opportunity`
  String get how_accept_job {
    return Intl.message(
      'How to accept the opportunity',
      name: 'how_accept_job',
      desc: '',
      args: [],
    );
  }

  /// `Method of calculating opportunity`
  String get method_calculating_opportunity {
    return Intl.message(
      'Method of calculating opportunity',
      name: 'method_calculating_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get this_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Select method of calculating opportunity`
  String get select_method_calculating_opportunity {
    return Intl.message(
      'Select method of calculating opportunity',
      name: 'select_method_calculating_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Select contract clause`
  String get select_contract_clause {
    return Intl.message(
      'Select contract clause',
      name: 'select_contract_clause',
      desc: '',
      args: [],
    );
  }

  /// `Working period`
  String get working_period {
    return Intl.message(
      'Working period',
      name: 'working_period',
      desc: '',
      args: [],
    );
  }

  /// `Select working period`
  String get select_working_period {
    return Intl.message(
      'Select working period',
      name: 'select_working_period',
      desc: '',
      args: [],
    );
  }

  /// `Select how to accept the job`
  String get select_how_accept_job {
    return Intl.message(
      'Select how to accept the job',
      name: 'select_how_accept_job',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `dates not set`
  String get dates_not_set {
    return Intl.message(
      'dates not set',
      name: 'dates_not_set',
      desc: '',
      args: [],
    );
  }

  /// `services`
  String get services {
    return Intl.message(
      'services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `No.Applicants`
  String get num_applicants {
    return Intl.message(
      'No.Applicants',
      name: 'num_applicants',
      desc: '',
      args: [],
    );
  }

  /// `No.Accepted`
  String get num_accepted {
    return Intl.message(
      'No.Accepted',
      name: 'num_accepted',
      desc: '',
      args: [],
    );
  }

  /// `No.Reserve`
  String get num_reserve {
    return Intl.message(
      'No.Reserve',
      name: 'num_reserve',
      desc: '',
      args: [],
    );
  }

  /// `Beginning work`
  String get beginning_work {
    return Intl.message(
      'Beginning work',
      name: 'beginning_work',
      desc: '',
      args: [],
    );
  }

  /// `End work`
  String get end_work {
    return Intl.message(
      'End work',
      name: 'end_work',
      desc: '',
      args: [],
    );
  }

  /// `Add an employee on opportunity`
  String get add_employee_on_opportunity {
    return Intl.message(
      'Add an employee on opportunity',
      name: 'add_employee_on_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobile_number {
    return Intl.message(
      'Mobile number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `List of applicants`
  String get menu_applicants {
    return Intl.message(
      'List of applicants',
      name: 'menu_applicants',
      desc: '',
      args: [],
    );
  }

  /// `Edit opportunity`
  String get edit_opportunity {
    return Intl.message(
      'Edit opportunity',
      name: 'edit_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Add chashifter`
  String get add_applicant {
    return Intl.message(
      'Add chashifter',
      name: 'add_applicant',
      desc: '',
      args: [],
    );
  }

  /// `Cancel opportunity`
  String get cancel_opportunity {
    return Intl.message(
      'Cancel opportunity',
      name: 'cancel_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to cancel the opportunity?`
  String get cancel_message_opportunity {
    return Intl.message(
      'Do you want to cancel the opportunity?',
      name: 'cancel_message_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Select working day date`
  String get select_working_day_date {
    return Intl.message(
      'Select working day date',
      name: 'select_working_day_date',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity details`
  String get opportunity_details {
    return Intl.message(
      'Opportunity details',
      name: 'opportunity_details',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get working_hours2 {
    return Intl.message(
      'Working hours',
      name: 'working_hours2',
      desc: '',
      args: [],
    );
  }

  /// `Project name`
  String get project_name {
    return Intl.message(
      'Project name',
      name: 'project_name',
      desc: '',
      args: [],
    );
  }

  /// `Create date`
  String get create_date {
    return Intl.message(
      'Create date',
      name: 'create_date',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity terms`
  String get opportunity_terms {
    return Intl.message(
      'Opportunity terms',
      name: 'opportunity_terms',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get show_less {
    return Intl.message(
      'Show less',
      name: 'show_less',
      desc: '',
      args: [],
    );
  }

  /// `Required mobile number`
  String get required_mobile_number {
    return Intl.message(
      'Required mobile number',
      name: 'required_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `New mobile number`
  String get mobile_number_new {
    return Intl.message(
      'New mobile number',
      name: 'mobile_number_new',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity date`
  String get opportunity_date {
    return Intl.message(
      'Opportunity date',
      name: 'opportunity_date',
      desc: '',
      args: [],
    );
  }

  /// `The number required for the opportunity`
  String get opportunities_num {
    return Intl.message(
      'The number required for the opportunity',
      name: 'opportunities_num',
      desc: '',
      args: [],
    );
  }

  /// `Period before start opportunity`
  String get period_before_start_opportunity {
    return Intl.message(
      'Period before start opportunity',
      name: 'period_before_start_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Period after start opportunity`
  String get period_after_start_opportunity {
    return Intl.message(
      'Period after start opportunity',
      name: 'period_after_start_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Applicant's name`
  String get employee_name {
    return Intl.message(
      'Applicant\'s name',
      name: 'employee_name',
      desc: '',
      args: [],
    );
  }

  /// `Approval order`
  String get approval_order {
    return Intl.message(
      'Approval order',
      name: 'approval_order',
      desc: '',
      args: [],
    );
  }

  /// `Write the required number`
  String get type_opportunities_number {
    return Intl.message(
      'Write the required number',
      name: 'type_opportunities_number',
      desc: '',
      args: [],
    );
  }

  /// `select profession`
  String get select_profession {
    return Intl.message(
      'select profession',
      name: 'select_profession',
      desc: '',
      args: [],
    );
  }

  /// `length`
  String get length {
    return Intl.message(
      'length',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Enter length`
  String get enter_length {
    return Intl.message(
      'Enter length',
      name: 'enter_length',
      desc: '',
      args: [],
    );
  }

  /// `Enter weight`
  String get enter_weight {
    return Intl.message(
      'Enter weight',
      name: 'enter_weight',
      desc: '',
      args: [],
    );
  }

  /// `Invalid length`
  String get invalid_length {
    return Intl.message(
      'Invalid length',
      name: 'invalid_length',
      desc: '',
      args: [],
    );
  }

  /// `opportunity name :`
  String get opportunity_name {
    return Intl.message(
      'opportunity name :',
      name: 'opportunity_name',
      desc: '',
      args: [],
    );
  }

  /// `deserved amount :`
  String get deserved_amount {
    return Intl.message(
      'deserved amount :',
      name: 'deserved_amount',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity Transaction Details`
  String get opportunity_details_more {
    return Intl.message(
      'Opportunity Transaction Details',
      name: 'opportunity_details_more',
      desc: '',
      args: [],
    );
  }

  /// `Transfer balance`
  String get transfer_balance {
    return Intl.message(
      'Transfer balance',
      name: 'transfer_balance',
      desc: '',
      args: [],
    );
  }

  /// `Current balance`
  String get current_balance {
    return Intl.message(
      'Current balance',
      name: 'current_balance',
      desc: '',
      args: [],
    );
  }

  /// `ٌR.S`
  String get rs {
    return Intl.message(
      'ٌR.S',
      name: 'rs',
      desc: '',
      args: [],
    );
  }

  /// `transfer money`
  String get transfer_money {
    return Intl.message(
      'transfer money',
      name: 'transfer_money',
      desc: '',
      args: [],
    );
  }

  /// `corporate balances`
  String get corporate_balances {
    return Intl.message(
      'corporate balances',
      name: 'corporate_balances',
      desc: '',
      args: [],
    );
  }

  /// `transaction history`
  String get transaction_history {
    return Intl.message(
      'transaction history',
      name: 'transaction_history',
      desc: '',
      args: [],
    );
  }

  /// `A request to deposit the amount will be submitted to your account.`
  String get submit_your_request {
    return Intl.message(
      'A request to deposit the amount will be submitted to your account.',
      name: 'submit_your_request',
      desc: '',
      args: [],
    );
  }

  /// `You cannot cancel a transfer request`
  String get cancellation_transfer_request {
    return Intl.message(
      'You cannot cancel a transfer request',
      name: 'cancellation_transfer_request',
      desc: '',
      args: [],
    );
  }

  /// `The application is not responsible for any error in the entered data.`
  String get application_not_responsible {
    return Intl.message(
      'The application is not responsible for any error in the entered data.',
      name: 'application_not_responsible',
      desc: '',
      args: [],
    );
  }

  /// `You are not entitled to ask the app for a refund in case of error`
  String get not_entitled_ask {
    return Intl.message(
      'You are not entitled to ask the app for a refund in case of error',
      name: 'not_entitled_ask',
      desc: '',
      args: [],
    );
  }

  /// `Transfer confirmation`
  String get transfer_confirm {
    return Intl.message(
      'Transfer confirmation',
      name: 'transfer_confirm',
      desc: '',
      args: [],
    );
  }

  /// `An amount of {quantity}  r.s will be transferred from your account in the {companyName} Company by  {withdrawMethod} `
  String transfer_confirm_message(
      String companyName, String quantity, String withdrawMethod) {
    return Intl.message(
      'An amount of $quantity  r.s will be transferred from your account in the $companyName Company by  $withdrawMethod ',
      name: 'transfer_confirm_message',
      desc: 'description',
      args: [companyName, quantity, withdrawMethod],
    );
  }

  /// `other information you can contact with`
  String get further_information {
    return Intl.message(
      'other information you can contact with',
      name: 'further_information',
      desc: '',
      args: [],
    );
  }

  /// `The balance is hidden`
  String get balance_hidden {
    return Intl.message(
      'The balance is hidden',
      name: 'balance_hidden',
      desc: '',
      args: [],
    );
  }

  /// `Click here to access your account`
  String get click_access_account {
    return Intl.message(
      'Click here to access your account',
      name: 'click_access_account',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawn Balance`
  String get withdrawn_balance {
    return Intl.message(
      'Withdrawn Balance',
      name: 'withdrawn_balance',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Balance`
  String get remaining_balance {
    return Intl.message(
      'Remaining Balance',
      name: 'remaining_balance',
      desc: '',
      args: [],
    );
  }

  /// `cancel transferred`
  String get cancel_transfare {
    return Intl.message(
      'cancel transferred',
      name: 'cancel_transfare',
      desc: '',
      args: [],
    );
  }

  /// `Transfer amount`
  String get transfer_amount {
    return Intl.message(
      'Transfer amount',
      name: 'transfer_amount',
      desc: '',
      args: [],
    );
  }

  /// `Transfer fee`
  String get transfer_fee {
    return Intl.message(
      'Transfer fee',
      name: 'transfer_fee',
      desc: '',
      args: [],
    );
  }

  /// `Net amount transferred`
  String get net_amount_transferred {
    return Intl.message(
      'Net amount transferred',
      name: 'net_amount_transferred',
      desc: '',
      args: [],
    );
  }

  /// `Transfer details`
  String get transfer_details {
    return Intl.message(
      'Transfer details',
      name: 'transfer_details',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer {
    return Intl.message(
      'Transfer',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Transfer from`
  String get transfer_from {
    return Intl.message(
      'Transfer from',
      name: 'transfer_from',
      desc: '',
      args: [],
    );
  }

  /// `Transfer method`
  String get transfer_method {
    return Intl.message(
      'Transfer method',
      name: 'transfer_method',
      desc: '',
      args: [],
    );
  }

  /// `Amount value`
  String get amount_value {
    return Intl.message(
      'Amount value',
      name: 'amount_value',
      desc: '',
      args: [],
    );
  }

  /// `Search for company`
  String get search_for_company {
    return Intl.message(
      'Search for company',
      name: 'search_for_company',
      desc: '',
      args: [],
    );
  }

  /// `Please select company`
  String get please_select_company {
    return Intl.message(
      'Please select company',
      name: 'please_select_company',
      desc: '',
      args: [],
    );
  }

  /// `Select company`
  String get select_company {
    return Intl.message(
      'Select company',
      name: 'select_company',
      desc: '',
      args: [],
    );
  }

  /// `Select transfer method`
  String get select_transfer_method {
    return Intl.message(
      'Select transfer method',
      name: 'select_transfer_method',
      desc: '',
      args: [],
    );
  }

  /// `Not added phone wallet data`
  String get not_added_phone_wallet_data {
    return Intl.message(
      'Not added phone wallet data',
      name: 'not_added_phone_wallet_data',
      desc: '',
      args: [],
    );
  }

  /// `Add wallet`
  String get add_wallet {
    return Intl.message(
      'Add wallet',
      name: 'add_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Not have bank account`
  String get not_have_bank_account {
    return Intl.message(
      'Not have bank account',
      name: 'not_have_bank_account',
      desc: '',
      args: [],
    );
  }

  /// `Please select wallet`
  String get please_select_wallet {
    return Intl.message(
      'Please select wallet',
      name: 'please_select_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Select wallet`
  String get select_wallet {
    return Intl.message(
      'Select wallet',
      name: 'select_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Riyals`
  String get saudi_riyals {
    return Intl.message(
      'Saudi Riyals',
      name: 'saudi_riyals',
      desc: '',
      args: [],
    );
  }

  /// `ID number recipient account`
  String get id_number_recipient_account {
    return Intl.message(
      'ID number recipient account',
      name: 'id_number_recipient_account',
      desc: '',
      args: [],
    );
  }

  /// `Account received`
  String get account_received {
    return Intl.message(
      'Account received',
      name: 'account_received',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw from phone wallet`
  String get withdraw_from_phone_wallet {
    return Intl.message(
      'Withdraw from phone wallet',
      name: 'withdraw_from_phone_wallet',
      desc: '',
      args: [],
    );
  }

  /// `When you select your wallet and press the confirm button, a request will be submitted to deposit the amount in your wallet.`
  String get withdraw_by_phone_wallet_screen_condition_1 {
    return Intl.message(
      'When you select your wallet and press the confirm button, a request will be submitted to deposit the amount in your wallet.',
      name: 'withdraw_by_phone_wallet_screen_condition_1',
      desc: '',
      args: [],
    );
  }

  /// `The order cannot be cancelled.`
  String get withdraw_by_phone_wallet_screen_condition_2 {
    return Intl.message(
      'The order cannot be cancelled.',
      name: 'withdraw_by_phone_wallet_screen_condition_2',
      desc: '',
      args: [],
    );
  }

  /// `The application is not responsible for any error in your phone wallet data.`
  String get withdraw_by_phone_wallet_screen_condition_3 {
    return Intl.message(
      'The application is not responsible for any error in your phone wallet data.',
      name: 'withdraw_by_phone_wallet_screen_condition_3',
      desc: '',
      args: [],
    );
  }

  /// `For further information, contact technical support.`
  String get withdraw_by_phone_wallet_screen_condition_4 {
    return Intl.message(
      'For further information, contact technical support.',
      name: 'withdraw_by_phone_wallet_screen_condition_4',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw through`
  String get withdraw_through {
    return Intl.message(
      'Withdraw through',
      name: 'withdraw_through',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message(
      'Withdraw',
      name: 'withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Cancel transfer`
  String get cancel_transfer {
    return Intl.message(
      'Cancel transfer',
      name: 'cancel_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the transfer?`
  String get are_you_sure_cancel_transfer {
    return Intl.message(
      'Are you sure you want to cancel the transfer?',
      name: 'are_you_sure_cancel_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Scan your code`
  String get scan_your_code {
    return Intl.message(
      'Scan your code',
      name: 'scan_your_code',
      desc: '',
      args: [],
    );
  }

  /// `Technical support`
  String get technical_support {
    return Intl.message(
      'Technical support',
      name: 'technical_support',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Only Saudi phone numbers are accepted`
  String get saudi_phone_numbers_accepted {
    return Intl.message(
      'Only Saudi phone numbers are accepted',
      name: 'saudi_phone_numbers_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Only IBAN numbers for Saudi bank customers are accepted`
  String get iban_numbers_saudi_bank_customers_accepted {
    return Intl.message(
      'Only IBAN numbers for Saudi bank customers are accepted',
      name: 'iban_numbers_saudi_bank_customers_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw from bank account`
  String get withdraw_from_bank_account {
    return Intl.message(
      'Withdraw from bank account',
      name: 'withdraw_from_bank_account',
      desc: '',
      args: [],
    );
  }

  /// `Add new wallet`
  String get add_new_wallet {
    return Intl.message(
      'Add new wallet',
      name: 'add_new_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password again`
  String get enter_password_again {
    return Intl.message(
      'Enter password again',
      name: 'enter_password_again',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get password_not_match {
    return Intl.message(
      'Password not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Select qualification name`
  String get select_qualification_name {
    return Intl.message(
      'Select qualification name',
      name: 'select_qualification_name',
      desc: '',
      args: [],
    );
  }

  /// `Search for your qualification name`
  String get search_for_your_qualification_name {
    return Intl.message(
      'Search for your qualification name',
      name: 'search_for_your_qualification_name',
      desc: '',
      args: [],
    );
  }

  /// `Hijri`
  String get hijri {
    return Intl.message(
      'Hijri',
      name: 'hijri',
      desc: '',
      args: [],
    );
  }

  /// `Biometrics service not enabled`
  String get biometrics_service_not_enabled {
    return Intl.message(
      'Biometrics service not enabled',
      name: 'biometrics_service_not_enabled',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable it?`
  String get do_want_to_enable_it {
    return Intl.message(
      'Do you want to enable it?',
      name: 'do_want_to_enable_it',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message(
      'Enable',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, log in`
  String get welcome_log_in {
    return Intl.message(
      'Welcome, log in',
      name: 'welcome_log_in',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to retrieve your password`
  String get enter_your_phone_number_retrieve_password {
    return Intl.message(
      'Enter your phone number to retrieve your password',
      name: 'enter_your_phone_number_retrieve_password',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get please_enter_new_password {
    return Intl.message(
      '',
      name: 'please_enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Favorite places`
  String get favorite_places {
    return Intl.message(
      'Favorite places',
      name: 'favorite_places',
      desc: '',
      args: [],
    );
  }

  /// `Add new place`
  String get add_new_place {
    return Intl.message(
      'Add new place',
      name: 'add_new_place',
      desc: '',
      args: [],
    );
  }

  /// `Please enter match password`
  String get please_enter_match_password {
    return Intl.message(
      'Please enter match password',
      name: 'please_enter_match_password',
      desc: '',
      args: [],
    );
  }

  /// `Official wear`
  String get official_wear {
    return Intl.message(
      'Official wear',
      name: 'official_wear',
      desc: '',
      args: [],
    );
  }

  /// `Apologies for submission`
  String get apologies_for_submission {
    return Intl.message(
      'Apologies for submission',
      name: 'apologies_for_submission',
      desc: '',
      args: [],
    );
  }

  /// `Attendance conditions`
  String get attendance_conditions {
    return Intl.message(
      'Attendance conditions',
      name: 'attendance_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Working details`
  String get working_details {
    return Intl.message(
      'Working details',
      name: 'working_details',
      desc: '',
      args: [],
    );
  }

  /// `Reserved opportunities`
  String get reserved_opportunities {
    return Intl.message(
      'Reserved opportunities',
      name: 'reserved_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `taught_us`
  String get taught_us {
    return Intl.message(
      'taught_us',
      name: 'taught_us',
      desc: '',
      args: [],
    );
  }

  /// `Absence Notice`
  String get absenceNotice {
    return Intl.message(
      'Absence Notice',
      name: 'absenceNotice',
      desc: '',
      args: [],
    );
  }

  /// `Select the date of absence`
  String get select_date_absence {
    return Intl.message(
      'Select the date of absence',
      name: 'select_date_absence',
      desc: '',
      args: [],
    );
  }

  /// `date absence`
  String get date_absence {
    return Intl.message(
      'date absence',
      name: 'date_absence',
      desc: '',
      args: [],
    );
  }

  /// `reasons for absence`
  String get reasons_for_absence {
    return Intl.message(
      'reasons for absence',
      name: 'reasons_for_absence',
      desc: '',
      args: [],
    );
  }

  /// `days of absence`
  String get days_absence {
    return Intl.message(
      'days of absence',
      name: 'days_absence',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the service of notice of absence, which is informing us of your non-attendance 12 hours before the start of your work time, from which only the day of absence will be deducted without penalty, out of concern and appreciation for your circumstances.`
  String get offer_you_service {
    return Intl.message(
      'We offer you the service of notice of absence, which is informing us of your non-attendance 12 hours before the start of your work time, from which only the day of absence will be deducted without penalty, out of concern and appreciation for your circumstances.',
      name: 'offer_you_service',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the date`
  String get validate_date {
    return Intl.message(
      'Please enter the date',
      name: 'validate_date',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the reason for absence`
  String get validate_resone {
    return Intl.message(
      'Please enter the reason for absence',
      name: 'validate_resone',
      desc: '',
      args: [],
    );
  }

  /// `I pledge that I do not work for any military entity, and in the event that this happens, I take full responsibility in particular, and I will not reveal the slightest responsibility for my work entity.`
  String get military_service_disclosure {
    return Intl.message(
      'I pledge that I do not work for any military entity, and in the event that this happens, I take full responsibility in particular, and I will not reveal the slightest responsibility for my work entity.',
      name: 'military_service_disclosure',
      desc: '',
      args: [],
    );
  }

  /// `Select district`
  String get select_district {
    return Intl.message(
      'Select district',
      name: 'select_district',
      desc: '',
      args: [],
    );
  }

  /// `Please select district`
  String get please_select_district {
    return Intl.message(
      'Please select district',
      name: 'please_select_district',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Approval job application`
  String get approval_job_application {
    return Intl.message(
      'Approval job application',
      name: 'approval_job_application',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employee {
    return Intl.message(
      'Employee',
      name: 'employee',
      desc: '',
      args: [],
    );
  }

  /// `Attendance update`
  String get attendance_update {
    return Intl.message(
      'Attendance update',
      name: 'attendance_update',
      desc: '',
      args: [],
    );
  }

  /// `Attendance state`
  String get attendance_state {
    return Intl.message(
      'Attendance state',
      name: 'attendance_state',
      desc: '',
      args: [],
    );
  }

  /// `Recording time`
  String get recording_time {
    return Intl.message(
      'Recording time',
      name: 'recording_time',
      desc: '',
      args: [],
    );
  }

  /// `Beginning time`
  String get beginning_time {
    return Intl.message(
      'Beginning time',
      name: 'beginning_time',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get end_time {
    return Intl.message(
      'End time',
      name: 'end_time',
      desc: '',
      args: [],
    );
  }

  /// `Record attendance`
  String get record_attendance {
    return Intl.message(
      'Record attendance',
      name: 'record_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Reason refuse`
  String get reason_refuse {
    return Intl.message(
      'Reason refuse',
      name: 'reason_refuse',
      desc: '',
      args: [],
    );
  }

  /// `Required reason refuse`
  String get required_reason_refuse {
    return Intl.message(
      'Required reason refuse',
      name: 'required_reason_refuse',
      desc: '',
      args: [],
    );
  }

  /// `Attendance registration`
  String get attendance_registration {
    return Intl.message(
      'Attendance registration',
      name: 'attendance_registration',
      desc: '',
      args: [],
    );
  }

  /// `Departure registration`
  String get departure_registration {
    return Intl.message(
      'Departure registration',
      name: 'departure_registration',
      desc: '',
      args: [],
    );
  }

  /// `Attendance and departure registration`
  String get attendance_and_departure_registration {
    return Intl.message(
      'Attendance and departure registration',
      name: 'attendance_and_departure_registration',
      desc: '',
      args: [],
    );
  }

  /// `Absence registration`
  String get absence_registration {
    return Intl.message(
      'Absence registration',
      name: 'absence_registration',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal registration`
  String get withdrawal_registration {
    return Intl.message(
      'Withdrawal registration',
      name: 'withdrawal_registration',
      desc: '',
      args: [],
    );
  }

  /// `Required attendance status`
  String get required_attendance_status {
    return Intl.message(
      'Required attendance status',
      name: 'required_attendance_status',
      desc: '',
      args: [],
    );
  }

  /// `Not found applicants`
  String get not_found_applicants {
    return Intl.message(
      'Not found applicants',
      name: 'not_found_applicants',
      desc: '',
      args: [],
    );
  }

  /// `time opportunity`
  String get time_opportunity {
    return Intl.message(
      'time opportunity',
      name: 'time_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get payment {
    return Intl.message(
      'Payment Methods',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity Conditions`
  String get opportunity_conditions {
    return Intl.message(
      'Opportunity Conditions',
      name: 'opportunity_conditions',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Employee already added`
  String get employee_already_added {
    return Intl.message(
      'Employee already added',
      name: 'employee_already_added',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Chances`
  String get remaining_chances {
    return Intl.message(
      'Remaining Chances',
      name: 'remaining_chances',
      desc: '',
      args: [],
    );
  }

  /// `Special Opportunity`
  String get special_jobs {
    return Intl.message(
      'Special Opportunity',
      name: 'special_jobs',
      desc: '',
      args: [],
    );
  }

  /// `submitted jobs`
  String get submitted_jobs {
    return Intl.message(
      'submitted jobs',
      name: 'submitted_jobs',
      desc: '',
      args: [],
    );
  }

  /// `Exit from App`
  String get exit_app {
    return Intl.message(
      'Exit from App',
      name: 'exit_app',
      desc: '',
      args: [],
    );
  }

  /// `You are required to register your check-in or check-out  in order for the application to continue to work`
  String get register_attendance_required {
    return Intl.message(
      'You are required to register your check-in or check-out  in order for the application to continue to work',
      name: 'register_attendance_required',
      desc: '',
      args: [],
    );
  }

  /// `You must register your check-in or check-out for your shift !`
  String get attendance_cashift_required {
    return Intl.message(
      'You must register your check-in or check-out for your shift !',
      name: 'attendance_cashift_required',
      desc: '',
      args: [],
    );
  }

  /// `violation`
  String get violation {
    return Intl.message(
      'violation',
      name: 'violation',
      desc: '',
      args: [],
    );
  }

  /// `violation date`
  String get violation_date {
    return Intl.message(
      'violation date',
      name: 'violation_date',
      desc: '',
      args: [],
    );
  }

  /// `violation details`
  String get violation_details {
    return Intl.message(
      'violation details',
      name: 'violation_details',
      desc: '',
      args: [],
    );
  }

  /// `Salary Definition Request`
  String get salary_definition_request {
    return Intl.message(
      'Salary Definition Request',
      name: 'salary_definition_request',
      desc: '',
      args: [],
    );
  }

  /// `repeated`
  String get violation_repeated {
    return Intl.message(
      'repeated',
      name: 'violation_repeated',
      desc: '',
      args: [],
    );
  }

  /// `direction to which it is directed`
  String get direction_directed {
    return Intl.message(
      'direction to which it is directed',
      name: 'direction_directed',
      desc: '',
      args: [],
    );
  }

  /// `the purpose of the request`
  String get purpose_request {
    return Intl.message(
      'the purpose of the request',
      name: 'purpose_request',
      desc: '',
      args: [],
    );
  }

  /// `Write the purpose of the request`
  String get write_purpose_request {
    return Intl.message(
      'Write the purpose of the request',
      name: 'write_purpose_request',
      desc: '',
      args: [],
    );
  }

  /// `Chamber of Commerce Attestation`
  String get commerce_ratification {
    return Intl.message(
      'Chamber of Commerce Attestation',
      name: 'commerce_ratification',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Write the direction to which it is directed`
  String get write_direction_directed {
    return Intl.message(
      'Write the direction to which it is directed',
      name: 'write_direction_directed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the purpose of the request`
  String get validate_purpose_request {
    return Intl.message(
      'Please enter the purpose of the request',
      name: 'validate_purpose_request',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the destination you are directed to`
  String get validate_direction_directed {
    return Intl.message(
      'Please enter the destination you are directed to',
      name: 'validate_direction_directed',
      desc: '',
      args: [],
    );
  }

  /// `Please select Chamber of Commerce ratification`
  String get validate_commerce_ratification {
    return Intl.message(
      'Please select Chamber of Commerce ratification',
      name: 'validate_commerce_ratification',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for review`
  String get waiting_for_review {
    return Intl.message(
      'Waiting for review',
      name: 'waiting_for_review',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Add new request`
  String get add_new_request {
    return Intl.message(
      'Add new request',
      name: 'add_new_request',
      desc: '',
      args: [],
    );
  }

  /// `Direction to`
  String get direction_to {
    return Intl.message(
      'Direction to',
      name: 'direction_to',
      desc: '',
      args: [],
    );
  }

  /// `Purpose of request`
  String get purpose_of_request {
    return Intl.message(
      'Purpose of request',
      name: 'purpose_of_request',
      desc: '',
      args: [],
    );
  }

  /// `Chamber of Commerce Attestation is required`
  String get chamber_commerce_attestation_required {
    return Intl.message(
      'Chamber of Commerce Attestation is required',
      name: 'chamber_commerce_attestation_required',
      desc: '',
      args: [],
    );
  }

  /// `Date request`
  String get date_request {
    return Intl.message(
      'Date request',
      name: 'date_request',
      desc: '',
      args: [],
    );
  }

  /// `Download file`
  String get download_file {
    return Intl.message(
      'Download file',
      name: 'download_file',
      desc: '',
      args: [],
    );
  }

  /// `Favorite work times`
  String get favorite_work_times {
    return Intl.message(
      'Favorite work times',
      name: 'favorite_work_times',
      desc: '',
      args: [],
    );
  }

  /// `Favorite work time`
  String get favorite_work_time {
    return Intl.message(
      'Favorite work time',
      name: 'favorite_work_time',
      desc: '',
      args: [],
    );
  }

  /// `Favorite working hours`
  String get favorite_working_hours {
    return Intl.message(
      'Favorite working hours',
      name: 'favorite_working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Please enter favorite working hours`
  String get please_enter_favorite_working_hours {
    return Intl.message(
      'Please enter favorite working hours',
      name: 'please_enter_favorite_working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Selection skills`
  String get selection_skills {
    return Intl.message(
      'Selection skills',
      name: 'selection_skills',
      desc: '',
      args: [],
    );
  }

  /// `Skills required for a {job}`
  String skills_required_for_job(String job) {
    return Intl.message(
      'Skills required for a $job',
      name: 'skills_required_for_job',
      desc: 'description',
      args: [job],
    );
  }

  /// `Please enter price`
  String get please_enter_price {
    return Intl.message(
      'Please enter price',
      name: 'please_enter_price',
      desc: '',
      args: [],
    );
  }

  /// `No People For This Number`
  String get employee_not_found {
    return Intl.message(
      'No People For This Number',
      name: 'employee_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get no_more_data {
    return Intl.message(
      'No more data',
      name: 'no_more_data',
      desc: '',
      args: [],
    );
  }

  /// `Load failed, refresh data`
  String get load_failed_refresh_data {
    return Intl.message(
      'Load failed, refresh data',
      name: 'load_failed_refresh_data',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today_opportunities {
    return Intl.message(
      'Today',
      name: 'today_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active_opportunities {
    return Intl.message(
      'Active',
      name: 'active_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled_opportunities {
    return Intl.message(
      'Canceled',
      name: 'canceled_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished_opportunities {
    return Intl.message(
      'Finished',
      name: 'finished_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Opportunities`
  String get the_opportunities {
    return Intl.message(
      'Opportunities',
      name: 'the_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Wanted Number`
  String get wanted_number {
    return Intl.message(
      'Wanted Number',
      name: 'wanted_number',
      desc: '',
      args: [],
    );
  }

  /// `Search for Opportunity`
  String get search_for_job {
    return Intl.message(
      'Search for Opportunity',
      name: 'search_for_job',
      desc: '',
      args: [],
    );
  }

  /// `Shift times`
  String get shift_times {
    return Intl.message(
      'Shift times',
      name: 'shift_times',
      desc: '',
      args: [],
    );
  }

  /// `the opportunity`
  String get the_opportunity {
    return Intl.message(
      'the opportunity',
      name: 'the_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Method of selecting employees`
  String get method_selecting_employees {
    return Intl.message(
      'Method of selecting employees',
      name: 'method_selecting_employees',
      desc: '',
      args: [],
    );
  }

  /// `How to accept applicants`
  String get method_accept_employees {
    return Intl.message(
      'How to accept applicants',
      name: 'method_accept_employees',
      desc: '',
      args: [],
    );
  }

  /// `Select purpose request`
  String get select_purpose_request {
    return Intl.message(
      'Select purpose request',
      name: 'select_purpose_request',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get load_more {
    return Intl.message(
      'Load more',
      name: 'load_more',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add your bank account now`
  String get add_your_bank_account_now {
    return Intl.message(
      'Add your bank account now',
      name: 'add_your_bank_account_now',
      desc: '',
      args: [],
    );
  }

  /// `Search for your job or location`
  String get search_your_job_location {
    return Intl.message(
      'Search for your job or location',
      name: 'search_your_job_location',
      desc: '',
      args: [],
    );
  }

  /// `Good morning`
  String get good_morning {
    return Intl.message(
      'Good morning',
      name: 'good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good evening`
  String get good_evening {
    return Intl.message(
      'Good evening',
      name: 'good_evening',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get leave {
    return Intl.message(
      'Leave',
      name: 'leave',
      desc: '',
      args: [],
    );
  }

  /// `Vacation type`
  String get vacation_type {
    return Intl.message(
      'Vacation type',
      name: 'vacation_type',
      desc: '',
      args: [],
    );
  }

  /// `Absence`
  String get absence {
    return Intl.message(
      'Absence',
      name: 'absence',
      desc: '',
      args: [],
    );
  }

  /// `Delay`
  String get delay {
    return Intl.message(
      'Delay',
      name: 'delay',
      desc: '',
      args: [],
    );
  }

  /// `Vacations`
  String get vacations {
    return Intl.message(
      'Vacations',
      name: 'vacations',
      desc: '',
      args: [],
    );
  }

  /// `Opportunities review`
  String get opportunities_review {
    return Intl.message(
      'Opportunities review',
      name: 'opportunities_review',
      desc: '',
      args: [],
    );
  }

  /// `Waiting approval`
  String get waiting_approval {
    return Intl.message(
      'Waiting approval',
      name: 'waiting_approval',
      desc: '',
      args: [],
    );
  }

  /// `Order status`
  String get order_status {
    return Intl.message(
      'Order status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `Blocking status`
  String get blocking_status {
    return Intl.message(
      'Blocking status',
      name: 'blocking_status',
      desc: '',
      args: [],
    );
  }

  /// `Choose blocking state`
  String get choose_blocking_state {
    return Intl.message(
      'Choose blocking state',
      name: 'choose_blocking_state',
      desc: '',
      args: [],
    );
  }

  /// `Payment refused`
  String get payment_refused {
    return Intl.message(
      'Payment refused',
      name: 'payment_refused',
      desc: '',
      args: [],
    );
  }

  /// `Payment accepted`
  String get payment_accepted {
    return Intl.message(
      'Payment accepted',
      name: 'payment_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Home address`
  String get home_address {
    return Intl.message(
      'Home address',
      name: 'home_address',
      desc: '',
      args: [],
    );
  }

  /// `Your current location`
  String get your_current_location {
    return Intl.message(
      'Your current location',
      name: 'your_current_location',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Select job`
  String get select_job {
    return Intl.message(
      'Select job',
      name: 'select_job',
      desc: '',
      args: [],
    );
  }

  /// `Search filtering`
  String get search_filtering {
    return Intl.message(
      'Search filtering',
      name: 'search_filtering',
      desc: '',
      args: [],
    );
  }

  /// `Select your current city`
  String get select_your_current_city {
    return Intl.message(
      'Select your current city',
      name: 'select_your_current_city',
      desc: '',
      args: [],
    );
  }

  /// `Date opportunity offered`
  String get date_opportunity_offered {
    return Intl.message(
      'Date opportunity offered',
      name: 'date_opportunity_offered',
      desc: '',
      args: [],
    );
  }

  /// `Write date`
  String get write_date {
    return Intl.message(
      'Write date',
      name: 'write_date',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity price`
  String get opportunity_price {
    return Intl.message(
      'Opportunity price',
      name: 'opportunity_price',
      desc: '',
      args: [],
    );
  }

  /// `Minimum`
  String get minimum {
    return Intl.message(
      'Minimum',
      name: 'minimum',
      desc: '',
      args: [],
    );
  }

  /// `Maximum`
  String get maximum {
    return Intl.message(
      'Maximum',
      name: 'maximum',
      desc: '',
      args: [],
    );
  }

  /// `Delete all`
  String get delete_all {
    return Intl.message(
      'Delete all',
      name: 'delete_all',
      desc: '',
      args: [],
    );
  }

  /// `Save filter`
  String get save_filter {
    return Intl.message(
      'Save filter',
      name: 'save_filter',
      desc: '',
      args: [],
    );
  }

  /// `View search results`
  String get view_search_results {
    return Intl.message(
      'View search results',
      name: 'view_search_results',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `Loan requests`
  String get loan_requests {
    return Intl.message(
      'Loan requests',
      name: 'loan_requests',
      desc: '',
      args: [],
    );
  }

  /// `Add new loan request`
  String get add_new_loan_request {
    return Intl.message(
      'Add new loan request',
      name: 'add_new_loan_request',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for approval`
  String get waiting_for_approval {
    return Intl.message(
      'Waiting for approval',
      name: 'waiting_for_approval',
      desc: '',
      args: [],
    );
  }

  /// `Loan start date`
  String get loan_start_date {
    return Intl.message(
      'Loan start date',
      name: 'loan_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Number of installment months`
  String get number_months_installment {
    return Intl.message(
      'Number of installment months',
      name: 'number_months_installment',
      desc: '',
      args: [],
    );
  }

  /// `Installment amount`
  String get installment_amount {
    return Intl.message(
      'Installment amount',
      name: 'installment_amount',
      desc: '',
      args: [],
    );
  }

  /// `Loan request details`
  String get loan_request_details {
    return Intl.message(
      'Loan request details',
      name: 'loan_request_details',
      desc: '',
      args: [],
    );
  }

  /// `Loan request type`
  String get loan_request_type {
    return Intl.message(
      'Loan request type',
      name: 'loan_request_type',
      desc: '',
      args: [],
    );
  }

  /// `Number of loan months`
  String get number_months_loan {
    return Intl.message(
      'Number of loan months',
      name: 'number_months_loan',
      desc: '',
      args: [],
    );
  }

  /// `Loan amount`
  String get financial_amount {
    return Intl.message(
      'Loan amount',
      name: 'financial_amount',
      desc: '',
      args: [],
    );
  }

  /// `conditions matching`
  String get conditions {
    return Intl.message(
      'conditions matching',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Select loan request type`
  String get select_loan_request_type {
    return Intl.message(
      'Select loan request type',
      name: 'select_loan_request_type',
      desc: '',
      args: [],
    );
  }

  /// `Select number of loan months`
  String get select_number_months_loan {
    return Intl.message(
      'Select number of loan months',
      name: 'select_number_months_loan',
      desc: '',
      args: [],
    );
  }

  /// `Enter loan amount`
  String get enter_loan_amount {
    return Intl.message(
      'Enter loan amount',
      name: 'enter_loan_amount',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `transfer type`
  String get type_transfer {
    return Intl.message(
      'transfer type',
      name: 'type_transfer',
      desc: '',
      args: [],
    );
  }

  /// `No.Installment`
  String get no_installment {
    return Intl.message(
      'No.Installment',
      name: 'no_installment',
      desc: '',
      args: [],
    );
  }

  /// `Monthly.Install`
  String get monthly_installment {
    return Intl.message(
      'Monthly.Install',
      name: 'monthly_installment',
      desc: '',
      args: [],
    );
  }

  /// `Loan Type`
  String get loan_type {
    return Intl.message(
      'Loan Type',
      name: 'loan_type',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Cashift`
  String get landing_page_title1 {
    return Intl.message(
      'Welcome to Cashift',
      name: 'landing_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Choose your opportunity`
  String get landing_page_title2 {
    return Intl.message(
      'Choose your opportunity',
      name: 'landing_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Record your arrival and departure via QRCode`
  String get landing_page_title3 {
    return Intl.message(
      'Record your arrival and departure via QRCode',
      name: 'landing_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Instant Get Paid`
  String get landing_page_title4 {
    return Intl.message(
      'Instant Get Paid',
      name: 'landing_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `The first electronic platform registered with the Intellectual Property Authority that provides opportunities on a daily basis on an hourly basis and immediate payment immediately after the end of your working hours using the latest payment methods`
  String get landing_page_desc1 {
    return Intl.message(
      'The first electronic platform registered with the Intellectual Property Authority that provides opportunities on a daily basis on an hourly basis and immediate payment immediately after the end of your working hours using the latest payment methods',
      name: 'landing_page_desc1',
      desc: '',
      args: [],
    );
  }

  /// `With Cashift, find opportunities that suit you and start the journey of raising your income level`
  String get landing_page_desc2 {
    return Intl.message(
      'With Cashift, find opportunities that suit you and start the journey of raising your income level',
      name: 'landing_page_desc2',
      desc: '',
      args: [],
    );
  }

  /// `An integrated system for preserving the rights of all parties through the QRCode dedicated to the Kashif platform, through which you can easily register attendance and leave`
  String get landing_page_desc3 {
    return Intl.message(
      'An integrated system for preserving the rights of all parties through the QRCode dedicated to the Kashif platform, through which you can easily register attendance and leave',
      name: 'landing_page_desc3',
      desc: '',
      args: [],
    );
  }

  /// `Start your shift, follow up on your work performance, finish your shift on time, and get the financial reward immediately`
  String get landing_page_desc4 {
    return Intl.message(
      'Start your shift, follow up on your work performance, finish your shift on time, and get the financial reward immediately',
      name: 'landing_page_desc4',
      desc: '',
      args: [],
    );
  }

  /// `This platform is registered with the Saudi Authority for Intellectual Property`
  String get platform_description {
    return Intl.message(
      'This platform is registered with the Saudi Authority for Intellectual Property',
      name: 'platform_description',
      desc: '',
      args: [],
    );
  }

  /// `Let's start`
  String get lets_start {
    return Intl.message(
      'Let\'s start',
      name: 'lets_start',
      desc: '',
      args: [],
    );
  }

  /// `Attendance fingerprint at beginning`
  String get attendance_fingerprint_at_beginning {
    return Intl.message(
      'Attendance fingerprint at beginning',
      name: 'attendance_fingerprint_at_beginning',
      desc: '',
      args: [],
    );
  }

  /// `Temporary fingerprint`
  String get temporary_fingerprint {
    return Intl.message(
      'Temporary fingerprint',
      name: 'temporary_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Attendance fingerprint during day`
  String get attendance_fingerprint_during_day {
    return Intl.message(
      'Attendance fingerprint during day',
      name: 'attendance_fingerprint_during_day',
      desc: '',
      args: [],
    );
  }

  /// `Final fingerprint`
  String get final_fingerprint {
    return Intl.message(
      'Final fingerprint',
      name: 'final_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enter_password {
    return Intl.message(
      'Enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `By clicking the check mark means you agree`
  String get clicking_check_mark_means_you_agree {
    return Intl.message(
      'By clicking the check mark means you agree',
      name: 'clicking_check_mark_means_you_agree',
      desc: '',
      args: [],
    );
  }

  /// `Gregorian date`
  String get gregorian_date {
    return Intl.message(
      'Gregorian date',
      name: 'gregorian_date',
      desc: '',
      args: [],
    );
  }

  /// `Hijri date`
  String get hijri_date {
    return Intl.message(
      'Hijri date',
      name: 'hijri_date',
      desc: '',
      args: [],
    );
  }

  /// `Confirm phone number`
  String get confirm_phone_number {
    return Intl.message(
      'Confirm phone number',
      name: 'confirm_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to your phone number`
  String get confirm_phone_number_desc {
    return Intl.message(
      'Enter the code sent to your phone number',
      name: 'confirm_phone_number_desc',
      desc: '',
      args: [],
    );
  }

  /// `Code expires within :  `
  String get code_expires_within {
    return Intl.message(
      'Code expires within :  ',
      name: 'code_expires_within',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get did_not_receive_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'did_not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor data`
  String get sponsor_data {
    return Intl.message(
      'Sponsor data',
      name: 'sponsor_data',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor name`
  String get sponsor_name {
    return Intl.message(
      'Sponsor name',
      name: 'sponsor_name',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor mobile`
  String get sponsor_mobile {
    return Intl.message(
      'Sponsor mobile',
      name: 'sponsor_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Bail requests`
  String get bail_requests {
    return Intl.message(
      'Bail requests',
      name: 'bail_requests',
      desc: '',
      args: [],
    );
  }

  /// `Bail application pending approval`
  String get bail_application_pending_approval {
    return Intl.message(
      'Bail application pending approval',
      name: 'bail_application_pending_approval',
      desc: '',
      args: [],
    );
  }

  /// `Approved bail request`
  String get approved_bail_request {
    return Intl.message(
      'Approved bail request',
      name: 'approved_bail_request',
      desc: '',
      args: [],
    );
  }

  /// `Bail request was denied`
  String get bail_request_denied {
    return Intl.message(
      'Bail request was denied',
      name: 'bail_request_denied',
      desc: '',
      args: [],
    );
  }

  /// `Sponsored name`
  String get sponsored_name {
    return Intl.message(
      'Sponsored name',
      name: 'sponsored_name',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Approval`
  String get approval {
    return Intl.message(
      'Approval',
      name: 'approval',
      desc: '',
      args: [],
    );
  }

  /// `Refusal`
  String get refusal {
    return Intl.message(
      'Refusal',
      name: 'refusal',
      desc: '',
      args: [],
    );
  }

  /// `Request has been rejected`
  String get request_has_been_rejected {
    return Intl.message(
      'Request has been rejected',
      name: 'request_has_been_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Please write the reason for the rejection and then confirm the rejection`
  String get request_has_been_rejected_message {
    return Intl.message(
      'Please write the reason for the rejection and then confirm the rejection',
      name: 'request_has_been_rejected_message',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `View terms and conditions`
  String get view_terms_conditions {
    return Intl.message(
      'View terms and conditions',
      name: 'view_terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `After break`
  String get after_break {
    return Intl.message(
      'After break',
      name: 'after_break',
      desc: '',
      args: [],
    );
  }

  /// `Before break`
  String get before_break {
    return Intl.message(
      'Before break',
      name: 'before_break',
      desc: '',
      args: [],
    );
  }

  /// `Gates`
  String get gates {
    return Intl.message(
      'Gates',
      name: 'gates',
      desc: '',
      args: [],
    );
  }

  /// `Mosques`
  String get mosques {
    return Intl.message(
      'Mosques',
      name: 'mosques',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Gate number {number}`
  String gate_number(dynamic number) {
    return Intl.message(
      'Gate number $number',
      name: 'gate_number',
      desc: 'Gate number',
      args: [number],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `First period`
  String get first_period {
    return Intl.message(
      'First period',
      name: 'first_period',
      desc: '',
      args: [],
    );
  }

  /// `Second period`
  String get second_period {
    return Intl.message(
      'Second period',
      name: 'second_period',
      desc: '',
      args: [],
    );
  }

  /// `Third period`
  String get third_period {
    return Intl.message(
      'Third period',
      name: 'third_period',
      desc: '',
      args: [],
    );
  }

  /// `Fourth period`
  String get fourth_period {
    return Intl.message(
      'Fourth period',
      name: 'fourth_period',
      desc: '',
      args: [],
    );
  }

  /// `Active gates`
  String get active_gates {
    return Intl.message(
      'Active gates',
      name: 'active_gates',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed_gates {
    return Intl.message(
      'Completed',
      name: 'completed_gates',
      desc: '',
      args: [],
    );
  }

  /// `My gates`
  String get my_gates {
    return Intl.message(
      'My gates',
      name: 'my_gates',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `After`
  String get after {
    return Intl.message(
      'After',
      name: 'after',
      desc: '',
      args: [],
    );
  }

  /// `Gate type : `
  String get gate_type {
    return Intl.message(
      'Gate type : ',
      name: 'gate_type',
      desc: '',
      args: [],
    );
  }

  /// `Start time : `
  String get time_start {
    return Intl.message(
      'Start time : ',
      name: 'time_start',
      desc: '',
      args: [],
    );
  }

  /// `End time : `
  String get time_end {
    return Intl.message(
      'End time : ',
      name: 'time_end',
      desc: '',
      args: [],
    );
  }

  /// `My work points`
  String get my_work_points {
    return Intl.message(
      'My work points',
      name: 'my_work_points',
      desc: '',
      args: [],
    );
  }

  /// `Connect Code : `
  String get connect_code {
    return Intl.message(
      'Connect Code : ',
      name: 'connect_code',
      desc: '',
      args: [],
    );
  }

  /// `Time left`
  String get remaining_time_to_rest {
    return Intl.message(
      'Time left',
      name: 'remaining_time_to_rest',
      desc: '',
      args: [],
    );
  }

  /// ` to rest`
  String get to_end_rest {
    return Intl.message(
      ' to rest',
      name: 'to_end_rest',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Factor`
  String get alternative_factor {
    return Intl.message(
      'Alternative Factor',
      name: 'alternative_factor',
      desc: '',
      args: [],
    );
  }

  /// `Administrator`
  String get administrator {
    return Intl.message(
      'Administrator',
      name: 'administrator',
      desc: '',
      args: [],
    );
  }

  /// `Attendance fingerprint`
  String get attendance_fingerprint {
    return Intl.message(
      'Attendance fingerprint',
      name: 'attendance_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Scan the fingerprint to register your attendance at the beginning of the working hours`
  String get attendance_fingerprint_desc {
    return Intl.message(
      'Scan the fingerprint to register your attendance at the beginning of the working hours',
      name: 'attendance_fingerprint_desc',
      desc: '',
      args: [],
    );
  }

  /// `Scan now`
  String get scan_now {
    return Intl.message(
      'Scan now',
      name: 'scan_now',
      desc: '',
      args: [],
    );
  }

  /// `Tasks and duties`
  String get tasks_duties {
    return Intl.message(
      'Tasks and duties',
      name: 'tasks_duties',
      desc: '',
      args: [],
    );
  }

  /// `Communication Device`
  String get communication_device {
    return Intl.message(
      'Communication Device',
      name: 'communication_device',
      desc: '',
      args: [],
    );
  }

  /// `Notice of receipt and delivery`
  String get notice_receipt_delivery {
    return Intl.message(
      'Notice of receipt and delivery',
      name: 'notice_receipt_delivery',
      desc: '',
      args: [],
    );
  }

  /// `You must check the condition of the contract first before receiving it`
  String get notice_receipt_delivery_desc {
    return Intl.message(
      'You must check the condition of the contract first before receiving it',
      name: 'notice_receipt_delivery_desc',
      desc: '',
      args: [],
    );
  }

  /// `Communication device number :`
  String get communication_device_number {
    return Intl.message(
      'Communication device number :',
      name: 'communication_device_number',
      desc: '',
      args: [],
    );
  }

  /// `Receipt status : `
  String get receipt_status {
    return Intl.message(
      'Receipt status : ',
      name: 'receipt_status',
      desc: '',
      args: [],
    );
  }

  /// `There are notes`
  String get there_are_notes {
    return Intl.message(
      'There are notes',
      name: 'there_are_notes',
      desc: '',
      args: [],
    );
  }

  /// `There are no notes`
  String get there_are_no_notes {
    return Intl.message(
      'There are no notes',
      name: 'there_are_no_notes',
      desc: '',
      args: [],
    );
  }

  /// `Add notes`
  String get add_notes {
    return Intl.message(
      'Add notes',
      name: 'add_notes',
      desc: '',
      args: [],
    );
  }

  /// `Your notes`
  String get your_notes {
    return Intl.message(
      'Your notes',
      name: 'your_notes',
      desc: '',
      args: [],
    );
  }

  /// `Write your notes here...`
  String get write_your_notes_here {
    return Intl.message(
      'Write your notes here...',
      name: 'write_your_notes_here',
      desc: '',
      args: [],
    );
  }

  /// `Take a picture showing the problem`
  String get take_picture_showing_the_problem {
    return Intl.message(
      'Take a picture showing the problem',
      name: 'take_picture_showing_the_problem',
      desc: '',
      args: [],
    );
  }

  /// `Add details to the image`
  String get add_details_to_image {
    return Intl.message(
      'Add details to the image',
      name: 'add_details_to_image',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your notes`
  String get please_enter_your_notes {
    return Intl.message(
      'Please enter your notes',
      name: 'please_enter_your_notes',
      desc: '',
      args: [],
    );
  }

  /// `Focus point data`
  String get focus_point_data {
    return Intl.message(
      'Focus point data',
      name: 'focus_point_data',
      desc: '',
      args: [],
    );
  }

  /// `Focus point times`
  String get focus_point_times {
    return Intl.message(
      'Focus point times',
      name: 'focus_point_times',
      desc: '',
      args: [],
    );
  }

  /// `Covenant received`
  String get covenant_received {
    return Intl.message(
      'Covenant received',
      name: 'covenant_received',
      desc: '',
      args: [],
    );
  }

  /// `Select project`
  String get select_project {
    return Intl.message(
      'Select project',
      name: 'select_project',
      desc: '',
      args: [],
    );
  }

  /// `Point type`
  String get point_type {
    return Intl.message(
      'Point type',
      name: 'point_type',
      desc: '',
      args: [],
    );
  }

  /// `Select point type`
  String get select_point_type {
    return Intl.message(
      'Select point type',
      name: 'select_point_type',
      desc: '',
      args: [],
    );
  }

  /// `Gate name`
  String get gate_name {
    return Intl.message(
      'Gate name',
      name: 'gate_name',
      desc: '',
      args: [],
    );
  }

  /// `Priority level`
  String get priority_level {
    return Intl.message(
      'Priority level',
      name: 'priority_level',
      desc: '',
      args: [],
    );
  }

  /// `Employee type`
  String get employee_type {
    return Intl.message(
      'Employee type',
      name: 'employee_type',
      desc: '',
      args: [],
    );
  }

  /// `Add a QR Code to the pivot point`
  String get add_qr_code_pivot_point {
    return Intl.message(
      'Add a QR Code to the pivot point',
      name: 'add_qr_code_pivot_point',
      desc: '',
      args: [],
    );
  }

  /// `QR Code value will appear when checked`
  String get qr_code_value_appear_when_checked {
    return Intl.message(
      'QR Code value will appear when checked',
      name: 'qr_code_value_appear_when_checked',
      desc: '',
      args: [],
    );
  }

  /// `QR Code has been added successfully`
  String get qr_code_added_successfully {
    return Intl.message(
      'QR Code has been added successfully',
      name: 'qr_code_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Current location`
  String get current_location {
    return Intl.message(
      'Current location',
      name: 'current_location',
      desc: '',
      args: [],
    );
  }

  /// `Add focus point`
  String get add_focus_point {
    return Intl.message(
      'Add focus point',
      name: 'add_focus_point',
      desc: '',
      args: [],
    );
  }

  /// `Add new time`
  String get add_new_time {
    return Intl.message(
      'Add new time',
      name: 'add_new_time',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Add covenant`
  String get add_covenant {
    return Intl.message(
      'Add covenant',
      name: 'add_covenant',
      desc: '',
      args: [],
    );
  }

  /// `Select shift type`
  String get select_shift_type {
    return Intl.message(
      'Select shift type',
      name: 'select_shift_type',
      desc: '',
      args: [],
    );
  }

  /// `Covenant data`
  String get covenant_data {
    return Intl.message(
      'Covenant data',
      name: 'covenant_data',
      desc: '',
      args: [],
    );
  }

  /// `Covenant type :`
  String get covenant_type {
    return Intl.message(
      'Covenant type :',
      name: 'covenant_type',
      desc: '',
      args: [],
    );
  }

  /// `Select covenant type`
  String get select_covenant_type {
    return Intl.message(
      'Select covenant type',
      name: 'select_covenant_type',
      desc: '',
      args: [],
    );
  }

  /// `Determine covenant number`
  String get determine_covenant_number {
    return Intl.message(
      'Determine covenant number',
      name: 'determine_covenant_number',
      desc: '',
      args: [],
    );
  }

  /// `Covenant number :`
  String get covenant_number {
    return Intl.message(
      'Covenant number :',
      name: 'covenant_number',
      desc: '',
      args: [],
    );
  }

  /// `Covenant name :`
  String get covenant_name {
    return Intl.message(
      'Covenant name :',
      name: 'covenant_name',
      desc: '',
      args: [],
    );
  }

  /// `List of gates added`
  String get list_gates_added {
    return Intl.message(
      'List of gates added',
      name: 'list_gates_added',
      desc: '',
      args: [],
    );
  }

  /// `Added focus points`
  String get added_focus_points {
    return Intl.message(
      'Added focus points',
      name: 'added_focus_points',
      desc: '',
      args: [],
    );
  }

  /// `Add new point`
  String get add_new_point {
    return Intl.message(
      'Add new point',
      name: 'add_new_point',
      desc: '',
      args: [],
    );
  }

  /// `Edit focus point`
  String get edit_focus_point {
    return Intl.message(
      'Edit focus point',
      name: 'edit_focus_point',
      desc: '',
      args: [],
    );
  }

  /// `Delete focus point`
  String get delete_focus_point {
    return Intl.message(
      'Delete focus point',
      name: 'delete_focus_point',
      desc: '',
      args: [],
    );
  }

  /// `Added date : `
  String get added_date {
    return Intl.message(
      'Added date : ',
      name: 'added_date',
      desc: '',
      args: [],
    );
  }

  /// `My focus points`
  String get my_focus_points {
    return Intl.message(
      'My focus points',
      name: 'my_focus_points',
      desc: '',
      args: [],
    );
  }

  /// `Invalid QR Code`
  String get invalid_qr_code {
    return Intl.message(
      'Invalid QR Code',
      name: 'invalid_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Edit focus point`
  String get edit_focus_point_data {
    return Intl.message(
      'Edit focus point',
      name: 'edit_focus_point_data',
      desc: '',
      args: [],
    );
  }

  /// `Edit focus point times`
  String get edit_focus_point_times {
    return Intl.message(
      'Edit focus point times',
      name: 'edit_focus_point_times',
      desc: '',
      args: [],
    );
  }

  /// `Edit covenant received`
  String get edit_covenant_received {
    return Intl.message(
      'Edit covenant received',
      name: 'edit_covenant_received',
      desc: '',
      args: [],
    );
  }

  /// `Delete time`
  String get delete_time {
    return Intl.message(
      'Delete time',
      name: 'delete_time',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this time?`
  String get are_you_sure_delete_time {
    return Intl.message(
      'Are you sure you want to delete this time?',
      name: 'are_you_sure_delete_time',
      desc: '',
      args: [],
    );
  }

  /// `Write covenant name`
  String get write_covenant_name {
    return Intl.message(
      'Write covenant name',
      name: 'write_covenant_name',
      desc: '',
      args: [],
    );
  }

  /// `Save edit`
  String get save_edit {
    return Intl.message(
      'Save edit',
      name: 'save_edit',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this focus point?`
  String get are_you_sure_delete_focus_point {
    return Intl.message(
      'Are you sure you want to delete this focus point?',
      name: 'are_you_sure_delete_focus_point',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this Custody ? `
  String get delete_custody {
    return Intl.message(
      'Are you sure you want to delete this Custody ? ',
      name: 'delete_custody',
      desc: '',
      args: [],
    );
  }

  /// `This time must be saved first before adding another time`
  String get saved_focus_point_time_dec {
    return Intl.message(
      'This time must be saved first before adding another time',
      name: 'saved_focus_point_time_dec',
      desc: '',
      args: [],
    );
  }

  /// `Location must be enabled before adding a focus point`
  String get focus_point_location_message {
    return Intl.message(
      'Location must be enabled before adding a focus point',
      name: 'focus_point_location_message',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Select area`
  String get select_area {
    return Intl.message(
      'Select area',
      name: 'select_area',
      desc: '',
      args: [],
    );
  }

  /// `Tracking focus points`
  String get tracking_focus_points {
    return Intl.message(
      'Tracking focus points',
      name: 'tracking_focus_points',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish_tracking {
    return Intl.message(
      'Finish',
      name: 'finish_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Rest time`
  String get rest_time {
    return Intl.message(
      'Rest time',
      name: 'rest_time',
      desc: '',
      args: [],
    );
  }

  /// `Record departure`
  String get record_departure {
    return Intl.message(
      'Record departure',
      name: 'record_departure',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to modify the site for your current site?`
  String get navigate_to_current_location_des {
    return Intl.message(
      'Do you want to modify the site for your current site?',
      name: 'navigate_to_current_location_des',
      desc: '',
      args: [],
    );
  }

  /// `Work point location`
  String get work_point_location {
    return Intl.message(
      'Work point location',
      name: 'work_point_location',
      desc: '',
      args: [],
    );
  }

  /// `Select gate type`
  String get select_gate_type {
    return Intl.message(
      'Select gate type',
      name: 'select_gate_type',
      desc: '',
      args: [],
    );
  }

  /// `Work periods`
  String get work_periods {
    return Intl.message(
      'Work periods',
      name: 'work_periods',
      desc: '',
      args: [],
    );
  }

  /// `Add the work period`
  String get add_work_the_period {
    return Intl.message(
      'Add the work period',
      name: 'add_work_the_period',
      desc: '',
      args: [],
    );
  }

  /// `Add more the work periods`
  String get add_more_the_work_periods {
    return Intl.message(
      'Add more the work periods',
      name: 'add_more_the_work_periods',
      desc: '',
      args: [],
    );
  }

  /// `No focus points found to search result`
  String get no_focus_points_found_to_search_result {
    return Intl.message(
      'No focus points found to search result',
      name: 'no_focus_points_found_to_search_result',
      desc: '',
      args: [],
    );
  }

  /// `There are no employees`
  String get there_no_employees {
    return Intl.message(
      'There are no employees',
      name: 'there_no_employees',
      desc: '',
      args: [],
    );
  }

  /// `Coverage`
  String get coverage {
    return Intl.message(
      'Coverage',
      name: 'coverage',
      desc: '',
      args: [],
    );
  }

  /// `Select coverage`
  String get select_coverage {
    return Intl.message(
      'Select coverage',
      name: 'select_coverage',
      desc: '',
      args: [],
    );
  }

  /// `point`
  String get point {
    return Intl.message(
      'point',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Activate client`
  String get activate_client {
    return Intl.message(
      'Activate client',
      name: 'activate_client',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Done`
  String get successfully_done {
    return Intl.message(
      'Successfully Done',
      name: 'successfully_done',
      desc: '',
      args: [],
    );
  }

  /// `Pledges and generalization`
  String get pledges_and_generalization {
    return Intl.message(
      'Pledges and generalization',
      name: 'pledges_and_generalization',
      desc: '',
      args: [],
    );
  }

  /// `Pledges`
  String get pledges {
    return Intl.message(
      'Pledges',
      name: 'pledges',
      desc: '',
      args: [],
    );
  }

  /// `Generalization`
  String get generalizations {
    return Intl.message(
      'Generalization',
      name: 'generalizations',
      desc: '',
      args: [],
    );
  }

  /// `Date pledge`
  String get date_pledge {
    return Intl.message(
      'Date pledge',
      name: 'date_pledge',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `Responsible projects`
  String get responsible_projects {
    return Intl.message(
      'Responsible projects',
      name: 'responsible_projects',
      desc: '',
      args: [],
    );
  }

  /// `Edit user profile`
  String get edit_user_profile {
    return Intl.message(
      'Edit user profile',
      name: 'edit_user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Activate account`
  String get activate_account {
    return Intl.message(
      'Activate account',
      name: 'activate_account',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate account`
  String get deactivate_account {
    return Intl.message(
      'Deactivate account',
      name: 'deactivate_account',
      desc: '',
      args: [],
    );
  }

  /// `Delete user`
  String get delete_user {
    return Intl.message(
      'Delete user',
      name: 'delete_user',
      desc: '',
      args: [],
    );
  }

  /// `Added users`
  String get added_users {
    return Intl.message(
      'Added users',
      name: 'added_users',
      desc: '',
      args: [],
    );
  }

  /// `Add new user`
  String get add_new_user {
    return Intl.message(
      'Add new user',
      name: 'add_new_user',
      desc: '',
      args: [],
    );
  }

  /// `Triple username`
  String get triple_username {
    return Intl.message(
      'Triple username',
      name: 'triple_username',
      desc: '',
      args: [],
    );
  }

  /// `Write user name`
  String get write_user_name {
    return Intl.message(
      'Write user name',
      name: 'write_user_name',
      desc: '',
      args: [],
    );
  }

  /// `User account`
  String get user_account {
    return Intl.message(
      'User account',
      name: 'user_account',
      desc: '',
      args: [],
    );
  }

  /// `Write user email`
  String get write_user_email {
    return Intl.message(
      'Write user email',
      name: 'write_user_email',
      desc: '',
      args: [],
    );
  }

  /// `Write user mobile number`
  String get write_user_mobile_number {
    return Intl.message(
      'Write user mobile number',
      name: 'write_user_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Write user password`
  String get write_user_password {
    return Intl.message(
      'Write user password',
      name: 'write_user_password',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get password_confirmation {
    return Intl.message(
      'Password confirmation',
      name: 'password_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `What are the user's permissions?`
  String get what_user_permissions {
    return Intl.message(
      'What are the user\'s permissions?',
      name: 'what_user_permissions',
      desc: '',
      args: [],
    );
  }

  /// `Brand name`
  String get brand_name {
    return Intl.message(
      'Brand name',
      name: 'brand_name',
      desc: '',
      args: [],
    );
  }

  /// `Select brand name`
  String get select_brand_name {
    return Intl.message(
      'Select brand name',
      name: 'select_brand_name',
      desc: '',
      args: [],
    );
  }

  /// `Select company name`
  String get select_company_name {
    return Intl.message(
      'Select company name',
      name: 'select_company_name',
      desc: '',
      args: [],
    );
  }

  /// `Select project name`
  String get select_project_name {
    return Intl.message(
      'Select project name',
      name: 'select_project_name',
      desc: '',
      args: [],
    );
  }

  /// `Type new password`
  String get type_new_password {
    return Intl.message(
      'Type new password',
      name: 'type_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Type new password confirmation`
  String get retype_password {
    return Intl.message(
      'Type new password confirmation',
      name: 'retype_password',
      desc: '',
      args: [],
    );
  }

  /// `Edit password`
  String get edit_password {
    return Intl.message(
      'Edit password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get permissions {
    return Intl.message(
      'Permissions',
      name: 'permissions',
      desc: '',
      args: [],
    );
  }

  /// `Search project name`
  String get search_project_name {
    return Intl.message(
      'Search project name',
      name: 'search_project_name',
      desc: '',
      args: [],
    );
  }

  /// `Search company name`
  String get search_company_name {
    return Intl.message(
      'Search company name',
      name: 'search_company_name',
      desc: '',
      args: [],
    );
  }

  /// `Search brand name`
  String get search_brand_name {
    return Intl.message(
      'Search brand name',
      name: 'search_brand_name',
      desc: '',
      args: [],
    );
  }

  /// `Search shift type`
  String get search_shift_type {
    return Intl.message(
      'Search shift type',
      name: 'search_shift_type',
      desc: '',
      args: [],
    );
  }

  /// `By choosing to reset data, you will have the opportunity to change your choice. If you want to continue, click Confirm`
  String get pledges_and_generalization_confirm_message {
    return Intl.message(
      'By choosing to reset data, you will have the opportunity to change your choice. If you want to continue, click Confirm',
      name: 'pledges_and_generalization_confirm_message',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Vision of the certificate`
  String get vision_certificate {
    return Intl.message(
      'Vision of the certificate',
      name: 'vision_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Employees Certificates`
  String get employees_certificates {
    return Intl.message(
      'Employees Certificates',
      name: 'employees_certificates',
      desc: '',
      args: [],
    );
  }

  /// `Employee Certificate`
  String get employee_certificate {
    return Intl.message(
      'Employee Certificate',
      name: 'employee_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Previous experience`
  String get previous_experience {
    return Intl.message(
      'Previous experience',
      name: 'previous_experience',
      desc: '',
      args: [],
    );
  }

  /// `Customer reviews`
  String get customer_reviews {
    return Intl.message(
      'Customer reviews',
      name: 'customer_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Projects management`
  String get projects_management {
    return Intl.message(
      'Projects management',
      name: 'projects_management',
      desc: '',
      args: [],
    );
  }

  /// `Add project`
  String get add_project {
    return Intl.message(
      'Add project',
      name: 'add_project',
      desc: '',
      args: [],
    );
  }

  /// `Add projects`
  String get add_projects {
    return Intl.message(
      'Add projects',
      name: 'add_projects',
      desc: '',
      args: [],
    );
  }

  /// `Project data`
  String get project_data {
    return Intl.message(
      'Project data',
      name: 'project_data',
      desc: '',
      args: [],
    );
  }

  /// `Attendance and departure report`
  String get attendance_departure_report {
    return Intl.message(
      'Attendance and departure report',
      name: 'attendance_departure_report',
      desc: '',
      args: [],
    );
  }

  /// `Edit project data`
  String get edit_project_data {
    return Intl.message(
      'Edit project data',
      name: 'edit_project_data',
      desc: '',
      args: [],
    );
  }

  /// `Adjust periods`
  String get adjust_periods {
    return Intl.message(
      'Adjust periods',
      name: 'adjust_periods',
      desc: '',
      args: [],
    );
  }

  /// `Pricing adjustment`
  String get pricing_adjustment {
    return Intl.message(
      'Pricing adjustment',
      name: 'pricing_adjustment',
      desc: '',
      args: [],
    );
  }

  /// `Edit additional sites`
  String get edit_additional_sites {
    return Intl.message(
      'Edit additional sites',
      name: 'edit_additional_sites',
      desc: '',
      args: [],
    );
  }

  /// `Print QR code`
  String get print_qr_code {
    return Intl.message(
      'Print QR code',
      name: 'print_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Project name in Arabic`
  String get project_name_ar {
    return Intl.message(
      'Project name in Arabic',
      name: 'project_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Project name in English`
  String get project_name_en {
    return Intl.message(
      'Project name in English',
      name: 'project_name_en',
      desc: '',
      args: [],
    );
  }

  /// `City in Arabic`
  String get city_ar {
    return Intl.message(
      'City in Arabic',
      name: 'city_ar',
      desc: '',
      args: [],
    );
  }

  /// `City in English`
  String get city_en {
    return Intl.message(
      'City in English',
      name: 'city_en',
      desc: '',
      args: [],
    );
  }

  /// `Write City`
  String get write_city {
    return Intl.message(
      'Write City',
      name: 'write_city',
      desc: '',
      args: [],
    );
  }

  /// `Address in Arabic`
  String get address_ar {
    return Intl.message(
      'Address in Arabic',
      name: 'address_ar',
      desc: '',
      args: [],
    );
  }

  /// `Address in English`
  String get address_en {
    return Intl.message(
      'Address in English',
      name: 'address_en',
      desc: '',
      args: [],
    );
  }

  /// `Write Address`
  String get write_address {
    return Intl.message(
      'Write Address',
      name: 'write_address',
      desc: '',
      args: [],
    );
  }

  /// `Brand type`
  String get brand_type {
    return Intl.message(
      'Brand type',
      name: 'brand_type',
      desc: '',
      args: [],
    );
  }

  /// `Select brand type`
  String get select_brand_type {
    return Intl.message(
      'Select brand type',
      name: 'select_brand_type',
      desc: '',
      args: [],
    );
  }

  /// `Main location`
  String get main_location {
    return Intl.message(
      'Main location',
      name: 'main_location',
      desc: '',
      args: [],
    );
  }

  /// `Location name`
  String get location_name {
    return Intl.message(
      'Location name',
      name: 'location_name',
      desc: '',
      args: [],
    );
  }

  /// `Additional locations`
  String get additional_locations {
    return Intl.message(
      'Additional locations',
      name: 'additional_locations',
      desc: '',
      args: [],
    );
  }

  /// `Add location`
  String get add_location {
    return Intl.message(
      'Add location',
      name: 'add_location',
      desc: '',
      args: [],
    );
  }

  /// `Start typing to search`
  String get start_typing_search {
    return Intl.message(
      'Start typing to search',
      name: 'start_typing_search',
      desc: '',
      args: [],
    );
  }

  /// `Tap on map to get address`
  String get tap_map_get_address {
    return Intl.message(
      'Tap on map to get address',
      name: 'tap_map_get_address',
      desc: '',
      args: [],
    );
  }

  /// `Nearby places`
  String get nearby_places {
    return Intl.message(
      'Nearby places',
      name: 'nearby_places',
      desc: '',
      args: [],
    );
  }

  /// `No Results Found`
  String get no_results_found {
    return Intl.message(
      'No Results Found',
      name: 'no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Finding place...`
  String get finding_place {
    return Intl.message(
      'Finding place...',
      name: 'finding_place',
      desc: '',
      args: [],
    );
  }

  /// `Add a new period`
  String get add_new_period {
    return Intl.message(
      'Add a new period',
      name: 'add_new_period',
      desc: '',
      args: [],
    );
  }

  /// `Period order`
  String get period_order {
    return Intl.message(
      'Period order',
      name: 'period_order',
      desc: '',
      args: [],
    );
  }

  /// `Select period order`
  String get select_period_order {
    return Intl.message(
      'Select period order',
      name: 'select_period_order',
      desc: '',
      args: [],
    );
  }

  /// `Search about period`
  String get search_period {
    return Intl.message(
      'Search about period',
      name: 'search_period',
      desc: '',
      args: [],
    );
  }

  /// `Period name in Arabic`
  String get period_name_ar {
    return Intl.message(
      'Period name in Arabic',
      name: 'period_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Period name in English`
  String get period_name_en {
    return Intl.message(
      'Period name in English',
      name: 'period_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Write Period Name`
  String get write_period_name {
    return Intl.message(
      'Write Period Name',
      name: 'write_period_name',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get occupation {
    return Intl.message(
      'Occupation',
      name: 'occupation',
      desc: '',
      args: [],
    );
  }

  /// `Select Occupation`
  String get select_occupation {
    return Intl.message(
      'Select Occupation',
      name: 'select_occupation',
      desc: '',
      args: [],
    );
  }

  /// `Search about occupation`
  String get search_occupation {
    return Intl.message(
      'Search about occupation',
      name: 'search_occupation',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get working_hours_num {
    return Intl.message(
      'Working hours',
      name: 'working_hours_num',
      desc: '',
      args: [],
    );
  }

  /// `Period pricing`
  String get period_pricing {
    return Intl.message(
      'Period pricing',
      name: 'period_pricing',
      desc: '',
      args: [],
    );
  }

  /// `Add period pricing`
  String get add_period_pricing {
    return Intl.message(
      'Add period pricing',
      name: 'add_period_pricing',
      desc: '',
      args: [],
    );
  }

  /// `City name`
  String get city_name {
    return Intl.message(
      'City name',
      name: 'city_name',
      desc: '',
      args: [],
    );
  }

  /// `Select city name`
  String get select_city_name {
    return Intl.message(
      'Select city name',
      name: 'select_city_name',
      desc: '',
      args: [],
    );
  }

  /// `from day`
  String get from_day {
    return Intl.message(
      'from day',
      name: 'from_day',
      desc: '',
      args: [],
    );
  }

  /// `To day`
  String get to_day {
    return Intl.message(
      'To day',
      name: 'to_day',
      desc: '',
      args: [],
    );
  }

  /// `Pricing Value`
  String get value_pricing {
    return Intl.message(
      'Pricing Value',
      name: 'value_pricing',
      desc: '',
      args: [],
    );
  }

  /// `select day `
  String get select_day {
    return Intl.message(
      'select day ',
      name: 'select_day',
      desc: '',
      args: [],
    );
  }

  /// `Enter the pricing value`
  String get write_value_pricing {
    return Intl.message(
      'Enter the pricing value',
      name: 'write_value_pricing',
      desc: '',
      args: [],
    );
  }

  /// `rosacea`
  String get rosacea {
    return Intl.message(
      'rosacea',
      name: 'rosacea',
      desc: '',
      args: [],
    );
  }

  /// `select a rose`
  String get select_rosacea {
    return Intl.message(
      'select a rose',
      name: 'select_rosacea',
      desc: '',
      args: [],
    );
  }

  /// `select the job`
  String get select_the_job {
    return Intl.message(
      'select the job',
      name: 'select_the_job',
      desc: '',
      args: [],
    );
  }

  /// `Search for a rose`
  String get search_rosacea {
    return Intl.message(
      'Search for a rose',
      name: 'search_rosacea',
      desc: '',
      args: [],
    );
  }

  /// `I am looking for a job`
  String get search_the_job {
    return Intl.message(
      'I am looking for a job',
      name: 'search_the_job',
      desc: '',
      args: [],
    );
  }

  /// `Don't Save`
  String get dont_save {
    return Intl.message(
      'Don\'t Save',
      name: 'dont_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit Period Pricing`
  String get edit_pricing {
    return Intl.message(
      'Edit Period Pricing',
      name: 'edit_pricing',
      desc: '',
      args: [],
    );
  }

  /// `Past Pricing`
  String get last_pricing {
    return Intl.message(
      'Past Pricing',
      name: 'last_pricing',
      desc: '',
      args: [],
    );
  }

  /// `the salary`
  String get the_salary {
    return Intl.message(
      'the salary',
      name: 'the_salary',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to_ {
    return Intl.message(
      'To',
      name: 'to_',
      desc: '',
      args: [],
    );
  }

  /// `Enter a day between 1 and 31.`
  String get validation_day {
    return Intl.message(
      'Enter a day between 1 and 31.',
      name: 'validation_day',
      desc: '',
      args: [],
    );
  }

  /// `Add a logo`
  String get add_logo {
    return Intl.message(
      'Add a logo',
      name: 'add_logo',
      desc: '',
      args: [],
    );
  }

  /// `Download an image file`
  String get download_image_file {
    return Intl.message(
      'Download an image file',
      name: 'download_image_file',
      desc: '',
      args: [],
    );
  }

  /// `Vision QR Code`
  String get vision_qr_code {
    return Intl.message(
      'Vision QR Code',
      name: 'vision_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Back to projects`
  String get back_to_projects {
    return Intl.message(
      'Back to projects',
      name: 'back_to_projects',
      desc: '',
      args: [],
    );
  }

  /// `Download Qr Code`
  String get download_qr_code {
    return Intl.message(
      'Download Qr Code',
      name: 'download_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Please Add a logo`
  String get please_add_logo {
    return Intl.message(
      'Please Add a logo',
      name: 'please_add_logo',
      desc: '',
      args: [],
    );
  }

  /// `The project has been added successfully`
  String get project_added_successfully {
    return Intl.message(
      'The project has been added successfully',
      name: 'project_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `The project will be added to the Manage Projects list.`
  String get project_added_manage_projects_list {
    return Intl.message(
      'The project will be added to the Manage Projects list.',
      name: 'project_added_manage_projects_list',
      desc: '',
      args: [],
    );
  }

  /// `You can download the project now or share it.`
  String get you_can_download_project_now_share_it {
    return Intl.message(
      'You can download the project now or share it.',
      name: 'you_can_download_project_now_share_it',
      desc: '',
      args: [],
    );
  }

  /// `Must be Arabic letters`
  String get must_be_arabic_letters {
    return Intl.message(
      'Must be Arabic letters',
      name: 'must_be_arabic_letters',
      desc: '',
      args: [],
    );
  }

  /// `Must be English letters`
  String get must_be_english_letters {
    return Intl.message(
      'Must be English letters',
      name: 'must_be_english_letters',
      desc: '',
      args: [],
    );
  }

  /// `Employment Management`
  String get employment_management {
    return Intl.message(
      'Employment Management',
      name: 'employment_management',
      desc: '',
      args: [],
    );
  }

  /// `Procedures`
  String get procedures {
    return Intl.message(
      'Procedures',
      name: 'procedures',
      desc: '',
      args: [],
    );
  }

  /// `More details`
  String get more_details {
    return Intl.message(
      'More details',
      name: 'more_details',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Employee Info`
  String get employee_data {
    return Intl.message(
      'Employee Info',
      name: 'employee_data',
      desc: '',
      args: [],
    );
  }

  /// `chashifter Info`
  String get chashifter_data {
    return Intl.message(
      'chashifter Info',
      name: 'chashifter_data',
      desc: '',
      args: [],
    );
  }

  /// `Ban`
  String get ban {
    return Intl.message(
      'Ban',
      name: 'ban',
      desc: '',
      args: [],
    );
  }

  /// `accept`
  String get accept_but {
    return Intl.message(
      'accept',
      name: 'accept_but',
      desc: '',
      args: [],
    );
  }

  /// `reject`
  String get reject_but {
    return Intl.message(
      'reject',
      name: 'reject_but',
      desc: '',
      args: [],
    );
  }

  /// `more details`
  String get more_than {
    return Intl.message(
      'more details',
      name: 'more_than',
      desc: '',
      args: [],
    );
  }

  /// `the project`
  String get project {
    return Intl.message(
      'the project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `notes`
  String get nods {
    return Intl.message(
      'notes',
      name: 'nods',
      desc: '',
      args: [],
    );
  }

  /// `The number of reviews on the project`
  String get review_project {
    return Intl.message(
      'The number of reviews on the project',
      name: 'review_project',
      desc: '',
      args: [],
    );
  }

  /// `The number of reviews on the company`
  String get review_company {
    return Intl.message(
      'The number of reviews on the company',
      name: 'review_company',
      desc: '',
      args: [],
    );
  }

  /// `To know more about this employee`
  String get more_than_about_emp {
    return Intl.message(
      'To know more about this employee',
      name: 'more_than_about_emp',
      desc: '',
      args: [],
    );
  }

  /// `click here`
  String get click {
    return Intl.message(
      'click here',
      name: 'click',
      desc: '',
      args: [],
    );
  }

  /// `Block Employees`
  String get block_emp {
    return Intl.message(
      'Block Employees',
      name: 'block_emp',
      desc: '',
      args: [],
    );
  }

  /// `Employee Certificate`
  String get cv_emp {
    return Intl.message(
      'Employee Certificate',
      name: 'cv_emp',
      desc: '',
      args: [],
    );
  }

  /// `Employee Statistics`
  String get statistic_emp {
    return Intl.message(
      'Employee Statistics',
      name: 'statistic_emp',
      desc: '',
      args: [],
    );
  }

  /// `base data`
  String get base_inf {
    return Intl.message(
      'base data',
      name: 'base_inf',
      desc: '',
      args: [],
    );
  }

  /// `level on computer`
  String get level_computer {
    return Intl.message(
      'level on computer',
      name: 'level_computer',
      desc: '',
      args: [],
    );
  }

  /// `current state`
  String get current_state {
    return Intl.message(
      'current state',
      name: 'current_state',
      desc: '',
      args: [],
    );
  }

  /// `Level in English`
  String get level_eng {
    return Intl.message(
      'Level in English',
      name: 'level_eng',
      desc: '',
      args: [],
    );
  }

  /// `Educational Qualification`
  String get level_education {
    return Intl.message(
      'Educational Qualification',
      name: 'level_education',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Opportunities`
  String get favorite_proportion {
    return Intl.message(
      'Favorite Opportunities',
      name: 'favorite_proportion',
      desc: '',
      args: [],
    );
  }

  /// `Work Data`
  String get work_inf {
    return Intl.message(
      'Work Data',
      name: 'work_inf',
      desc: '',
      args: [],
    );
  }

  /// `Employee Details`
  String get employee_details {
    return Intl.message(
      'Employee Details',
      name: 'employee_details',
      desc: '',
      args: [],
    );
  }

  /// `Previous opportunities and evaluations`
  String get previous_opportunities_and_evaluations {
    return Intl.message(
      'Previous opportunities and evaluations',
      name: 'previous_opportunities_and_evaluations',
      desc: '',
      args: [],
    );
  }

  /// `Average feedbacks`
  String get average_feedbacks {
    return Intl.message(
      'Average feedbacks',
      name: 'average_feedbacks',
      desc: '',
      args: [],
    );
  }

  /// `Previous opportunities`
  String get previous_opportunities {
    return Intl.message(
      'Previous opportunities',
      name: 'previous_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Previous opportunity`
  String get previous_opportunity {
    return Intl.message(
      'Previous opportunity',
      name: 'previous_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to ban the employee?`
  String get are_you_sure_ban_employee {
    return Intl.message(
      'Are you sure to ban the employee?',
      name: 'are_you_sure_ban_employee',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to approve the employee?`
  String get are_you_sure_approval_employee {
    return Intl.message(
      'Are you sure to approve the employee?',
      name: 'are_you_sure_approval_employee',
      desc: '',
      args: [],
    );
  }

  /// `Please select permission`
  String get please_select_permission {
    return Intl.message(
      'Please select permission',
      name: 'please_select_permission',
      desc: '',
      args: [],
    );
  }

  /// `Punishments`
  String get punishments {
    return Intl.message(
      'Punishments',
      name: 'punishments',
      desc: '',
      args: [],
    );
  }

  /// `Add a new punishment`
  String get add_new_punishment {
    return Intl.message(
      'Add a new punishment',
      name: 'add_new_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Punishment Name`
  String get punishment_name {
    return Intl.message(
      'Punishment Name',
      name: 'punishment_name',
      desc: '',
      args: [],
    );
  }

  /// `Select Punishment Name`
  String get select_punishment_name {
    return Intl.message(
      'Select Punishment Name',
      name: 'select_punishment_name',
      desc: '',
      args: [],
    );
  }

  /// `Punishment Type`
  String get punishment_type {
    return Intl.message(
      'Punishment Type',
      name: 'punishment_type',
      desc: '',
      args: [],
    );
  }

  /// `Select Punishment Type`
  String get select_punishment_type {
    return Intl.message(
      'Select Punishment Type',
      name: 'select_punishment_type',
      desc: '',
      args: [],
    );
  }

  /// `Number of prohibited days`
  String get num_prohibited_days {
    return Intl.message(
      'Number of prohibited days',
      name: 'num_prohibited_days',
      desc: '',
      args: [],
    );
  }

  /// `Prohibited days`
  String get determine_prohibited_days {
    return Intl.message(
      'Prohibited days',
      name: 'determine_prohibited_days',
      desc: '',
      args: [],
    );
  }

  /// `The value of the discounted amount`
  String get value_discounted_amount {
    return Intl.message(
      'The value of the discounted amount',
      name: 'value_discounted_amount',
      desc: '',
      args: [],
    );
  }

  /// `Edit Punishment`
  String get edit_punishment {
    return Intl.message(
      'Edit Punishment',
      name: 'edit_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate Punishment`
  String get deactivate_punishment {
    return Intl.message(
      'Deactivate Punishment',
      name: 'deactivate_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Activate Punishment`
  String get activate_punishment {
    return Intl.message(
      'Activate Punishment',
      name: 'activate_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Delete Punishment`
  String get delete_punishment {
    return Intl.message(
      'Delete Punishment',
      name: 'delete_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active_f {
    return Intl.message(
      'Active',
      name: 'active_f',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive_f {
    return Intl.message(
      'Inactive',
      name: 'inactive_f',
      desc: '',
      args: [],
    );
  }

  /// `Violation value`
  String get violation_value {
    return Intl.message(
      'Violation value',
      name: 'violation_value',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to approve the violation?`
  String get are_you_sure_approval_violation {
    return Intl.message(
      'Are you sure to approve the violation?',
      name: 'are_you_sure_approval_violation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete the punishment?`
  String get are_you_sure_delete_punishment {
    return Intl.message(
      'Are you sure to delete the punishment?',
      name: 'are_you_sure_delete_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to deactivate the punishment?`
  String get are_you_sure_deactivate_punishment {
    return Intl.message(
      'Are you sure to deactivate the punishment?',
      name: 'are_you_sure_deactivate_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to activate the punishment?`
  String get are_you_sure_activate_punishment {
    return Intl.message(
      'Are you sure to activate the punishment?',
      name: 'are_you_sure_activate_punishment',
      desc: '',
      args: [],
    );
  }

  /// `Search about City Name`
  String get search_city_name {
    return Intl.message(
      'Search about City Name',
      name: 'search_city_name',
      desc: '',
      args: [],
    );
  }

  /// `Employment Officials`
  String get employment_officials {
    return Intl.message(
      'Employment Officials',
      name: 'employment_officials',
      desc: '',
      args: [],
    );
  }

  /// `Add Employment Official`
  String get add_employment_official {
    return Intl.message(
      'Add Employment Official',
      name: 'add_employment_official',
      desc: '',
      args: [],
    );
  }

  /// `Edit Employment Official Data`
  String get edit_employment_official_data {
    return Intl.message(
      'Edit Employment Official Data',
      name: 'edit_employment_official_data',
      desc: '',
      args: [],
    );
  }

  /// `Determine Shift Hours`
  String get determine_shift_hours {
    return Intl.message(
      'Determine Shift Hours',
      name: 'determine_shift_hours',
      desc: '',
      args: [],
    );
  }

  /// `Workdays`
  String get workdays {
    return Intl.message(
      'Workdays',
      name: 'workdays',
      desc: '',
      args: [],
    );
  }

  /// `Write Working Days`
  String get write_working_days {
    return Intl.message(
      'Write Working Days',
      name: 'write_working_days',
      desc: '',
      args: [],
    );
  }

  /// `Add notes in Arabic`
  String get add_notes_in_arabic {
    return Intl.message(
      'Add notes in Arabic',
      name: 'add_notes_in_arabic',
      desc: '',
      args: [],
    );
  }

  /// `Add notes in English`
  String get add_notes_in_english {
    return Intl.message(
      'Add notes in English',
      name: 'add_notes_in_english',
      desc: '',
      args: [],
    );
  }

  /// `Write Note`
  String get write_note {
    return Intl.message(
      'Write Note',
      name: 'write_note',
      desc: '',
      args: [],
    );
  }

  /// `Write Employee Name`
  String get write_employee_name {
    return Intl.message(
      'Write Employee Name',
      name: 'write_employee_name',
      desc: '',
      args: [],
    );
  }

  /// `Write Email`
  String get write_email {
    return Intl.message(
      'Write Email',
      name: 'write_email',
      desc: '',
      args: [],
    );
  }

  /// `Add employment location`
  String get add_employment_location {
    return Intl.message(
      'Add employment location',
      name: 'add_employment_location',
      desc: '',
      args: [],
    );
  }

  /// `Delete Employment Official Data`
  String get delete_employment_official_data {
    return Intl.message(
      'Delete Employment Official Data',
      name: 'delete_employment_official_data',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to deactivate the employment official?`
  String get are_you_sure_deactivate_employment_official {
    return Intl.message(
      'Are you sure to deactivate the employment official?',
      name: 'are_you_sure_deactivate_employment_official',
      desc: '',
      args: [],
    );
  }

  /// `employment department`
  String get employment_department {
    return Intl.message(
      'employment department',
      name: 'employment_department',
      desc: '',
      args: [],
    );
  }

  /// `Add Copy Rights`
  String get add_copy_rights_title {
    return Intl.message(
      'Add Copy Rights',
      name: 'add_copy_rights_title',
      desc: '',
      args: [],
    );
  }

  /// `add condition`
  String get add_condition {
    return Intl.message(
      'add condition',
      name: 'add_condition',
      desc: '',
      args: [],
    );
  }

  /// `ُEdit condition`
  String get edit_condition {
    return Intl.message(
      'ُEdit condition',
      name: 'edit_condition',
      desc: '',
      args: [],
    );
  }

  /// `Write the condition in Arabic`
  String get condition_ar {
    return Intl.message(
      'Write the condition in Arabic',
      name: 'condition_ar',
      desc: '',
      args: [],
    );
  }

  /// `Write the condition in Arabic`
  String get condition_ar_validation {
    return Intl.message(
      'Write the condition in Arabic',
      name: 'condition_ar_validation',
      desc: '',
      args: [],
    );
  }

  /// `Condition in English`
  String get condition_en {
    return Intl.message(
      'Condition in English',
      name: 'condition_en',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Write the condition in English`
  String get condition_en_validation {
    return Intl.message(
      'Write the condition in English',
      name: 'condition_en_validation',
      desc: '',
      args: [],
    );
  }

  /// `Status changed to active`
  String get update_status_active {
    return Intl.message(
      'Status changed to active',
      name: 'update_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Status changed to inactive`
  String get update_status_unActive {
    return Intl.message(
      'Status changed to inactive',
      name: 'update_status_unActive',
      desc: '',
      args: [],
    );
  }

  /// `Writing requirements in Arabic`
  String get writing_requirements_ar {
    return Intl.message(
      'Writing requirements in Arabic',
      name: 'writing_requirements_ar',
      desc: '',
      args: [],
    );
  }

  /// `Write requirements in Arabic`
  String get writing_requirements_ar_validation {
    return Intl.message(
      'Write requirements in Arabic',
      name: 'writing_requirements_ar_validation',
      desc: '',
      args: [],
    );
  }

  /// `Write requirements in English`
  String get writing_requirements_en {
    return Intl.message(
      'Write requirements in English',
      name: 'writing_requirements_en',
      desc: '',
      args: [],
    );
  }

  /// `Write requirements in English`
  String get writing_requirements_en_validation {
    return Intl.message(
      'Write requirements in English',
      name: 'writing_requirements_en_validation',
      desc: '',
      args: [],
    );
  }

  /// `add job requirements`
  String get add_job_requirements {
    return Intl.message(
      'add job requirements',
      name: 'add_job_requirements',
      desc: '',
      args: [],
    );
  }

  /// `job requirements`
  String get job_requirements {
    return Intl.message(
      'job requirements',
      name: 'job_requirements',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get not_found_data {
    return Intl.message(
      'No data found',
      name: 'not_found_data',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'edit job requirements' key

  /// `Deactivate employment official`
  String get deactivate_employment_official {
    return Intl.message(
      'Deactivate employment official',
      name: 'deactivate_employment_official',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `QR Code Fingerprint`
  String get qr_code_fingerprint {
    return Intl.message(
      'QR Code Fingerprint',
      name: 'qr_code_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `The first step to register is to scan the face with a mobile camera`
  String get record_attendance_scan_description_face_print {
    return Intl.message(
      'The first step to register is to scan the face with a mobile camera',
      name: 'record_attendance_scan_description_face_print',
      desc: '',
      args: [],
    );
  }

  /// `The second step for registration is to check the QR code for the opportunity`
  String get record_attendance_scan_description_qr_code_fingerprint {
    return Intl.message(
      'The second step for registration is to check the QR code for the opportunity',
      name: 'record_attendance_scan_description_qr_code_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Location accuracy`
  String get location_accuracy {
    return Intl.message(
      'Location accuracy',
      name: 'location_accuracy',
      desc: '',
      args: [],
    );
  }

  /// `metre`
  String get metre {
    return Intl.message(
      'metre',
      name: 'metre',
      desc: '',
      args: [],
    );
  }

  /// `Face Print`
  String get face_print {
    return Intl.message(
      'Face Print',
      name: 'face_print',
      desc: '',
      args: [],
    );
  }

  /// `Add face print`
  String get add_face_print {
    return Intl.message(
      'Add face print',
      name: 'add_face_print',
      desc: '',
      args: [],
    );
  }

  /// `Scan the face to identify you`
  String get scan_fac_identify_you {
    return Intl.message(
      'Scan the face to identify you',
      name: 'scan_fac_identify_you',
      desc: '',
      args: [],
    );
  }

  /// `Adding a face print is optional for females and can be skipped`
  String get scan_fac_note {
    return Intl.message(
      'Adding a face print is optional for females and can be skipped',
      name: 'scan_fac_note',
      desc: '',
      args: [],
    );
  }

  /// `If you want to modify the face print, you must consult the administration first`
  String get update_scan_face_note {
    return Intl.message(
      'If you want to modify the face print, you must consult the administration first',
      name: 'update_scan_face_note',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update_button {
    return Intl.message(
      'Update',
      name: 'update_button',
      desc: '',
      args: [],
    );
  }

  /// `Working document`
  String get working_document {
    return Intl.message(
      'Working document',
      name: 'working_document',
      desc: '',
      args: [],
    );
  }

  /// `Advantages of the freelancer document`
  String get advantages_freelancer_document {
    return Intl.message(
      'Advantages of the freelancer document',
      name: 'advantages_freelancer_document',
      desc: '',
      args: [],
    );
  }

  /// `There are many ways to pay`
  String get there_many_ways_pay {
    return Intl.message(
      'There are many ways to pay',
      name: 'there_many_ways_pay',
      desc: '',
      args: [],
    );
  }

  /// `You can choose the method that suits you`
  String get there_many_ways_pay_desc {
    return Intl.message(
      'You can choose the method that suits you',
      name: 'there_many_ways_pay_desc',
      desc: '',
      args: [],
    );
  }

  /// `Payment by Tamara`
  String get payment_by_tamara {
    return Intl.message(
      'Payment by Tamara',
      name: 'payment_by_tamara',
      desc: '',
      args: [],
    );
  }

  /// `Payment by credit card`
  String get payment_by_credit_card {
    return Intl.message(
      'Payment by credit card',
      name: 'payment_by_credit_card',
      desc: '',
      args: [],
    );
  }

  /// `Take a percentage of the opportunity value`
  String get payment_by_opportunity_value {
    return Intl.message(
      'Take a percentage of the opportunity value',
      name: 'payment_by_opportunity_value',
      desc: '',
      args: [],
    );
  }

  /// `Click here`
  String get click_here {
    return Intl.message(
      'Click here',
      name: 'click_here',
      desc: '',
      args: [],
    );
  }

  /// `Discount certificate details`
  String get discount_certificate_details {
    return Intl.message(
      'Discount certificate details',
      name: 'discount_certificate_details',
      desc: '',
      args: [],
    );
  }

  /// `Installment package`
  String get installment_package {
    return Intl.message(
      'Installment package',
      name: 'installment_package',
      desc: '',
      args: [],
    );
  }

  /// `Select installment package`
  String get select_installment_package {
    return Intl.message(
      'Select installment package',
      name: 'select_installment_package',
      desc: '',
      args: [],
    );
  }

  /// `Certificate value`
  String get certificate_value {
    return Intl.message(
      'Certificate value',
      name: 'certificate_value',
      desc: '',
      args: [],
    );
  }

  /// `In the event that the installments are not completed, you are not entitled to claim the paid installments`
  String get installment_with_cashift_note {
    return Intl.message(
      'In the event that the installments are not completed, you are not entitled to claim the paid installments',
      name: 'installment_with_cashift_note',
      desc: '',
      args: [],
    );
  }

  /// `Smil`
  String get smil {
    return Intl.message(
      'Smil',
      name: 'smil',
      desc: '',
      args: [],
    );
  }

  /// `Face not matched`
  String get face_not_matched {
    return Intl.message(
      'Face not matched',
      name: 'face_not_matched',
      desc: '',
      args: [],
    );
  }

  /// `Seen`
  String get seen {
    return Intl.message(
      'Seen',
      name: 'seen',
      desc: '',
      args: [],
    );
  }

  /// `I agree to all terms and conditions`
  String get terms_and_conditions_message {
    return Intl.message(
      'I agree to all terms and conditions',
      name: 'terms_and_conditions_message',
      desc: '',
      args: [],
    );
  }

  /// `In the event of confirmation of non-approval in issuing the document, the account will be frozen`
  String get installment_postponement_desc {
    return Intl.message(
      'In the event of confirmation of non-approval in issuing the document, the account will be frozen',
      name: 'installment_postponement_desc',
      desc: '',
      args: [],
    );
  }

  /// `What is the?`
  String get what_is_reason {
    return Intl.message(
      'What is the?',
      name: 'what_is_reason',
      desc: '',
      args: [],
    );
  }

  /// `Type the reason...`
  String get type_reason {
    return Intl.message(
      'Type the reason...',
      name: 'type_reason',
      desc: '',
      args: [],
    );
  }

  /// `I accept`
  String get i_accept {
    return Intl.message(
      'I accept',
      name: 'i_accept',
      desc: '',
      args: [],
    );
  }

  /// `deposit`
  String get deposit {
    return Intl.message(
      'deposit',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  /// `Successful operations:`
  String get success_processing {
    return Intl.message(
      'Successful operations:',
      name: 'success_processing',
      desc: '',
      args: [],
    );
  }

  /// `Value of successful operations:`
  String get value_success_processing {
    return Intl.message(
      'Value of successful operations:',
      name: 'value_success_processing',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete number:`
  String get failed_processing {
    return Intl.message(
      'Incomplete number:',
      name: 'failed_processing',
      desc: '',
      args: [],
    );
  }

  /// `Value of incomplete number:`
  String get value_failed_processing {
    return Intl.message(
      'Value of incomplete number:',
      name: 'value_failed_processing',
      desc: '',
      args: [],
    );
  }

  /// `Total value recovered`
  String get value_total {
    return Intl.message(
      'Total value recovered',
      name: 'value_total',
      desc: '',
      args: [],
    );
  }

  /// `Number required:`
  String get number_req {
    return Intl.message(
      'Number required:',
      name: 'number_req',
      desc: '',
      args: [],
    );
  }

  /// `pending amounts`
  String get salary_hanging {
    return Intl.message(
      'pending amounts',
      name: 'salary_hanging',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Mole name:`
  String get name_mole {
    return Intl.message(
      'Mole name:',
      name: 'name_mole',
      desc: '',
      args: [],
    );
  }

  /// `Opportunity date:`
  String get opportunity_time {
    return Intl.message(
      'Opportunity date:',
      name: 'opportunity_time',
      desc: '',
      args: [],
    );
  }

  /// `Confirm attendance`
  String get attendance_confirm {
    return Intl.message(
      'Confirm attendance',
      name: 'attendance_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Why can't you attend?`
  String get why_not_attended {
    return Intl.message(
      'Why can\'t you attend?',
      name: 'why_not_attended',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your attendance today`
  String get confirm_today {
    return Intl.message(
      'Please confirm your attendance today',
      name: 'confirm_today',
      desc: '',
      args: [],
    );
  }

  /// `Write the reason for your apology`
  String get write_reason_apology {
    return Intl.message(
      'Write the reason for your apology',
      name: 'write_reason_apology',
      desc: '',
      args: [],
    );
  }

  /// `apology`
  String get apology {
    return Intl.message(
      'apology',
      name: 'apology',
      desc: '',
      args: [],
    );
  }

  /// `Confirm attendance`
  String get confirm_attendance {
    return Intl.message(
      'Confirm attendance',
      name: 'confirm_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home Page`
  String get back_to_home_page {
    return Intl.message(
      'Back to Home Page',
      name: 'back_to_home_page',
      desc: '',
      args: [],
    );
  }

  /// `Search places`
  String get search_places {
    return Intl.message(
      'Search places',
      name: 'search_places',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'current' key

  /// `week ago`
  String get from_week {
    return Intl.message(
      'week ago',
      name: 'from_week',
      desc: '',
      args: [],
    );
  }

  /// `two weeks ago`
  String get from_tow_week {
    return Intl.message(
      'two weeks ago',
      name: 'from_tow_week',
      desc: '',
      args: [],
    );
  }

  /// ` month ago`
  String get from_month_week {
    return Intl.message(
      ' month ago',
      name: 'from_month_week',
      desc: '',
      args: [],
    );
  }

  /// `date dispose`
  String get date_dispose {
    return Intl.message(
      'date dispose',
      name: 'date_dispose',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get classification {
    return Intl.message(
      'categories',
      name: 'classification',
      desc: '',
      args: [],
    );
  }

  /// `Add a new classification`
  String get add_classification {
    return Intl.message(
      'Add a new classification',
      name: 'add_classification',
      desc: '',
      args: [],
    );
  }

  /// `Edit classification`
  String get edit_classification {
    return Intl.message(
      'Edit classification',
      name: 'edit_classification',
      desc: '',
      args: [],
    );
  }

  /// `Add a new job opportunity`
  String get add_new_job_opportunity {
    return Intl.message(
      'Add a new job opportunity',
      name: 'add_new_job_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `All employees`
  String get all_employees {
    return Intl.message(
      'All employees',
      name: 'all_employees',
      desc: '',
      args: [],
    );
  }

  /// `total statistics`
  String get total_statistic {
    return Intl.message(
      'total statistics',
      name: 'total_statistic',
      desc: '',
      args: [],
    );
  }

  /// `Method of arrival and departure`
  String get method_arrival_departure {
    return Intl.message(
      'Method of arrival and departure',
      name: 'method_arrival_departure',
      desc: '',
      args: [],
    );
  }

  /// `Please select employees`
  String get please_select_employees {
    return Intl.message(
      'Please select employees',
      name: 'please_select_employees',
      desc: '',
      args: [],
    );
  }

  /// `ways_accept_job`
  String get ways_accept_job {
    return Intl.message(
      'ways_accept_job',
      name: 'ways_accept_job',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions of the job`
  String get terms_conditions_job {
    return Intl.message(
      'Terms and conditions of the job',
      name: 'terms_conditions_job',
      desc: '',
      args: [],
    );
  }

  /// `Send a personal interview request`
  String get send_personal_interview_request {
    return Intl.message(
      'Send a personal interview request',
      name: 'send_personal_interview_request',
      desc: '',
      args: [],
    );
  }

  /// `Area name`
  String get area_name {
    return Intl.message(
      'Area name',
      name: 'area_name',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR code for the project to confirm your shift`
  String get scan_qr_code_project_confirm_shift {
    return Intl.message(
      'Scan the QR code for the project to confirm your shift',
      name: 'scan_qr_code_project_confirm_shift',
      desc: '',
      args: [],
    );
  }

  /// `Check the Qr Code for the opportunity`
  String get check_qr_code_opportunity {
    return Intl.message(
      'Check the Qr Code for the opportunity',
      name: 'check_qr_code_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `*The “Kashift” application needs to allow the use of the geographical location service in the background to be able to benefit from the automatic attendance and dismissal registration service.`
  String get background_service_permission_message {
    return Intl.message(
      '*The “Kashift” application needs to allow the use of the geographical location service in the background to be able to benefit from the automatic attendance and dismissal registration service.',
      name: 'background_service_permission_message',
      desc: '',
      args: [],
    );
  }

  /// `* The Kashft application needs to allow the use of the geographical location service so that the application can send your job location to verify that you are in the correct work location.`
  String get location_service_permission_message {
    return Intl.message(
      '* The Kashft application needs to allow the use of the geographical location service so that the application can send your job location to verify that you are in the correct work location.',
      name: 'location_service_permission_message',
      desc: '',
      args: [],
    );
  }

  /// `The application needs permission to use the camera and memory files. Please add permissions through the settings.`
  String get face_recognition_service_permission_message {
    return Intl.message(
      'The application needs permission to use the camera and memory files. Please add permissions through the settings.',
      name: 'face_recognition_service_permission_message',
      desc: '',
      args: [],
    );
  }

  /// `*If you do not agree to enable the program to work to correctly prove the time of attendance and departure, your status will be considered as an absence.`
  String get reject_service_permission_message {
    return Intl.message(
      '*If you do not agree to enable the program to work to correctly prove the time of attendance and departure, your status will be considered as an absence.',
      name: 'reject_service_permission_message',
      desc: '',
      args: [],
    );
  }

  /// `Search for a contract clause`
  String get search_contract_clause {
    return Intl.message(
      'Search for a contract clause',
      name: 'search_contract_clause',
      desc: '',
      args: [],
    );
  }

  /// `Number required for the opportunity`
  String get number_required_for_opportunity {
    return Intl.message(
      'Number required for the opportunity',
      name: 'number_required_for_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Type the number required for the opportunity`
  String get type_number_required_for_opportunity {
    return Intl.message(
      'Type the number required for the opportunity',
      name: 'type_number_required_for_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Manager name`
  String get manager_name {
    return Intl.message(
      'Manager name',
      name: 'manager_name',
      desc: '',
      args: [],
    );
  }

  /// `Type the manager name`
  String get type_manager_name {
    return Intl.message(
      'Type the manager name',
      name: 'type_manager_name',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions of the opportunity`
  String get terms_conditions_opportunities {
    return Intl.message(
      'Terms and conditions of the opportunity',
      name: 'terms_conditions_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Add terms and conditions of the opportunity`
  String get add_terms_conditions_opportunities {
    return Intl.message(
      'Add terms and conditions of the opportunity',
      name: 'add_terms_conditions_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Writing terms and conditions in Arabic`
  String get writing_terms_conditions_ar {
    return Intl.message(
      'Writing terms and conditions in Arabic',
      name: 'writing_terms_conditions_ar',
      desc: '',
      args: [],
    );
  }

  /// `Write terms and conditions in Arabic`
  String get write_terms_conditions_ar {
    return Intl.message(
      'Write terms and conditions in Arabic',
      name: 'write_terms_conditions_ar',
      desc: '',
      args: [],
    );
  }

  /// `Writing terms and conditions in English`
  String get writing_terms_conditions_en {
    return Intl.message(
      'Writing terms and conditions in English',
      name: 'writing_terms_conditions_en',
      desc: '',
      args: [],
    );
  }

  /// `Write terms and conditions in English`
  String get write_terms_conditions_en {
    return Intl.message(
      'Write terms and conditions in English',
      name: 'write_terms_conditions_en',
      desc: '',
      args: [],
    );
  }

  /// `total deductions`
  String get total_deductions {
    return Intl.message(
      'total deductions',
      name: 'total_deductions',
      desc: '',
      args: [],
    );
  }

  /// ` deductions`
  String get s {
    return Intl.message(
      ' deductions',
      name: 's',
      desc: '',
      args: [],
    );
  }

  /// `Total value of opportunity`
  String get total_opportunity {
    return Intl.message(
      'Total value of opportunity',
      name: 'total_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `net`
  String get net {
    return Intl.message(
      'net',
      name: 'net',
      desc: '',
      args: [],
    );
  }

  /// `loan`
  String get loan {
    return Intl.message(
      'loan',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `infringement`
  String get infringement {
    return Intl.message(
      'infringement',
      name: 'infringement',
      desc: '',
      args: [],
    );
  }

  /// `There are no deductions`
  String get no_deductions {
    return Intl.message(
      'There are no deductions',
      name: 'no_deductions',
      desc: '',
      args: [],
    );
  }

  /// `Infringement status`
  String get status_infringement {
    return Intl.message(
      'Infringement status',
      name: 'status_infringement',
      desc: '',
      args: [],
    );
  }

  /// `Blocking start date:`
  String get start_date_blocking {
    return Intl.message(
      'Blocking start date:',
      name: 'start_date_blocking',
      desc: '',
      args: [],
    );
  }

  /// `Blocking end date:`
  String get end_date_blocking {
    return Intl.message(
      'Blocking end date:',
      name: 'end_date_blocking',
      desc: '',
      args: [],
    );
  }

  /// `Deducting a certificate of no record:`
  String get deducting_certificate {
    return Intl.message(
      'Deducting a certificate of no record:',
      name: 'deducting_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get add_new {
    return Intl.message(
      'Add new',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `Reset mobile number`
  String get reset_mobile_number {
    return Intl.message(
      'Reset mobile number',
      name: 'reset_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Reset face fingerprint`
  String get reset_face_fingerprint {
    return Intl.message(
      'Reset face fingerprint',
      name: 'reset_face_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Company-wide ban`
  String get company_wide_ban {
    return Intl.message(
      'Company-wide ban',
      name: 'company_wide_ban',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure that the employee has been banned at the company level?`
  String get ban_employee_desc {
    return Intl.message(
      'Are you sure that the employee has been banned at the company level?',
      name: 'ban_employee_desc',
      desc: '',
      args: [],
    );
  }

  /// `Type the reason for the ban`
  String get type_reason_ban {
    return Intl.message(
      'Type the reason for the ban',
      name: 'type_reason_ban',
      desc: '',
      args: [],
    );
  }

  /// `You must choose where to send the verification code`
  String get must_choose_where_send_verification_code {
    return Intl.message(
      'You must choose where to send the verification code',
      name: 'must_choose_where_send_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `The proof file must be uploaded`
  String get proof_file_must_uploaded {
    return Intl.message(
      'The proof file must be uploaded',
      name: 'proof_file_must_uploaded',
      desc: '',
      args: [],
    );
  }

  /// `A verification code will be sent to your old mobile number. You must review it now`
  String get verification_code_sent_desc {
    return Intl.message(
      'A verification code will be sent to your old mobile number. You must review it now',
      name: 'verification_code_sent_desc',
      desc: '',
      args: [],
    );
  }

  /// `I accept to`
  String get i_accept_to {
    return Intl.message(
      'I accept to',
      name: 'i_accept_to',
      desc: '',
      args: [],
    );
  }

  /// `the loans`
  String get loans {
    return Intl.message(
      'the loans',
      name: 'loans',
      desc: '',
      args: [],
    );
  }

  /// `Add loans`
  String get add_loans {
    return Intl.message(
      'Add loans',
      name: 'add_loans',
      desc: '',
      args: [],
    );
  }

  /// `Search by phone number detector`
  String get search_by_phone {
    return Intl.message(
      'Search by phone number detector',
      name: 'search_by_phone',
      desc: '',
      args: [],
    );
  }

  /// `total loan `
  String get total_loans {
    return Intl.message(
      'total loan ',
      name: 'total_loans',
      desc: '',
      args: [],
    );
  }

  /// `active loans`
  String get active_loans {
    return Intl.message(
      'active loans',
      name: 'active_loans',
      desc: '',
      args: [],
    );
  }

  /// `total collection`
  String get total_collection {
    return Intl.message(
      'total collection',
      name: 'total_collection',
      desc: '',
      args: [],
    );
  }

  /// `residual`
  String get residual {
    return Intl.message(
      'residual',
      name: 'residual',
      desc: '',
      args: [],
    );
  }

  /// `Collected`
  String get collection_done {
    return Intl.message(
      'Collected',
      name: 'collection_done',
      desc: '',
      args: [],
    );
  }

  /// `collecting advances`
  String get loans_collection {
    return Intl.message(
      'collecting advances',
      name: 'loans_collection',
      desc: '',
      args: [],
    );
  }

  /// `Loan type`
  String get type_loans {
    return Intl.message(
      'Loan type',
      name: 'type_loans',
      desc: '',
      args: [],
    );
  }

  /// `collection percentage`
  String get value_collect {
    return Intl.message(
      'collection percentage',
      name: 'value_collect',
      desc: '',
      args: [],
    );
  }

  /// `loans value`
  String get value_loans {
    return Intl.message(
      'loans value',
      name: 'value_loans',
      desc: '',
      args: [],
    );
  }

  /// `discount percentage`
  String get value_discount {
    return Intl.message(
      'discount percentage',
      name: 'value_discount',
      desc: '',
      args: [],
    );
  }

  /// `opportunity value`
  String get value_opportunity {
    return Intl.message(
      'opportunity value',
      name: 'value_opportunity',
      desc: '',
      args: [],
    );
  }

  /// `collection data`
  String get data_collection {
    return Intl.message(
      'collection data',
      name: 'data_collection',
      desc: '',
      args: [],
    );
  }

  /// `Total loan value`
  String get total_value_loan {
    return Intl.message(
      'Total loan value',
      name: 'total_value_loan',
      desc: '',
      args: [],
    );
  }

  /// `total remaining`
  String get total_residual {
    return Intl.message(
      'total remaining',
      name: 'total_residual',
      desc: '',
      args: [],
    );
  }

  /// `Collect cashshift advances`
  String get chashifter_collect_loan {
    return Intl.message(
      'Collect cashshift advances',
      name: 'chashifter_collect_loan',
      desc: '',
      args: [],
    );
  }

  /// `Value collected`
  String get value_collection {
    return Intl.message(
      'Value collected',
      name: 'value_collection',
      desc: '',
      args: [],
    );
  }

  /// `collect`
  String get collect {
    return Intl.message(
      'collect',
      name: 'collect',
      desc: '',
      args: [],
    );
  }

  /// `chashifter advance details`
  String get chashifter_details_loan {
    return Intl.message(
      'chashifter advance details',
      name: 'chashifter_details_loan',
      desc: '',
      args: [],
    );
  }

  /// `Type the discount value`
  String get type_discount_value {
    return Intl.message(
      'Type the discount value',
      name: 'type_discount_value',
      desc: '',
      args: [],
    );
  }

  /// `discount value`
  String get discount_value {
    return Intl.message(
      'discount value',
      name: 'discount_value',
      desc: '',
      args: [],
    );
  }

  /// `Cashifter name`
  String get cashifter_name {
    return Intl.message(
      'Cashifter name',
      name: 'cashifter_name',
      desc: '',
      args: [],
    );
  }

  /// `Select cashifter`
  String get select_cashifter {
    return Intl.message(
      'Select cashifter',
      name: 'select_cashifter',
      desc: '',
      args: [],
    );
  }

  /// `Discount percentage`
  String get discount_percentage {
    return Intl.message(
      'Discount percentage',
      name: 'discount_percentage',
      desc: '',
      args: [],
    );
  }

  /// `Select discount percentage`
  String get select_discount_percentage {
    return Intl.message(
      'Select discount percentage',
      name: 'select_discount_percentage',
      desc: '',
      args: [],
    );
  }

  /// `Select loan type`
  String get select_loan_type {
    return Intl.message(
      'Select loan type',
      name: 'select_loan_type',
      desc: '',
      args: [],
    );
  }

  /// `Loan value`
  String get loan_value {
    return Intl.message(
      'Loan value',
      name: 'loan_value',
      desc: '',
      args: [],
    );
  }

  /// `Type the loan value`
  String get type_loan_value {
    return Intl.message(
      'Type the loan value',
      name: 'type_loan_value',
      desc: '',
      args: [],
    );
  }

  /// `Successfully downloaded`
  String get successfully_downloaded {
    return Intl.message(
      'Successfully downloaded',
      name: 'successfully_downloaded',
      desc: '',
      args: [],
    );
  }

  /// `conditions of the job`
  String get opportunity_condition {
    return Intl.message(
      'conditions of the job',
      name: 'opportunity_condition',
      desc: '',
      args: [],
    );
  }

  /// `What is the reason for apologizing?`
  String get whats_reason_apologizing {
    return Intl.message(
      'What is the reason for apologizing?',
      name: 'whats_reason_apologizing',
      desc: '',
      args: [],
    );
  }

  /// `Type the reason for apologizing`
  String get type_reason_apologizing {
    return Intl.message(
      'Type the reason for apologizing',
      name: 'type_reason_apologizing',
      desc: '',
      args: [],
    );
  }

  /// `Classification`
  String get opportunity_classification {
    return Intl.message(
      'Classification',
      name: 'opportunity_classification',
      desc: '',
      args: [],
    );
  }

  /// `applicants`
  String get applicants {
    return Intl.message(
      'applicants',
      name: 'applicants',
      desc: '',
      args: [],
    );
  }

  /// `applied`
  String get applied {
    return Intl.message(
      'applied',
      name: 'applied',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get show_details_data {
    return Intl.message(
      'View details',
      name: 'show_details_data',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid_off {
    return Intl.message(
      'Paid',
      name: 'paid_off',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled or withdrawn`
  String get canceled_withdrawn {
    return Intl.message(
      'Cancelled or withdrawn',
      name: 'canceled_withdrawn',
      desc: '',
      args: [],
    );
  }

  /// `Date created`
  String get date_create {
    return Intl.message(
      'Date created',
      name: 'date_create',
      desc: '',
      args: [],
    );
  }

  /// `Applied details`
  String get applied_details {
    return Intl.message(
      'Applied details',
      name: 'applied_details',
      desc: '',
      args: [],
    );
  }

  /// `change hours `
  String get change_hours {
    return Intl.message(
      'change hours ',
      name: 'change_hours',
      desc: '',
      args: [],
    );
  }

  /// `applied name`
  String get applied_name {
    return Intl.message(
      'applied name',
      name: 'applied_name',
      desc: '',
      args: [],
    );
  }

  /// `Ready to start`
  String get ready_to_start {
    return Intl.message(
      'Ready to start',
      name: 'ready_to_start',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there is no internet connection!`
  String get no_internet {
    return Intl.message(
      'Sorry, there is no internet connection!',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Since your device is not connected to the Internet, you can register attendance via:`
  String get no_internet_description {
    return Intl.message(
      'Since your device is not connected to the Internet, you can register attendance via:',
      name: 'no_internet_description',
      desc: '',
      args: [],
    );
  }

  /// `Recording chashift attendance and departure`
  String get chashift_attendance {
    return Intl.message(
      'Recording chashift attendance and departure',
      name: 'chashift_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Register your attendance with your fingerprint`
  String get chashift_attendance_finger {
    return Intl.message(
      'Register your attendance with your fingerprint',
      name: 'chashift_attendance_finger',
      desc: '',
      args: [],
    );
  }

  /// `DTA attendance and departure recording`
  String get chashift_attendance_dta {
    return Intl.message(
      'DTA attendance and departure recording',
      name: 'chashift_attendance_dta',
      desc: '',
      args: [],
    );
  }

  /// `Type the opportunity value`
  String get type_opportunity_value {
    return Intl.message(
      'Type the opportunity value',
      name: 'type_opportunity_value',
      desc: '',
      args: [],
    );
  }

  /// `Select the opportunity date`
  String get select_opportunity_date {
    return Intl.message(
      'Select the opportunity date',
      name: 'select_opportunity_date',
      desc: '',
      args: [],
    );
  }

  /// `Type the backup number`
  String get type_back_up_number {
    return Intl.message(
      'Type the backup number',
      name: 'type_back_up_number',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to save the data`
  String get confairm_data {
    return Intl.message(
      'Are you sure to save the data',
      name: 'confairm_data',
      desc: '',
      args: [],
    );
  }

  /// `Please specify the order status!`
  String get confairm_status_order {
    return Intl.message(
      'Please specify the order status!',
      name: 'confairm_status_order',
      desc: '',
      args: [],
    );
  }

  /// `Please rate first.`
  String get rating_confairm {
    return Intl.message(
      'Please rate first.',
      name: 'rating_confairm',
      desc: '',
      args: [],
    );
  }

  /// `Write the reason for rejecting the payment`
  String get reject_reason {
    return Intl.message(
      'Write the reason for rejecting the payment',
      name: 'reject_reason',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for activation`
  String get wait_active {
    return Intl.message(
      'Waiting for activation',
      name: 'wait_active',
      desc: '',
      args: [],
    );
  }

  /// `Stopd`
  String get not_active {
    return Intl.message(
      'Stopd',
      name: 'not_active',
      desc: '',
      args: [],
    );
  }

  /// `on the job`
  String get in_work {
    return Intl.message(
      'on the job',
      name: 'in_work',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `rest days`
  String get rest_day {
    return Intl.message(
      'rest days',
      name: 'rest_day',
      desc: '',
      args: [],
    );
  }

  /// `calculation method`
  String get calculation_method {
    return Intl.message(
      'calculation method',
      name: 'calculation_method',
      desc: '',
      args: [],
    );
  }

  /// `select working time`
  String get select_working_time {
    return Intl.message(
      'select working time',
      name: 'select_working_time',
      desc: '',
      args: [],
    );
  }

  /// `duration_monthly`
  String get duration_monthly {
    return Intl.message(
      'duration_monthly',
      name: 'duration_monthly',
      desc: '',
      args: [],
    );
  }

  /// `edit employee`
  String get edit_employee {
    return Intl.message(
      'edit employee',
      name: 'edit_employee',
      desc: '',
      args: [],
    );
  }

  /// `employee state`
  String get state_emp {
    return Intl.message(
      'employee state',
      name: 'state_emp',
      desc: '',
      args: [],
    );
  }

  /// `cashifters`
  String get cashifters {
    return Intl.message(
      'cashifters',
      name: 'cashifters',
      desc: '',
      args: [],
    );
  }

  /// `Add a new cashifters`
  String get add_cashifters {
    return Intl.message(
      'Add a new cashifters',
      name: 'add_cashifters',
      desc: '',
      args: [],
    );
  }

  /// `edit cashifters `
  String get edit_cashifters {
    return Intl.message(
      'edit cashifters ',
      name: 'edit_cashifters',
      desc: '',
      args: [],
    );
  }

  /// `There is no work time`
  String get dont_have_work_time {
    return Intl.message(
      'There is no work time',
      name: 'dont_have_work_time',
      desc: '',
      args: [],
    );
  }

  /// `Show focus points on map`
  String get show_focus_points_in_map {
    return Intl.message(
      'Show focus points on map',
      name: 'show_focus_points_in_map',
      desc: '',
      args: [],
    );
  }

  /// `Search by cashifter's mobile number`
  String get search_by_phone_employee {
    return Intl.message(
      'Search by cashifter\'s mobile number',
      name: 'search_by_phone_employee',
      desc: '',
      args: [],
    );
  }

  /// `Select the method of selecting employees`
  String get select_method_selecting_employees {
    return Intl.message(
      'Select the method of selecting employees',
      name: 'select_method_selecting_employees',
      desc: '',
      args: [],
    );
  }

  /// `Select the method of arrival and departure`
  String get select_method_arrival_departure {
    return Intl.message(
      'Select the method of arrival and departure',
      name: 'select_method_arrival_departure',
      desc: '',
      args: [],
    );
  }

  /// `View Work Hazards`
  String get view_work_hazards {
    return Intl.message(
      'View Work Hazards',
      name: 'view_work_hazards',
      desc: '',
      args: [],
    );
  }

  /// `Add Hazards`
  String get add_hazards {
    return Intl.message(
      'Add Hazards',
      name: 'add_hazards',
      desc: '',
      args: [],
    );
  }

  /// `Work Hazards`
  String get work_hazards {
    return Intl.message(
      'Work Hazards',
      name: 'work_hazards',
      desc: '',
      args: [],
    );
  }

  /// `Degree Important`
  String get degree_importance {
    return Intl.message(
      'Degree Important',
      name: 'degree_importance',
      desc: '',
      args: [],
    );
  }

  /// `Select the degree of importance`
  String get select_degree_importance {
    return Intl.message(
      'Select the degree of importance',
      name: 'select_degree_importance',
      desc: '',
      args: [],
    );
  }

  /// `Submission date`
  String get submission_date {
    return Intl.message(
      'Submission date',
      name: 'submission_date',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get view_details {
    return Intl.message(
      'View details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `Upload a PDF or image`
  String get upload_pdf_image {
    return Intl.message(
      'Upload a PDF or image',
      name: 'upload_pdf_image',
      desc: '',
      args: [],
    );
  }

  /// `You can add more than one image to illustrate the complaint.`
  String get add_complaint_files_desc {
    return Intl.message(
      'You can add more than one image to illustrate the complaint.',
      name: 'add_complaint_files_desc',
      desc: '',
      args: [],
    );
  }

  /// `Search here...`
  String get search_here {
    return Intl.message(
      'Search here...',
      name: 'search_here',
      desc: '',
      args: [],
    );
  }

  /// `Select type`
  String get select_type {
    return Intl.message(
      'Select type',
      name: 'select_type',
      desc: '',
      args: [],
    );
  }

  /// `Work hazard details`
  String get work_hazard_details {
    return Intl.message(
      'Work hazard details',
      name: 'work_hazard_details',
      desc: '',
      args: [],
    );
  }

  /// `Attached attachments`
  String get attached_attachments {
    return Intl.message(
      'Attached attachments',
      name: 'attached_attachments',
      desc: '',
      args: [],
    );
  }

  /// `Responsible response`
  String get responsible_response {
    return Intl.message(
      'Responsible response',
      name: 'responsible_response',
      desc: '',
      args: [],
    );
  }

  /// `Shift Name`
  String get shift_name {
    return Intl.message(
      'Shift Name',
      name: 'shift_name',
      desc: '',
      args: [],
    );
  }

  /// `Blink your eyes`
  String get blink_your_eyes {
    return Intl.message(
      'Blink your eyes',
      name: 'blink_your_eyes',
      desc: '',
      args: [],
    );
  }

  /// `Turn left`
  String get turn_left {
    return Intl.message(
      'Turn left',
      name: 'turn_left',
      desc: '',
      args: [],
    );
  }

  /// `Turn right`
  String get turn_right {
    return Intl.message(
      'Turn right',
      name: 'turn_right',
      desc: '',
      args: [],
    );
  }

  /// `Tasks And Duties`
  String get tasks_and_duties {
    return Intl.message(
      'Tasks And Duties',
      name: 'tasks_and_duties',
      desc: '',
      args: [],
    );
  }

  /// `There are no tasks and duties`
  String get empty_tasks_and_duties {
    return Intl.message(
      'There are no tasks and duties',
      name: 'empty_tasks_and_duties',
      desc: '',
      args: [],
    );
  }

  /// `This app collects location data to help you find nearby opportunities and verify your location when starting work, even when the app is closed or not in use.`
  String get location_disclosure {
    return Intl.message(
      'This app collects location data to help you find nearby opportunities and verify your location when starting work, even when the app is closed or not in use.',
      name: 'location_disclosure',
      desc: '',
      args: [],
    );
  }

  /// `Cashift Required Permissions`
  String get allow_required_permissions {
    return Intl.message(
      'Cashift Required Permissions',
      name: 'allow_required_permissions',
      desc: '',
      args: [],
    );
  }

  /// `Tasks and responsibilities`
  String get tasks_and_responsibilities {
    return Intl.message(
      'Tasks and responsibilities',
      name: 'tasks_and_responsibilities',
      desc: '',
      args: [],
    );
  }

  /// `Add Task Responsibility`
  String get add_task_responsibility {
    return Intl.message(
      'Add Task Responsibility',
      name: 'add_task_responsibility',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task Responsibility`
  String get edit_task_responsibility {
    return Intl.message(
      'Edit Task Responsibility',
      name: 'edit_task_responsibility',
      desc: '',
      args: [],
    );
  }

  /// `add vehicles`
  String get add_vehicles {
    return Intl.message(
      'add vehicles',
      name: 'add_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `vehicles`
  String get vehicles {
    return Intl.message(
      'vehicles',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Model `
  String get model {
    return Intl.message(
      'Model ',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Color `
  String get color {
    return Intl.message(
      'Color ',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Year of manufacture `
  String get year_crate {
    return Intl.message(
      'Year of manufacture ',
      name: 'year_crate',
      desc: '',
      args: [],
    );
  }

  /// `Edit vehicle data`
  String get edit_data_vehicles {
    return Intl.message(
      'Edit vehicle data',
      name: 'edit_data_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Edit covenant`
  String get edit_covenant {
    return Intl.message(
      'Edit covenant',
      name: 'edit_covenant',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle insurance`
  String get vehicle_insurance {
    return Intl.message(
      'Vehicle insurance',
      name: 'vehicle_insurance',
      desc: '',
      args: [],
    );
  }

  /// `maintenance`
  String get maintenance {
    return Intl.message(
      'maintenance',
      name: 'maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Basic vehicle information`
  String get vehicles_info {
    return Intl.message(
      'Basic vehicle information',
      name: 'vehicles_info',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Type`
  String get vehicle_type {
    return Intl.message(
      'Vehicle Type',
      name: 'vehicle_type',
      desc: '',
      args: [],
    );
  }

  /// `Plate and license information`
  String get plate_license_info {
    return Intl.message(
      'Plate and license information',
      name: 'plate_license_info',
      desc: '',
      args: [],
    );
  }

  /// `License Expiration Date`
  String get expair_date_license {
    return Intl.message(
      'License Expiration Date',
      name: 'expair_date_license',
      desc: '',
      args: [],
    );
  }

  /// `License Number`
  String get license_number {
    return Intl.message(
      'License Number',
      name: 'license_number',
      desc: '',
      args: [],
    );
  }

  /// `Plate Number`
  String get number_plate {
    return Intl.message(
      'Plate Number',
      name: 'number_plate',
      desc: '',
      args: [],
    );
  }

  /// `vehicle details`
  String get vehicles_details {
    return Intl.message(
      'vehicle details',
      name: 'vehicles_details',
      desc: '',
      args: [],
    );
  }

  /// `Additional Specifications`
  String get additional_specifications {
    return Intl.message(
      'Additional Specifications',
      name: 'additional_specifications',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Specifications`
  String get vehicle_specifications {
    return Intl.message(
      'Vehicle Specifications',
      name: 'vehicle_specifications',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Images`
  String get vehicle_image {
    return Intl.message(
      'Vehicle Images',
      name: 'vehicle_image',
      desc: '',
      args: [],
    );
  }

  /// `covenant`
  String get covenant {
    return Intl.message(
      'covenant',
      name: 'covenant',
      desc: '',
      args: [],
    );
  }

  /// `The damage`
  String get damage {
    return Intl.message(
      'The damage',
      name: 'damage',
      desc: '',
      args: [],
    );
  }

  /// `Add insurance`
  String get add_insurance {
    return Intl.message(
      'Add insurance',
      name: 'add_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance type`
  String get type_insurance {
    return Intl.message(
      'Insurance type',
      name: 'type_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Select insurance type`
  String get select_type_insurance {
    return Intl.message(
      'Select insurance type',
      name: 'select_type_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance number`
  String get number_insurance {
    return Intl.message(
      'Insurance number',
      name: 'number_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Write insurance number`
  String get write_number_insurance {
    return Intl.message(
      'Write insurance number',
      name: 'write_number_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance company name`
  String get company_name_insurance {
    return Intl.message(
      'Insurance company name',
      name: 'company_name_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Write insurance company name`
  String get write_company_name_insurance {
    return Intl.message(
      'Write insurance company name',
      name: 'write_company_name_insurance',
      desc: '',
      args: [],
    );
  }

  /// `EXP expiration date.`
  String get expire_date {
    return Intl.message(
      'EXP expiration date.',
      name: 'expire_date',
      desc: '',
      args: [],
    );
  }

  /// `Write EXP expiration date.`
  String get write_expire_date {
    return Intl.message(
      'Write EXP expiration date.',
      name: 'write_expire_date',
      desc: '',
      args: [],
    );
  }

  /// `Write the damage that occurred`
  String get write_damage {
    return Intl.message(
      'Write the damage that occurred',
      name: 'write_damage',
      desc: '',
      args: [],
    );
  }

  /// `insurance`
  String get insurance {
    return Intl.message(
      'insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `attachments`
  String get attachments {
    return Intl.message(
      'attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `Please upload an image or PDF file`
  String get please_upload_pdf_image {
    return Intl.message(
      'Please upload an image or PDF file',
      name: 'please_upload_pdf_image',
      desc: '',
      args: [],
    );
  }

  /// `Body Mass`
  String get body_mass {
    return Intl.message(
      'Body Mass',
      name: 'body_mass',
      desc: '',
      args: [],
    );
  }

  /// `Write Body Mass`
  String get write_body_mass {
    return Intl.message(
      'Write Body Mass',
      name: 'write_body_mass',
      desc: '',
      args: [],
    );
  }

  /// `Write the vehicle specifications here..`
  String get write_vehicle_specifications {
    return Intl.message(
      'Write the vehicle specifications here..',
      name: 'write_vehicle_specifications',
      desc: '',
      args: [],
    );
  }

  /// `Basic vehicle information`
  String get basic_vehicle_information {
    return Intl.message(
      'Basic vehicle information',
      name: 'basic_vehicle_information',
      desc: '',
      args: [],
    );
  }

  /// `License and plate information`
  String get license_and_plate_information {
    return Intl.message(
      'License and plate information',
      name: 'license_and_plate_information',
      desc: '',
      args: [],
    );
  }

  /// `Add vehicle`
  String get add_vehicle {
    return Intl.message(
      'Add vehicle',
      name: 'add_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Edit vehicle`
  String get edit_vehicle {
    return Intl.message(
      'Edit vehicle',
      name: 'edit_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Type License Number`
  String get type_license_number {
    return Intl.message(
      'Type License Number',
      name: 'type_license_number',
      desc: '',
      args: [],
    );
  }

  /// `Select vehicle type`
  String get select_vehicle_type {
    return Intl.message(
      'Select vehicle type',
      name: 'select_vehicle_type',
      desc: '',
      args: [],
    );
  }

  /// `Model name`
  String get model_name {
    return Intl.message(
      'Model name',
      name: 'model_name',
      desc: '',
      args: [],
    );
  }

  /// `Type model name`
  String get type_model_name {
    return Intl.message(
      'Type model name',
      name: 'type_model_name',
      desc: '',
      args: [],
    );
  }

  /// `Year Manufacture`
  String get year_manufacture {
    return Intl.message(
      'Year Manufacture',
      name: 'year_manufacture',
      desc: '',
      args: [],
    );
  }

  /// `Type year of manufacture`
  String get type_year_manufacture {
    return Intl.message(
      'Type year of manufacture',
      name: 'type_year_manufacture',
      desc: '',
      args: [],
    );
  }

  /// `Type the vehicle specifications here`
  String get type_vehicle_specifications_here {
    return Intl.message(
      'Type the vehicle specifications here',
      name: 'type_vehicle_specifications_here',
      desc: '',
      args: [],
    );
  }

  /// `Plate number`
  String get plate_number {
    return Intl.message(
      'Plate number',
      name: 'plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Type plate number`
  String get type_plate_number {
    return Intl.message(
      'Type plate number',
      name: 'type_plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle color`
  String get vehicle_color {
    return Intl.message(
      'Vehicle color',
      name: 'vehicle_color',
      desc: '',
      args: [],
    );
  }

  /// `Select vehicle color`
  String get select_vehicle_color {
    return Intl.message(
      'Select vehicle color',
      name: 'select_vehicle_color',
      desc: '',
      args: [],
    );
  }

  /// `License expiry date`
  String get license_expiry_date {
    return Intl.message(
      'License expiry date',
      name: 'license_expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `Select license expiry date`
  String get select_license_expiry_date {
    return Intl.message(
      'Select license expiry date',
      name: 'select_license_expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `Type covenant name`
  String get type_covenant_name {
    return Intl.message(
      'Type covenant name',
      name: 'type_covenant_name',
      desc: '',
      args: [],
    );
  }

  /// `Covenant description`
  String get covenant_desc {
    return Intl.message(
      'Covenant description',
      name: 'covenant_desc',
      desc: '',
      args: [],
    );
  }

  /// `Type covenant description`
  String get type_covenant_desc {
    return Intl.message(
      'Type covenant description',
      name: 'type_covenant_desc',
      desc: '',
      args: [],
    );
  }

  /// `Download image`
  String get download_image {
    return Intl.message(
      'Download image',
      name: 'download_image',
      desc: '',
      args: [],
    );
  }

  /// `Please select all images`
  String get please_select_all_images {
    return Intl.message(
      'Please select all images',
      name: 'please_select_all_images',
      desc: '',
      args: [],
    );
  }

  /// `Covenants`
  String get covenants {
    return Intl.message(
      'Covenants',
      name: 'covenants',
      desc: '',
      args: [],
    );
  }

  /// `Edit insurance`
  String get edit_insurance {
    return Intl.message(
      'Edit insurance',
      name: 'edit_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Attendance & departure notifications`
  String get attendance_and_departure_notifications {
    return Intl.message(
      'Attendance & departure notifications',
      name: 'attendance_and_departure_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Request type`
  String get type_request {
    return Intl.message(
      'Request type',
      name: 'type_request',
      desc: '',
      args: [],
    );
  }

  /// `Leave period`
  String get leave_period {
    return Intl.message(
      'Leave period',
      name: 'leave_period',
      desc: '',
      args: [],
    );
  }

  /// `clear`
  String get clear {
    return Intl.message(
      'clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Request status`
  String get status_request {
    return Intl.message(
      'Request status',
      name: 'status_request',
      desc: '',
      args: [],
    );
  }

  /// `Type the area name`
  String get type_area_name {
    return Intl.message(
      'Type the area name',
      name: 'type_area_name',
      desc: '',
      args: [],
    );
  }

  /// `Number of field survey hours`
  String get number_field_survey_hours {
    return Intl.message(
      'Number of field survey hours',
      name: 'number_field_survey_hours',
      desc: '',
      args: [],
    );
  }

  /// `Type the number hours`
  String get type_number_hours {
    return Intl.message(
      'Type the number hours',
      name: 'type_number_hours',
      desc: '',
      args: [],
    );
  }

  /// `Number of minutes`
  String get number_minutes {
    return Intl.message(
      'Number of minutes',
      name: 'number_minutes',
      desc: '',
      args: [],
    );
  }

  /// `Type the number of minutes`
  String get type_number_minutes {
    return Intl.message(
      'Type the number of minutes',
      name: 'type_number_minutes',
      desc: '',
      args: [],
    );
  }

  /// `Select vehicles`
  String get select_vehicles {
    return Intl.message(
      'Select vehicles',
      name: 'select_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Locate the area on the map`
  String get locate_area_map {
    return Intl.message(
      'Locate the area on the map',
      name: 'locate_area_map',
      desc: '',
      args: [],
    );
  }

  /// `Add data`
  String get add_data {
    return Intl.message(
      'Add data',
      name: 'add_data',
      desc: '',
      args: [],
    );
  }

  /// `Mark the area on the map`
  String get mark_box_map {
    return Intl.message(
      'Mark the area on the map',
      name: 'mark_box_map',
      desc: '',
      args: [],
    );
  }

  /// `You have to take some points into consideration when marking the box on the map`
  String get you_have_to_take_some_points_into_consideration_check_box {
    return Intl.message(
      'You have to take some points into consideration when marking the box on the map',
      name: 'you_have_to_take_some_points_into_consideration_check_box',
      desc: '',
      args: [],
    );
  }

  /// `Areas`
  String get areas {
    return Intl.message(
      'Areas',
      name: 'areas',
      desc: '',
      args: [],
    );
  }

  /// `Add area`
  String get add_area {
    return Intl.message(
      'Add area',
      name: 'add_area',
      desc: '',
      args: [],
    );
  }

  /// `View areas`
  String get view_areas {
    return Intl.message(
      'View areas',
      name: 'view_areas',
      desc: '',
      args: [],
    );
  }

  /// `Edit map`
  String get edit_map {
    return Intl.message(
      'Edit map',
      name: 'edit_map',
      desc: '',
      args: [],
    );
  }

  /// `Edit data`
  String get edit_data {
    return Intl.message(
      'Edit data',
      name: 'edit_data',
      desc: '',
      args: [],
    );
  }

  /// `Delete area`
  String get delete_area {
    return Intl.message(
      'Delete area',
      name: 'delete_area',
      desc: '',
      args: [],
    );
  }

  /// `Please select the area`
  String get please_select_area {
    return Intl.message(
      'Please select the area',
      name: 'please_select_area',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Save selection`
  String get save_selection {
    return Intl.message(
      'Save selection',
      name: 'save_selection',
      desc: '',
      args: [],
    );
  }

  /// `Add request`
  String get add_request {
    return Intl.message(
      'Add request',
      name: 'add_request',
      desc: '',
      args: [],
    );
  }

  /// `Power`
  String get power {
    return Intl.message(
      'Power',
      name: 'power',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get period {
    return Intl.message(
      'Period',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Total attendance`
  String get total_attendance {
    return Intl.message(
      'Total attendance',
      name: 'total_attendance',
      desc: '',
      args: [],
    );
  }

  /// `number of hours`
  String get number_hour {
    return Intl.message(
      'number of hours',
      name: 'number_hour',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'starting fingerprint' key

  // skipped getter for the 'ending fingerprint' key

  /// `No employees`
  String get no_employee {
    return Intl.message(
      'No employees',
      name: 'no_employee',
      desc: '',
      args: [],
    );
  }

  /// `Select the project name first to show you the employees`
  String get no_employee_decr {
    return Intl.message(
      'Select the project name first to show you the employees',
      name: 'no_employee_decr',
      desc: '',
      args: [],
    );
  }

  /// `Total contracting power`
  String get total_contracting_power {
    return Intl.message(
      'Total contracting power',
      name: 'total_contracting_power',
      desc: '',
      args: [],
    );
  }

  /// `data vehicles`
  String get data_vehicles {
    return Intl.message(
      'data vehicles',
      name: 'data_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `vehicle components`
  String get vehicle_components {
    return Intl.message(
      'vehicle components',
      name: 'vehicle_components',
      desc: '',
      args: [],
    );
  }

  /// `Violation name`
  String get violation_name {
    return Intl.message(
      'Violation name',
      name: 'violation_name',
      desc: '',
      args: [],
    );
  }

  /// `Violation name in Arabic`
  String get violation_name_ar {
    return Intl.message(
      'Violation name in Arabic',
      name: 'violation_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Violation name in English`
  String get violation_name_en {
    return Intl.message(
      'Violation name in English',
      name: 'violation_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Type the violation name in Arabic`
  String get type_violation_name_ar {
    return Intl.message(
      'Type the violation name in Arabic',
      name: 'type_violation_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Type the violation name in English`
  String get type_violation_name_en {
    return Intl.message(
      'Type the violation name in English',
      name: 'type_violation_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Violations types`
  String get violations_types {
    return Intl.message(
      'Violations types',
      name: 'violations_types',
      desc: '',
      args: [],
    );
  }

  /// `Add violation type`
  String get add_violation_type {
    return Intl.message(
      'Add violation type',
      name: 'add_violation_type',
      desc: '',
      args: [],
    );
  }

  /// `Edit violation type`
  String get edit_violation_type {
    return Intl.message(
      'Edit violation type',
      name: 'edit_violation_type',
      desc: '',
      args: [],
    );
  }

  /// `Select employee name`
  String get select_employee_name {
    return Intl.message(
      'Select employee name',
      name: 'select_employee_name',
      desc: '',
      args: [],
    );
  }

  /// `Add violation`
  String get add_violation {
    return Intl.message(
      'Add violation',
      name: 'add_violation',
      desc: '',
      args: [],
    );
  }

  /// `violation type`
  String get violation_type {
    return Intl.message(
      'violation type',
      name: 'violation_type',
      desc: '',
      args: [],
    );
  }

  /// `Edit violation`
  String get edit_violation {
    return Intl.message(
      'Edit violation',
      name: 'edit_violation',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Complete the receipt information`
  String get complete_receipt_information {
    return Intl.message(
      'Complete the receipt information',
      name: 'complete_receipt_information',
      desc: '',
      args: [],
    );
  }

  /// `Receiving employee`
  String get name_receipt {
    return Intl.message(
      'Receiving employee',
      name: 'name_receipt',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete received`
  String get incomplete_receipt {
    return Intl.message(
      'Incomplete received',
      name: 'incomplete_receipt',
      desc: '',
      args: [],
    );
  }

  /// `Complete received`
  String get complete_receipt {
    return Intl.message(
      'Complete received',
      name: 'complete_receipt',
      desc: '',
      args: [],
    );
  }

  /// `receive vehicle`
  String get receive_vehicle {
    return Intl.message(
      'receive vehicle',
      name: 'receive_vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Upload images to illustrate these notes`
  String get add_image {
    return Intl.message(
      'Upload images to illustrate these notes',
      name: 'add_image',
      desc: '',
      args: [],
    );
  }

  /// `Click (No) when there are no notes on the vehicle or (Yes) if it is not working or has notes with an explanation.`
  String get vehicle_note {
    return Intl.message(
      'Click (No) when there are no notes on the vehicle or (Yes) if it is not working or has notes with an explanation.',
      name: 'vehicle_note',
      desc: '',
      args: [],
    );
  }

  /// `Select violation name`
  String get select_violation_name {
    return Intl.message(
      'Select violation name',
      name: 'select_violation_name',
      desc: '',
      args: [],
    );
  }

  /// `Attendance and departure reports`
  String get attendance_and_departure_notifications_reports {
    return Intl.message(
      'Attendance and departure reports',
      name: 'attendance_and_departure_notifications_reports',
      desc: '',
      args: [],
    );
  }

  /// `Company \ factory name`
  String get company_or_factory_name {
    return Intl.message(
      'Company \\ factory name',
      name: 'company_or_factory_name',
      desc: '',
      args: [],
    );
  }

  /// `Street name`
  String get street_name {
    return Intl.message(
      'Street name',
      name: 'street_name',
      desc: '',
      args: [],
    );
  }

  /// `Type street name`
  String get type_street_name {
    return Intl.message(
      'Type street name',
      name: 'type_street_name',
      desc: '',
      args: [],
    );
  }

  /// `You can add more than one image to illustrate the violation.`
  String get add_violation_files_desc {
    return Intl.message(
      'You can add more than one image to illustrate the violation.',
      name: 'add_violation_files_desc',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `PDF`
  String get pdf {
    return Intl.message(
      'PDF',
      name: 'pdf',
      desc: '',
      args: [],
    );
  }

  /// `violations`
  String get violations {
    return Intl.message(
      'violations',
      name: 'violations',
      desc: '',
      args: [],
    );
  }

  /// `edit area`
  String get edit_area {
    return Intl.message(
      'edit area',
      name: 'edit_area',
      desc: '',
      args: [],
    );
  }

  /// `select area`
  String get select_map {
    return Intl.message(
      'select area',
      name: 'select_map',
      desc: '',
      args: [],
    );
  }

  /// `Edit area selection`
  String get edit_select_map {
    return Intl.message(
      'Edit area selection',
      name: 'edit_select_map',
      desc: '',
      args: [],
    );
  }

  /// `Search for the area you want.`
  String get search_by_area {
    return Intl.message(
      'Search for the area you want.',
      name: 'search_by_area',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR CODE to view vehicle data`
  String get scan_code_car {
    return Intl.message(
      'Scan the QR CODE to view vehicle data',
      name: 'scan_code_car',
      desc: '',
      args: [],
    );
  }

  /// `Upload image`
  String get upload_image {
    return Intl.message(
      'Upload image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Period from`
  String get period_from {
    return Intl.message(
      'Period from',
      name: 'period_from',
      desc: '',
      args: [],
    );
  }

  /// `Period to`
  String get period_to {
    return Intl.message(
      'Period to',
      name: 'period_to',
      desc: '',
      args: [],
    );
  }

  /// `Request Track Attendance and Departure`
  String get request_track_attendance_departure {
    return Intl.message(
      'Request Track Attendance and Departure',
      name: 'request_track_attendance_departure',
      desc: '',
      args: [],
    );
  }

  /// `View tracking requests`
  String get view_tracking_requests {
    return Intl.message(
      'View tracking requests',
      name: 'view_tracking_requests',
      desc: '',
      args: [],
    );
  }

  /// `Add tracking request`
  String get add_tracking_request {
    return Intl.message(
      'Add tracking request',
      name: 'add_tracking_request',
      desc: '',
      args: [],
    );
  }

  /// `Tracking period`
  String get tracking_period {
    return Intl.message(
      'Tracking period',
      name: 'tracking_period',
      desc: '',
      args: [],
    );
  }

  /// `Show Cashifter images`
  String get show_cashifter_images {
    return Intl.message(
      'Show Cashifter images',
      name: 'show_cashifter_images',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'total male' key

  // skipped getter for the 'total female' key

  /// `all city`
  String get all_city {
    return Intl.message(
      'all city',
      name: 'all_city',
      desc: '',
      args: [],
    );
  }

  /// `all  job`
  String get all_job {
    return Intl.message(
      'all  job',
      name: 'all_job',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get add_address {
    return Intl.message(
      'Add Address',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Cashifter attendance tracking`
  String get cashifter_attendance_tracking {
    return Intl.message(
      'Cashifter attendance tracking',
      name: 'cashifter_attendance_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Operating plan`
  String get operating_plan {
    return Intl.message(
      'Operating plan',
      name: 'operating_plan',
      desc: '',
      args: [],
    );
  }

  /// `Select operating plan`
  String get select_operating_plan {
    return Intl.message(
      'Select operating plan',
      name: 'select_operating_plan',
      desc: '',
      args: [],
    );
  }

  /// `Tour type`
  String get tour_type {
    return Intl.message(
      'Tour type',
      name: 'tour_type',
      desc: '',
      args: [],
    );
  }

  /// `Select tour type`
  String get select_tour_type {
    return Intl.message(
      'Select tour type',
      name: 'select_tour_type',
      desc: '',
      args: [],
    );
  }

  /// `Before starting the tour, you must select the type of tour in order to receive the vehicle.`
  String get start_tour_warning_msg {
    return Intl.message(
      'Before starting the tour, you must select the type of tour in order to receive the vehicle.',
      name: 'start_tour_warning_msg',
      desc: '',
      args: [],
    );
  }

  /// `Job duties`
  String get job_duties {
    return Intl.message(
      'Job duties',
      name: 'job_duties',
      desc: '',
      args: [],
    );
  }

  /// `End field survey`
  String get end_field_survey {
    return Intl.message(
      'End field survey',
      name: 'end_field_survey',
      desc: '',
      args: [],
    );
  }

  /// `End tour`
  String get end_tour {
    return Intl.message(
      'End tour',
      name: 'end_tour',
      desc: '',
      args: [],
    );
  }

  /// `Tour history`
  String get tour_history {
    return Intl.message(
      'Tour history',
      name: 'tour_history',
      desc: '',
      args: [],
    );
  }

  /// `Follow tours`
  String get follow_tours {
    return Intl.message(
      'Follow tours',
      name: 'follow_tours',
      desc: '',
      args: [],
    );
  }

  /// `Change operating plan`
  String get change_operating_plan {
    return Intl.message(
      'Change operating plan',
      name: 'change_operating_plan',
      desc: '',
      args: [],
    );
  }

  /// `Start tour`
  String get start_tour {
    return Intl.message(
      'Start tour',
      name: 'start_tour',
      desc: '',
      args: [],
    );
  }

  /// `Number of violations`
  String get violations_num {
    return Intl.message(
      'Number of violations',
      name: 'violations_num',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to complete the field survey?`
  String get end_field_survey_warning_msg {
    return Intl.message(
      'Are you sure you want to complete the field survey?',
      name: 'end_field_survey_warning_msg',
      desc: '',
      args: [],
    );
  }

  /// `Search for areas`
  String get search_for_areas {
    return Intl.message(
      'Search for areas',
      name: 'search_for_areas',
      desc: '',
      args: [],
    );
  }

  /// `Face print verification`
  String get cheek_face {
    return Intl.message(
      'Face print verification',
      name: 'cheek_face',
      desc: '',
      args: [],
    );
  }

  /// `Contractual power number`
  String get contractual_power_number {
    return Intl.message(
      'Contractual power number',
      name: 'contractual_power_number',
      desc: '',
      args: [],
    );
  }

  /// `list empty`
  String get list_empty {
    return Intl.message(
      'list empty',
      name: 'list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Fines discount`
  String get fines_discount {
    return Intl.message(
      'Fines discount',
      name: 'fines_discount',
      desc: '',
      args: [],
    );
  }

  /// `value due`
  String get value_due {
    return Intl.message(
      'value due',
      name: 'value_due',
      desc: '',
      args: [],
    );
  }

  /// `Discount on criminal record certificate`
  String get discount_criminal_certificate {
    return Intl.message(
      'Discount on criminal record certificate',
      name: 'discount_criminal_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Type the contractual power number`
  String get type_contractual_power_number {
    return Intl.message(
      'Type the contractual power number',
      name: 'type_contractual_power_number',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the options`
  String get please_add_all {
    return Intl.message(
      'Please complete the options',
      name: 'please_add_all',
      desc: '',
      args: [],
    );
  }

  /// `opportunity`
  String get opportunity {
    return Intl.message(
      'opportunity',
      name: 'opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Please save the yes selections`
  String get please_save_yes {
    return Intl.message(
      'Please save the yes selections',
      name: 'please_save_yes',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get please_fill_all_fields {
    return Intl.message(
      'Please fill in all fields',
      name: 'please_fill_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Job uniform`
  String get job_uniform {
    return Intl.message(
      'Job uniform',
      name: 'job_uniform',
      desc: '',
      args: [],
    );
  }

  /// `Upload a picture`
  String get upload_picture {
    return Intl.message(
      'Upload a picture',
      name: 'upload_picture',
      desc: '',
      args: [],
    );
  }

  /// `Add some notes`
  String get add_some_notes {
    return Intl.message(
      'Add some notes',
      name: 'add_some_notes',
      desc: '',
      args: [],
    );
  }

  /// `Add details to the image`
  String get add_details_image {
    return Intl.message(
      'Add details to the image',
      name: 'add_details_image',
      desc: '',
      args: [],
    );
  }

  /// `Select the job to choose the job uniform`
  String get select_job_choose_job_uniform {
    return Intl.message(
      'Select the job to choose the job uniform',
      name: 'select_job_choose_job_uniform',
      desc: '',
      args: [],
    );
  }

  /// `Add a photo`
  String get add_photo {
    return Intl.message(
      'Add a photo',
      name: 'add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number change requests`
  String get mobile_number_change_requests {
    return Intl.message(
      'Mobile number change requests',
      name: 'mobile_number_change_requests',
      desc: '',
      args: [],
    );
  }

  /// `New mobile number`
  String get new_mobile_number {
    return Intl.message(
      'New mobile number',
      name: 'new_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Show Cashifter data`
  String get show_cashifter_data {
    return Intl.message(
      'Show Cashifter data',
      name: 'show_cashifter_data',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure about the rejection?`
  String get user_request_reject_title {
    return Intl.message(
      'Are you sure about the rejection?',
      name: 'user_request_reject_title',
      desc: '',
      args: [],
    );
  }

  /// `If you reject the cashier request, you must write the reason.`
  String get user_request_reject_subtitle {
    return Intl.message(
      'If you reject the cashier request, you must write the reason.',
      name: 'user_request_reject_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you agree to change the cashier's mobile number?`
  String get user_request_accept_title {
    return Intl.message(
      'Are you sure you agree to change the cashier\'s mobile number?',
      name: 'user_request_accept_title',
      desc: '',
      args: [],
    );
  }

  /// `If you approve the cashier's request, the request will be moved to the approval list and the request will be transferred to the administration.`
  String get user_request_accept_subtitle_msg {
    return Intl.message(
      'If you approve the cashier\'s request, the request will be moved to the approval list and the request will be transferred to the administration.',
      name: 'user_request_accept_subtitle_msg',
      desc: '',
      args: [],
    );
  }

  /// `Cashifters Requests`
  String get cashifters_requests {
    return Intl.message(
      'Cashifters Requests',
      name: 'cashifters_requests',
      desc: '',
      args: [],
    );
  }

  /// `You must enter the new mobile number to send you the verification code to your mobile`
  String get add_mobile_new {
    return Intl.message(
      'You must enter the new mobile number to send you the verification code to your mobile',
      name: 'add_mobile_new',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get confirm_code {
    return Intl.message(
      'Verification code',
      name: 'confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `To verify that this is your mobile number, you must attach a file to prove that you own this number:`
  String get add_file_mobile {
    return Intl.message(
      'To verify that this is your mobile number, you must attach a file to prove that you own this number:',
      name: 'add_file_mobile',
      desc: '',
      args: [],
    );
  }

  /// `The verification code will be sent to the new mobile number, you must write it now`
  String get confirm_code_ms {
    return Intl.message(
      'The verification code will be sent to the new mobile number, you must write it now',
      name: 'confirm_code_ms',
      desc: '',
      args: [],
    );
  }

  /// `First you must agree to these commitments and read them carefully, after that we will send your request to the supervisor.`
  String get ok_teams_ms {
    return Intl.message(
      'First you must agree to these commitments and read them carefully, after that we will send your request to the supervisor.',
      name: 'ok_teams_ms',
      desc: '',
      args: [],
    );
  }

  /// `Your request will be submitted successfully!`
  String get will_send_request {
    return Intl.message(
      'Your request will be submitted successfully!',
      name: 'will_send_request',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I agree to these commitments.`
  String get confirm_yes {
    return Intl.message(
      'Yes, I agree to these commitments.',
      name: 'confirm_yes',
      desc: '',
      args: [],
    );
  }

  /// `Add gas stations`
  String get add_gas_stations {
    return Intl.message(
      'Add gas stations',
      name: 'add_gas_stations',
      desc: '',
      args: [],
    );
  }

  /// `Name of gas station in English`
  String get name_en_gas_stations {
    return Intl.message(
      'Name of gas station in English',
      name: 'name_en_gas_stations',
      desc: '',
      args: [],
    );
  }

  /// `Name of gas station`
  String get name_gas_stations {
    return Intl.message(
      'Name of gas station',
      name: 'name_gas_stations',
      desc: '',
      args: [],
    );
  }

  /// `Location of gas station on map`
  String get location_gas_stations {
    return Intl.message(
      'Location of gas station on map',
      name: 'location_gas_stations',
      desc: '',
      args: [],
    );
  }

  /// `Gas stations`
  String get gas_stations {
    return Intl.message(
      'Gas stations',
      name: 'gas_stations',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start_but {
    return Intl.message(
      'Start',
      name: 'start_but',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint type`
  String get fingerprint_type {
    return Intl.message(
      'Fingerprint type',
      name: 'fingerprint_type',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Not completed`
  String get not_completed {
    return Intl.message(
      'Not completed',
      name: 'not_completed',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to these commitments`
  String get please_confirm_yes {
    return Intl.message(
      'Please agree to these commitments',
      name: 'please_confirm_yes',
      desc: '',
      args: [],
    );
  }

  /// `Upon confirmation, this attachment will be moved to the (Rejected) list.`
  String get pledge_attachment_reject {
    return Intl.message(
      'Upon confirmation, this attachment will be moved to the (Rejected) list.',
      name: 'pledge_attachment_reject',
      desc: '',
      args: [],
    );
  }

  /// `If you are sure to reject the attachment, you must write the reason for rejection.`
  String get pledge_sub_reject {
    return Intl.message(
      'If you are sure to reject the attachment, you must write the reason for rejection.',
      name: 'pledge_sub_reject',
      desc: '',
      args: [],
    );
  }

  /// `Why do you want to reject this attachment?`
  String get pledge_title_reject {
    return Intl.message(
      'Why do you want to reject this attachment?',
      name: 'pledge_title_reject',
      desc: '',
      args: [],
    );
  }

  /// `I pledge that I have reviewed the original attachment and acknowledge that it is valid, and I bear legal responsibility if proven otherwise.`
  String get pledge_attachment_accept {
    return Intl.message(
      'I pledge that I have reviewed the original attachment and acknowledge that it is valid, and I bear legal responsibility if proven otherwise.',
      name: 'pledge_attachment_accept',
      desc: '',
      args: [],
    );
  }

  /// `You must confirm acceptance and acknowledge that you have reviewed the attachment and received the original.`
  String get pledge_sub_accept {
    return Intl.message(
      'You must confirm acceptance and acknowledge that you have reviewed the attachment and received the original.',
      name: 'pledge_sub_accept',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to accept this attachment?`
  String get pledge_title_accept {
    return Intl.message(
      'Are you sure to accept this attachment?',
      name: 'pledge_title_accept',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to the pledge.`
  String get please_agree_pledge {
    return Intl.message(
      'Please agree to the pledge.',
      name: 'please_agree_pledge',
      desc: '',
      args: [],
    );
  }

  /// `Model year`
  String get model_year {
    return Intl.message(
      'Model year',
      name: 'model_year',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end_but {
    return Intl.message(
      'End',
      name: 'end_but',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to go to Google Map application?`
  String get do_you_navigation_map {
    return Intl.message(
      'Do you want to go to Google Map application?',
      name: 'do_you_navigation_map',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle data`
  String get vehicle_data {
    return Intl.message(
      'Vehicle data',
      name: 'vehicle_data',
      desc: '',
      args: [],
    );
  }

  /// `Image before maintenance`
  String get image_before_maintenance {
    return Intl.message(
      'Image before maintenance',
      name: 'image_before_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Image after maintenance`
  String get image_after_maintenance {
    return Intl.message(
      'Image after maintenance',
      name: 'image_after_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Operation type`
  String get type_operation {
    return Intl.message(
      'Operation type',
      name: 'type_operation',
      desc: '',
      args: [],
    );
  }

  /// `View maintenance and faults`
  String get view_maintenance {
    return Intl.message(
      'View maintenance and faults',
      name: 'view_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance work`
  String get add_maintenance {
    return Intl.message(
      'Maintenance work',
      name: 'add_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance and Breakdowns`
  String get breakdown_maintenance {
    return Intl.message(
      'Maintenance and Breakdowns',
      name: 'breakdown_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Your action will be saved and sent to the project manager for review and response.`
  String get waring_action_notification {
    return Intl.message(
      'Your action will be saved and sent to the project manager for review and response.',
      name: 'waring_action_notification',
      desc: '',
      args: [],
    );
  }

  /// `It will be sent to the supervisor.`
  String get waring_final_action_notification {
    return Intl.message(
      'It will be sent to the supervisor.',
      name: 'waring_final_action_notification',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image before maintenance`
  String get shod_image_before_maintenance {
    return Intl.message(
      'Please select an image before maintenance',
      name: 'shod_image_before_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image after maintenance`
  String get shod_image_after_maintenance {
    return Intl.message(
      'Please select an image after maintenance',
      name: 'shod_image_after_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Driver violations`
  String get driver_violations {
    return Intl.message(
      'Driver violations',
      name: 'driver_violations',
      desc: '',
      args: [],
    );
  }

  /// `Speeding during the violation`
  String get speeding_during_violation {
    return Intl.message(
      'Speeding during the violation',
      name: 'speeding_during_violation',
      desc: '',
      args: [],
    );
  }

  /// `Click here to view the location of the violation`
  String get click_here_view_violation_location {
    return Intl.message(
      'Click here to view the location of the violation',
      name: 'click_here_view_violation_location',
      desc: '',
      args: [],
    );
  }

  /// `Violation time`
  String get violation_time {
    return Intl.message(
      'Violation time',
      name: 'violation_time',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle performance`
  String get vehicle_performance {
    return Intl.message(
      'Vehicle performance',
      name: 'vehicle_performance',
      desc: '',
      args: [],
    );
  }

  /// `Maximum recorded speed`
  String get maximum_recorded_speed {
    return Intl.message(
      'Maximum recorded speed',
      name: 'maximum_recorded_speed',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle path`
  String get vehicle_path {
    return Intl.message(
      'Vehicle path',
      name: 'vehicle_path',
      desc: '',
      args: [],
    );
  }

  /// `km/h`
  String get km_h {
    return Intl.message(
      'km/h',
      name: 'km_h',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `add breakdown`
  String get add_breakdown {
    return Intl.message(
      'add breakdown',
      name: 'add_breakdown',
      desc: '',
      args: [],
    );
  }

  /// `Receive vehicle details`
  String get receive_vehicle_details {
    return Intl.message(
      'Receive vehicle details',
      name: 'receive_vehicle_details',
      desc: '',
      args: [],
    );
  }

  /// `Write the action to be taken`
  String get write_action_to_be_taken {
    return Intl.message(
      'Write the action to be taken',
      name: 'write_action_to_be_taken',
      desc: '',
      args: [],
    );
  }

  /// `Go to the violation site`
  String get go_violation_site {
    return Intl.message(
      'Go to the violation site',
      name: 'go_violation_site',
      desc: '',
      args: [],
    );
  }

  /// `Download violation image`
  String get download_violation_image {
    return Intl.message(
      'Download violation image',
      name: 'download_violation_image',
      desc: '',
      args: [],
    );
  }

  /// `Camera name in Arabic`
  String get camera_name_ar {
    return Intl.message(
      'Camera name in Arabic',
      name: 'camera_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Type camera name in Arabic`
  String get type_camera_name_ar {
    return Intl.message(
      'Type camera name in Arabic',
      name: 'type_camera_name_ar',
      desc: '',
      args: [],
    );
  }

  /// `Camera name in English`
  String get camera_name_en {
    return Intl.message(
      'Camera name in English',
      name: 'camera_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Type camera name in English`
  String get type_camera_name_en {
    return Intl.message(
      'Type camera name in English',
      name: 'type_camera_name_en',
      desc: '',
      args: [],
    );
  }

  /// `Camera code`
  String get camera_code {
    return Intl.message(
      'Camera code',
      name: 'camera_code',
      desc: '',
      args: [],
    );
  }

  /// `Type camera code`
  String get type_camera_code {
    return Intl.message(
      'Type camera code',
      name: 'type_camera_code',
      desc: '',
      args: [],
    );
  }

  /// `Start video`
  String get start_video {
    return Intl.message(
      'Start video',
      name: 'start_video',
      desc: '',
      args: [],
    );
  }

  /// `Live feed`
  String get live_feed {
    return Intl.message(
      'Live feed',
      name: 'live_feed',
      desc: '',
      args: [],
    );
  }

  /// `Select video date`
  String get select_video_date {
    return Intl.message(
      'Select video date',
      name: 'select_video_date',
      desc: '',
      args: [],
    );
  }

  /// `Camera name`
  String get camera_name {
    return Intl.message(
      'Camera name',
      name: 'camera_name',
      desc: '',
      args: [],
    );
  }

  /// `Camera type`
  String get camera_type {
    return Intl.message(
      'Camera type',
      name: 'camera_type',
      desc: '',
      args: [],
    );
  }

  /// `Start live feed`
  String get start_live_feed {
    return Intl.message(
      'Start live feed',
      name: 'start_live_feed',
      desc: '',
      args: [],
    );
  }

  /// `Add camera`
  String get camera_add {
    return Intl.message(
      'Add camera',
      name: 'camera_add',
      desc: '',
      args: [],
    );
  }

  /// `Cameras`
  String get cameras {
    return Intl.message(
      'Cameras',
      name: 'cameras',
      desc: '',
      args: [],
    );
  }

  /// `View cameras`
  String get view_cameras {
    return Intl.message(
      'View cameras',
      name: 'view_cameras',
      desc: '',
      args: [],
    );
  }

  /// `Add camera`
  String get add_camera {
    return Intl.message(
      'Add camera',
      name: 'add_camera',
      desc: '',
      args: [],
    );
  }

  /// `Edit camera`
  String get edit_camera {
    return Intl.message(
      'Edit camera',
      name: 'edit_camera',
      desc: '',
      args: [],
    );
  }

  /// `Delete camera`
  String get delete_camera {
    return Intl.message(
      'Delete camera',
      name: 'delete_camera',
      desc: '',
      args: [],
    );
  }

  /// `Track vehicle on the map`
  String get track_vehicle_on_map {
    return Intl.message(
      'Track vehicle on the map',
      name: 'track_vehicle_on_map',
      desc: '',
      args: [],
    );
  }

  /// `driver name`
  String get driver_name {
    return Intl.message(
      'driver name',
      name: 'driver_name',
      desc: '',
      args: [],
    );
  }

  /// `Please select a date from and to`
  String get select_date_from_to {
    return Intl.message(
      'Please select a date from and to',
      name: 'select_date_from_to',
      desc: '',
      args: [],
    );
  }

  /// `play`
  String get play {
    return Intl.message(
      'play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `Position:`
  String get position {
    return Intl.message(
      'Position:',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Speed:`
  String get speed {
    return Intl.message(
      'Speed:',
      name: 'speed',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle camera code`
  String get vehicle_camera_code {
    return Intl.message(
      'Vehicle camera code',
      name: 'vehicle_camera_code',
      desc: '',
      args: [],
    );
  }

  /// `Edit date and time`
  String get edit_date_time {
    return Intl.message(
      'Edit date and time',
      name: 'edit_date_time',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Live streaming`
  String get live_streaming {
    return Intl.message(
      'Live streaming',
      name: 'live_streaming',
      desc: '',
      args: [],
    );
  }

  /// `Select camera`
  String get select_camera {
    return Intl.message(
      'Select camera',
      name: 'select_camera',
      desc: '',
      args: [],
    );
  }

  /// `Date from`
  String get date_from {
    return Intl.message(
      'Date from',
      name: 'date_from',
      desc: '',
      args: [],
    );
  }

  /// `Date to`
  String get date_to {
    return Intl.message(
      'Date to',
      name: 'date_to',
      desc: '',
      args: [],
    );
  }

  /// `video`
  String get video {
    return Intl.message(
      'video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `The date to must be greater than the date from`
  String get date_to_must_be_greater_than_date_from {
    return Intl.message(
      'The date to must be greater than the date from',
      name: 'date_to_must_be_greater_than_date_from',
      desc: '',
      args: [],
    );
  }

  /// `There are no videos yet`
  String get there_are_videos_yet {
    return Intl.message(
      'There are no videos yet',
      name: 'there_are_videos_yet',
      desc: '',
      args: [],
    );
  }

  /// `Please select the time and date you want the videos to be shown`
  String get videos_dates_validate_msg {
    return Intl.message(
      'Please select the time and date you want the videos to be shown',
      name: 'videos_dates_validate_msg',
      desc: '',
      args: [],
    );
  }

  /// `Select date and time`
  String get select_date_and_time {
    return Intl.message(
      'Select date and time',
      name: 'select_date_and_time',
      desc: '',
      args: [],
    );
  }

  /// `Drivers`
  String get drivers {
    return Intl.message(
      'Drivers',
      name: 'drivers',
      desc: '',
      args: [],
    );
  }

  /// `Maximum speed`
  String get maximum_speed {
    return Intl.message(
      'Maximum speed',
      name: 'maximum_speed',
      desc: '',
      args: [],
    );
  }

  /// `transactions`
  String get transactions {
    return Intl.message(
      'transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `view transactions`
  String get view_transactions {
    return Intl.message(
      'view transactions',
      name: 'view_transactions',
      desc: '',
      args: [],
    );
  }

  /// `add transactions`
  String get add_transactions {
    return Intl.message(
      'add transactions',
      name: 'add_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Completed Tasks`
  String get completed_tasks {
    return Intl.message(
      'Completed Tasks',
      name: 'completed_tasks',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message(
      'In Progress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `update transactions`
  String get update_transactions {
    return Intl.message(
      'update transactions',
      name: 'update_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get reschedule {
    return Intl.message(
      'Reschedule',
      name: 'reschedule',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Date`
  String get delivery_date {
    return Intl.message(
      'Delivery Date',
      name: 'delivery_date',
      desc: '',
      args: [],
    );
  }

  /// `Entity`
  String get entity {
    return Intl.message(
      'Entity',
      name: 'entity',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Violations of factory`
  String get violations_of_factory {
    return Intl.message(
      'Violations of factory',
      name: 'violations_of_factory',
      desc: '',
      args: [],
    );
  }

  /// `Violations of operation`
  String get violations_of_operation {
    return Intl.message(
      'Violations of operation',
      name: 'violations_of_operation',
      desc: '',
      args: [],
    );
  }

  /// `Face image is required to proceed`
  String get face_image_required_proceed {
    return Intl.message(
      'Face image is required to proceed',
      name: 'face_image_required_proceed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
