import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class Constants {
  static String fontFamily = 'Montserrat';
  static bool user = true;
  
  // static LatLng cairoLatLng = const LatLng(30.033333, 31.233334);
  static String locationCache = '';
  static String token = '';
  static bool tablet = false;
  static String unKnownValue = 'Un Known Value'.tr();
  static String notificationChannelKey = 'channel_id2';
  static LatLng saudiLatLng = const LatLng(24.7248316, 47.152177);

  // static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String fcmToken = '';
  static String currentLanguage = 'en';
  static String passwordApi = r'#as@$#$@as#';
  static Map jsonServerKey = {};
// static RemoteMessage? messageGlobal;
}

enum StatusRequest { completed, pending, canceled }

bool arabicLanguage = true;


class IconAndText {
  final String icon;
  final String text;

  IconAndText({required this.icon, required this.text});
}

List<DayAndMonth> weekDay = [
  DayAndMonth(day: 'السبت'.tr(), dayInMonth: '30'),
  DayAndMonth(day: 'الاحد'.tr(), dayInMonth: '01'),
  DayAndMonth(day: 'الاثنين'.tr(), dayInMonth: '02'),
  DayAndMonth(day: 'الثلاثاء'.tr(), dayInMonth: '03'),
  DayAndMonth(day: 'الاربعاء'.tr(), dayInMonth: '04'),
  DayAndMonth(day: 'الخميس'.tr(), dayInMonth: '05'),
  DayAndMonth(day: 'الجمعه'.tr(), dayInMonth: '06'),
];

class DayAndMonth {
  final String day;
  final String dayInMonth;

  DayAndMonth({required this.day, required this.dayInMonth});
}

// class TaskData {
//   final String? time;
//   final String? title;
//   final String? discription;
//   final String? taskType;

//   TaskData(
//       {required this.time,
//       required this.title,
//       required this.discription,
//       required this.taskType});
// }

// WHATSAPP  = '1'
// EMAIL  = '2'
// CALL = '3'
// MEETING = '4';
// PROJECT = '5';
enum ContactMethods { whatsapp, email, call, meeting, project }

enum Gender { male, female }
