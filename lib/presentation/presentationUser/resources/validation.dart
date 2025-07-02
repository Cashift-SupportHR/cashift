import 'package:flutter/cupertino.dart';
import 'package:shiftapp/core/extensions/extensions.dart';

class Validation {
  static String IBANregex1 = r"/^AL\d{10}[0-9A-Z]{16}$|^AD\d{10}[0-9A-Z]{12}$|^AT\d{18}$|^BH\d{2}[A-Z]{4}[0-9A-Z]{14}$|^BE\d{14}$|^BA\d{18}$|^BG\d{2}[A-Z]{4}\d{6}[0-9A-Z]{8}$|^HR\d{19}$|^CY\d{10}[0-9A-Z]{16}$|^CZ\d{22}$|^DK\d{16}$|^FO\d{16}$|^GL\d{16}$|^DO\d{2}[0-9A-Z]{4}\d{20}$|^EE\d{18}$|^FI\d{16}$|^FR\d{12}[0-9A-Z]{11}\d{2}$|^GE\d{2}[A-Z]{2}\d{16}$|^DE\d{20}$|^GI\d{2}[A-Z]{4}[0-9A-Z]{15}$|^GR\d{9}[0-9A-Z]{16}$|^HU\d{26}$|^IS\d{24}$|^IE\d{2}[A-Z]{4}\d{14}$|^IL\d{21}$|^IT\d{2}[A-Z]\d{10}[0-9A-Z]{12}$|^[A-Z]{2}\d{5}[0-9A-Z]{13}$|^KW\d{2}[A-Z]{4}22!$|^LV\d{2}[A-Z]{4}[0-9A-Z]{13}$|^LB\d{6}[0-9A-Z]{20}$|^LI\d{7}[0-9A-Z]{12}$|^LT\d{18}$|^LU\d{5}[0-9A-Z]{13}$|^MK\d{5}[0-9A-Z]{10}\d{2}$|^MT\d{2}[A-Z]{4}\d{5}[0-9A-Z]{18}$|^MR13\d{23}$|^MU\d{2}[A-Z]{4}\d{19}[A-Z]{3}$|^MC\d{12}[0-9A-Z]{11}\d{2}$|^ME\d{20}$|^NL\d{2}[A-Z]{4}\d{10}$|^NO\d{13}$|^PL\d{10}[0-9A-Z]{,16}n$|^PT\d{23}$|^RO\d{2}[A-Z]{4}[0-9A-Z]{16}$|^SM\d{2}[A-Z]\d{10}[0-9A-Z]{12}$|^SA\d{4}[0-9A-Z]{18}$|^RS\d{20}$|^SK\d{22}$|^SI\d{17}$|^ES\d{22}$|^SE\d{22}$|^CH\d{7}[0-9A-Z]{12}$|^TN59\d{20}$|^TR\d{7}[0-9A-Z]{17}$|^AE\d{21}$|^GB\d{2}[A-Z]{4}\d{14}$/";
      static bool isValidPhone(String phone) =>
      RegExp("^(5|05)(\\d{8})\$").hasMatch(phone);

  static bool validIban(String value) =>
      RegExp(IBANregex1).hasMatch(value);

  static bool isArabicLetters(String name) =>
      RegExp("^[\u0621-\u064A\\s]+\$").hasMatch(name);

  static bool isArabicLettersWithNumbers(String name) =>
      RegExp("^[\u0621-\u064A\\s0-9\\W]+\$").hasMatch(name);

  static bool isEnglishLetters(String name) =>
      RegExp("^[a-zA-Z\\s]+\$").hasMatch(name);

  // English Letters With Numbers with any character
  static bool isEnglishLettersWithNumbers(String name) => RegExp("^[a-zA-Z0-9\\s]+\$").hasMatch(name);


  static bool isValidFullName(String name) =>
      RegExp("^[\u0621-\u064a\\s]{3,}(?: [\u0621-\u064a\\s]+){2}\$")
          .hasMatch(name);

  static bool isValidIDNumber(String id) =>
      RegExp("^[1-2][0-9]{1,10}\$").hasMatch(id);

  static bool isEmailValid(String email) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static String? validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  // enter Full Name validation
  static bool isFullName(String value) {
    List words = value.split(' ');
    words.removeWhere((word) => word == '');
    bool  _nameIsValid = words.length >= 3 &&
        !words.any((word) => word.contains('  '));
    return _nameIsValid;
  }

  static validateArabicText(BuildContext context, String? value) {
    if (value.isNullOrEmpty()) {
      return context.getStrings().this_field_is_required;
    } else if (!Validation.isArabicLettersWithNumbers(value ?? '')) {
      return context.getStrings().must_be_arabic_letters;
    }
    return null;
  }

  static validateEnglishText(BuildContext context, String? value) {
    if (value.isNullOrEmpty()) {
      return context.getStrings().this_field_is_required;
    } else if (!Validation.isEnglishLettersWithNumbers(value ?? '')) {
      return context.getStrings().must_be_english_letters;
    }
    return null;
  }
}
