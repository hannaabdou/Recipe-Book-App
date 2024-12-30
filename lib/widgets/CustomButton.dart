import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double width;
  final double height;
  final double? fontSize;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    this.icon,
    this.fontSize,
    this.width = 200,
    this.height = 50,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // لون الخلفية
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // الزوايا المستديرة
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8), // مسافة بين الأيقونة والنص
            ],
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
