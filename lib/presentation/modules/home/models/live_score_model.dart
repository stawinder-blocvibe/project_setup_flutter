class LiveScoreModel {
  LiveScoreModel({
      this.id, 
      this.seriesId, 
      this.totalOvers, 
      this.toss, 
      this.result, 
      this.type, 
      this.powerplay, 
      this.currentEvent, 
      this.teama, 
      this.teamb, 
      this.nextBatsman, 
      this.liveInningNumber, 
      this.batsman, 
      this.bowler, 
      this.lastBowler, 
      this.battingTeamId, 
      this.bowlingTeamId, 
      this.teamaScore, 
      this.teambScore, 
      this.needRunMessage, 
      this.leadTrail, 
      this.partnership, 
      this.yetToBat, 
      this.currentRunRate, 
      this.lastFourOvers, 
      this.lastSixBalls, 
      this.lastWicket, 
      this.target, 
      this.reqRunRate, 
      this.runsNeeded, 
      this.ballsRemaining, 
      this.odds, 
      this.status,});

  LiveScoreModel.fromJson(dynamic json) {
    id = json['id'];
    seriesId = json['series_id'];
    totalOvers = json['total_overs'];
    toss = json['toss'];
    result = json['result'];
    type = json['type'];
    powerplay = json['powerplay'];
    currentEvent = json['current_event'];
    teama = json['teama'] != null ? Teama.fromJson(json['teama']) : null;
    teamb = json['teamb'] != null ? Teamb.fromJson(json['teamb']) : null;
    nextBatsman = json['next_batsman'];
    liveInningNumber = json['live_inning_number'];
    if (json['batsman'] != null) {
      batsman = [];
      json['batsman'].forEach((v) {
        batsman?.add(Batsman.fromJson(v));
      });
    }
    bowler = json['bowler'] != null ? Bowler.fromJson(json['bowler']) : null;
    lastBowler = json['last_bowler'] != null ? LastBowler.fromJson(json['last_bowler']) : null;
    battingTeamId = json['batting_team_id'];
    bowlingTeamId = json['bowling_team_id'];
    teamaScore = json['teama_score'] != null ? TeamaScore.fromJson(json['teama_score']) : null;
    teambScore = json['teamb_score'] != null ? TeambScore.fromJson(json['teamb_score']) : null;
    needRunMessage = json['need_run_message'];
    leadTrail = json['lead_trail'];
    partnership = json['partnership'] != null ? Partnership.fromJson(json['partnership']) : null;
    if (json['yet_to_bat'] != null) {
      yetToBat = [];
      json['yet_to_bat'].forEach((v) {
        yetToBat?.add(YetToBat.fromJson(v));
      });
    }
    currentRunRate = json['current_run_rate'];
    if (json['last_four_overs'] != null) {
      lastFourOvers = [];
      json['last_four_overs'].forEach((v) {
        lastFourOvers?.add(LastFourOvers.fromJson(v));
      });
    }
    lastSixBalls = json['last_six_balls'] != null ? json['last_six_balls'].cast<String>() : [];
    lastWicket = json['last_wicket'] != null ? LastWicket.fromJson(json['last_wicket']) : null;
    target = json['target'];
    reqRunRate = json['req_run_rate'];
    runsNeeded = json['runs_needed'];
    ballsRemaining = json['balls_remaining'];
    odds = json['odds'] != null ? Odds.fromJson(json['odds']) : null;
    status = json['status'];
  }
  String? id;
  String? seriesId;
  String? totalOvers;
  String? toss;
  String? result;
  String? type;
  String? powerplay;
  String? currentEvent;
  Teama? teama;
  Teamb? teamb;
  String? nextBatsman;
  String? liveInningNumber;
  List<Batsman>? batsman;
  Bowler? bowler;
  LastBowler? lastBowler;
  String? battingTeamId;
  String? bowlingTeamId;
  TeamaScore? teamaScore;
  TeambScore? teambScore;
  String? needRunMessage;
  String? leadTrail;
  Partnership? partnership;
  List<YetToBat>? yetToBat;
  String? currentRunRate;
  List<LastFourOvers>? lastFourOvers;
  List<String>? lastSixBalls;
  LastWicket? lastWicket;
  String? target;
  String? reqRunRate;
  String? runsNeeded;
  String? ballsRemaining;
  Odds? odds;
  String? status;
LiveScoreModel copyWith({  String? id,
  String? seriesId,
  String? totalOvers,
  String? toss,
  String? result,
  String? type,
  String? powerplay,
  String? currentEvent,
  Teama? teama,
  Teamb? teamb,
  String? nextBatsman,
  String? liveInningNumber,
  List<Batsman>? batsman,
  Bowler? bowler,
  LastBowler? lastBowler,
  String? battingTeamId,
  String? bowlingTeamId,
  TeamaScore? teamaScore,
  TeambScore? teambScore,
  String? needRunMessage,
  String? leadTrail,
  Partnership? partnership,
  List<YetToBat>? yetToBat,
  String? currentRunRate,
  List<LastFourOvers>? lastFourOvers,
  List<String>? lastSixBalls,
  LastWicket? lastWicket,
  String? target,
  String? reqRunRate,
  String? runsNeeded,
  String? ballsRemaining,
  Odds? odds,
  String? status,
}) => LiveScoreModel(  id: id ?? this.id,
  seriesId: seriesId ?? this.seriesId,
  totalOvers: totalOvers ?? this.totalOvers,
  toss: toss ?? this.toss,
  result: result ?? this.result,
  type: type ?? this.type,
  powerplay: powerplay ?? this.powerplay,
  currentEvent: currentEvent ?? this.currentEvent,
  teama: teama ?? this.teama,
  teamb: teamb ?? this.teamb,
  nextBatsman: nextBatsman ?? this.nextBatsman,
  liveInningNumber: liveInningNumber ?? this.liveInningNumber,
  batsman: batsman ?? this.batsman,
  bowler: bowler ?? this.bowler,
  lastBowler: lastBowler ?? this.lastBowler,
  battingTeamId: battingTeamId ?? this.battingTeamId,
  bowlingTeamId: bowlingTeamId ?? this.bowlingTeamId,
  teamaScore: teamaScore ?? this.teamaScore,
  teambScore: teambScore ?? this.teambScore,
  needRunMessage: needRunMessage ?? this.needRunMessage,
  leadTrail: leadTrail ?? this.leadTrail,
  partnership: partnership ?? this.partnership,
  yetToBat: yetToBat ?? this.yetToBat,
  currentRunRate: currentRunRate ?? this.currentRunRate,
  lastFourOvers: lastFourOvers ?? this.lastFourOvers,
  lastSixBalls: lastSixBalls ?? this.lastSixBalls,
  lastWicket: lastWicket ?? this.lastWicket,
  target: target ?? this.target,
  reqRunRate: reqRunRate ?? this.reqRunRate,
  runsNeeded: runsNeeded ?? this.runsNeeded,
  ballsRemaining: ballsRemaining ?? this.ballsRemaining,
  odds: odds ?? this.odds,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['series_id'] = seriesId;
    map['total_overs'] = totalOvers;
    map['toss'] = toss;
    map['result'] = result;
    map['type'] = type;
    map['powerplay'] = powerplay;
    map['current_event'] = currentEvent;
    if (teama != null) {
      map['teama'] = teama?.toJson();
    }
    if (teamb != null) {
      map['teamb'] = teamb?.toJson();
    }
    map['next_batsman'] = nextBatsman;
    map['live_inning_number'] = liveInningNumber;
    if (batsman != null) {
      map['batsman'] = batsman?.map((v) => v.toJson()).toList();
    }
    if (bowler != null) {
      map['bowler'] = bowler?.toJson();
    }
    if (lastBowler != null) {
      map['last_bowler'] = lastBowler?.toJson();
    }
    map['batting_team_id'] = battingTeamId;
    map['bowling_team_id'] = bowlingTeamId;
    if (teamaScore != null) {
      map['teama_score'] = teamaScore?.toJson();
    }
    if (teambScore != null) {
      map['teamb_score'] = teambScore?.toJson();
    }
    map['need_run_message'] = needRunMessage;
    map['lead_trail'] = leadTrail;
    if (partnership != null) {
      map['partnership'] = partnership?.toJson();
    }
    if (yetToBat != null) {
      map['yet_to_bat'] = yetToBat?.map((v) => v.toJson()).toList();
    }
    map['current_run_rate'] = currentRunRate;
    if (lastFourOvers != null) {
      map['last_four_overs'] = lastFourOvers?.map((v) => v.toJson()).toList();
    }
    map['last_six_balls'] = lastSixBalls;
    if (lastWicket != null) {
      map['last_wicket'] = lastWicket?.toJson();
    }
    map['target'] = target;
    map['req_run_rate'] = reqRunRate;
    map['runs_needed'] = runsNeeded;
    map['balls_remaining'] = ballsRemaining;
    if (odds != null) {
      map['odds'] = odds?.toJson();
    }
    map['status'] = status;
    return map;
  }

}

class Odds {
  Odds({
      this.minrate, 
      this.maxrate, 
      this.favteam, 
      this.sessionOver, 
      this.sessionMin, 
      this.sessionMax,});

  Odds.fromJson(dynamic json) {
    minrate = json['minrate'];
    maxrate = json['maxrate'];
    favteam = json['favteam'];
    sessionOver = json['session_over'];
    sessionMin = json['session_min'];
    sessionMax = json['session_max'];
  }
  String? minrate;
  String? maxrate;
  String? favteam;
  String? sessionOver;
  String? sessionMin;
  String? sessionMax;
Odds copyWith({  String? minrate,
  String? maxrate,
  String? favteam,
  String? sessionOver,
  String? sessionMin,
  String? sessionMax,
}) => Odds(  minrate: minrate ?? this.minrate,
  maxrate: maxrate ?? this.maxrate,
  favteam: favteam ?? this.favteam,
  sessionOver: sessionOver ?? this.sessionOver,
  sessionMin: sessionMin ?? this.sessionMin,
  sessionMax: sessionMax ?? this.sessionMax,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['minrate'] = minrate;
    map['maxrate'] = maxrate;
    map['favteam'] = favteam;
    map['session_over'] = sessionOver;
    map['session_min'] = sessionMin;
    map['session_max'] = sessionMax;
    return map;
  }

}

class LastWicket {
  LastWicket({
      this.player, 
      this.run, 
      this.ball,});

  LastWicket.fromJson(dynamic json) {
    player = json['player'];
    run = json['run'];
    ball = json['ball'];
  }
  String? player;
  int? run;
  int? ball;
LastWicket copyWith({  String? player,
  int? run,
  int? ball,
}) => LastWicket(  player: player ?? this.player,
  run: run ?? this.run,
  ball: ball ?? this.ball,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['player'] = player;
    map['run'] = run;
    map['ball'] = ball;
    return map;
  }

}

class LastFourOvers {
  LastFourOvers({
      this.over, 
      this.balls, 
      this.runs,});

  LastFourOvers.fromJson(dynamic json) {
    over = json['over'];
    balls = json['balls'] != null ? json['balls'].cast<String>() : [];
    runs = json['runs'];
  }
  int? over;
  List<String>? balls;
  int? runs;
LastFourOvers copyWith({  int? over,
  List<String>? balls,
  int? runs,
}) => LastFourOvers(  over: over ?? this.over,
  balls: balls ?? this.balls,
  runs: runs ?? this.runs,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['over'] = over;
    map['balls'] = balls;
    map['runs'] = runs;
    return map;
  }

}

class YetToBat {
  YetToBat({
      this.playerId, 
      this.name, 
      this.playingRole,});

  YetToBat.fromJson(dynamic json) {
    playerId = json['player_id'];
    name = json['name'];
    playingRole = json['playing_role'];
  }
  String? playerId;
  String? name;
  String? playingRole;
YetToBat copyWith({  String? playerId,
  String? name,
  String? playingRole,
}) => YetToBat(  playerId: playerId ?? this.playerId,
  name: name ?? this.name,
  playingRole: playingRole ?? this.playingRole,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['player_id'] = playerId;
    map['name'] = name;
    map['playing_role'] = playingRole;
    return map;
  }

}

class Partnership {
  Partnership({
      this.ball, 
      this.run,});

  Partnership.fromJson(dynamic json) {
    ball = json['ball'];
    run = json['run'];
  }
  int? ball;
  int? run;
Partnership copyWith({  int? ball,
  int? run,
}) => Partnership(  ball: ball ?? this.ball,
  run: run ?? this.run,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ball'] = ball;
    map['run'] = run;
    return map;
  }

}

class TeambScore {
  TeambScore({
      this.teamId, 
      this.score, 
      this.completeScore, 
      this.wickets, 
      this.overs, 
      this.balls,});

  TeambScore.fromJson(dynamic json) {
    teamId = json['team_id'];
    score = json['score'];
    completeScore = json['complete_score'];
    wickets = json['wickets'];
    overs = json['overs'];
    balls = json['balls'];
  }
  String? teamId;
  String? score;
  String? completeScore;
  String? wickets;
  String? overs;
  String? balls;
TeambScore copyWith({  String? teamId,
  String? score,
  String? completeScore,
  String? wickets,
  String? overs,
  String? balls,
}) => TeambScore(  teamId: teamId ?? this.teamId,
  score: score ?? this.score,
  completeScore: completeScore ?? this.completeScore,
  wickets: wickets ?? this.wickets,
  overs: overs ?? this.overs,
  balls: balls ?? this.balls,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['team_id'] = teamId;
    map['score'] = score;
    map['complete_score'] = completeScore;
    map['wickets'] = wickets;
    map['overs'] = overs;
    map['balls'] = balls;
    return map;
  }

}

class TeamaScore {
  TeamaScore({
      this.teamId, 
      this.score, 
      this.completeScore, 
      this.wickets, 
      this.overs, 
      this.balls,});

  TeamaScore.fromJson(dynamic json) {
    teamId = json['team_id'];
    score = json['score'];
    completeScore = json['complete_score'];
    wickets = json['wickets'];
    overs = json['overs'];
    balls = json['balls'];
  }
  String? teamId;
  String? score;
  String? completeScore;
  String? wickets;
  String? overs;
  String? balls;
TeamaScore copyWith({  String? teamId,
  String? score,
  String? completeScore,
  String? wickets,
  String? overs,
  String? balls,
}) => TeamaScore(  teamId: teamId ?? this.teamId,
  score: score ?? this.score,
  completeScore: completeScore ?? this.completeScore,
  wickets: wickets ?? this.wickets,
  overs: overs ?? this.overs,
  balls: balls ?? this.balls,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['team_id'] = teamId;
    map['score'] = score;
    map['complete_score'] = completeScore;
    map['wickets'] = wickets;
    map['overs'] = overs;
    map['balls'] = balls;
    return map;
  }

}

class LastBowler {
  LastBowler({
      this.name, 
      this.playerId, 
      this.runs, 
      this.overs, 
      this.wickets, 
      this.econ,});

  LastBowler.fromJson(dynamic json) {
    name = json['name'];
    playerId = json['player_id'];
    runs = json['runs'];
    overs = json['overs'];
    wickets = json['wickets'];
    econ = json['econ'];
  }
  String? name;
  String? playerId;
  String? runs;
  String? overs;
  String? wickets;
  String? econ;
LastBowler copyWith({  String? name,
  String? playerId,
  String? runs,
  String? overs,
  String? wickets,
  String? econ,
}) => LastBowler(  name: name ?? this.name,
  playerId: playerId ?? this.playerId,
  runs: runs ?? this.runs,
  overs: overs ?? this.overs,
  wickets: wickets ?? this.wickets,
  econ: econ ?? this.econ,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['player_id'] = playerId;
    map['runs'] = runs;
    map['overs'] = overs;
    map['wickets'] = wickets;
    map['econ'] = econ;
    return map;
  }

}

class Bowler {
  Bowler({
      this.name, 
      this.playerId, 
      this.runs, 
      this.overs, 
      this.wickets, 
      this.econ,});

  Bowler.fromJson(dynamic json) {
    name = json['name'];
    playerId = json['player_id'];
    runs = json['runs'];
    overs = json['overs'];
    wickets = json['wickets'];
    econ = json['econ'];
  }
  String? name;
  String? playerId;
  String? runs;
  String? overs;
  String? wickets;
  String? econ;
Bowler copyWith({  String? name,
  String? playerId,
  String? runs,
  String? overs,
  String? wickets,
  String? econ,
}) => Bowler(  name: name ?? this.name,
  playerId: playerId ?? this.playerId,
  runs: runs ?? this.runs,
  overs: overs ?? this.overs,
  wickets: wickets ?? this.wickets,
  econ: econ ?? this.econ,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['player_id'] = playerId;
    map['runs'] = runs;
    map['overs'] = overs;
    map['wickets'] = wickets;
    map['econ'] = econ;
    return map;
  }

}

class Batsman {
  Batsman({
      this.name, 
      this.playerId, 
      this.isStrike, 
      this.runs, 
      this.balls, 
      this.fours, 
      this.sixes, 
      this.strikeRate,});

  Batsman.fromJson(dynamic json) {
    name = json['name'];
    playerId = json['player_id'];
    isStrike = json['is_strike'];
    runs = json['runs'];
    balls = json['balls'];
    fours = json['fours'];
    sixes = json['sixes'];
    strikeRate = json['strike_rate'];
  }
  String? name;
  String? playerId;
  String? isStrike;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? strikeRate;
Batsman copyWith({  String? name,
  String? playerId,
  String? isStrike,
  String? runs,
  String? balls,
  String? fours,
  String? sixes,
  String? strikeRate,
}) => Batsman(  name: name ?? this.name,
  playerId: playerId ?? this.playerId,
  isStrike: isStrike ?? this.isStrike,
  runs: runs ?? this.runs,
  balls: balls ?? this.balls,
  fours: fours ?? this.fours,
  sixes: sixes ?? this.sixes,
  strikeRate: strikeRate ?? this.strikeRate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['player_id'] = playerId;
    map['is_strike'] = isStrike;
    map['runs'] = runs;
    map['balls'] = balls;
    map['fours'] = fours;
    map['sixes'] = sixes;
    map['strike_rate'] = strikeRate;
    return map;
  }

}

class Teamb {
  Teamb({
      this.id, 
      this.name, 
      this.abbr, 
      this.logoUrl,});

  Teamb.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    abbr = json['abbr'];
    logoUrl = json['logo_url'];
  }
  String? id;
  String? name;
  String? abbr;
  String? logoUrl;
Teamb copyWith({  String? id,
  String? name,
  String? abbr,
  String? logoUrl,
}) => Teamb(  id: id ?? this.id,
  name: name ?? this.name,
  abbr: abbr ?? this.abbr,
  logoUrl: logoUrl ?? this.logoUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['abbr'] = abbr;
    map['logo_url'] = logoUrl;
    return map;
  }

}

class Teama {
  Teama({
      this.id, 
      this.name, 
      this.abbr, 
      this.logoUrl,});

  Teama.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    abbr = json['abbr'];
    logoUrl = json['logo_url'];
  }
  String? id;
  String? name;
  String? abbr;
  String? logoUrl;
Teama copyWith({  String? id,
  String? name,
  String? abbr,
  String? logoUrl,
}) => Teama(  id: id ?? this.id,
  name: name ?? this.name,
  abbr: abbr ?? this.abbr,
  logoUrl: logoUrl ?? this.logoUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['abbr'] = abbr;
    map['logo_url'] = logoUrl;
    return map;
  }

}