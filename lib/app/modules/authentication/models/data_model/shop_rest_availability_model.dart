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
      return keyMonday.tr;
    case TUESDAY:
      return keyTuesday.tr;
    case WEDNESDAY:
      return keyWednesday.tr;
    case THURSDAY:
      return keyThursday.tr;
    case FRIDAY:
      return keyFriday.tr;
    case SATURDAY:
      return keySaturday.tr;
    case SUNDAY:
      return keySunday.tr;
    default:
      return '';
  }
}
