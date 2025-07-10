class OverNew {
  OverNew({
      this.overNumber, 
      this.predictedList,});

  OverNew.fromJson(dynamic json) {
    overNumber = json['overNumber'];
    if (json['predictedList'] != null) {
      predictedList = [];
      json['predictedList'].forEach((v) {
        predictedList?.add(PredictedList.fromJson(v));
      });
    }
  }
  int? overNumber;
  List<PredictedList>? predictedList;
OverNew copyWith({  int? overNumber,
  List<PredictedList>? predictedList,
}) => OverNew(  overNumber: overNumber ?? this.overNumber,
  predictedList: predictedList ?? this.predictedList,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overNumber'] = overNumber;
    if (predictedList != null) {
      map['predictedList'] = predictedList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PredictedList {
  PredictedList({
      this.firstBall, 
      this.secondBall, 
      this.thirdBall, 
      this.fourthBall, 
      this.fifthBall, 
      this.sixthBall,
      this.extraBalls,
  });

  PredictedList.fromJson(dynamic json) {
    firstBall = json['firstBall'];
    secondBall = json['secondBall'];
    thirdBall = json['thirdBall'];
    fourthBall = json['fourthBall'];
    fifthBall = json['fifthBall'];
    sixthBall = json['sixthBall'];
    extraBalls = json['extraBalls'];
  }
  String? firstBall;
  String? secondBall;
  String? thirdBall;
  String? fourthBall;
  String? fifthBall;
  String? sixthBall;
  List<String?>? extraBalls;
PredictedList copyWith({  String? firstBall,
  String? secondBall,
  String? thirdBall,
  String? fourthBall,
  String? fifthBall,
  String? sixthBall,
  List<String?>? extraBalls,
}) => PredictedList(  firstBall: firstBall ?? this.firstBall,
  secondBall: secondBall ?? this.secondBall,
  thirdBall: thirdBall ?? this.thirdBall,
  fourthBall: fourthBall ?? this.fourthBall,
  fifthBall: fifthBall ?? this.fifthBall,
  sixthBall: sixthBall ?? this.sixthBall,
  extraBalls: extraBalls ?? this.extraBalls,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstBall'] = firstBall;
    map['secondBall'] = secondBall;
    map['thirdBall'] = thirdBall;
    map['fourthBall'] = fourthBall;
    map['fifthBall'] = fifthBall;
    map['sixthBall'] = sixthBall;
    map['extraBalls'] = extraBalls?.map((v) => v).toList();
    return map;
  }

}