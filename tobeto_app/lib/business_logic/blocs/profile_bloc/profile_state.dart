// state durumlarını UI da kullanacağız.
// kullandığımız bu state UI ları güncellesin...

// contex.read<ProfileBloc>.add(FetchProfileInfo)

import 'package:tobeto_app/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  // profile bilgileri getireceğiz
  // istek atılıyor...
}

class ProfileLoading extends ProfileState {
  // circular progress indicator
}

// loaded
// yüklendi...

class ProfileInfoFetched extends ProfileState {
  // profile bilgileri getireceğiz
  // ekrana yansıyan kısım
  UserModel user;
  ProfileInfoFetched({
    required this.user,
  });
}

class ProfileInfoFetchFailed extends ProfileState {
  // veri yoksa
  String errorMessage;
  ProfileInfoFetchFailed({
    required this.errorMessage,
  });
}

class ProfileUpdated extends ProfileState {}

class ProfileUpdatedFailed extends ProfileState {
  String message;
  ProfileUpdatedFailed({
    required this.message,
  });
}

class CloseBloc extends ProfileState {}
