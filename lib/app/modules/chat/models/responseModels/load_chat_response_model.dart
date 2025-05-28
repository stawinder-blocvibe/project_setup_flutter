import 'package:base_project/app/export.dart';

class LoadChatResponseModel {
  List<ChatDataModel>? chatMessages;
  Meta? mMeta;
  String? copyrights;

  LoadChatResponseModel({this.chatMessages, this.mMeta, this.copyrights});

  LoadChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['chat_messages'] != null) {
      chatMessages = <ChatDataModel>[];
      json['chat_messages'].forEach((v) {
        chatMessages!.add(new ChatDataModel.fromJson(v));
      });
    }
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
    copyrights = json['copyrights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatMessages != null) {
      data['chat_messages'] =
          this.chatMessages!.map((v) => v.toJson()).toList();
    }
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta!.toJson();
    }
    data['copyrights'] = this.copyrights;
    return data;
  }
}
