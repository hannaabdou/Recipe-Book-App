import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  final String text;
  final double textSize;
  final String textFamily;
  final double textWordSpacing;
  final double textLetterSpacing;
  final FontWeight textWeight;
  final Color textColor;

  const CustomTextStyle({
    super.key,
    required this.text,
    required this.textSize,
    this.textFamily = 'Poppins',
    this.textWeight = FontWeight.normal,
    required this.textColor,
    this.textWordSpacing = 0,
    this.textLetterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: textFamily,
        fontWeight: textWeight,
        color: textColor,
        wordSpacing: textWordSpacing,
        letterSpacing: textLetterSpacing,
        decoration: TextDecoration.none,
      ),
    );
  }
}
