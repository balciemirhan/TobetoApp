import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_profile_model/language_history.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class ForeignLanguageEdit extends StatefulWidget {
  const ForeignLanguageEdit({Key? key}) : super(key: key);

  @override
  _ForeignLanguageEditState createState() => _ForeignLanguageEditState();
}

class _ForeignLanguageEditState extends State<ForeignLanguageEdit> {
  String? _selectedLanguage;
  String? _selectedLevel;

  _language(
    BuildContext context, {
    required String language,
    required String level,
    required void Function()? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppTextTheme.small(
                    language, fontWeight: FontWeight.normal, context),
                AppTextTheme.small(
                    level, fontWeight: FontWeight.normal, context),
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.deepPurple.shade900,
              ),
            ),
          ],
        ),
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
                text: "Dil Seçiniz",
                items: const [
                  DropdownMenuItem(
                      value: "İngilizce", child: Text("İngilizce")),
                  DropdownMenuItem(value: "Almanca", child: Text("Almanca")),
                  DropdownMenuItem(
                      value: "Fransızca", child: Text("Fransızca")),
                  DropdownMenuItem(value: "Çince", child: Text("Çince")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value.toString();
                  });
                },
              ),
              EditDropdownField(
                text: "Seviye Seçiniz",
                items: const [
                  DropdownMenuItem(
                      value: "Temel Seviye (A1, A2)",
                      child: Text("Temel Seviye (A1, A2)")),
                  DropdownMenuItem(
                      value: "Orta Seviye (B1, B2)",
                      child: Text("Orta Seviye (B1, B2)")),
                  DropdownMenuItem(
                      value: "İleri Seviye (C1, C2)",
                      child: Text("İleri Seviye (C1, C2)")),
                  DropdownMenuItem(value: "Anadil", child: Text("Anadil")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value.toString();
                  });
                },
              ),
              EditButton(
                text: "Kaydet",
                onTap: () {
                  if (state.user.languageHistory != null) {
                    state.user.languageHistory!.add(
                      LanguageHistory(
                          langName: _selectedLanguage,
                          langLevel: _selectedLevel),
                    );
                  } else {
                    state.user.languageHistory = List.of(
                      [
                        LanguageHistory(
                            langName: _selectedLanguage,
                            langLevel: _selectedLevel),
                      ],
                    );
                  }
                  context
                      .read<ProfileBloc>()
                      .add(UpdateProfile(user: state.user));
                },
              ),
              SizedBox(
                  height: 300,
                  child: state.user.languageHistory != null
                      ? ListView.builder(
                          itemCount: state.user.languageHistory!.length,
                          itemBuilder: (context, index) {
                            final language = state.user.languageHistory![index];
                            return _language(
                              context,
                              language: language.langName!,
                              level: language.langLevel!,
                              onPressed: () {
                                state.user.languageHistory?.removeAt(index);
                                context.read<ProfileBloc>().add(
                                      UpdateProfile(user: state.user),
                                    );
                              },
                            );
                          },
                        )
                      : Container()),
            ],
          );
        }
        return Container();
      },
    );
  }
}
