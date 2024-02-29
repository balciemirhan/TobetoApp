import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_state.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/announcement_survey/announcement_carousel.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextTheme.londrinaShadow("Duyuru", context),
        const Spacer(),
        BlocBuilder<AnnouncementBloc, AnnouncementState>(
          builder: (context, state) {
            if (state is AnnouncementInitial) {
              context.read<AnnouncementBloc>().add(GetAnnouncement());
            }
            if (state is AnnouncementLoading) {
              return const CircularProgressIndicator();
            }
            if (state is AnnouncementLoaded) {
              final announcement = state.announcement;
              return AnnouncementCarousel(announcement: announcement);
            }
            return Container();
          },
        ),
        const Spacer()
      ],
    );
  }
}
