import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_select_date.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class EducationEdit extends StatefulWidget {
  const EducationEdit({Key? key}) : super(key: key);

  @override
  _EducationEditState createState() => _EducationEditState();
}

class _EducationEditState extends State<EducationEdit> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final List<Map<String, String>> _educationList = [];
  String? _selectededucationStatus;
  String? _selectedCity;

  _competence(
    BuildContext context, {
    required String status,
    required String school,
    required String department,
    required String city,
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
              onPressed: () {
                setState(() {
                  _educationList
                      .removeWhere((item) => item['school'] == school);
                });
              },
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
    return SingleChildScrollView(
      child: Column(
        children: [
          EditDropdownField(
              text: "Eğitim Durumu",
              items: const [
                DropdownMenuItem(value: "Lisans", child: Text("Lisans")),
                DropdownMenuItem(value: "Ön Lisans", child: Text("Ön Lisans")),
                DropdownMenuItem(
                    value: "Yüksek Lisans", child: Text("Yüksek Lisans")),
                DropdownMenuItem(value: "Doktora", child: Text("Doktora")),
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
              DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditSelectDate(text: "Giriş Tarihi"),
              EditSelectDate(
                text: "Çıkış Tarihi",
              )
            ],
          ),
          EditButton(
              text: "Ekle",
              onTap: () {
                if (_selectededucationStatus != null && _selectedCity != null) {
                  setState(() {
                    _educationList.add({
                      "status": _selectededucationStatus!,
                      "city": _selectedCity!,
                      "department": _departmentController.text,
                      "school": _schoolController.text
                    });
                    _selectededucationStatus = null;
                  });
                }
              }),
          for (Map<String, String> competence in _educationList)
            _competence(
              context,
              status: competence["status"] ?? '',
              department: competence['department'] ?? '',
              school: competence['school'] ?? '',
              city: competence['city'] ?? '',
            ),
        ],
      ),
    );
  }
}
