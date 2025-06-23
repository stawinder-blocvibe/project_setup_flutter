

class Over {
  final dynamic overNumber;
  final dynamic firstBall;
  final dynamic secondBall;
  final dynamic thirdBall;
  final dynamic fourthBall;
  final dynamic fifthBall;
  final dynamic sixthBall;

  Over({
    required this.overNumber,
    required this.firstBall,
    required this.secondBall,
    required this.thirdBall,
    required this.fourthBall,
    required this.fifthBall,
    required this.sixthBall,
  });

  factory Over.fromJson(Map<dynamic, dynamic> json) {
    return Over(
      overNumber: json['overNumber'],
      firstBall: json['firstBall'],
      secondBall: json['secondBall'],
      thirdBall: json['thirdBall'],
      fourthBall: json['fourthBall'],
      fifthBall: json['fifthBall'],
      sixthBall: json['sixthBall'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'overNumber': overNumber,
      'firstBall': firstBall,
      'secondBall': secondBall,
      'thirdBall': thirdBall,
      'fourthBall': fourthBall,
      'fifthBall': fifthBall,
      'sixthBall': sixthBall,
    };
  }

  Over copyWith({
    dynamic? overNumber,
    dynamic? firstBall,
    dynamic? secondBall,
    dynamic? thirdBall,
    dynamic? fourthBall,
    dynamic? fifthBall,
    dynamic? sixthBall,
  }) {
    return Over(
      overNumber: overNumber ?? this.overNumber,
      firstBall: firstBall ?? this.firstBall,
      secondBall: secondBall ?? this.secondBall,
      thirdBall: thirdBall ?? this.thirdBall,
      fourthBall: fourthBall ?? this.fourthBall,
      fifthBall: fifthBall ?? this.fifthBall,
      sixthBall: sixthBall ?? this.sixthBall,
    );
  }
}
