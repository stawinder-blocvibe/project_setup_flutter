class SavePredictionModel {
  SavePredictionModel({
      this.innings,});

  SavePredictionModel.fromJson(dynamic json) {
    if (json['innings'] != null) {
      innings = [];
      json['innings'].forEach((v) {
        innings?.add(Innings.fromJson(v));
      });
    }
  }
  List<Innings>? innings;
SavePredictionModel copyWith({  List<Innings>? innings,
}) => SavePredictionModel(  innings: innings ?? this.innings,
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
    input = json['Input'] != null ? json['Input'].cast<dynamic>() : [];
  }
  int? over;
  List<dynamic>? input;
Overs copyWith({  int? over,
  List<dynamic>? input,
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