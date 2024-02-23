import 'package:cloud_firestore/cloud_firestore.dart';

class EducationHistory {
  String? educationStatus;
  String? schoolName;
  String? department;
  String? city;
  DateTime? startDate;
  DateTime? endDate;
  EducationHistory({
    this.educationStatus,
    this.schoolName,
    this.department,
    this.city,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'educationStatus': educationStatus,
      'schoolName': schoolName,
      'department': department,
      'city': city,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory EducationHistory.fromMap(Map<String, dynamic> map) {
    return EducationHistory(
      educationStatus: map['educationStatus'] ?? '',
      schoolName: map['schoolName'] ?? '',
      department: map['department'] ?? '' ?? '',
      city: map['city'] ?? '',
      startDate: (map['startDate'] as Timestamp?)?.toDate(),
      endDate: (map['endDate'] as Timestamp?)?.toDate(),
    );
  }
}
