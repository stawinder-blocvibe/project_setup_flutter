class SlotCell {
  SlotCell({
      this.fromRank, 
      this.toRank, 
      this.prize, 
      this.label,});

  SlotCell.fromJson(dynamic json) {
    fromRank = json['fromRank'];
    toRank = json['toRank'];
    prize = json['prize'];
    label = json['label'];
  }
  int? fromRank;
  int? toRank;
  int? prize;
  String? label;
SlotCell copyWith({  int? fromRank,
  int? toRank,
  int? prize,
  String? label,
}) => SlotCell(  fromRank: fromRank ?? this.fromRank,
  toRank: toRank ?? this.toRank,
  prize: prize ?? this.prize,
  label: label ?? this.label,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fromRank'] = fromRank;
    map['toRank'] = toRank;
    map['prize'] = prize;
    map['label'] = label;
    return map;
  }

}