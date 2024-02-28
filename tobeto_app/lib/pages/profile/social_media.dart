import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  String _getImageAssetPath(String socialName) {
    switch (socialName.toLowerCase()) {
      case 'instagram':
        return 'assets/images/instagram.png';
      case 'twitter':
        return 'assets/images/twitter.png';
      case 'linkedin':
        return 'assets/images/linkedin.png';
      case 'github':
        return 'assets/images/github.png';
      case 'dribbble':
        return 'assets/images/dribbble.png';
      case 'behance':
        return 'assets/images/behance.png';
      default:
        return 'assets/images/linkedin.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
              text: "Medya Hesaplarım",
              widget: user.socialHistory != null
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: user.socialHistory!.length,
                        itemBuilder: (context, index) {
                          final social = user.socialHistory![index];
                          return InkWell(
                            child: Image(
                              image: AssetImage(
                                  _getImageAssetPath("${social.socialName}")),
                            ),
                            onTap: () async {
                              final Uri url = Uri.parse("${social.socialURL}");

                              if (!await canLaunchUrl(url)) {
                                print(url.data);
                                launchUrl(url);
                              } else {
                                snackBarMessage(context, "Geçersiz URL");
                              }
                            },
                          );
                        },
                      ),
                    )
                  : const SizedBox());
        }
        return Container();
      },
    );
  }
}
