import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'CustomIconTextRow.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double? titleSize;
  final FontWeight titleWeight;
  final Color? titleColor;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final double? rightIconSize;
  final double? leftIconSize;
  final Color? rightIconColor;
  final Color? leftIconColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomButton({
    Key? key,
    required this.title,
    this.titleSize,
    this.titleWeight = FontWeight.bold,
    this.titleColor,
    this.rightIcon,
    this.leftIcon,
    this.rightIconSize,
    this.leftIconSize,
    this.width = 200,
    this.height = 50,
    required this.onPressed,
    this.rightIconColor,
    this.leftIconColor,
    this.buttonColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, // استخدام اللون من الـ Theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // الزوايا المستديرة
          ),
        ),
        child: CustomIconTextRow(
          title: title,
          titleSize: titleSize,
          titleWeight: titleWeight,
          titleColor: titleColor,
          rightIcon: rightIcon,
          rightIconSize: rightIconSize,
          rightIconColor: rightIconColor,
          leftIcon: leftIcon,
          leftIconSize: leftIconSize,
          leftIconColor: leftIconColor,
        ),
      ),
    );
  }
}
