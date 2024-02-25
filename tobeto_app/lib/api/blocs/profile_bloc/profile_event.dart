// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/user_profile_model/education_history.dart';

abstract class ProfileEvent {}

// --------------- profile bilgilerimi getir ---------------
// read / get(getir
// hali hazırdaki verilerim:
// otomatik olarak userModel var

class GetProfil extends ProfileEvent {}

// --------------- profile bilgilerimi güncelle---------------

class UpdateProfile extends ProfileEvent {
  // kimin?
  UserModel user;
  File? photo;
  UpdateProfile({required this.user, this.photo});
}

class UpdateUserCertificate extends ProfileEvent {
  UserModel user;
  File? file;
  UpdateUserCertificate({
    required this.user,
    this.file,
  });
}

class UploadProfilePhoto extends ProfileEvent {
  final File photo;

  UploadProfilePhoto({required this.photo});
}

class DeleteProfile extends ProfileEvent {}

class DeleteEducation extends ProfileEvent {
  /* final EducationHistory educationHistory;
  DeleteEducation({
    required this.educationHistory,
  }); */
  final int index;

  DeleteEducation({required this.index});
}

//---------- Temizle -----------------
class ClearState extends ProfileEvent {}
