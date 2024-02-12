import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/business_logic/repositories/user_repository.dart';
import 'package:tobeto_app/models/user_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;

  ProfileBloc(this._userRepository) : super(ProfileInitial()) {
    on<FetchProfileInfo>(_onFetchProfileInfo);
    on<UpdateProfile>(_onUpdateProfile);
    on<CloseEvent>(_close);
  }
// -------------------- Verileri getir - oku --------------------

  Future<void> _onFetchProfileInfo(
      FetchProfileInfo event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading()); // circular progress indicator
    try {
      // profil bilgilerinbi getiren fonksiyon
      UserModel user = await _userRepository.getUser(UserModel());
      // getirilen fonksiyon yay.UI yay.
      emit(ProfileInfoFetched(user: user));
    } catch (e) {
      emit(ProfileInfoFetchFailed(errorMessage: "Hata"));
    }
  }

  // -------------------- Verileri güncelle--------------------

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await _userRepository.updateUser(event.user);
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileInfoFetchFailed(errorMessage: (e.toString())));
    }
  }

  Future<void> _close(CloseEvent event, Emitter<ProfileState> emit) async {
    await super.close();
    emit(CloseBloc());
  }
}
