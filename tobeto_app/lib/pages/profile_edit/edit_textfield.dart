import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.controller,
    this.onTap,
  });
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
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
