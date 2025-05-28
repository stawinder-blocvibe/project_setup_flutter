import '../../../data/models/links_self_meta_model.dart';
import 'message_data_model.dart';

class LoadChatResponseModel {
  List<MessageDataModel>? list;
  String? datecheck;
  Links? lLinks;
  Meta? mMeta;
  String? copyrighths;

  LoadChatResponseModel({
    this.list,
    this.datecheck,
    this.copyrighths,
    this.lLinks,
    this.mMeta,
  });

  LoadChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <MessageDataModel>[];
      json['list'].forEach((v) {
        list!.add(new MessageDataModel.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
    datecheck = json['datecheck'];
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta!.toJson();
    }
    data['datecheck'] = this.datecheck;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
