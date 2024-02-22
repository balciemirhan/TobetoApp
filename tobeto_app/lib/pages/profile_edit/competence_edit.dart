import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';

class CompetenceEdit extends StatefulWidget {
  const CompetenceEdit({Key? key}) : super(key: key);

  @override
  _CompetenceEditState createState() => _CompetenceEditState();
}

class _CompetenceEditState extends State<CompetenceEdit> {
  _competence(BuildContext context, {required String text}) {
    return NeuBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextTheme.small(text, fontWeight: FontWeight.normal, context),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }

  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EditDropdownField(
          text: "Yetkinlikleriniz",
          items: [
            DropdownMenuItem(
              value: "Muhasebe",
              child: Text("Muhasebe"),
            ),
            DropdownMenuItem(
              value: "Aktif Dinleme",
              child: Text("Aktif Dinleme"),
            ),
            DropdownMenuItem(
              value: "Uyum Sağlama",
              child: Text("Uyum Sağlama"),
            ),
            DropdownMenuItem(
              value: "C#",
              child: Text("C#"),
            ),
            DropdownMenuItem(
              value: "Algoritma",
              child: Text("Algoritma"),
            ),
            DropdownMenuItem(
              value: "Android (İşletim Sistemi)",
              child: Text("Android (İşletim Sistemi)"),
            ),
          ],
        ),
        EditButton(text: "Ekle", onTap: () {}),
        _competence(context, text: "Aktif Öğrenme"),
        _competence(context, text: "SQL"),
        _competence(context, text: "Javascript"),
      ],
    );
  }
}
