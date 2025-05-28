import 'message_data_model.dart';

class LoadNewChatResponseModel {
  List<MessageDataModel>? list;
  String? datecheck;
  String? copyrighths;

  LoadNewChatResponseModel({
    this.list,
    this.datecheck,
    this.copyrighths,
  });

  LoadNewChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <MessageDataModel>[];
      json['list'].forEach((v) {
        list!.add(new MessageDataModel.fromJson(v));
      });
    }
    datecheck = json['datecheck'];
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['datecheck'] = this.datecheck;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
