class ChatDataModel {
  var id;
  var message;
  var users;
  var fromId;
  var fromName;
  var toId;
  var orderId;
  var readers;
  var groupId;
  var createdOn;
  var isRead;
  var stateId;
  var deletedBy;
  var fromUserProfileFile;
  var toUserProfileFile;
  var typeId;

  ChatDataModel(
      {this.id,
      this.message,
      this.users,
      this.fromId,
      this.fromName,
      this.toId,
      this.orderId,
      this.readers,
      this.groupId,
      this.createdOn,
      this.isRead,
      this.stateId,
      this.deletedBy,
      this.fromUserProfileFile,
      this.toUserProfileFile,
      this.typeId});

  ChatDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    users = json['users'];
    fromId = json['from_id'];
    fromName = json['from_name'];
    toId = json['to_id'];
    orderId = json['order_id'];
    readers = json['readers'];
    groupId = json['group_id'];
    createdOn = json['created_on'] != null
        ? DateTime.parse(json['created_on'] + 'Z').toLocal().toString()
        : null;
    isRead = json['is_read'];
    stateId = json['state_id'];
    deletedBy = json['deleted_by'];
    fromUserProfileFile = json['from_user_profile_file'];
    toUserProfileFile = json['to_user_profile_file'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['users'] = this.users;
    data['from_id'] = this.fromId;
    data['from_name'] = this.fromName;
    data['to_id'] = this.toId;
    data['order_id'] = this.orderId;
    data['readers'] = this.readers;
    data['group_id'] = this.groupId;
    data['created_on'] = this.createdOn;
    data['is_read'] = this.isRead;
    data['state_id'] = this.stateId;
    data['deleted_by'] = this.deletedBy;
    data['from_user_profile_file'] = this.fromUserProfileFile;
    data['to_user_profile_file'] = this.toUserProfileFile;
    data['type_id'] = this.typeId;
    return data;
  }
}
