import '../../../data/models/links_self_meta_model.dart';

class FaqResponseModel {
  List<FaqItem>? list;
  Links? lLinks;
  Meta? mMeta;
  String? copyrighths;

  FaqResponseModel({this.list, this.lLinks, this.mMeta, this.copyrighths});

  FaqResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <FaqItem>[];
      json['list'].forEach((v) {
        list!.add(new FaqItem.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
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
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}

class FaqItem {
  int? id;
  String? title;
  String? description;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? createdById;
  bool? isExpanded;

  FaqItem(
      {this.id,
      this.title,
      this.description,
      this.stateId,
      this.typeId,
      this.createdOn,
      this.createdById,
      this.isExpanded = false});

  FaqItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
    isExpanded = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}
