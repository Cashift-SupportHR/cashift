import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class DateFormatter{
  static const TIME_STAMP="yyyy-MM-dd'T'HH:mm:ss" ;
  static const DAY_MONTH_YEAR ='dd/MM/yyyy' ;
  static const MONTH_DAY_YEAR ='MM/dd/yyyy' ;
  static const HOUR_MINUT_SEC ='HH:mm:ss' ;
  static const HOUR_MINUT ='HH:mm' ;
  static const HOUR_MINUT_12 =' hh:mm a' ;
  static const DATE_TIME ='dd/MM/yyyy HH:mm:ss' ;
  static const DATE_TIME_API ='MM/dd/yyyy HH:mm:ss' ;
  static const DATE_TIME_UI ='EEE ,d MMM  yyyy , hh:mm a' ;
  static const DATE_TIME_UI_2 ='d MMM  yyyy , hh:mm a' ;
  static const DATE_TIME_UI_3 ='d MMM , hh:mm a' ;
  static const WORKING_DATE_TIME_UI ='dd-MM-yyyy HH:mm a' ;
  static const DATE_TIME_UI_HOUR_MINUT_12 ='dd/MM/yyyy h:mm a' ;
  static const  DATE_TIME_UIF ="MM/dd/yyyy HH:mm" ;
  static const DATE_UI ='EEE ,d MMM  yyyy ' ;
  static const MONTH_NAME_YEAR ='MMM yyyy ' ;
  static const TIME_UI ='hh:mm' ;
  static const DATE_Api_DD_MM_YYYY ='dd-MM-yyyy' ;
  static const DATE_D_MMM_YYYY ='d MMM yyyy';

  static String monthNameYear(DateTime date){
    return formatDate(date, MONTH_NAME_YEAR);
  }

  static String getCurrentDate({String ?local , String  ? pattern}) {
    /* final hDate = HijriCalendar.now();
    return hDate.toFormat('${hDate.dayWeName} , dd MMMM  yyyy هـ');*/
    final now = DateTime.now();
    return DateFormatter.formatDate(now, pattern??DateFormatter.DATE_UI, local: local);
  }


 static String formatDate(DateTime dateTime ,String pattern , {String  ?   local }){
   final langCode = local ?? Get.locale?.languageCode;
   try {
     return DateFormat(pattern, langCode).format(dateTime);
   }catch(e){
     return '' ;
   }
  }

  static String repairRequestApiDate(DateTime date ){
    try {
      return formatDate(date, DAY_MONTH_YEAR,local: 'en');
    }catch(e){
      return '';
    }
  }

  static String repairRequestApiDateTime(DateTime date ){
    try {
      return formatDate(date, TIME_STAMP,local: 'en');
    }catch(e){
      return '';
    }
  }

  static String formatDateString(date , String pattern ,String newPattern ,{String ? local }){
    final langCode =local ?? Get.locale?.languageCode;

    DateTime tempDate = DateFormat(pattern).parse(date);
    String newDate = DateFormat(newPattern, langCode).format(tempDate);
    return newDate;

  }

  static String repairApiDate(String date, {String? apiPattern, String? pattern,
    String ? local
  }){
   try {
     return formatDateString(date, apiPattern ?? DAY_MONTH_YEAR, pattern ?? DATE_UI, local: local);
   }catch(e){
     return '';
   }
  }
  static String repairApiDateTime(String date,{String ? pattern , String ? apiPattern, String ? local} ){
   try {
     return formatDateString(date, apiPattern??TIME_STAMP, pattern ??DATE_TIME_UI, local: local);
   }catch(e){
     print('repairApiDateTime $e');
     return '';
   }
 }
  static String formatTimeStamp(String date,{String ? pattern , String ? apiPattern, String local = 'en'} ){
    try {
      return formatDateString(date, apiPattern??DAY_MONTH_YEAR, pattern ??TIME_STAMP, local: local);
    }catch(e){
      print('formatTimeStamp $e');
      return '';
    }
  }
 static String timeStampToTime(String date){
   try {
     return formatDateString(date, TIME_STAMP, TIME_UI);
   }catch(e){
     return '';
   }
 }
  static DateTime dateFromString(date , {String pattern = DATE_TIME, String ? local}){
    DateTime tempDate = DateFormat(pattern, local).parse(date);
    return tempDate;
  }
  static DateTime dateFromTimeStamp(date){
    return dateFromString(date, pattern: TIME_STAMP);
  }


  static int differenceTwoDatesByHours(DateTime start , DateTime end){
   DateTime date = DateTime(start.year, start.month, start.day, start.hour, start.minute, start.second);
   final difference = date.difference(end).inHours;
   print('difference ${difference.toString()}');
   return difference.abs();
  }
  static int differenceTwoDatesByMinutes(DateTime start , DateTime end){
   final milliSec = end.millisecond-start.millisecond;
   var sec = milliSec/1000;
   var minute = sec/60;
   return minute .toInt();
  }
  static int differenceNowByMinutes(DateTime start ){
    DateTime end = DateTime.now();
   final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
   var sec = milliSec/1000;
   var minute = sec/60;
   return minute .toInt();
  }
  static int differenceTwoDatesBySeconds(DateTime start , DateTime end){
    final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
    var sec = milliSec/1000;
    return sec.toInt();
  }
  static int differenceNowBySecond(DateTime start ){
    DateTime end = DateTime.now();
   final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
   var sec = milliSec/1000;
   print('differenceNowBySecond ${sec.toInt()}');
   return sec.toInt();
  }
  // By Harbey
  static String formatDateStringNoPattern(String dateTime, {String  ?   local, String? pattern}){
    final langCode =local ?? Get.locale?.languageCode;
    try {
      return DateFormat(pattern ?? DAY_MONTH_YEAR, langCode).format(DateTime.parse(dateTime));
    }catch(e){
      return '' ;
    }
  }
  static String formatDateStringNoLangCode(String dateTime, {String  ?   local, String? pattern}){
    try {
      return DateFormat(pattern ?? DAY_MONTH_YEAR).format(DateTime.parse(dateTime));
    }catch(e){
      print('formatDateStringNoLangCode $e');
      return '' ;
    }
  }
  static int differenceStartDateNowBySecond(DateTime end ){
    DateTime start = DateTime.now();
    final milliSec = end.millisecondsSinceEpoch-start.millisecondsSinceEpoch;
    var sec = milliSec/1000;
    print('differenceNowBySecond ${sec.toInt()}');
    return sec.toInt();
  }
  static String repairApiTime(String date,{String ? pattern, String ? apiPattern} ){
    try {
      print('repairApiTime $date');
      return formatDateString(date, apiPattern??HOUR_MINUT_SEC, pattern ??HOUR_MINUT_12);
    }catch(e){
      return '';
    }
  }

  static Duration differenceTwoDates(DateTime start , DateTime end){
    DateTime date = DateTime(start.year, start.month, start.day, start.hour, start.minute, start.second);
    final difference = date.difference(end);
    print('difference ${difference.toString()}');
    return difference;
  }


  static String repairApiTimeUI(String date,{String ? pattern, String ? apiPattern} ){
    try {
      return formatDateString(date, pattern ?? HOUR_MINUT, pattern ??HOUR_MINUT_12);
    }catch(e){
      return '';
    }
  }
  static int convertDateToMilliSeconds(String date){
    try {
      return dateFromTimeStamp(date).millisecondsSinceEpoch;
    } on Exception {
      return 0;
    }
  }

  static String repairApiTimeStamp(String date,{String ? pattern, String ? apiPattern} ){
    try {
      print('repairApiTime $date');
      return formatDateString(date, apiPattern??TIME_STAMP, pattern ??HOUR_MINUT_12);
    }catch(e){
      return '';
    }
  }

  static TimeOfDay parseTimeOfDay(String time) {
  //  print('parseTimeOfDay $time');
    try {
      TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.parse('1970-01-01 $time'));;
      return timeOfDay;
    }catch(e){
  //    print('parseTimeOfDayError $e');
      return TimeOfDay.now();
    }
  }



  static DateTime parseDateAndTimeOfDay(String date, {String? pattern}) {
    //  print('parseTimeOfDay $time');
    try {
      // Convert Arabic AM/PM → English AM/PM
      date = date
          .replaceAll('ص', 'AM')
          .replaceAll('م', 'PM').replaceAll('  ', ' ');
      print('parseDateAndTimeOfDay $date');
      return  DateFormat('dd/M/yyyy hh:mm a').parse(date);
    } catch(e){
      print('parseTimeOfDayError $e');
      return DateTime.now();
    }
  }

  static String plusOneMinute(String date) {
    try {
      // 1. Parse your string into a DateTime
      final original = DateTime.parse(date);

      // 2. Add one minute
      final plusOneMinute = original.add(const Duration(minutes: 1));
      return plusOneMinute.toIso8601String();
    } catch (e) {
      print('formatDateTimeError $e');
      return '';
    }
  }
}