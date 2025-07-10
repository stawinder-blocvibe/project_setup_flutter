class HomeApiResponse {
  HomeApiResponse({
      this.banners, 
      this.liveMatches, 
      this.upcomingMatches,});

  HomeApiResponse.fromJson(dynamic json) {
    banners = json['banners'] != null ? json['banners'].cast<String>() : [];
    if (json['liveMatches'] != null) {
      liveMatches = [];
      json['liveMatches'].forEach((v) {
        liveMatches?.add(LiveMatches.fromJson(v));
      });
    }
    if (json['upcomingMatches'] != null) {
      upcomingMatches = [];
      json['upcomingMatches'].forEach((v) {
        upcomingMatches?.add(UpcomingMatches.fromJson(v));
      });
    }
  }
  List<String>? banners;
  List<LiveMatches>? liveMatches;
  List<UpcomingMatches>? upcomingMatches;
HomeApiResponse copyWith({  List<String>? banners,
  List<LiveMatches>? liveMatches,
  List<UpcomingMatches>? upcomingMatches,
}) => HomeApiResponse(  banners: banners ?? this.banners,
  liveMatches: liveMatches ?? this.liveMatches,
  upcomingMatches: upcomingMatches ?? this.upcomingMatches,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banners'] = banners;
    if (liveMatches != null) {
      map['liveMatches'] = liveMatches?.map((v) => v.toJson()).toList();
    }
    if (upcomingMatches != null) {
      map['upcomingMatches'] = upcomingMatches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UpcomingMatches {
  UpcomingMatches({
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
      this.venue,
      this.isPredictHarOverMatch,
      this.isPredictHarInningMatch,
   });

  UpcomingMatches.fromJson(dynamic json) {
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
    isPredictHarOverMatch = json['isPredictHarOverMatch'];
    isPredictHarInningMatch = json['isPredictHarInningMatch'];
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
  bool? isPredictHarOverMatch;
  bool? isPredictHarInningMatch;
UpcomingMatches copyWith({  String? matchId,
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
  bool? isPredictHarOverMatch,
  bool? isPredictHarInningMatch,
}) => UpcomingMatches(  matchId: matchId ?? this.matchId,
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
  isPredictHarOverMatch: isPredictHarOverMatch ?? this.isPredictHarOverMatch,
  isPredictHarInningMatch: isPredictHarInningMatch ?? this.isPredictHarInningMatch,
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
    map['isPredictHarOverMatch'] = isPredictHarOverMatch;
    map['isPredictHarInningMatch'] = isPredictHarInningMatch;
    return map;
  }

}

class LiveMatches {
  LiveMatches({
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
      this.venue,
      this.isPredictHarOverMatch,
      this.isPredictHarInningMatch,
  });

  LiveMatches.fromJson(dynamic json) {
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
    isPredictHarInningMatch = json['isPredictHarInningMatch'];
    isPredictHarInningMatch = json['isPredictHarInningMatch'];
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
  bool? isPredictHarOverMatch;
  bool? isPredictHarInningMatch;
LiveMatches copyWith({  String? matchId,
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
  bool? isPredictHarOverMatch,
  bool? isPredictHarInningMatch,
}) => LiveMatches(  matchId: matchId ?? this.matchId,
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
  isPredictHarOverMatch: isPredictHarOverMatch ?? this.isPredictHarOverMatch,
  isPredictHarInningMatch: isPredictHarInningMatch ?? this.isPredictHarInningMatch,
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
    map['isPredictHarOverMatch'] = isPredictHarOverMatch;
    map['isPredictHarInningMatch'] = isPredictHarInningMatch;
    return map;
  }

}