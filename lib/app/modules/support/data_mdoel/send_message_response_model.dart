
import 'message_data_model.dart';

class SendMessageResponseModel {
  MessageDataModel? detail;
  String? message;
  String? datecheck;
  String? copyrighths;

  SendMessageResponseModel(
      {this.detail, this.message, this.datecheck, this.copyrighths});

  SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    detail =
    json['detail'] != null ? new MessageDataModel.fromJson(json['detail']) : null;
    message = json['message'];
    datecheck = json['datecheck'];
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['message'] = this.message;
    data['datecheck'] = this.datecheck;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}

