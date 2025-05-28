

import 'package:base_project/app/export.dart';

String hourlyFormatter = 'hh:mm a';
String dayFormatter = "yyyy-MM-dd";
String dateMonthFormatter = "dd MMMM yyyy";
String dateMonthFormatter2 = "dd MMM yy";
String yearDayMonthFormatter = "yyyy/MM/dd";
String dayMonthYearFormatter = "dd/MM/yyyy";
String monthFormatter = "MMM";
String dateFormatter = "dd";
String monthDateYearFormatter = "MMM dd, yyyy";
String yearDayMonthTimeFormatter = "yyyy/MM/dd hh:mm:ss aa";

timeFormat(date) {
  return DateFormat(hourlyFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dateMonthFormat(date) {
  return DateFormat(dateMonthFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dateMonFormat(date) {
  return DateFormat(dateMonthFormatter2)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dayFormat(date) {
  return DateFormat(dayFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

yearDayMonthFormat(date) {
  return DateFormat(yearDayMonthFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dayMonthYearFormat(date) {
  return DateFormat(dayMonthYearFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

monthDateYearFormat(date) {
  return DateFormat(monthDateYearFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

monthFormat(date) {
  return DateFormat(monthFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

dateFormat(date) {
  return DateFormat(dateFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}

yearDayMonthTimeFormat(date) {
  return DateFormat(yearDayMonthTimeFormatter)
      .format(date != null ? DateTime.parse(date).toLocal() : DateTime.now());
}
