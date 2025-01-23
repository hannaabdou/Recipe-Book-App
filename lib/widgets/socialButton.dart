import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class socialButton extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const socialButton({
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
          borderRadius: BorderRadius.circular(10), // الزوايا
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // الظل
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // اتجاه الظل
            ),
          ],
        ),
        padding: EdgeInsets.all(10), // الحواف الداخلية
        child: Image.asset(
          imagePath, // مسار الصورة
          width: width.w,
          height: height.h,
        ),
      ),
    );
  }
}
