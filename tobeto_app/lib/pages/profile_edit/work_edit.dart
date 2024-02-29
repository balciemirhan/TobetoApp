import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_profile_model/work_history.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_card.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_select_date.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class WorkEdit extends StatefulWidget {
  const WorkEdit({Key? key}) : super(key: key);

  @override
  _WorkEditState createState() => _WorkEditState();
}

class _WorkEditState extends State<WorkEdit> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCity;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  void _onStartDateSelected(DateTime date) {
    setState(() {
      _selectedStartDate = date;
    });
  }

  void _onEndDateSelected(DateTime date) {
    setState(() {
      _selectedEndDate = date;
    });
  }

  _workCard(
    BuildContext context, {
    required String name,
    required String position,
    required String sector,
    required String city,
    required String description,
    required void Function() onPressed,
  }) {
    return EditCard(
      onPressed: onPressed,
      child: Column(
        children: [
          AppTextTheme.small(name, context, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextTheme.xSmall(position, context),
                    const SizedBox(height: 10),
                    AppTextTheme.xSmall(
                        sector, fontWeight: FontWeight.normal, context),
                    const SizedBox(height: 10),
                    AppTextTheme.xSmall(
                        city, fontWeight: FontWeight.normal, context),
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Column(
                  children: [
                    AppTextTheme.xSmall(
                        description, fontWeight: FontWeight.normal, context),
                  ],
                ),
              ),
            ],
          ),
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
                EditTextField(
                  label: "Kurum Adı",
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                ),
                EditTextField(
                    label: "Pozisyon",
                    keyboardType: TextInputType.text,
                    controller: _positionController),
                EditTextField(
                    label: "Sektör",
                    keyboardType: TextInputType.text,
                    controller: _sectorController),
                EditDropdownField(
                    text: "Şehir",
                    items: const [
                      DropdownMenuItem(
                          value: "İstanbul", child: Text("İstanbul")),
                      DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                      DropdownMenuItem(
                          value: "Kocaeli", child: Text("Kocaeli")),
                      DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
                      DropdownMenuItem(value: "Manisa", child: Text("Manisa")),
                      DropdownMenuItem(value: "Bolu", child: Text("Bolu")),
                      DropdownMenuItem(value: "Yalova", child: Text("Yalova")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EditSelectDate(
                      text: "Giriş Tarihi",
                      onDateSelected: _onStartDateSelected,
                    ),
                    EditSelectDate(
                      onDateSelected: _onEndDateSelected,
                      text: "Çıkış Tarihi",
                    )
                  ],
                ),
                EditTextField(
                  label: "İş Açıklaması",
                  keyboardType: TextInputType.text,
                  controller: _descriptionController,
                ),
                EditButton(
                  text: "Ekle",
                  onTap: () {
                    if (state.user.workHistory != null) {
                      state.user.workHistory!.add(
                        WorkHistory(
                          city: _selectedCity,
                          organizationName: _nameController.text,
                          position: _positionController.text,
                          sector: _sectorController.text,
                          workDescription: _descriptionController.text,
                          startDate: _selectedStartDate,
                          endDate: _selectedEndDate,
                        ),
                      );
                    } else {
                      state.user.workHistory = List.of(
                        [
                          WorkHistory(
                            city: _selectedCity,
                            organizationName: _nameController.text,
                            position: _positionController.text,
                            sector: _sectorController.text,
                            workDescription: _descriptionController.text,
                            startDate: _selectedStartDate,
                            endDate: _selectedEndDate,
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
                    child: state.user.workHistory != null
                        ? ListView.builder(
                            itemCount: state.user.workHistory!.length,
                            itemBuilder: (context, index) {
                              final work = state.user.workHistory![index];
                              return _workCard(
                                context,
                                description: work.workDescription!,
                                name: work.organizationName!,
                                position: work.position!,
                                sector: work.sector!,
                                city: work.city!,
                                onPressed: () {
                                  state.user.workHistory?.removeAt(index);
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
