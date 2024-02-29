import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_profile_model/competence_history.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_card.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class CompetenceEdit extends StatefulWidget {
  const CompetenceEdit({Key? key}) : super(key: key);

  @override
  _CompetenceEditState createState() => _CompetenceEditState();
}

class _CompetenceEditState extends State<CompetenceEdit> {
  String? _selectedCompetence;

  _competence(
    BuildContext context, {
    required String competence,
    required void Function() onPressed,
  }) {
    return EditCard(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextTheme.small(
              competence, fontWeight: FontWeight.normal, context),
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
          return SingleChildScrollView(
            child: Column(
              children: [
                EditDropdownField(
                  text: 'Yetkinlikler',
                  items: const [
                    DropdownMenuItem(
                      value: "Muhasebe",
                      child: Text("Muhasebe"),
                    ),
                    DropdownMenuItem(value: "C#", child: Text("C#")),
                    DropdownMenuItem(
                        value: "Aktif Öğrenme", child: Text("Aktif Öğrenme"))
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCompetence = value.toString();
                    });
                  },
                ),
                EditButton(
                  text: "Ekle",
                  onTap: () {
                    if (state.user.competenceHistory != null) {
                      state.user.competenceHistory!.add(
                        CompetenceHistory(
                          compName: _selectedCompetence,
                        ),
                      );
                    } else {
                      state.user.competenceHistory = List.of(
                        [
                          CompetenceHistory(
                            compName: _selectedCompetence,
                          ),
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
                    child: state.user.competenceHistory != null
                        ? ListView.builder(
                            itemCount: state.user.competenceHistory!.length,
                            itemBuilder: (context, index) {
                              final competence =
                                  state.user.competenceHistory![index];
                              return _competence(
                                context,
                                competence: competence.compName!,
                                onPressed: () {
                                  state.user.competenceHistory?.removeAt(index);
                                  context.read<ProfileBloc>().add(
                                        UpdateProfile(user: state.user),
                                      );
                                },
                              );
                            },
                          )
                        : Container()),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
