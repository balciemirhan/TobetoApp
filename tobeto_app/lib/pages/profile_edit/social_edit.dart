import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_profile_model/social_history.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_card.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class SocialEdit extends StatefulWidget {
  const SocialEdit({Key? key}) : super(key: key);

  @override
  _SocialEditState createState() => _SocialEditState();
}

class _SocialEditState extends State<SocialEdit> {
  String? _selectedName;
  final TextEditingController _urlController = TextEditingController();
  _social(
    BuildContext context, {
    required String social,
    required void Function() onPressed,
  }) {
    return EditCard(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextTheme.small(social, context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          context.read<ProfileBloc>().add(GetProfil());
        }
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileLoaded) {
          return Column(
            children: [
              EditDropdownField(
                text: "Seçiniz",
                items: const [
                  DropdownMenuItem(
                      value: "İnstagram",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.instagram),
                          SizedBox(width: 15),
                          Text("İnstagram")
                        ],
                      )),
                  DropdownMenuItem(
                      value: "Twitter",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.twitter),
                          SizedBox(width: 15),
                          Text("Twitter"),
                        ],
                      )),
                  DropdownMenuItem(
                      value: "LinkedIn",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.linkedin),
                          SizedBox(width: 15),
                          Text("LinkedIn"),
                        ],
                      )),
                  DropdownMenuItem(
                      value: "Github",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.github),
                          SizedBox(width: 15),
                          Text("Github"),
                        ],
                      )),
                  DropdownMenuItem(
                      value: "Dribble",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.dribbble),
                          SizedBox(width: 15),
                          Text("Dribble"),
                        ],
                      )),
                  DropdownMenuItem(
                      value: "Behance",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.behance),
                          SizedBox(width: 15),
                          Text("Behance"),
                        ],
                      )),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedName = value.toString();
                  });
                },
              ),
              EditTextField(
                label: "https://",
                keyboardType: TextInputType.url,
                controller: _urlController,
              ),
              EditButton(
                  text: "Kaydet",
                  onTap: () {
                    if (state.user.socialHistory != null) {
                      state.user.socialHistory!.add(
                        SocialHistory(
                          socialName: _selectedName,
                          socialURL: _urlController.text,
                        ),
                      );
                    } else {
                      state.user.socialHistory = List.of(
                        [
                          SocialHistory(
                            socialName: _selectedName,
                            socialURL: _urlController.text,
                          ),
                        ],
                      );
                    }
                    context
                        .read<ProfileBloc>()
                        .add(UpdateProfile(user: state.user));
                  }),
              SizedBox(
                  height: 300,
                  child: state.user.socialHistory != null
                      ? ListView.builder(
                          itemCount: state.user.socialHistory!.length,
                          itemBuilder: (context, index) {
                            final social = state.user.socialHistory![index];
                            return _social(context, social: social.socialName!,
                                onPressed: () {
                              state.user.socialHistory?.removeAt(index);
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateProfile(user: state.user));
                            });
                          },
                        )
                      : Container())
            ],
          );
        }
        return Container();
      },
    );
  }
}
