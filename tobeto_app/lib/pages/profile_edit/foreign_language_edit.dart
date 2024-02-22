import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class ForeignLanguageEdit extends StatefulWidget {
  const ForeignLanguageEdit({Key? key}) : super(key: key);

  @override
  _ForeignLanguageEditState createState() => _ForeignLanguageEditState();
}

class _ForeignLanguageEditState extends State<ForeignLanguageEdit> {
  final List<Map<String, String>> _selectedCompetences = [];
  String? _selectedLanguage;
  String? _selectedLevel;

  _competence(BuildContext context,
      {required String language, required String level}) {
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
              onPressed: () {
                setState(() {
                  _selectedCompetences
                      .removeWhere((item) => item['language'] == language);
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
    return Column(
      children: [
        EditDropdownField(
          text: "Dil Seçiniz",
          items: const [
            DropdownMenuItem(value: "İngilizce", child: Text("İngilizce")),
            DropdownMenuItem(value: "Almanca", child: Text("Almanca")),
            DropdownMenuItem(value: "Fransızca", child: Text("Fransızca")),
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
            if (_selectedLanguage != null && _selectedLevel != null) {
              setState(() {
                _selectedCompetences.add({
                  'language': _selectedLanguage!,
                  'level': _selectedLevel!,
                });
                _selectedLanguage = null;
              });
            }
          },
        ),
        for (Map<String, String> competence in _selectedCompetences)
          _competence(
            context,
            language: competence['language'] ?? '',
            level: competence['level'] ?? '',
          ),
      ],
    );
  }
}
