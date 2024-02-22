import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_select_date.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class ExperienceEdit extends StatefulWidget {
  const ExperienceEdit({Key? key}) : super(key: key);

  @override
  _ExperienceEditState createState() => _ExperienceEditState();
}

class _ExperienceEditState extends State<ExperienceEdit> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EditTextField(
              label: "Kurum Adı", keyboardType: TextInputType.text),
          const EditTextField(
              label: "Pozisyon", keyboardType: TextInputType.text),
          const EditTextField(
              label: "Sektör", keyboardType: TextInputType.text),
          const EditDropdownField(text: "Şehir", items: [
            DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
            DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
            DropdownMenuItem(value: "Kocaeli", child: Text("Kocaeli")),
            DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
            DropdownMenuItem(value: "Manisa", child: Text("Manisa")),
            DropdownMenuItem(value: "Bolu", child: Text("Bolu")),
            DropdownMenuItem(value: "Yalova", child: Text("Yalova")),
          ]),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditSelectDate(text: "Giriş Tarihi"),
              EditSelectDate(
                text: "Çıkış Tarihi",
              )
            ],
          ),
          const EditTextField(
            label: "İş Açıklaması",
            keyboardType: TextInputType.text,
          ),
          EditButton(text: "Ekle", onTap: () {})
        ],
      ),
    );
  }
}
