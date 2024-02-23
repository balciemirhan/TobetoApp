class LanguageHistory {
  String? langId;
  String? langName;
  String? langLevel;

  LanguageHistory({
    this.langId,
    this.langName,
    this.langLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'langId': langId,
      'langName': langName,
      'langLevel': langLevel,
    };
  }

  factory LanguageHistory.fromMap(Map<String, dynamic> map) {
    return LanguageHistory(
      langId: map['langId'] ?? '',
      langName: map['langName'] ?? '',
      langLevel: map['langLevel'] ?? '',
    );
  }
}
