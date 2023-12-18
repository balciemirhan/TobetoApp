import 'package:flutter/material.dart';

class MyTextForm extends StatefulWidget {
  const MyTextForm({Key? key}) : super(key: key);

  @override
  _MyTextFormState createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: Colors.amber,
            size: 26,
          ),
          // helperText: "Search your topic",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Arama",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          isDense: true,
        ),
      ),
    ));
  }
}
