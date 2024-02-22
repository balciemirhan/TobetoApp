import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class SocialEdit extends StatefulWidget {
  const SocialEdit({Key? key}) : super(key: key);

  @override
  _SocialEditState createState() => _SocialEditState();
}

class _SocialEditState extends State<SocialEdit> {
  final List<String> _selectedCompetences = [];
  String? _selectedDropdownItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditDropdownField(
          text: "Seçiniz",
          items: const [
            DropdownMenuItem(
                value: "İnstagram",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.instagram),
                    SizedBox(width: 15),
                    Text("İnstagram")
                  ],
                )),
            DropdownMenuItem(
                value: "Twitter",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.twitter),
                    SizedBox(width: 15),
                    Text("Twitter"),
                  ],
                )),
            DropdownMenuItem(
                value: "LinkedIn",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 15),
                    Text("LinkedIn"),
                  ],
                )),
            DropdownMenuItem(
                value: "Github",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.github),
                    SizedBox(width: 15),
                    Text("Github"),
                  ],
                )),
            DropdownMenuItem(
                value: "Dribble",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.dribbble),
                    SizedBox(width: 15),
                    Text("Dribble"),
                  ],
                )),
            DropdownMenuItem(
                value: "Behance",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.behance),
                    SizedBox(width: 15),
                    Text("Behance"),
                  ],
                )),
          ],
          onChanged: (value) {
            setState(() {
              _selectedDropdownItem = value.toString();
            });
          },
        ),
        const EditTextField(
          label: "https://",
          keyboardType: TextInputType.url,
        ),
        EditButton(text: "Kaydet", onTap: () {})
      ],
    );
  }
}
