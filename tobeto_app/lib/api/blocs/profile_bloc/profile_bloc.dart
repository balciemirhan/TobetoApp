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
  }
// -------------------- Verileri getir - oku --------------------

  Future<void> _onGetProfile(
      GetProfil event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading()); // circular progress indicator
    try {
      // profil bilgilerinbi getiren fonksiyon
      UserModel user = await _userRepository.getUser(UserModel());
      // getirilen fonksiyon yay.UI yay.
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

  // -------------------- Verileri güncelle--------------------
  // Burada hem kullanıcı'nın profile bilgilerini hem de resmini güncelleme işlemi yaptırıyorum.
  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      if (event.photo != null) {
        await _storageRepository
            .uploadPhoto(event.photo!); // fotoğrafı güncelle
      }
      await _userRepository.updateUser(event.user);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileError(errorMessage: (e.toString())));
    }
  }

  void _onClear(ClearState event, Emitter<ProfileState> emit) {
    emit(
        ProfileInitial()); // ClearState eventi alındığında state'i Initial olarak ayarlıyor
  }
}
