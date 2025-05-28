class NotificationDataModel {
  int? id;
  String? title;
  var description;
  int? modelId;
  String? modelType;
  int? isRead;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? toUserId;
  int? createdById;
  String? fullName;
  String? imageFile;

  NotificationDataModel({this.id,
    this.title,
    this.description,
    this.modelId,
    this.modelType,
    this.isRead,
    this.stateId,
    this.typeId,
    this.createdOn,
    this.toUserId,
    this.createdById,
    this.fullName,
    this.imageFile});

  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    modelId = json['model_id'];
    modelType = json['model_type'];
    isRead = json['is_read'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'] != null
        ? DateTime.parse(json['created_on'] + 'Z').toLocal().toString()
        : null;
    toUserId = json['to_user_id'];
    createdById = json['created_by_id'];
    fullName = json['full_name'];
    imageFile = json['image_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['model_id'] = this.modelId;
    data['model_type'] = this.modelType;
    data['is_read'] = this.isRead;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['to_user_id'] = this.toUserId;
    data['created_by_id'] = this.createdById;
    data['full_name'] = this.fullName;
    data['image_file'] = this.imageFile;
    return data;
  }
}