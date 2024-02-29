import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/text.dart';

class TextFieldFilter extends StatelessWidget {
  const TextFieldFilter({Key? key, required this.onChanged}) : super(key: key);
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: AppText.searchText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }
}
