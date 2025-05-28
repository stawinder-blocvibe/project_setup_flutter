class MessageDataModel {
  dynamic id;
  dynamic message;
  dynamic fromId;
  dynamic fromName;
  dynamic toName;
  dynamic toId;
  dynamic readers;
  dynamic requestId;
  dynamic createdOn;
  dynamic isRead;
  dynamic stateId;
  dynamic fromUserProfileFile;
  dynamic toUserProfileFile;
  bool? messageStatus;
  dynamic typeId;
  dynamic notifiedUsers;
  dynamic sendOn;

  MessageDataModel(
      {this.id,
        this.message,
        this.fromId,
        this.fromName,
        this.toName,
        this.toId,
        this.readers,
        this.requestId,
        this.createdOn,
        this.isRead,
        this.stateId,
        this.fromUserProfileFile,
        this.toUserProfileFile,
        this.messageStatus,
        this.typeId,
        this.notifiedUsers,
        this.sendOn});

  MessageDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    fromId = json['from_id'];
    fromName = json['from_name'];
    toName = json['to_name'];
    toId = json['to_id'];
    readers = json['readers'];
    requestId = json['request_id'];
    createdOn = json['created_on'];
    isRead = json['is_read'];
    stateId = json['state_id'];
    fromUserProfileFile = json['from_user_profile_file'];
    toUserProfileFile = json['to_user_profile_file'];
    messageStatus = json['message_status'];
    typeId = json['type_id'];
    notifiedUsers = json['notified_users'];
    sendOn = json['send_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['from_id'] = this.fromId;
    data['from_name'] = this.fromName;
    data['to_name'] = this.toName;
    data['to_id'] = this.toId;
    data['readers'] = this.readers;
    data['request_id'] = this.requestId;
    data['created_on'] = this.createdOn;
    data['is_read'] = this.isRead;
    data['state_id'] = this.stateId;
    data['from_user_profile_file'] = this.fromUserProfileFile;
    data['to_user_profile_file'] = this.toUserProfileFile;
    data['message_status'] = this.messageStatus;
    data['type_id'] = this.typeId;
    data['notified_users'] = this.notifiedUsers;
    data['send_on'] = this.sendOn;
    return data;
  }
}