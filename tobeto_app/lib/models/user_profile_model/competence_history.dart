class CompetenceHistory {
  String? compId;
  String? compName;

  CompetenceHistory({
    this.compId,
    this.compName,
  });

  Map<String, dynamic> toMap() {
    return {
      'compId': compId,
      'compName': compName,
    };
  }

  factory CompetenceHistory.fromMap(Map<String, dynamic> map) {
    return CompetenceHistory(
      compId: map['compId'] ?? '',
      compName: map['compName'] ?? '',
    );
  }
}
