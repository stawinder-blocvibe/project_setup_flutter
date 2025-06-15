class MyMatchModel {
  MyMatchModel({
      this.matchId, 
      this.externalMatchId, 
      this.teamAName, 
      this.teamBName, 
      this.teamAAbbr, 
      this.teamBAbbr, 
      this.teamALogoUrl, 
      this.teamBLogoUrl, 
      this.type, 
      this.title, 
      this.startDatetime, 
      this.date, 
      this.time, 
      this.status, 
      this.venue,});

  MyMatchModel.fromJson(dynamic json) {
    matchId = json['matchId'];
    externalMatchId = json['externalMatchId'];
    teamAName = json['teamAName'];
    teamBName = json['teamBName'];
    teamAAbbr = json['teamAAbbr'];
    teamBAbbr = json['teamBAbbr'];
    teamALogoUrl = json['teamALogoUrl'];
    teamBLogoUrl = json['teamBLogoUrl'];
    type = json['type'];
    title = json['title'];
    startDatetime = json['startDatetime'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    venue = json['venue'];
  }
  String? matchId;
  int? externalMatchId;
  String? teamAName;
  String? teamBName;
  String? teamAAbbr;
  String? teamBAbbr;
  dynamic teamALogoUrl;
  dynamic teamBLogoUrl;
  String? type;
  String? title;
  String? startDatetime;
  String? date;
  String? time;
  String? status;
  String? venue;
MyMatchModel copyWith({  String? matchId,
  int? externalMatchId,
  String? teamAName,
  String? teamBName,
  String? teamAAbbr,
  String? teamBAbbr,
  dynamic teamALogoUrl,
  dynamic teamBLogoUrl,
  String? type,
  String? title,
  String? startDatetime,
  String? date,
  String? time,
  String? status,
  String? venue,
}) => MyMatchModel(  matchId: matchId ?? this.matchId,
  externalMatchId: externalMatchId ?? this.externalMatchId,
  teamAName: teamAName ?? this.teamAName,
  teamBName: teamBName ?? this.teamBName,
  teamAAbbr: teamAAbbr ?? this.teamAAbbr,
  teamBAbbr: teamBAbbr ?? this.teamBAbbr,
  teamALogoUrl: teamALogoUrl ?? this.teamALogoUrl,
  teamBLogoUrl: teamBLogoUrl ?? this.teamBLogoUrl,
  type: type ?? this.type,
  title: title ?? this.title,
  startDatetime: startDatetime ?? this.startDatetime,
  date: date ?? this.date,
  time: time ?? this.time,
  status: status ?? this.status,
  venue: venue ?? this.venue,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['matchId'] = matchId;
    map['externalMatchId'] = externalMatchId;
    map['teamAName'] = teamAName;
    map['teamBName'] = teamBName;
    map['teamAAbbr'] = teamAAbbr;
    map['teamBAbbr'] = teamBAbbr;
    map['teamALogoUrl'] = teamALogoUrl;
    map['teamBLogoUrl'] = teamBLogoUrl;
    map['type'] = type;
    map['title'] = title;
    map['startDatetime'] = startDatetime;
    map['date'] = date;
    map['time'] = time;
    map['status'] = status;
    map['venue'] = venue;
    return map;
  }

}