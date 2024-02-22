import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class CompetenceEdit extends StatefulWidget {
  const CompetenceEdit({Key? key}) : super(key: key);

  @override
  _CompetenceEditState createState() => _CompetenceEditState();
}

class _CompetenceEditState extends State<CompetenceEdit> {
  final List<String> _selectedCompetences = [];
  String? _selectedDropdownItem;

  _competence(BuildContext context, {required String text}) {
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
            AppTextTheme.small(text, fontWeight: FontWeight.normal, context),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedCompetences.remove(text);
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
              _selectedDropdownItem = value.toString();
            });
          },
        ),
        EditButton(
          text: "Ekle",
          onTap: () {
            if (_selectedDropdownItem != null) {
              setState(() {
                _selectedCompetences.add(_selectedDropdownItem!);
                _selectedDropdownItem = null;
              });
            }
          },
        ),
        for (String competence in _selectedCompetences)
          _competence(context, text: competence),
      ],
    );
  }
}
