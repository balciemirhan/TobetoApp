import 'package:tobeto_app/models/user_model.dart';

abstract class ProfileEvent {}

// --------------- profile bilgilerimi getir ---------------
// read / get(getir
// hali hazırdaki verilerim:
// otomatik olarak userModel var

class FetchProfileInfo extends ProfileEvent {}

// --------------- profile bilgilerimi güncelle---------------

class UpdateProfile extends ProfileEvent {
  // kimin?
  UserModel user;
  UpdateProfile({required this.user});
}

class CloseEvent extends ProfileEvent {}
