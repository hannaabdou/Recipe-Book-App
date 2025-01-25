import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(
      size.width * 0.4,
      0,
      size.width * 0.42,
      20.h, // ضبط ارتفاع الانحناء
    );
    path.arcToPoint(
      Offset(size.width * 0.58, 20.h),
      radius: Radius.circular(10.r), // ضبط نصف القطر
      clockwise: false,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      0,
      size.width * 0.65,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5.w, true); // ضبط الظل
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
