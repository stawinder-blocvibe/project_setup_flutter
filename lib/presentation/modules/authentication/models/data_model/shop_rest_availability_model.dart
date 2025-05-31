import 'package:base_project/app/export.dart';

class SetAvailabilityModel {
  dynamic id;
  dynamic day;
  dynamic openingTime;
  dynamic closingTime;
  dynamic isAdded;

  SetAvailabilityModel({
    this.id,
    this.day,
    this.openingTime = '',
    this.closingTime = '',
    this.isAdded,
  });

  Map toJson() => {
        "day_id": id,
        "start_time": openingTime,
        'end_time': closingTime,
      };

  SetAvailabilityModel.fromJson(Map<String, dynamic> json) {
    id = json['day_id'];
    day = getDayName(json['day_id']);
    openingTime = json['start_time'] ?? '';
    closingTime = json['end_time'] ?? '';

    isAdded = openingTime != '' && closingTime != '' ? true : false;
  }
}

String getDayName(int dayId) {
  switch (dayId) {
    case MONDAY:
      return "Monday".tr;
    case TUESDAY:
      return "Tuesday".tr;
    case WEDNESDAY:
      return "Wednesday".tr;
    case THURSDAY:
      return "Thursday".tr;
    case FRIDAY:
      return "Friday".tr;
    case SATURDAY:
      return "Saturday".tr;
    case SUNDAY:
      return "Sunday".tr;
    default:
      return '';
  }
}
