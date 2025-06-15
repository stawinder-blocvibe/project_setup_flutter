

class Over {
  final int overNumber;
  final String firstBall;
  final String secondBall;
  final String thirdBall;
  final String fourthBall;
  final String fifthBall;
  final String sixthBall;

  Over({
    required this.overNumber,
    required this.firstBall,
    required this.secondBall,
    required this.thirdBall,
    required this.fourthBall,
    required this.fifthBall,
    required this.sixthBall,
  });

  factory Over.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
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
    int? overNumber,
    String? firstBall,
    String? secondBall,
    String? thirdBall,
    String? fourthBall,
    String? fifthBall,
    String? sixthBall,
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
