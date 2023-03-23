import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  final Color fontColor;
  final double fontSize;

  const EmptyWidget({
    Key? key,
    required this.message,
    this.fontColor = Colors.black,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
        ),
      ),
    );
  }
}
