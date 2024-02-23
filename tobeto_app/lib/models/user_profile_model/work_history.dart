// ignore_for_file: public_member_api_docs, sort_constructors_first
class WorkHistory {
  String? organizationName;
  String? position;
  String? sector;
  String? city;
  String? startDate;
  String? endDate;
  String? workDescription;
  WorkHistory({
    this.organizationName,
    this.position,
    this.sector,
    this.city,
    this.startDate,
    this.endDate,
    this.workDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'organizationName': organizationName,
      'position': position,
      'sector': sector,
      'city': city,
      'startDate': startDate,
      'endDate': endDate,
      'workDescription': workDescription,
    };
  }

  factory WorkHistory.fromMap(Map<String, dynamic> map) {
    return WorkHistory(
      organizationName: map['organizationName'] ?? '',
      position: map['position'] ?? '',
      sector: map['sector'] ?? '',
      city: map['city'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      workDescription: map['workDescription'] ?? '',
    );
  }
}
