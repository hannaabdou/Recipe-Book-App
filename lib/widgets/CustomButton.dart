import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double titleSize;
  final double horizontalSize;
  final double verticalSize;
  final VoidCallback onPressed;
  final Color buttonColor;
  final IconData? icon;
  final double? iconSize;
  final bool iconOnRight;

  const CustomButton({
    super.key,
    required this.title,
    this.titleColor,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
    this.horizontalSize = 7,
    this.titleSize = 16,
    this.verticalSize = 7,
    this.icon,
    this.iconSize = 20,
    this.iconOnRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalSize,
          horizontal: horizontalSize,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconOnRight
              ? [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  if (icon != null) ...[
                    SizedBox(width: 8),
                    Icon(icon, size: iconSize, color: titleColor),
                  ]
                ]
              : [
                  if (icon != null) ...[
                    Icon(icon, size: iconSize, color: titleColor),
                    SizedBox(width: 8),
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
