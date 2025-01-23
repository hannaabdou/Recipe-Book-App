import 'package:flutter/material.dart';

class textButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final VoidCallback onPressed;

  const textButton(
      {super.key,
      required this.text,
      required this.textSize,
      required this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        textStyle: TextStyle(
          fontSize: textSize,
          fontFamily: 'Poppins-SemiBold',
        ),
      ),
      child: Text(text),
    );
  }
}
