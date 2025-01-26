import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Image.asset(
          imagePath,
          width: width.w,
          height: height.h,
        ),
      ),
    );
  }
}
