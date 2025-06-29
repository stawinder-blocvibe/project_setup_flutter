class TransactionModel {
  TransactionModel({
      this.id, 
      this.userId, 
      this.amount, 
      this.type, 
      this.createdAt, 
      this.gatewayTransectionId, 
      this.matchId, 
      this.poolId, 
      this.user,});

  TransactionModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    type = json['type'];
    createdAt = json['createdAt'];
    gatewayTransectionId = json['gatewayTransectionId'];
    matchId = json['matchId'];
    poolId = json['poolId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? userId;
  int? amount;
  String? type;
  String? createdAt;
  dynamic gatewayTransectionId;
  String? matchId;
  dynamic poolId;
  User? user;
TransactionModel copyWith({  String? id,
  String? userId,
  int? amount,
  String? type,
  String? createdAt,
  dynamic gatewayTransectionId,
  String? matchId,
  dynamic poolId,
  User? user,
}) => TransactionModel(  id: id ?? this.id,
  userId: userId ?? this.userId,
  amount: amount ?? this.amount,
  type: type ?? this.type,
  createdAt: createdAt ?? this.createdAt,
  gatewayTransectionId: gatewayTransectionId ?? this.gatewayTransectionId,
  matchId: matchId ?? this.matchId,
  poolId: poolId ?? this.poolId,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['amount'] = amount;
    map['type'] = type;
    map['createdAt'] = createdAt;
    map['gatewayTransectionId'] = gatewayTransectionId;
    map['matchId'] = matchId;
    map['poolId'] = poolId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.fullName, 
      this.mobileNumber, 
      this.email,});

  User.fromJson(dynamic json) {
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
  }
  dynamic fullName;
  String? mobileNumber;
  dynamic email;
User copyWith({  dynamic fullName,
  String? mobileNumber,
  dynamic email,
}) => User(  fullName: fullName ?? this.fullName,
  mobileNumber: mobileNumber ?? this.mobileNumber,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    return map;
  }

}