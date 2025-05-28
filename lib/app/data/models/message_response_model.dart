

class MessageResponseModel {
  bool? success;
  String? message;
  String? copyrighths;
  String? dateCheck;

  MessageResponseModel({
    this.success,
    this.message,
    this.copyrighths,
    this.dateCheck,
  });

  MessageResponseModel.fromJson(Map json) {
    success = json['success'];
    message = json['message'];
    copyrighths = json['copyrighths'];
    dateCheck = json['datecheck'];
  }

  Map toJson() {
    final Map data = new Map();
    data['success'] = this.success;
    data['message'] = this.message;
    data['copyrighths'] = this.copyrighths;
    data['datecheck'] = this.dateCheck;
    return data;
  }
}
