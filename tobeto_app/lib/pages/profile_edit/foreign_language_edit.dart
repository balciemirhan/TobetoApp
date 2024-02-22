import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class ForeignLanguageEdit extends StatefulWidget {
  const ForeignLanguageEdit({Key? key}) : super(key: key);

  @override
  _ForeignLanguageEditState createState() => _ForeignLanguageEditState();
}

class _ForeignLanguageEditState extends State<ForeignLanguageEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EditDropdownField(
          text: "Dil Seçiniz",
          items: [
            DropdownMenuItem(value: "Dil Seçiniz", child: Text("Dil Seçiniz")),
            DropdownMenuItem(value: "İngilizce", child: Text("İngilizce")),
            DropdownMenuItem(value: "Almanca", child: Text("Almanca")),
            DropdownMenuItem(value: "Fransızca", child: Text("Fransızca")),
            DropdownMenuItem(value: "Çince", child: Text("Çince")),
          ],
        ),
        const EditDropdownField(
          text: "Seviye Seçiniz",
          items: [
            DropdownMenuItem(
                value: "Seviye Seçiniz", child: Text("Seviye Seçiniz")),
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
        ),
        EditButton(text: "Kaydet", onTap: () {})
      ],
    );
  }
}
