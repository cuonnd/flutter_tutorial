import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const WhiteText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
