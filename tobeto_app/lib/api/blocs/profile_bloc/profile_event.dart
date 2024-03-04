import 'dart:io';
import 'package:tobeto_app/models/user_model.dart';

abstract class ProfileEvent {}

class GetProfil extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
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
  final int index;

  DeleteEducation({required this.index});
}

class ClearState extends ProfileEvent {}
