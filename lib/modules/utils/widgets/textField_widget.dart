import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscure;
  final minLines;
  final maxLines;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscure,
      required this.hintText,
      required this.minLines,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            labelText: labelText,
            hintText: hintText,
          ),
          obscureText: obscure,
        ));
  }
}
