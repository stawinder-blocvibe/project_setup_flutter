import 'package:base_project/app/export.dart';

import '../dataModels/NotificationCell.dart';

class NotificationListResponseModel {
  List<NotificationCell>? data;
  Meta? meta;
  int? status;

  NotificationListResponseModel({this.data, this.meta, this.status});

  NotificationListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      data = <NotificationCell>[];
      json['list'].forEach((v) {
        data!.add(new NotificationCell.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
