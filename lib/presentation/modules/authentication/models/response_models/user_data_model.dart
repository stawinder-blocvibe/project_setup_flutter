import 'package:base_project/app/export.dart';

import '../data_model/user_data_model.dart';

class UserResponseModel {
  String? token;
  UserDataModel? detail;
  String? message;
  String? copyrighths;

  UserResponseModel({this.token, this.detail, this.message, this.copyrighths});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? json['access-token'];
    detail = json['detail'] != null
        ? new UserDataModel.fromJson(json['detail'])
        : null;
    message = json['message'];
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['message'] = this.message;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
