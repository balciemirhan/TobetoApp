import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_profile_model/education_history.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_select_date.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class EducationEdit extends StatefulWidget {
  const EducationEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EducationEditState();
}

class _EducationEditState extends State<EducationEdit> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  String? _selectededucationStatus;
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

  _educationCard(
    BuildContext context, {
    required String status,
    required String school,
    required String department,
    required String city,
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
                    status, fontWeight: FontWeight.normal, context),
                AppTextTheme.small(
                    school, fontWeight: FontWeight.normal, context),
                AppTextTheme.small(
                    department, fontWeight: FontWeight.normal, context),
              ],
            ),
            Column(
              children: [
                AppTextTheme.small(
                    city, fontWeight: FontWeight.normal, context),
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
          return SingleChildScrollView(
            child: Column(
              children: [
                EditDropdownField(
                    text: "Eğitim Durumu",
                    items: const [
                      DropdownMenuItem(value: "Lisans", child: Text("Lisans")),
                      DropdownMenuItem(
                          value: "Ön Lisans", child: Text("Ön Lisans")),
                      DropdownMenuItem(
                          value: "Yüksek Lisans", child: Text("Yüksek Lisans")),
                      DropdownMenuItem(
                          value: "Doktora", child: Text("Doktora")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectededucationStatus = value;
                      });
                    }),
                EditTextField(
                  label: "Okulun Adı",
                  keyboardType: TextInputType.text,
                  controller: _schoolController,
                ),
                EditTextField(
                  label: "Bölüm",
                  keyboardType: TextInputType.text,
                  controller: _departmentController,
                ),
                EditDropdownField(
                  text: "Şehir",
                  items: const [
                    DropdownMenuItem(
                        value: "İstanbul", child: Text("İstanbul")),
                    DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                    DropdownMenuItem(value: "Kocaeli", child: Text("Kocaeli")),
                    DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
                    DropdownMenuItem(value: "Manisa", child: Text("Manisa")),
                    DropdownMenuItem(value: "Bolu", child: Text("Bolu")),
                    DropdownMenuItem(value: "Yalova", child: Text("Yalova")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EditSelectDate(
                      onDateSelected: _onStartDateSelected,
                      text: "Giriş Tarihi",
                    ),
                    EditSelectDate(
                      text: "Çıkış Tarihi",
                      onDateSelected: _onEndDateSelected,
                    )
                  ],
                ),
                EditButton(
                  text: "Ekle",
                  onTap: () {
                    if (state.user.educationHistory != null) {
                      state.user.educationHistory!.add(
                        EducationHistory(
                          educationStatus: _selectededucationStatus,
                          schoolName: _schoolController.text,
                          department: _departmentController.text,
                          city: _selectedCity,
                          startDate: _selectedStartDate,
                          endDate: _selectedEndDate,
                        ),
                      );
                    } else {
                      state.user.educationHistory = List.of(
                        [
                          EducationHistory(
                            educationStatus: _selectededucationStatus,
                            schoolName: _schoolController.text,
                            department: _departmentController.text,
                            city: _selectedCity,
                            startDate: _selectedStartDate,
                            endDate: _selectedEndDate,
                          )
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
                    child: state.user.educationHistory != null
                        ? ListView.builder(
                            itemCount: state.user.educationHistory!.length,
                            itemBuilder: (context, index) {
                              final education =
                                  state.user.educationHistory![index];
                              return _educationCard(
                                context,
                                status: education.educationStatus!,
                                school: education.schoolName!,
                                department: education.department!,
                                city: education.city!,
                                onPressed: () {},
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
