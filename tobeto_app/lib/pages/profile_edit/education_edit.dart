import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EditDropdownField(text: "Eğitim Durumu", items: [
            DropdownMenuItem(value: "Lisans", child: Text("Lisans")),
            DropdownMenuItem(value: "Ön Lisans", child: Text("Ön Lisans")),
            DropdownMenuItem(
                value: "Yüksek Lisans", child: Text("Yüksek Lisans")),
            DropdownMenuItem(value: "Doktora", child: Text("Doktora")),
          ]),
          const EditTextField(
              label: "Okulun Adı", keyboardType: TextInputType.text),
          const EditTextField(label: "Bölüm", keyboardType: TextInputType.text),
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
          EditButton(text: "Ekle", onTap: () {})
        ],
      ),
    );
  }
}
