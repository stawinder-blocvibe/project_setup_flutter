class LeaderboardUser {
  LeaderboardUser({
      this.userId, 
      this.fullName, 
      this.score,});

  LeaderboardUser.fromJson(dynamic json) {
    userId = json['userId'];
    fullName = json['fullName'];
    score = json['score'];
  }
  String? userId;
  String? fullName;
  int? score;
LeaderboardUser copyWith({  String? userId,
  String? fullName,
  int? score,
}) => LeaderboardUser(  userId: userId ?? this.userId,
  fullName: fullName ?? this.fullName,
  score: score ?? this.score,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['score'] = score;
    return map;
  }

}