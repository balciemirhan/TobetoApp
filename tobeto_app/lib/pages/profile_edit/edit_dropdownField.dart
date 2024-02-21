import 'package:flutter/material.dart';

class EditDropdownField extends StatefulWidget {
  const EditDropdownField({Key? key, this.items, required this.text})
      : super(key: key);
  final List<DropdownMenuItem<String>>? items;
  final String text;

  @override
  State<EditDropdownField> createState() => _EditDropdownFieldState();
}

class _EditDropdownFieldState extends State<EditDropdownField> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.text,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        items: widget.items,
        value: selectedOption,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
        },
      ),
    );
  }
}
