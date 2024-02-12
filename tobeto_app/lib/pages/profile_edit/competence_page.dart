import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class CompetencePage extends StatefulWidget {
  const CompetencePage({Key? key}) : super(key: key);

  @override
  _CompetencePageState createState() => _CompetencePageState();
}

class _CompetencePageState extends State<CompetencePage> {
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
        DropdownButtonFormField(
          value: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
          items: const [
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
          decoration: const InputDecoration(
            labelText: "Yetkinlik",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Ekle")),
        _competence(context, text: "Aktif Öğrenme"),
        _competence(context, text: "SQL"),
        _competence(context, text: "Javascript"),
      ],
    );
  }
}
