import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          personTextField(
            label: "Adınız",
            keyboardType: TextInputType.text,
          ),
          personTextField(
            label: "Soyadınız",
            keyboardType: TextInputType.text,
          ),
          personTextField(
            label: "Telefon Numaranız",
            keyboardType: TextInputType.phone,
          ),
          personTextField(
            label: "Doğum Tarihiniz",
            keyboardType: TextInputType.datetime,
          ),
          personTextField(
            label: "TC Kimlik No",
            keyboardType: TextInputType.number,
          ),
          personTextField(
            label: "E-posta",
            keyboardType: TextInputType.emailAddress,
          ),
          personTextField(
            label: "Ülke",
          ),
          personTextField(
            label: "İl",
          ),
          personTextField(
            label: "İlçe",
          ),
          personTextField(
            label: "Mahalle/Sokak",
          ),
          personTextField(
            label: "Hakkımda",
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

class personTextField extends StatelessWidget {
  const personTextField({
    super.key,
    required this.label,
    this.keyboardType,
  });
  final String label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: keyboardType,
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
    );
  }
}
