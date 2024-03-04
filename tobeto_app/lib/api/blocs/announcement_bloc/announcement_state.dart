import 'package:tobeto_app/models/announcement_model.dart';

abstract class AnnouncementState {}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoading extends AnnouncementState {}

class AnnouncementLoaded extends AnnouncementState {
  final List<AnnouncementModel> announcement;

  AnnouncementLoaded({required this.announcement});
}

class AnnouncementError extends AnnouncementState {
  final String message;

  AnnouncementError({required this.message});
}

class AnnouncementExample extends AnnouncementState {}
