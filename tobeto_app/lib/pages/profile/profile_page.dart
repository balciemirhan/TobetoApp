import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget.dart';
import 'package:tobeto_app/config/constant/format/date_formatter.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/pages/profile/about.dart';
import 'package:tobeto_app/pages/profile/certificate.dart';
import 'package:tobeto_app/pages/profile/competence.dart';
import 'package:tobeto_app/pages/profile/education.dart';
import 'package:tobeto_app/pages/profile/work.dart';
import 'package:tobeto_app/pages/profile/foreign_language.dart';
import 'package:tobeto_app/pages/profile/social_media.dart';
import 'package:tobeto_app/pages/profile/activity_map.dart';
import 'package:tobeto_app/pages/profile/rozet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  personal(BuildContext context,
      {required String image, required String text}) {
    return Row(
      children: [
        Image(height: 25, image: AssetImage(image)),
        const SizedBox(
          width: 10,
        ),
        Text(
            style: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.black87),
            text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial || state is ProfileUpdated) {
            context.read<ProfileBloc>().add(GetProfil());
          }
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            UserModel user = state.user;
            return Container(
              padding: const EdgeInsets.only(top: 40),
              color: Colors.deepPurple.shade100,
              child: Column(
                children: [
                  TopBarWidget(
                      widget: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/profiledit");
                          },
                          icon: const Icon(Icons.edit)),
                      titleText: AppText.profile),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              personal(context,
                                  image: AppImage.user,
                                  text: '${user.name} ${user.surname}'),
                              personal(context,
                                  image: AppImage.calendar,
                                  text: DateFormatter.dateFormatter.format(
                                      user.dateOfBirth ?? DateTime.now())),
                              personal(context,
                                  image: AppImage.phone, text: '${user.phone}'),
                              personal(context,
                                  image: AppImage.email, text: '${user.email}'),
                            ],
                          ),
                          CircleAvatar(
                            minRadius: 40,
                            maxRadius: 60,
                            backgroundImage: NetworkImage(
                              user.profilePhoto!,
                            ),
                          )
                        ],
                      )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 60),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade700, blurRadius: 10)
                        ],
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(50)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const ActivityMapWidget(),
                            About(
                              description: " ${user.description}",
                            ),
                            const Education(),
                            const Work(),
                            const Competence(),
                            const ForeignLanguage(),
                            const Certificate(),
                            const Rozet(),
                            const SocialMedia(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileError) {
            return Center(child: Text(state.errorMessage));
          }
          return Center(
            child: Container(),
          );
        },
      ),
    );
  }
}
