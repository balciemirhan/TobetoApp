import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
              text: "Medya Hesaplarım",
              widget: user.socialHistory != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.socialHistory!.length,
                      itemBuilder: (context, index) {
                        final social = user.socialHistory![index];
                        return Column(
                          children: [
                            AppTextTheme.small(
                                social.socialName!,
                                fontWeight: FontWeight.normal,
                                context),
                            AppTextTheme.small(
                                social.socialURL!,
                                fontWeight: FontWeight.normal,
                                context),
                          ],
                        );
                      },
                    )
                  : const SizedBox());
        }
        return Container();
      },
    );
  }
}
