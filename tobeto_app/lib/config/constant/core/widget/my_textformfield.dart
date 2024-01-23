import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';

class MyTextformfield extends StatelessWidget {
  const MyTextformfield({
    Key? key,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    this.obscureText,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.autocorrect,
  }) : super(key: key);

  final TextEditingController? controller;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? autocorrect;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return NeuBox(
      width: mediaQuery.width * 0.8,
      height: mediaQuery.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          /*   autovalidateMode: AutovalidateMode.onUserInteraction,  validator yerine geçer */
          /*    textInputAction: TextInputAction.next,  */
          autocorrect: autocorrect ?? false,
          keyboardType: keyboardType,
          onSaved: onSaved, // controller ile aynı işlev
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFFFFFFF),
            )),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9E9E9E)),
            ),
            filled: true,
            fillColor: const Color(0xFFE0E0E0),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
