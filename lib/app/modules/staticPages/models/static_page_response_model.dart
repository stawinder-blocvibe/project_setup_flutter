class StaticPageResponseModel {
  StaticPage? page;
  String? copyrighths;

  StaticPageResponseModel({this.page, this.copyrighths});

  StaticPageResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['details'] != null
        ? new StaticPage.fromJson(json['details'])
        : null;
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['details'] = this.page!.toJson();
    }
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}

class StaticPage {
  int? id;
  String? title;
  String? url;
  String? description;
  int? stateId;
  String? createdOn;
  String? updatedOn;
  int? createdById;

  StaticPage(
      {this.id,
      this.title,
      this.url,
      this.description,
      this.stateId,
      this.createdOn,
      this.updatedOn,
      this.createdById});

  StaticPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    description = json['description'];
    stateId = json['state_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['description'] = this.description;
    data['state_id'] = this.stateId;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}
