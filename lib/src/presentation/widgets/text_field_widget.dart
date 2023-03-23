import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color? borderColor;
  final Color? textColor;
  final double borderRadius;
  final double? fontSizeLabel;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    this.borderColor = Colors.grey,
    this.textColor = Colors.black,
    this.borderRadius = 10,
    this.fontSizeLabel = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.all(9),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!,),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
