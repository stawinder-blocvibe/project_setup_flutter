class PoolModel {
  PoolModel({
      this.poolId, 
      this.maxParticipants, 
      this.participantsId, 
      this.joiningPrice, 
      this.winningPrice, 
      this.type, 
      this.matchId,});

  PoolModel.fromJson(dynamic json) {
    poolId = json['poolId'];
    maxParticipants = json['max_participants'];
    if (json['participantsId'] != null) {
      participantsId = [];
      json['participantsId'].forEach((v) {
        // participantsId?.add(Dynamic.fromJson(v));
      });
    }
    joiningPrice = json['joining_price'];
    winningPrice = json['winning_price'];
    type = json['type'];
    matchId = json['matchId'];
  }
  String? poolId;
  int? maxParticipants;
  List<dynamic>? participantsId;
  int? joiningPrice;
  int? winningPrice;
  String? type;
  String? matchId;
PoolModel copyWith({  String? poolId,
  int? maxParticipants,
  List<dynamic>? participantsId,
  int? joiningPrice,
  int? winningPrice,
  String? type,
  String? matchId,
}) => PoolModel(  poolId: poolId ?? this.poolId,
  maxParticipants: maxParticipants ?? this.maxParticipants,
  participantsId: participantsId ?? this.participantsId,
  joiningPrice: joiningPrice ?? this.joiningPrice,
  winningPrice: winningPrice ?? this.winningPrice,
  type: type ?? this.type,
  matchId: matchId ?? this.matchId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['poolId'] = poolId;
    map['max_participants'] = maxParticipants;
    if (participantsId != null) {
      map['participantsId'] = participantsId?.map((v) => v.toJson()).toList();
    }
    map['joining_price'] = joiningPrice;
    map['winning_price'] = winningPrice;
    map['type'] = type;
    map['matchId'] = matchId;
    return map;
  }

}