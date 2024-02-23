class SocialHistory {
  String? socialId;
  String? socialName;
  String? socialURL;

  SocialHistory({
    this.socialId,
    this.socialName,
    this.socialURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'socialId': socialId,
      'socialName': socialName,
      'socialURL': socialURL,
    };
  }

  factory SocialHistory.fromMap(Map<String, dynamic> map) {
    return SocialHistory(
      socialId: map['socialId'] ?? '',
      socialName: map['socialName'] ?? '',
      socialURL: map['socialURL'] ?? '',
    );
  }
}
