import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/models/user_profile_model/certificate_model.dart';
import 'package:tobeto_app/models/user_profile_model/competence_history.dart';
import 'package:tobeto_app/models/user_profile_model/education_history.dart';
import 'package:tobeto_app/models/user_profile_model/language_history.dart';
import 'package:tobeto_app/models/user_profile_model/social_history.dart';
import 'package:tobeto_app/models/user_profile_model/work_history.dart';

class UserModel {
  String? userId;
  String? name;
  String? surname;
  String? description;
  String? github;
  String? instagram;
  String? linkedin;
  String? email;
  String? phone;
  String? profilePhoto;
  DateTime? dateOfBirth;
  String? tcNo;
  String? country;
  String? city;
  String? address;
  List<EducationHistory>? educationHistory;
  List<WorkHistory>? workHistory;
  List<CompetenceHistory>? competenceHistory;
  List<LanguageHistory>? languageHistory;
  List<SocialHistory>? socialHistory;
  List<String>? favorites;
  List<Certificate>? certificates;

  UserModel({
    this.name,
    this.surname,
    this.description,
    this.github,
    this.instagram,
    this.linkedin,
    this.profilePhoto,
    this.userId,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.tcNo,
    this.country,
    this.city,
    this.address,
    this.educationHistory,
    this.workHistory,
    this.competenceHistory,
    this.languageHistory,
    this.socialHistory,
    this.favorites,
    this.certificates,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      name: map['name'] ?? "",
      surname: map['surname'] ?? "",
      description: map['description'] ?? "",
      github: map['github'] ?? "",
      instagram: map['instagram'] ?? "",
      linkedin: map['linkedin'] ?? "",
      profilePhoto: map['profilePhoto'] ?? "",
      dateOfBirth: (map['dateOfBirth'] as Timestamp?)?.toDate(),
      tcNo: map["tcNo"] ?? "",
      country: map['country'] ?? "",
      city: map['city'] ?? "",
      address: map['address'] ?? "",
      educationHistory: (map['educationHistory'] as List?)
          ?.map((e) => EducationHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      workHistory: (map['workHistory'] as List?)
          ?.map((e) => WorkHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      competenceHistory: (map['competenceHistory'] as List?)
          ?.map((e) => CompetenceHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      languageHistory: (map['languageHistory'] as List?)
          ?.map((e) => LanguageHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      socialHistory: (map['socialHistory'] as List?)
          ?.map((e) => SocialHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      certificates: (map['certificates'] as List?)
          ?.map((e) => Certificate.fromMap(e as Map<String, dynamic>))
          .toList(),
      favorites: List<String>.from(map['favorites'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    final classMap = _createMap();
    final Map<String, dynamic> map = {};
    for (MapEntry<String, dynamic> entry in classMap.entries) {
      if (entry.value != null) {
        map.addEntries([entry]);
      }
    }
    return map;
  }

  Map<String, dynamic> _createMap() {
    return {
      'userId': userId,
      'email': email,
      'phone': phone,
      'name': name,
      'surname': surname,
      'description': description,
      'github': github,
      'instagram': instagram,
      'linkedin': linkedin,
      'profilePhoto': profilePhoto,
      'dateOfBirth': dateOfBirth,
      'tcNo': tcNo,
      'country': country,
      'city': city,
      'address': address,
      'educationHistory': educationHistory?.map((e) => e.toMap()).toList(),
      'workHistory': workHistory?.map((e) => e.toMap()).toList(),
      'competenceHistory': competenceHistory?.map((e) => e.toMap()).toList(),
      'languageHistory': languageHistory?.map((e) => e.toMap()).toList(),
      'socialHistory': socialHistory?.map((e) => e.toMap()).toList(),
      'certificates': certificates?.map((e) => e.toMap()).toList(),
      'favorites': favorites,
    };
  }
}
