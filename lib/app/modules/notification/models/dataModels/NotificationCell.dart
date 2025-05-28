class NotificationCell {
  NotificationCell({
    // this.controller,
    // this.action,
    // this.message,
    // this.userId,
    this.id,
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
    this.imageFile,
  });

  NotificationCell.fromJson(dynamic json) {
    // controller = json['controller'];
    // action = json['action'];
    // message = json['message'];
    // userId = json['user_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    modelId = json['model_id'];
    modelType = json['model_type'];
    isRead = json['is_read'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    toUserId = json['to_user_id'];
    createdById = json['created_by_id'];
    fullName = json['full_name'];
    imageFile = json['image_file'];
  }
  // String? controller;
  // String? action;
  // String? message;
  // String? userId;
  String? id;
  String? title;
  String? description;
  String? modelId;
  String? modelType;
  String? isRead;
  String? stateId;
  String? typeId;
  String? createdOn;
  String? toUserId;
  String? createdById;
  String? fullName;
  String? imageFile;
  NotificationCell copyWith({
    // String? controller,
    // String? action,
    // String? message,
    // String? userId,
    String? id,
    String? title,
    String? description,
    String? modelId,
    String? modelType,
    String? isRead,
    String? stateId,
    String? typeId,
    String? createdOn,
    String? toUserId,
    String? createdById,
    String? fullName,
    String? imageFile,
  }) =>
      NotificationCell(
        // controller: controller ?? this.controller,
        // action: action ?? this.action,
        // message: message ?? this.message,
        // userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        modelId: modelId ?? this.modelId,
        modelType: modelType ?? this.modelType,
        isRead: isRead ?? this.isRead,
        stateId: stateId ?? this.stateId,
        typeId: typeId ?? this.typeId,
        createdOn: createdOn ?? this.createdOn,
        toUserId: toUserId ?? this.toUserId,
        createdById: createdById ?? this.createdById,
        fullName: fullName ?? this.fullName,
        imageFile: imageFile ?? this.imageFile,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['controller'] = controller;
    // map['action'] = action;
    // map['message'] = message;
    // map['user_id'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['model_id'] = modelId;
    map['model_type'] = modelType;
    map['is_read'] = isRead;
    map['state_id'] = stateId;
    map['type_id'] = typeId;
    map['created_on'] = createdOn;
    map['to_user_id'] = toUserId;
    map['created_by_id'] = createdById;
    map['image_file'] = imageFile;
    map['full_name'] = fullName;
    return map;
  }
}
