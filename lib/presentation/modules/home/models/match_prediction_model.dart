class MatchPredictionModel {
  MatchPredictionModel({
      this.id, 
      this.userId, 
      this.matchId, 
      this.poolId, 
      this.compitionType, 
      this.overPrediction,});

  MatchPredictionModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    matchId = json['matchId'];
    poolId = json['poolId'];
    compitionType = json['compitionType'];
    overPrediction = json['overPrediction'] != null ? OverPrediction.fromJson(json['overPrediction']) : null;
  }
  String? id;
  String? userId;
  String? matchId;
  String? poolId;
  String? compitionType;
  OverPrediction? overPrediction;
MatchPredictionModel copyWith({  String? id,
  String? userId,
  String? matchId,
  String? poolId,
  String? compitionType,
  OverPrediction? overPrediction,
}) => MatchPredictionModel(  id: id ?? this.id,
  userId: userId ?? this.userId,
  matchId: matchId ?? this.matchId,
  poolId: poolId ?? this.poolId,
  compitionType: compitionType ?? this.compitionType,
  overPrediction: overPrediction ?? this.overPrediction,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['matchId'] = matchId;
    map['poolId'] = poolId;
    map['compitionType'] = compitionType;
    if (overPrediction != null) {
      map['overPrediction'] = overPrediction?.toJson();
    }
    return map;
  }

}

class OverPrediction {
  OverPrediction({
      this.innings,});

  OverPrediction.fromJson(dynamic json) {
    if (json['innings'] != null) {
      innings = [];
      json['innings'].forEach((v) {
        innings?.add(Innings.fromJson(v));
      });
    }
  }
  List<Innings>? innings;
OverPrediction copyWith({  List<Innings>? innings,
}) => OverPrediction(  innings: innings ?? this.innings,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (innings != null) {
      map['innings'] = innings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Innings {
  Innings({
      this.inning, 
      this.overs,});

  Innings.fromJson(dynamic json) {
    inning = json['inning'];
    if (json['overs'] != null) {
      overs = [];
      json['overs'].forEach((v) {
        overs?.add(Overs.fromJson(v));
      });
    }
  }
  int? inning;
  List<Overs>? overs;
Innings copyWith({  int? inning,
  List<Overs>? overs,
}) => Innings(  inning: inning ?? this.inning,
  overs: overs ?? this.overs,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['inning'] = inning;
    if (overs != null) {
      map['overs'] = overs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Overs {
  Overs({
      this.over, 
      this.input,});

  Overs.fromJson(dynamic json) {
    over = json['over'];
    input = json['Input'] != null ? json['Input'].cast<String>() : [];
  }
  int? over;
  List<String>? input;
Overs copyWith({  int? over,
  List<String>? input,
}) => Overs(  over: over ?? this.over,
  input: input ?? this.input,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['over'] = over;
    map['Input'] = input;
    return map;
  }

}