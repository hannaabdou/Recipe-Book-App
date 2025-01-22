import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final double? horizontalSize;
  final double? verticalSize;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomButton({
    Key? key,
    required this.title,
    this.titleColor,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
    this.horizontalSize = 7,
    this.titleSize = 16,
    this.verticalSize = 7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // استخدام اللون من الـ Theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // الزوايا المستديرة
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalSize!.h,
          horizontal: horizontalSize!.w,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: titleSize!.sp,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
