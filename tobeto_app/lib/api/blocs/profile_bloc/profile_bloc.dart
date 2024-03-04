import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/api/repositories/storage_repository.dart';
import 'package:tobeto_app/api/repositories/user_repository.dart';
import 'package:tobeto_app/models/user_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;

  ProfileBloc(this._userRepository, this._storageRepository)
      : super(ProfileInitial()) {
    on<GetProfil>(_onGetProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<ClearState>(_onClear);
    on<DeleteProfile>(_ondeleteProfile);
    on<UpdateUserCertificate>(_onUpdateUserCertificate);
  }

  Future<void> _onGetProfile(
      GetProfil event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      UserModel user = await _userRepository.getUser(UserModel());
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      if (event.photo != null) {
        await _storageRepository.uploadPhoto(event.photo!);
      }
      await _userRepository.updateUser(event.user);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: (e.toString())));
    }
  }

  Future<void> _onUpdateUserCertificate(
      UpdateUserCertificate event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await _storageRepository.updateUserCertificate(event.user, event.file);

      await _userRepository.updateUser(event.user);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: (e.toString())));
    }
  }

  Future<void> _ondeleteProfile(
      DeleteProfile event, Emitter<ProfileState> emit) async {
    try {
      await _userRepository.deleteUser(UserModel());
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: (e.toString())));
    }
  }

  void _onClear(ClearState event, Emitter<ProfileState> emit) {
    emit(ProfileInitial());
  }
}
